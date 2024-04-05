
Rematch5Settings = {
	["UseMinimapButton"] = false,
	["HideLevelBubbles"] = false,
	["LastOpenLayout"] = "3-teams",
	["CurrentLayout"] = "3-teams",
	["ColorPetNames"] = true,
	["InteractOnlyWhenInjured"] = false,
	["AutoWinRecord"] = false,
	["JournalLayout"] = "3-teams",
	["ImportRememberOverride"] = false,
	["PetMarkerNames"] = {
	},
	["QueueSortByNameToo"] = false,
	["DontSortByRelevance"] = false,
	["DisableShare"] = false,
	["ShowSpeciesID"] = false,
	["UseDefaultJournal"] = false,
	["HideTruncatedTooltips"] = false,
	["PetCardForLinks"] = false,
	["HideRarityBorders"] = false,
	["LockPosition"] = false,
	["QueueAutoLearn"] = false,
	["PanelTabAnchor"] = "BOTTOMRIGHT",
	["PetCardAlwaysShowHPXPText"] = false,
	["CollapseOnEsc"] = false,
	["CustomScaleValue"] = 100,
	["RandomAbilitiesToo"] = false,
	["QueueActiveSort"] = false,
	["MaximizedLayout"] = "3-teams",
	["ExportIncludePreferences"] = false,
	["LargerBreedText"] = false,
	["DisplayUniqueTotal"] = false,
	["HideBreedsLists"] = false,
	["TooltipBehavior"] = "Normal",
	["HideTargetBadges"] = false,
	["ShowNotesOnLoad"] = false,
	["HideTeamBadges"] = false,
	["InteractOnMouseover"] = 3,
	["LastOpenJournal"] = true,
	["QueueSortRaresFirst"] = true,
	["HideBreedsLoadouts"] = false,
	["RandomPetRules"] = 2,
	["PetCardAlwaysShowHPBar"] = false,
	["ScriptFilters"] = {
		{
			"Unnamed Pets", -- [1]
			"-- Collected pets that still have their original name.\n\nreturn owned and not customName", -- [2]
		}, -- [1]
		{
			"Partially Leveled", -- [1]
			"-- Pets that have earned some xp in battle.\n\nreturn xp and xp>0", -- [2]
		}, -- [2]
		{
			"Unique Abilities", -- [1]
			"-- Pets with abilities not shared by other pets.\n\nif not count then\n  -- create count of each ability per species\n  count = {}\n  for speciesID in AllSpeciesIDs() do\n    for abilityID in AllAbilities(speciesID) do\n      if not count[abilityID] then\n        count[abilityID] = 0\n      end\n      count[abilityID] = count[abilityID] + 1\n    end\n  end\nend\n\nfor _,abilityID in ipairs(abilityList) do\n  if count[abilityID]==1 then\n    return true\n  end\nend", -- [2]
		}, -- [3]
		{
			"Pets Without Rares", -- [1]
			"-- Collected battle pets that have no rare version.\n\nif not rares then\n  rares = {}\n  for petID in AllPetIDs() do\n    if select(5,C_PetJournal.GetPetStats(petID))==4 then\n      rares[C_PetJournal.GetPetInfoByPetID(petID)]=true\n    end\n  end\nend\n\nif canBattle and owned and not rares[speciesID] then\n  return true\nend", -- [2]
		}, -- [4]
		{
			"Hybrid Counters", -- [1]
			"-- Pets with three or more attack types different than their pet type.\n\nlocal count = 0\nfor _,abilityID in ipairs(abilityList) do\n  local abilityType,noHints = select(7, C_PetBattles.GetAbilityInfoByID(abilityID) )\n  if not noHints and abilityType~=petType then\n    count = count + 1\n  end\nend\n\nreturn count>=3\n", -- [2]
		}, -- [5]
	},
	["SpecialSlots"] = {
	},
	["BoringLoreFont"] = false,
	["InteractOnSoftInteract"] = 0,
	["CompactTargetList"] = false,
	["TypeBarTab"] = 1,
	["ResetFilters"] = false,
	["ShowNewGroupTabFix"] = true,
	["InteractAlways"] = true,
	["CompactTeamList"] = false,
	["QueueSortFavoritesFirst"] = false,
	["PetCardHidePossibleBreeds"] = false,
	["DontConfirmFillQueue"] = true,
	["ShowAbilityNumbers"] = false,
	["HideMenuHelp"] = false,
	["ShowLoadedTeamPreferences"] = false,
	["ShowNotesInBattle"] = false,
	["ExpandedTargets"] = {
	},
	["CustomScale"] = false,
	["ExportIncludeNotes"] = false,
	["BreedSource"] = "BattlePetBreedID",
	["LastSelectedGroup"] = "group:none",
	["HideWinRecord"] = false,
	["ToolbarDismiss"] = false,
	["DefaultPreferences"] = {
	},
	["QueueAutoImport"] = true,
	["PetCardInBattle"] = false,
	["ColorTeamNames"] = true,
	["StickyNewPets"] = false,
	["InteractShowAfterLoad"] = false,
	["AllowHiddenPets"] = false,
	["ShowAfterBattle"] = false,
	["PetCardNoMouseoverFlip"] = false,
	["WarnWhenRandomNot25"] = false,
	["Anchor"] = "BOTTOMRIGHT",
	["ShowFillQueueMore"] = false,
	["LoadHealthiest"] = false,
	["currentTeamID"] = "team:253",
	["CompactQueueList"] = false,
	["ColorTargetNames"] = true,
	["DontConfirmRemoveQueue"] = false,
	["InteractPreferUninjured"] = false,
	["NotesFont"] = "GameFontHighlight",
	["KeepCompanion"] = false,
	["PetNotes"] = {
	},
	["PetCardBackground"] = "Expansion",
	["UseTypeBar"] = true,
	["HidePetToast"] = false,
	["HideNotesBadges"] = false,
	["HidePreferenceBadges"] = false,
	["CompactPetList"] = false,
	["BackupCount"] = 269,
	["HideToolbarTooltips"] = false,
	["PetCardShowExpansionStat"] = false,
	["QueueRandomWhenEmpty"] = false,
	["ShowNewGroupTab"] = true,
	["HideOptionTooltips"] = false,
	["PreferencesPaused"] = false,
	["AlwaysTeamTabs"] = false,
	["PetCardCompactCollected"] = false,
	["HideNotesButtonInBattle"] = false,
	["ConvertedTeams"] = {
		"team:1", -- [1]
		[142114] = "team:2",
		["Are They Not Beautiful? (Aquatic)"] = "team:224",
		[150929] = "team:3",
		[87122] = "team:4",
		[116792] = "team:210",
		[200688] = "team:6",
		[85685] = "team:7",
		[99035] = "team:8",
		[124617] = "team:9",
		[161661] = "team:10",
		["Chi-Chi, Hatchling of Chi-Ji"] = "team:225",
		[200689] = "team:11",
		[175778] = "team:12",
		[105455] = "team:13",
		[161662] = "team:14",
		[87123] = "team:15",
		[85622] = "team:16",
		[175779] = "team:17",
		[161663] = "team:18",
		[141479] = "team:19",
		[175780] = "team:20",
		[98270] = "team:21",
		[141799] = "team:22",
		[116794] = "team:23",
		[200692] = "team:24",
		[175781] = "team:25",
		["Do You Even Train? (Humanoid)"] = "team:226",
		[105840] = "team:26",
		[175782] = "team:27",
		["To a Land Down Under (Humanoid)"] = "team:227",
		[87125] = "team:28",
		[116795] = "team:29",
		[175783] = "team:30",
		[140461] = "team:31",
		[175784] = "team:32",
		["Are They Not Beautiful? (Flyer)"] = "team:228",
		[141292] = "team:33",
		[200696] = "team:34",
		[71924] = "team:221",
		[83837] = "team:35",
		[200697] = "team:36",
		[175786] = "team:37",
		[201849] = "team:38",
		["Are They Not Beautiful? (Mech)"] = "team:230",
		[85659] = "team:39",
		[71926] = "team:40",
		[155413] = "team:41",
		["Do You Even Train? (Elemental)"] = "team:231",
		[155414] = "team:42",
		[160205] = "team:43",
		[71927] = "team:44",
		[160206] = "team:45",
		[160207] = "team:46",
		[204792] = "team:47",
		["Ashes Will Fall"] = "team:232",
		[197447] = "team:48",
		[160208] = "team:49",
		[141046] = "team:50",
		[173303] = "team:51",
		["Zao, Calfling of Niuzao"] = "team:233",
		[160209] = "team:52",
		[71929] = "team:53",
		["Do You Even Train? (Magic) (2)"] = "team:234",
		[141814] = "team:158",
		[141879] = "team:55",
		[201858] = "team:56",
		[154910] = "team:57",
		[99077] = "team:136",
		[145968] = "team:58",
		[154911] = "team:59",
		[141945] = "team:60",
		[71931] = "team:61",
		[154912] = "team:62",
		[173372] = "team:63",
		[154913] = "team:64",
		[145971] = "team:65",
		[71932] = "team:66",
		[154914] = "team:67",
		["Are They Not Beautiful? (Undead) (2)"] = "team:236",
		[154915] = "team:68",
		[71933] = "team:69",
		[154916] = "team:70",
		[173376] = "team:71",
		[146932] = "team:72",
		[73626] = "team:223",
		[154917] = "team:73",
		[173377] = "team:74",
		[72285] = "team:75",
		[201802] = "team:76",
		[66824] = "team:139",
		[154918] = "team:78",
		["To a Land Down Under (Flyer)"] = "team:238",
		[173315] = "team:79",
		[97804] = "team:80",
		["To a Land Down Under (Critter)"] = "team:239",
		[204934] = "team:81",
		[154920] = "team:82",
		["Are They Not Beautiful? (Undead)"] = "team:240",
		[99210] = "team:83",
		[162458] = "team:84",
		[154921] = "team:85",
		[173381] = "team:86",
		[66730] = "team:87",
		[115307] = "team:88",
		["Deeptide Fingerling"] = "team:241",
		[154923] = "team:89",
		[205065] = "team:90",
		[162461] = "team:91",
		["To a Land Down Under (Magic)"] = "team:242",
		[154924] = "team:92",
		[173129] = "team:93",
		[173257] = "team:94",
		[154925] = "team:95",
		[173130] = "team:96",
		[142151] = "team:97",
		["To a Land Down Under (Mech)"] = "team:243",
		[173131] = "team:98",
		[141002] = "team:99",
		[154927] = "team:218",
		[72290] = "team:100",
		[66733] = "team:101",
		[162465] = "team:102",
		[173324] = "team:103",
		[99150] = "team:104",
		[99182] = "team:105",
		[173133] = "team:106",
		[162466] = "team:107",
		["To a Land Down Under (Aquatic)"] = "team:245",
		[154929] = "team:108",
		[87110] = "team:109",
		[140813] = "team:110",
		[66734] = "team:111",
		[201878] = "team:112",
		[145988] = "team:113",
		["Are They Not Beautiful? (Magic)"] = "team:246",
		[162468] = "team:114",
		[173263] = "team:115",
		["Are They Not Beautiful? (Dragon)"] = "team:247",
		["Mini Manafiend Melee"] = "team:248",
		[162469] = "team:116",
		[146181] = "team:117",
		[140880] = "team:118",
		[162470] = "team:119",
		[146182] = "team:120",
		[196069] = "team:121",
		[139987] = "team:122",
		[146183] = "team:123",
		["Yu'la, Broodling of Yu'lon"] = "team:249",
		[142096] = "team:124",
		[107489] = "team:125",
		[150911] = "team:126",
		[141969] = "team:127",
		["To a Land Down Under (Undead)"] = "team:250",
		[68462] = "team:128",
		["Chi-Chi, Hatchling of Chi-Ji (2)"] = "team:251",
		[196264] = "team:129",
		[197350] = "team:130",
		[169501] = "team:131",
		[141588] = "team:132",
		[150914] = "team:133",
		[68463] = "team:134",
		["Do You Even Train? (Flyer)"] = "team:252",
		[68559] = "team:135",
		[87124] = "team:222",
		[104553] = "team:164",
		[66739] = "team:138",
		[116793] = "team:169",
		["Do You Even Train? (Undead)"] = "team:235",
		[200693] = "team:177",
		[162471] = "team:178",
		[197417] = "team:142",
		[68464] = "team:143",
		["Do You Even Train? (Critter)"] = "team:254",
		[173267] = "team:141",
		[68560] = "team:144",
		[119346] = "team:216",
		[175785] = "team:140",
		[161658] = "team:146",
		[150917] = "team:147",
		[116786] = "team:148",
		[119341] = "team:195",
		[202440] = "team:201",
		["wankah"] = "team:259",
		[72291] = "team:162",
		[173274] = "team:150",
		[161649] = "team:155",
		["To a Land Down Under (Dragon)"] = "team:267",
		[68465] = "team:153",
		[140315] = "team:154",
		[71934] = "team:77",
		["nega"] = "team:253",
		[141529] = "team:157",
		[142054] = "team:213",
		[161657] = "team:211",
		[104970] = "team:159",
		[146001] = "team:163",
		[116787] = "team:166",
		["Catch team"] = "team:261",
		[200678] = "team:214",
		[197336] = "team:181",
		[202458] = "team:220",
		[141077] = "team:184",
		[161651] = "team:165",
		[119345] = "team:205",
		[146002] = "team:149",
		[200679] = "team:151",
		[161656] = "team:203",
		[105386] = "team:170",
		[154919] = "team:187",
		[150918] = "team:152",
		[142234] = "team:172",
		[119343] = "team:174",
		[116788] = "team:156",
		[200680] = "team:186",
		[119407] = "team:176",
		[71930] = "team:208",
		["Do You Even Train? (Magic)"] = "team:229",
		[150858] = "team:179",
		[150922] = "team:180",
		[72009] = "team:160",
		[204926] = "team:199",
		[146004] = "team:189",
		["To a Land Down Under"] = "team:256",
		[139489] = "team:185",
		["Do You Even Train? (Dragon)"] = "team:237",
		[189376] = "team:190",
		[150923] = "team:188",
		[119408] = "team:192",
		[116789] = "team:167",
		[146005] = "team:191",
		[155267] = "team:202",
		[98489] = "team:193",
		[119344] = "team:194",
		[119342] = "team:161",
		[141215] = "team:196",
		[105323] = "team:183",
		[79179] = "team:198",
		["To a Land Down Under (Elemental)"] = "team:255",
		[68564] = "team:200",
		[146003] = "team:175",
		[160210] = "team:54",
		["Are They Not Beautiful? (Humanoid)"] = "team:244",
		[150925] = "team:173",
		[197102] = "team:168",
		[116790] = "team:182",
		[200684] = "team:206",
		[119409] = "team:207",
		[154928] = "team:219",
		[154926] = "team:217",
		[66741] = "team:212",
		[201004] = "team:197",
		[161650] = "team:209",
		["Are They Not Beautiful? (Elemental)"] = "team:265",
		[155145] = "team:5",
		["Do You Even Train? (Aquatic)"] = "team:258",
		["healfuck"] = "team:266",
		[201899] = "team:215",
		["Are They Not Beautiful? (Beast)"] = "team:257",
		["Growing Ectoplasm 1"] = "team:268",
		["Do You Even Train? (Beast)"] = "team:269",
		[116791] = "team:145",
		[173331] = "team:137",
		["Xu-Fu, Cub of Xuen"] = "team:260",
		["To a Land Down Under (Beast)"] = "team:262",
		["Are They Not Beautiful? (Critter)"] = "team:263",
		["Do You Even Train? (Mech)"] = "team:264",
		[62621] = "team:204",
		[202452] = "team:171",
	},
	["NotesLeft"] = false,
	["QueueSortInTeamsFirst"] = false,
	["ResetSortWithFilters"] = false,
	["ResetExceptSearch"] = false,
	["Filters"] = {
		["Other"] = {
		},
		["Stats"] = {
		},
		["Strong"] = {
		},
		["Marker"] = {
		},
		["Sources"] = {
		},
		["Sort"] = {
		},
		["Level"] = {
		},
		["Tough"] = {
		},
		["Types"] = {
		},
		["Expansion"] = {
		},
		["Rarity"] = {
		},
		["RawSearchText"] = "\"Mystical Spring Bouquet\"",
		["Similar"] = {
		},
		["Search"] = {
			["Pattern"] = "^[mM][yY][sS][tT][iI][cC][aA][lL] [sS][pP][rR][iI][nN][gG] [bB][oO][uU][qQ][uU][eE][tT]$",
			["Length"] = 25,
		},
		["Breed"] = {
		},
		["Script"] = {
		},
		["Collected"] = {
		},
		["Favorite"] = {
		},
		["Moveset"] = {
		},
	},
	["MinimapButtonPosition"] = -162,
	["KeepNotesOnScreen"] = false,
	["HideLevelingBadges"] = false,
	["FavoriteFilters"] = {
	},
	["LevelingQueue"] = {
	},
	["QueueSortOrder"] = 2,
	["CardBehavior"] = "Normal",
	["BreedFormat"] = 1,
	["LockWindow"] = false,
	["InteractOnTarget"] = 0,
	["CombineGroupKey"] = "None",
	["SafariHatShine"] = false,
	["ImportConflictOverwrite"] = true,
	["ExpandedGroups"] = {
		["group:10"] = true,
	},
	["DontWarnMissing"] = true,
	["HideMarkerBadges"] = false,
	["PetCardCanPin"] = false,
	["HideTooltips"] = false,
	["BarChartCategory"] = 1,
	["NeverTeamTabs"] = false,
	["SortByNickname"] = false,
	["LastToastedPetID"] = "BattlePet-0-000012CC675A",
	["PetCardFlipKey"] = "Alt",
	["WasShownOnLogout"] = false,
	["GroupOrder"] = {
		"group:favorites", -- [1]
		"group:none", -- [2]
		"group:1", -- [3]
		"group:2", -- [4]
		"group:3", -- [5]
		"group:4", -- [6]
		"group:5", -- [7]
		"group:6", -- [8]
		"group:7", -- [9]
		"group:8", -- [10]
		"group:9", -- [11]
		"group:10", -- [12]
	},
	["AbilityBackground"] = "Icon",
	["QueueSkipDead"] = false,
	["LockNotesPosition"] = false,
	["PetMarkers"] = {
		[216] = 7,
		[850] = 7,
		[331] = 7,
		[849] = 7,
	},
	["AlwaysUsePetSatchel"] = false,
	["ShowAbilityID"] = false,
	["NoBackupReminder"] = true,
	["PrioritizeBreedOnImport"] = false,
	["HideNonBattlePets"] = false,
	["ReverseToolbar"] = false,
	["ExpandedOptionsHeaders"] = {
		true, -- [1]
	},
}
Rematch5SavedTeams = {
	["team:46"] = {
		["pets"] = {
			"BattlePet-0-000012B67B94", -- [1]
			"BattlePet-0-000012B14EFA", -- [2]
			"BattlePet-0-000012B01DC0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7438\n\nStrategy added by Squirl\nUsually wins around round 15. Enemy crits do not appear to be an issue.\n\nTurn 1: Disruption\nRepeat until Prideling dies:\nPriority 1: Life Exchange if your HP <= 500\nPriority 2: Seethe\nRavenous Prideling dies; swap in your Orphaned Felbat\nTurn 1: Fel Immolate\nTurn 2: Drain Blood if the enemy's racial is triggered and their HP is <= 263; else Black Claw\nFollow this priority until enemy Logic dies:\nPriority 1: Black Claw if not applied\nPriority 2: Drain Blood if off CD\nPriority 3: Fel Immolate\nEnemy Logic dies; enemy Math comes in\nTurn 1: Fel Immolate\nTurn 2: Black Claw\nYour Lil' Bling is swapped in\nTurn 3: Inflation\n",
		["name"] = "Therin Skysong",
		["tags"] = {
			"122A2GU", -- [1]
			"2225202", -- [2]
			"2115198", -- [3]
		},
		["teamID"] = "team:46",
		["targets"] = {
			160207, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:203"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B67566", -- [2]
			"BattlePet-0-000012707902", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7094\n\nStrategy added by Shenk\nYou can use pretty much any pet with Stampede-like abilities instead of the Infected Squirrel.\n\nTurn 1: Pass\nTurn 2: Curse of Doom\nTurn 3: Haunt\nBring in your Infected Squirrel\nTurn 1: Creeping Fungus\nTurn 2-3: Stampede\n",
		["name"] = "Splint",
		["tags"] = {
			"221616M", -- [1]
			"222AJJ", -- [2]
			"111B39L", -- [3]
		},
		["teamID"] = "team:203",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:5",
		["targets"] = {
			161656, -- [1]
		},
	},
	["team:129"] = {
		["pets"] = {
			"BattlePet-0-000012B81435", -- [1]
			"BattlePet-0-000012B01E0C", -- [2]
			"BattlePet-0-000006E4C782", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nTurn 1: Corrosion\nTurn 2: Void Nova\nTurn 3: Poison Protocol\nTurn 4: Corrosion\nTurn 5: Pass\nTurn 6: Void Nova\nBring in your Sunblade Micro-Defender\nTurn 7: Armageddon\nYour Chrominius comes in\nTurn 8: Bite\nTurn 9: Surge of Power\n",
		["name"] = "The Terrible Three",
		["tags"] = {
			"22142OQ", -- [1]
			"00261J0", -- [2]
			"1026140", -- [3]
		},
		["teamID"] = "team:129",
		["targets"] = {
			196264, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:229"] = {
		["pets"] = {
			"BattlePet-0-000012B607A8", -- [1]
			"BattlePet-0-000012B17368", -- [2]
			"BattlePet-0-000012B81435", -- [3]
		},
		["notes"] = "Strategy added by Doledippers\nI've tried this 4 times and have won each time. I know this fight has a lot of RNG with the ability order so, there may be cases where this doesn't work. However, each of the 4 attempts I did have resulted in a pretty clean win, with the 3rd Anomalus having atleast 600 HP at the end.Let me know if you run into any cases where this fails, thank you!\n\nPriority 1:: Void Nova\nPriority 2:: Poison Protocol\nPriority 3:: Ooze Touch\nPriority 4:: Pass if Lifft / Swole is underwater AND Poison Protocol +  Void Nova are on cd\nPriority 5:: Ooze Touch when only Swole is left\n",
		["name"] = "Do You Even Train? (Magic)",
		["tags"] = {
			"12142OQ", -- [1]
			"12142OQ", -- [2]
			"12142OQ", -- [3]
		},
		["teamID"] = "team:229",
		["groupID"] = "group:none",
	},
	["team:64"] = {
		["pets"] = {
			"BattlePet-0-000006E4C7B4", -- [1]
			"BattlePet-0-000012B5C2FF", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Ktjn\nTurn 1: Black Claw\nTurn 2+: Flock\nIkky dies\nTurn 4: Bring in Direbeak Hatchling\nTurn 5: Predatory Strike\n",
		["name"] = "Shadowspike Lurker",
		["tags"] = {
			"01181FS", -- [1]
			"00171TN", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:64",
		["targets"] = {
			154913, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:268"] = {
		["pets"] = {
			"BattlePet-0-000012B67566", -- [1]
			"BattlePet-0-000012B6764A", -- [2]
			"BattlePet-0-000012B4C5B0", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Creeping Fungus\nTurn 2-4: Stampede\nTurn 5: Corpse Explosion\n\nBring in your Mechanical Axebeak\nTurn 1: Peck\nRandom Enemy Pet comes in\n\nDeviate Flapper:\nPeck > Lift-Off > Haywire\n\nDeviate Smallclaw:\nHaywire > Peck+\n\nDeviate Chomper:\nLift-Off > Peck+\n",
		["name"] = "Growing Ectoplasm 1",
		["tags"] = {
			"222AJJ", -- [1]
			"22271BR", -- [2]
			"21131CJ", -- [3]
		},
		["teamID"] = "team:268",
		["groupID"] = "group:7",
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:211"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012B4AB86", -- [2]
			"BattlePet-0-000008A86E91", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8239\n\nStrategy added by Silverleaf#1446\nPriority 1: Deflection when Whirlpool is at 1\nPriority 2: Sandstorm\nPriority 3: Crush\n",
		["name"] = "Ninn Jah",
		["tags"] = {
			"1116143", -- [1]
			"122AMK", -- [2]
			"22181S7", -- [3]
		},
		["teamID"] = "team:211",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:5",
		["targets"] = {
			161657, -- [1]
		},
	},
	["team:168"] = {
		["pets"] = {
			"BattlePet-0-000012B4874E", -- [1]
			"BattlePet-0-000012B146D0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Scratike#2323\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\nTurn 5: Tail Sweep until Nexus Whelpling dies\nTurn 6: Wind-Up\nTurn 7: Wind-Up\nTurn 6: WIN\n",
		["name"] = "Two and Two Together",
		["tags"] = {
			"122414D", -- [1]
			"11181BB", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:168",
		["targets"] = {
			197102, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:70"] = {
		["pets"] = {
			"BattlePet-0-000006E4C7B4", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by bios\nTurn 1: Black Claw\nTurn 2: Flock\nTurn 3: Swap to your Teroclaw Hatchling\nTurn 4: Alpha Strike\nAny standard attack will finish the fight\n",
		["name"] = "Ravenous Scalespawn",
		["tags"] = {
			"01181FS", -- [1]
			"20071C8", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:70",
		["targets"] = {
			154916, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:90"] = {
		["pets"] = {
			"BattlePet-0-000011D76CB1", -- [1]
			"BattlePet-0-000012B6047C", -- [2]
			"BattlePet-0-000012B0D34B", -- [3]
		},
		["name"] = "Praying Stingray",
		["tags"] = {
			"111731D", -- [1]
			"1113451", -- [2]
			"11189L", -- [3]
		},
		["teamID"] = "team:90",
		["targets"] = {
			205065, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:30"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11352\n\nStrategy added by angbad#1501\nQuick and Easy\n\nTurn 1: Blistering Cold\nTurn 2: Swap to your Ikky\nTurn 3: Black Claw\nTurn 4: Flock\nBring in your Boneshard\nTurn 5: Pass\n",
		["name"] = "Digallo",
		["tags"] = {
			"01031TB", -- [1]
			"01181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:30",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			175783, -- [1]
		},
	},
	["team:244"] = {
		["pets"] = {
			"BattlePet-0-000012B822C0", -- [1]
			"BattlePet-0-000006E4C775", -- [2]
			"BattlePet-0-00000D640E69", -- [3]
		},
		["notes"] = "Strategy added by BurntGinger#1399\nYou should rely more heavily on the script then what's written down below. Don't waste cooldowns on mobs about to die, and quit if Beeks is still alive and all you got is a Withered boi. I test and fine tune strategies before posting, so let it be known there is RNG here.\n\nTurn 1: Creeping Insanity\nTurn 2: Spiritfire Bolt\nTurn 3: Spiritfire Bolt\nTurn 4: Swap to your Father Winter's Helper. Fethres dies due to Creeping Insanity....usually. Use Ice Lance if active still.\nTurn 5: Gift of Winter's Veil\nTurn 6: Call Blizzard if possible. Otherwise skip to Turn 8\nTurn 7: Ice Lance until you die. Bring back in Void-Scarred Anubisath\nTurn 8: Soulrush if Beeks still up. Otherwise, Turn 9.\nTurn 9: Creeping Insanity\nTurn 10: Spiritfire Bolt or pass. Void-Scarred Anubisath dies usually, bring in Wretched Servant\nTurn 11: Weakness\nTurn 12: Nether Blast until Talons dies.\n",
		["name"] = "Are They Not Beautiful? (Humanoid)",
		["tags"] = {
			"22262OH", -- [1]
			"21233N", -- [2]
			"22131J2", -- [3]
		},
		["teamID"] = "team:244",
		["groupID"] = "group:none",
	},
	["team:238"] = {
		["pets"] = {
			"BattlePet-0-000012B5C2FF", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"BattlePet-0-000012B6764A", -- [3]
		},
		["notes"] = "Strategy added by Refreshe#1641\nNear copy of Alainon#1617's strategy #19177 using a modified script from Akéla#2848's comment there. I just didn't have that third pet and this expands the pool nicely.\n\nTurn 1: Ironskin\nTurns 2-3: Falcosaur Swarm!\nTurn 4: Predatory Strike\nTurn 5: Use Falcosaur Swarm! or bring in Ikky\nQuills until Bassalt is dead\nTurn 6: Black Claw\nTurns 7-9: Flock\nTurns 10-12: Flock\nBring in your Mechanical Axebeak\nTurns 1-2: Haywire\nTurn 3: Decoy\nTurn 4: Alpha Strike\nTurns 5-6: Haywire\n",
		["name"] = "To a Land Down Under (Flyer)",
		["tags"] = {
			"12171TN", -- [1]
			"21181FS", -- [2]
			"12171BR", -- [3]
		},
		["teamID"] = "team:238",
		["groupID"] = "group:none",
	},
	["team:228"] = {
		["pets"] = {
			"BattlePet-0-000012B118A8", -- [1]
			"BattlePet-0-000012B01E1E", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Strategy added by Kyzna\nIm just posting my strategy that worked for me. This strategy required that you sucessfully stun. .\n\nBring in your Sentinel's Companion\nTurn 1: Soulrush if Fethres is not stunned = reset\nBeeks comes in\nTurn 2: Dark Talon\nTurn 3: Ethereal (you need to block Surge of Power) if not = reset\nTurn 4: Dark Talon\nTurn 5: Dark Talon\nTurn 6: Dark Talon\nBeeks dies. Fethres comes in\nTurn 7: Dark Talon\nTurn 8: Dark Talon\nFethres dies. Talons comes in\nTurn 9: Soulrush, Dark Talon if talons is stunned\nBring in your Squawkling\nTurn 10: Shriek\nTurn 11: Arcane Storm\nTurn 12: Arcane Blast\n",
		["name"] = "Are They Not Beautiful? (Flyer)",
		["tags"] = {
			"22281GV", -- [1]
			"22132C9", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:228",
		["groupID"] = "group:none",
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:189"] = {
		["pets"] = {
			"BattlePet-0-000012B67B94", -- [1]
			"BattlePet-0-000012B17369", -- [2]
			"BattlePet-0-000006E4C75E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/16007\n\nStrategy added by Dassemps#1507\nTurn 1: Breath of Sorrow\nTurn 2: Seethe\nTurn 3: Seethe\nAn enemy pet comes in\nTurn 4: Life Exchange\nTurn 5: Seethe\nTurn 6: Breath of Sorrow\nTurn 7: Swap to your Living Sandling\nTurn 7: Sandstorm\nTurn 8: Quicksand\nTurn 9: Sand Bolt\n",
		["name"] = "Gnomeregan Guard Mechanostrider",
		["tags"] = {
			"112A2GU", -- [1]
			"222A14P", -- [2]
			"02198E", -- [3]
		},
		["teamID"] = "team:189",
		["targets"] = {
			146004, -- [1]
		},
		["groupID"] = "group:6",
	},
	["team:51"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A28", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by matarsaed#2362\nTurn 1-4: Frost Shot\nTurn 5: Explode\n",
		["name"] = "Ashes Will Fall",
		["tags"] = {
			"01271VP", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:51",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			173303, -- [1]
		},
	},
	["team:227"] = {
		["pets"] = {
			"BattlePet-0-000012B0D34E", -- [1]
			"BattlePet-0-000012B6760E", -- [2]
			"BattlePet-0-000012B118E8", -- [3]
		},
		["notes"] = "Strategy added by Alainon#1617\nTurn 1: Jar of Smelly Liquid\nTurn 2: Corrosion\nTurn 3: Nether Gate \nClawz comes in\nTurn 4: Jar of Smelly Liquid\nTurn 5: Corrosion until Wyrmy Tunkin dies\nBring in your Squirky\nTurn 1: Clobber\nBassalt comes in\nTurn 2: Fish Slap Until Bassalt dies, Claws comes in\nTurn 3: Bubble\nTurn 4+: Clobber when available otherwise Fish Slap until Squirky dies\nBring in your Winter's Little Helper\nTurn 1: Ice Tomb\nTurn 2: Call Blizzard\nTurn 3+: Ice Lance Murrey should die before Winter's Little Helper\n",
		["name"] = "To a Land Down Under (Humanoid)",
		["tags"] = {
			"211A1QV", -- [1]
			"21231SF", -- [2]
			"22241A5", -- [3]
		},
		["teamID"] = "team:227",
		["groupID"] = "group:none",
	},
	["team:77"] = {
		["pets"] = {
			"BattlePet-0-000006E4C782", -- [1]
			"BattlePet-0-000012B608F8", -- [2]
			"BattlePet-0-000012B673F3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10395\n\nStrategy added by Berendain\nBackground and explanation in the comments.\n\nIn slot 3, you can use any pet with Ion Cannon, but note that the G0-R41-0N Ultratonk is the only one that doesn't have a 1-round standard attack, so in that sense it's worse than the other options.  It will still work though, and often you won't even need to use any attacks to get Trike low before using Ion Cannon, especially with him burning each round.\n\nTurn 1: Arcane Explosion\nTurn 2: Howl\nTurn 3: Surge of Power, Screamer dies\nChaos comes in\nTurn 1+: Arcane Explosion until Chrominius dies\nBring in your Fel Flame\nTurn 1: Flame Breath\nTurn 2: Scorched Earth\nTurn 3+: Flame Breath until Chaos dies\nTrike comes in\nTurn 1: Conflagrate\nTurn 2: Apply Flame Breath\nTurn 3: Scorched Earth\nTurn 4+: Spam Flame Breath until Fel Flame dies\nBring in your Microbot XD\nTurn 1: If needed, use any standard attack until Trike is low enough to be killed with Ion Cannon\nTurn 2: Ion Cannon, Trike dies\n",
		["name"] = "Dr. Ion Goldbloom",
		["tags"] = {
			"2126140", -- [1]
			"2216G7", -- [2]
			"00272KT", -- [3]
		},
		["teamID"] = "team:77",
		["targets"] = {
			71934, -- [1]
		},
		["groupID"] = "group:3",
	},
	["team:214"] = {
		["pets"] = {
			"BattlePet-0-000012B6751A", -- [1]
			"BattlePet-0-0000122BADD1", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Salkari\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\nWhelpling dies before getting off another attack\nTurns 1-3: Mana Surge\nTurn 4: Eyeblast\nTurn 6: Arcane eye should be able to finish him off. If not, then 1 attack from 3rd pet\n",
		["name"] = "Storm-Touched Slyvern",
		["tags"] = {
			"02281LP", -- [1]
			"1128148", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:214",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			200678, -- [1]
		},
	},
	["team:206"] = {
		["pets"] = {
			"BattlePet-0-000012BB19D8", -- [1]
			"BattlePet-0-00000D5451F8", -- [2]
			"BattlePet-0-00000D511EB1", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nTurn 1: Illuminate\nTurn 2: Swap to your Baa'l\nTurn 3: Murder the Innocent\nTurn 4: Swap to your Death Seeker\nTurn 5: Murder the Innocent\n",
		["name"] = "Vortex - Legendary",
		["tags"] = {
			"002A1L4", -- [1]
			"020329G", -- [2]
			"02062V1", -- [3]
		},
		["teamID"] = "team:206",
		["targets"] = {
			200684, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:19"] = {
		["pets"] = {
			"BattlePet-0-000012BAC9E8", -- [1]
			"BattlePet-0-000006E4C76E", -- [2]
			"BattlePet-0-000012B673F3", -- [3]
		},
		["notes"] = "Strategy added by norng\n10 rounds.\n\nTurn 1: Metal Fist\nTurn 2: Supercharge\nTurn 3: Call Lightning - Timbo resurrects\nTurn 4: Swap to your Runeforged Servitor - Timbo dies\nPokey comes in\nTurn 1: Supercharge\nTurn 2: Call Lightning - Pokey resurrects\nTurn 3: Swap to your Microbot XD - Pokey dies\nBurly Jr. comes in\nTurn 1: Supercharge\nTurns 2-3: Ion Cannon - Burly Jr. dies\n",
		["name"] = "Strange Looking Dogs",
		["tags"] = {
			"111C3K", -- [1]
			"02231T5", -- [2]
			"02272KT", -- [3]
		},
		["teamID"] = "team:19",
		["targets"] = {
			141479, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:114"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B67566", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7732\n\nStrategy added by ForestBoy#2243\nTurn 1: Shadow Slash\nTurn 2: Pass\nTurn 3: Curse of Doom\nTurn 4: Haunt\nBring in your Infected squirrel\nTurn 1: Rabid Strike\nTurn 2: Stampede\nAt this point K'tiny should be dead, if not bring in 3rd pet and finish it.\n",
		["name"] = "Tiny Madness",
		["tags"] = {
			"121616M", -- [1]
			"210AJJ", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:114",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			162468, -- [1]
		},
	},
	["team:97"] = {
		["pets"] = {
			"BattlePet-0-000012B01ED3", -- [1]
			0, -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2216\n\nStrategy added by Laponko\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up\nTurn 5: Swap to Level Pet\nTurn 6: Swap to Iron Starlette\nTurn 7: Wind-Up\n",
		["name"] = "You've Never Seen Jammer Upset",
		["tags"] = {
			"11171BB", -- [1]
			"ZL", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:97",
		["preferences"] = {
			["minHP"] = 501,
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			142151, -- [1]
		},
	},
	["team:267"] = {
		["pets"] = {
			"BattlePet-0-000012B4861E", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			"BattlePet-0-000012B4838C", -- [3]
		},
		["notes"] = "Strategy added by Oakwarden\nNot my strat. Full credit goes to RezokDDW#1749wrote on 5/3/2023Nether Faerie Dragon 2,2,1Chrominius 1,1,2Emerald Proto-WhelpUsed these three, and almost solo'd with the Faerie dragonStarted with putting the moonlight up with the faerie dragon then just used Arcane Blast until the first pet died.Then once the 2nd came out I used moonlight again, then Life Exchange, then Arcane Blast killed it.Arcane blast until the Faerie dragon died, swap in Chrominius to Howl and then Surge of Power to kill Murrey. \n\nTurn 1: Moonfire\nTurn 2: Arcane Blast until Bassalt dies.\nTurn 3: Life Exchange\nTurn 4: Moonfire\nTurn 5: Arcane Blast until Clawz dies or your Nether Faerie Dragon dies.\nBring in your Chrominius\nTurn 1: Howl\nTurns 2-4: Surge of Power\n",
		["name"] = "To a Land Down Under (Dragon)",
		["tags"] = {
			"2215HD", -- [1]
			"1126140", -- [2]
			"222814F", -- [3]
		},
		["teamID"] = "team:267",
		["groupID"] = "group:none",
	},
	["team:133"] = {
		["pets"] = {
			"BattlePet-0-000006E4C754", -- [1]
			"BattlePet-0-000012B146C9", -- [2]
			"BattlePet-0-000012B6C313", -- [3]
		},
		["notes"] = "Strategy added by Cognosis\nTurn 1: Arcane Blast\nTurn 2: Consume Magic\nTurn 3+: Arcane Blast until all enemies are dead or Court Scribe is\nFinish off any surviving backline pets with your second pet.  I suggest a rabbit, in which case:\n1: Dodge\n2: Stampede\n3: Flurry\nRepeat until all enemies are dead\n",
		["name"] = "Wandering Phantasm",
		["tags"] = {
			"11281SB", -- [1]
			"222568", -- [2]
			"11163BO", -- [3]
		},
		["teamID"] = "team:133",
		["targets"] = {
			150914, -- [1]
		},
		["groupID"] = "group:8",
	},
	["team:183"] = {
		["pets"] = {
			"BattlePet-0-000012B146CA", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"BattlePet-0-000012B146D0", -- [3]
		},
		["notes"] = "Strategy added by Makaveli#22599\nTurn 1: Extra Plating\nTurn 2: Make it Rain\nTurn 3: Inflation\nTurn 4: Repeat until your lil'bling dies. Try to have him die while enemy still has damage debuff on them\nBring in your Ikky\nTurn 1+: Savage Talon to kill Ancient Catacomb Spider\nCatacomb Bat comes in\nTurn 1: Black Claw\nTurns 2-4: Flock\nCatacomb Snake comes in\nTurns 1-3: Flock\nBring in your Iron Starlette\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\n",
		["name"] = "Clear the Catacombs",
		["tags"] = {
			"2215198", -- [1]
			"11181FS", -- [2]
			"10181BB", -- [3]
		},
		["teamID"] = "team:183",
		["targets"] = {
			105323, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:217"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-000012B58B24", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\nTurn 1: Flyby\nTurn 2: Thunderbolt\nOptional:: If CK-9 is below 1154HP due to a crit last round and you're not stunned; use Explode now (turn 3) with Mechanical Pandaren Dragonling instead of turn 6 to save a turn.\nTurn 3: Swap/Bring in your Darkmoon Zeppelin\nTurn 4: Thunderbolt\nTurn 5: Explode\nBring in your Mechanical Pandaren Dragonling\nTurn 6: Explode\n",
		["name"] = "CK-9 Micro-Oppression Unit",
		["tags"] = {
			"2215QC", -- [1]
			"021CAJ", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:217",
		["targets"] = {
			154926, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:172"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"BattlePet-0-000012B4874E", -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["notes"] = "Strategy added by Runisco\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up until Iron Starlette dies\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm\nTurn 2: Mana Surge\nTurn 3: Tail Sweep until Nexus Whelpling dies\nBring in your Ikky\nTurn 1: Black Claw\nTurn 2: Flock\n",
		["name"] = "Small Beginnings",
		["tags"] = {
			"10181BB", -- [1]
			"122414D", -- [2]
			"11181FS", -- [3]
		},
		["teamID"] = "team:172",
		["targets"] = {
			142234, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:165"] = {
		["pets"] = {
			"BattlePet-0-000012B99946", -- [1]
			"BattlePet-0-000012B01ED3", -- [2]
			"BattlePet-0-000012949F80", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10265\n\nStrategy added by Berendain\nTurn 1: Clean-Up\nTurn 2: Soulrush\nTurn 3: Swap to your Iron Starlette\nTurn 4: Wind-Up\nTurn 5: Supercharge\nTurn 6: Wind-Up\nTurn 7: Toxic Smoke until something dies\nTurn 8: If Iron Starlette dies before Ralf does, bring back your Servant of Demidos, and finish him off\n",
		["name"] = "Ralf",
		["tags"] = {
			"11241I1", -- [1]
			"12171BB", -- [2]
			"1119385", -- [3]
		},
		["teamID"] = "team:165",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:5",
		["targets"] = {
			161651, -- [1]
		},
	},
	["team:124"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"BattlePet-0-000012B118A8", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7734\n\nStrategy added by Shenk\nThanks @Rosqo for the idea.\n\nTurn 1: Void Nova\nTurn 2: Poison Protocol\nTurn 3: Corrosion\nTurn 4: Corrosion. Both pets die (Should your Anomalus already be dead before it can attack just bring in Sentinel's Companion and finish Lazy with [spell=Dark Talon].)\nBring in your Sentinel's Companion\nSpokes comes in\nTurn 1: Soulrush. Spokes dies\nSkeeto comes in\nTurn 1: Moonfire\n",
		["name"] = "Critters are Friends, Not Food",
		["tags"] = {
			"22142OQ", -- [1]
			"22181GV", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:124",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			142096, -- [1]
		},
	},
	["team:80"] = {
		["pets"] = {
			"BattlePet-0-000012BEEECA", -- [1]
			"BattlePet-0-000012B99CF8", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by nogulpfrog\n68-78S.  REMARK : Infused Etherwyrm ability data on XUFU is incorrect.\n\nTurn 1: Arcane Storm\nTurn 2: Swap to your Pet Bombling\nTurn 3: Minefield\nTurn 4: Explode\nBring in your Level Pet\nTurn 5: Swap to your Infused Etherwyrm\nTurn 6: Arcane Storm\nTurns 7-9: Mana Surge\nTurn 10: Arcane Storm  (if Mana Surge deal enough damage, enemy third pet died)\nTurn 11: Wind Burst, enemy third pet died.\n",
		["name"] = "Fight Night: Tiffany Nelson",
		["tags"] = {
			"211430R", -- [1]
			"01292L", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:80",
		["targets"] = {
			97804, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:154"] = {
		["pets"] = {
			"BattlePet-0-000006E4C77C", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nPriority 1: Call Blizzard on CD\nPriority 2: Deep Freeze on CD\nPriority 3: Snowball all else\nPriority 4: Standby when the 'Fixed' Remote Control Rocket Chicken comes in\nIf needed, bring in next pet to finish the fight. \n",
		["name"] = "Automated Chaos",
		["tags"] = {
			"11233L", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:154",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			140315, -- [1]
		},
	},
	["team:10"] = {
		["pets"] = {
			"BattlePet-0-000008A85848", -- [1]
			"BattlePet-0-000012B5C2FF", -- [2]
			"BattlePet-0-000012B66D54", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8624\n\nStrategy added by Kylmyys#2878\nTurn 1: Warning Squawk\nTurn 2+3: Falcosaur Swarm! until Bloodgazer Hatchling dies\nBring in your Direbeak Hatchling\nTurn 1: Warning Squawk\nTurn 2: Falcosaur Swarm! until Wilbur dies\n",
		["name"] = "Wilbur",
		["tags"] = {
			"21281TP", -- [1]
			"12271TN", -- [2]
			"11241TO", -- [3]
		},
		["teamID"] = "team:10",
		["targets"] = {
			161661, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:5"] = {
		["pets"] = {
			"BattlePet-0-000012B5CBA5", -- [1]
			"BattlePet-0-000012B751E1", -- [2]
			"BattlePet-0-00001275D175", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5489\n\nStrategy added by DragonsAfterDark\nIf the backline pets don't die before the active pet, you will face all the enemy pets. \n\nTurn 1: Tidal Wave\nTurn 2: Tidal Wave\nTurn 3: Rain Dance\nAfter that:\nPriority 1: Rain Dance on CD\nPriority 2: Tidal Wave as filler\nPriority 3: Once the backline enemies are dead Rain Dance & Water Jet to kill enemy #1\n",
		["name"] = "Plagued Critters",
		["tags"] = {
			"11231KN", -- [1]
			"111737N", -- [2]
			"111737N", -- [3]
		},
		["teamID"] = "team:5",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:8",
		["targets"] = {
			155145, -- [1]
		},
	},
	["team:17"] = {
		["pets"] = {
			"BattlePet-0-00000D5451F8", -- [1]
			"BattlePet-0-000012B01ED3", -- [2]
			"BattlePet-0-000012B146D1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10639\n\nStrategy added by DragonsAfterDark\n**For those without the Seaborne Spore**\n\nAny combination of Explode pets should work here. \n\nVideo for Fight (https://www.youtube.com/watch?v=whfyt1i8Zxs)\n\nTurn 1: Murder the Innocent\nTurn 2: Swap to your Iron Starlette\nTurn 3: Explode\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Explode\nBring in your Baa'l\nTurn 1: Murder the Innocent\n",
		["name"] = "Chittermaw",
		["tags"] = {
			"020329G", -- [1]
			"00271BB", -- [2]
			"0015QC", -- [3]
		},
		["teamID"] = "team:17",
		["targets"] = {
			175779, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:44"] = {
		["pets"] = {
			"BattlePet-0-000012B6764A", -- [1]
			0, -- [2]
			"BattlePet-0-000012B66DA8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9773\n\nStrategy added by Rebekha#21420\nTurn 1: Decoy\nTurn 2 & 3: Haywire\nTurn 4+: Alpha Strike until Tonsa dies\nChirps comes in\nBring in your Level Pet\nBring in your Teroclaw Hatchling\nTurn 1: Dodge\nTurn 2+: Claw until Chirps hp < 927\nTurn 3: Ravage until Chirps dies\nBrewly comes in\nTurn 1: Dodge when Brewly has the barrel throwing buff\nTurns 2-3: Ravage if Brewly hp < 619\nTurn 4: Claw until Brewly dies\nIf you have the world's worst RNG, bring back your Mech Axe to finish the job\n",
		["name"] = "Chen Stormstout",
		["tags"] = {
			"12171BR", -- [1]
			"ZL", -- [2]
			"11271C8", -- [3]
		},
		["teamID"] = "team:44",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:1",
		["targets"] = {
			71927, -- [1]
		},
	},
	["team:253"] = {
		["pets"] = {
			"BattlePet-0-000012BAC9E8", -- [1]
			"BattlePet-0-000012B01DE0", -- [2]
			"BattlePet-0-000012B589F6", -- [3]
		},
		["name"] = "nega",
		["tags"] = {
			"121C3K", -- [1]
			"21133O", -- [2]
			"111531F", -- [3]
		},
		["teamID"] = "team:253",
		["groupID"] = "group:10",
	},
	["team:258"] = {
		["pets"] = {
			"BattlePet-0-000006E4C793", -- [1]
			"BattlePet-0-000012B01EB7", -- [2]
			"BattlePet-0-000012B67F31", -- [3]
		},
		["notes"] = "Strategy added by Refreshe#1641\nThis script and strat worked way better than I expected for how simple brain it was...\n\nPriority 1: Primal Cry\nPriority 2: Poison Spit\nBring in your Mallard Duckling when Leviathan Hatchling dies.\nTurn 1+: Shriek\nBring in your Juvenile Scuttleback when Mallard Duckling dies.\nPriority 1: Dive dodge dive.\nPriority 2: Claw\n",
		["name"] = "Do You Even Train? (Aquatic)",
		["tags"] = {
			"022A1IN", -- [1]
			"0103377", -- [2]
			"20181NF", -- [3]
		},
		["teamID"] = "team:258",
		["groupID"] = "group:none",
	},
	["team:216"] = {
		["pets"] = {
			"BattlePet-0-000012B2E223", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14532\n\nStrategy added by Grevenilvec\nPrio 1: Bubble on CD\nPrio 2: Swarm of Flies if enemy doesn't have Swarm of Flies debuff\nPrio 3: Tongue Lash as filler\nBenax should kill Unfortunate Defias and Deadmines Parrot\nSwap to your Teroclaw Hatchling\nPrio 1: Nature's Ward if buff is not active\nPrio 2: Alpha Strike if enemy's health is above 309\nPrio 3: Ravage",
		["name"] = "Unfortunate Defias",
		["tags"] = {
			"22171SE", -- [1]
			"22271C8", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:216",
		["targets"] = {
			119346, -- [1]
		},
		["groupID"] = "group:4",
	},
	["team:187"] = {
		["pets"] = {
			"BattlePet-0-000012B01DC0", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5508\n\nStrategy added by DragonsAfterDark\nBe cautious, lest you give your enemies the tools to destroy you. *laughs*\n\nVideo for Fight (https://www.youtube.com/watch?v=zXxxLMjdfII)\n\nTurn 1+: Inflation\n",
		["name"] = "Voltgorger",
		["tags"] = {
			"2005198", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:187",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			154919, -- [1]
		},
	},
	["team:73"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B482D2", -- [2]
			"random:10", -- [3]
		},
		["notes"] = "Strategy added by Lazey\n*** 9.0.2 approved ***Illusional Barrier X with only 3 rounds cooldown, Psionic Storm dealing AoE damage and changing the weather to Arcane Winds to give Psychic Blast an additional attack. Looks dangerous but my answer is... Blistering Cold :-)To get as much Frostbite applications as possible on Mindshackle I use Blistering Cold two times before I force my Boneshard to die. To make it even worse for the opponent I also add a Bleeding effect. Black Claw and Shattered Defenses applied by Hunting Party, Flock or Swarm will then buff Frostbite/Bleeding damage.You can replace Zandalari Raptors with Foulfeather, Ikky or Chitterspine Skitterling (8.2 Nazjatar wild catch), the script can handle them all and will also bring your third pet to pass the last turn if your birdies die.\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: BONESTORM\nTurn 4: Blistering Cold (Boneshard dies)\nBring in your Black Claw + Swarm ability pet\nTurn 1: Black Claw\nTurn 2+: Hunting Party, Flock or Swarm\n\nWhen your Mech comes in (while using vulnerable Flying pets with Black Claw)\nPass turn\n",
		["name"] = "Mindshackle",
		["tags"] = {
			"11231TB", -- [1]
			"202A15R", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:73",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			154917, -- [1]
		},
	},
	["team:263"] = {
		["pets"] = {
			"BattlePet-0-000012B90214", -- [1]
			"BattlePet-0-000012B82344", -- [2]
			"BattlePet-0-000012B82340", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).In all my testing I've only seen Fethres using Feign Death once, so please excuse me for completely ignoring the RNG that would add to the fights.Why make it complicated, when we got spilled with these pets in Battle for Azeroth? When you don't have 3x of them, I guess someone in your Guild, etc. can help out.**Can't easily script the optimal Early Advantage usage, because scripts can't foresee our pet's HP (unfortunately Early Advantage doesn't really deal \"double damage\", it just does a 2nd hit when your HP is still lower after the 1st hit), so I'm just firing it when our pet's HP is lower at the start of a round.\n\nInfo:: Never refresh existing Void Tremors! While facing Fethres or Beeks, you can apply Void Tremors for the next enemy, but make sure your next attack will kill the active enemy so it's not wasted.\n\nStick to these priorities on all your pets, bring next pet when one dies:\n!: Skip Prio 1-3 when Void Tremors is active! (didnt wanna add this to each line)\nPrio 1:: Enemy has 1102HP or more -> Void Tremors\nPrio 2:: Enemy is not Talons, enemy has 734HP or less, Early Advantage is usable or ready next turn, and your HP is lower**) -> Void Tremors\nPrio 3:: Enemy is not Talons, enemy has 367HP or less -> Void Tremors\nPrio 4:: Your pet has lower HP than the enemy -> Early Advantage**\nPrio 5:: Scratch\n",
		["name"] = "Are They Not Beautiful? (Critter)",
		["tags"] = {
			"12282ON", -- [1]
			"12282ON", -- [2]
			"12282ON", -- [3]
		},
		["teamID"] = "team:263",
		["groupID"] = "group:none",
	},
	["team:116"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			0, -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8935\n\nStrategy added by Tinlar#1408\nYour leveling pet will take some minor back-line damage.\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nEnemy forces pet change to Ikky\nTurn 1: Black Claw\nTurn 2: Flock\nBring in your Level Pet\nTurn 1: Swap to your Boneshard\nTurn 2: BONESTORM or pass\n",
		["name"] = "Brain Tickling",
		["tags"] = {
			"11231TB", -- [1]
			"11181FS", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:116",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			162469, -- [1]
		},
	},
	["team:118"] = {
		["pets"] = {
			"BattlePet-0-000012B4838C", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Runisco\nPrio 1: Emerald Presence up. Use when 1 turn left\nPrio 2: Emerald Dream when health < 750\nPrio 3: Standby. There is no point in attacking, the bees stinging is cooldown based\nAs soon as one bee uses sting and dies, the others will. Your whelp should survive all 3.\n",
		["name"] = "What's the Buzz?",
		["tags"] = {
			"222814F", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:118",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			140880, -- [1]
		},
	},
	["team:125"] = {
		["pets"] = {
			"BattlePet-0-000012B99945", -- [1]
			0, -- [2]
			"BattlePet-0-000012B6AE3C", -- [3]
		},
		["notes"] = "Strategy added by Berendain\nUpdate:  TD Script updated on 20th May, 2021.  Make sure you have the updated script.You should never need to use pet bandages when leveling using this team.  You may occasionally want to heal your pets, but the revive pets ability, available every 8 minutes, will be more than enough.Using this strategy, you will normally win between 1:15 and 1:25.  You may win in as short a time as 1:12.  On the other hand, if you get unlucky and miss Stumpers' Cute Face several times in a row, the fight may take much longer.  The longest the fight has taken me was 1:55, after I missed Stumpers four times.The TD script works if you're using an Abyssal Eel, which has Acid Rain instead of Cleansing Rain.  The fight will take the same amount of time, but without healing your team each fight you may need to use a pet bandage occasionally.  \n\nTurn 1: Focus\nTurn 2: Sandstorm\nTurn 3: Zap until Foof dies\nStumpers comes in\nTurn 1: Zap\nTurn 2: Swap to your Level Pet\nTurn 3: Swap to your Ranishu Runt\nFollow this priority list until Stumpers dies:\nPriority 1: Refresh Focus when it has 1 round remaining (or has expired)\nPriority 2: Sandstorm\nPriority 3: Zap\nLil' Sizzle comes in\nTurn 1: Swap to your Voidskimmer\nTurn 2: Pump\nTurn 3: Cleansing Rain\nTurn 4: Unleash Pump and Lil' Sizzle dies\n",
		["name"] = "Fight Night: Amalia",
		["tags"] = {
			"11142BH", -- [1]
			"ZL", -- [2]
			"01282PH", -- [3]
		},
		["teamID"] = "team:125",
		["targets"] = {
			107489, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:202"] = {
		["pets"] = {
			"BattlePet-0-000012BA9563", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			"BattlePet-0-000012B01DE4", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6023\n\nStrategy added by Shenk\nReads hard, but it's actually simple. Just using the abilities as you'd usually always do.\nGuardian Cobra Hatchling can solo it when there is no magic enemy pet. \n\nTurn 1: Blinding Poison\nTurn 2: Flurry until Risen Guard enters undead phase\n*: Risen Guard enters undead phase. Is the next pet a Lost Soul or Tormented Spirit?\nTurn 4:  Yes - Swap to your Mechanical Pandaren Dragonling, then skip to the \"Magic enemy\" at the bottom\nTurn 4: No - Pass\nAn enemy pet comes in\nTurn 1: Blinding Poison\nTurn 2: Flurry until the enemy enters undead phase\n The second pet enters undead phase. Is the next pet a Lost Soul or Tormented Spirit?\nTurn 3: Yes - Swap to your Mechanical Pandaren Dragonling, then skip to the \"Magic enemy\" at the bottom\nTurn 4: No - Pass\n\nMagic enemy\nTurn 1: Thunderbolt\nTurn 2: Decoy\nTurn 3: Breath until enemy pet dies\n",
		["name"] = "Risen Guard",
		["tags"] = {
			"211524E", -- [1]
			"1225QC", -- [2]
			"11181TG", -- [3]
		},
		["teamID"] = "team:202",
		["targets"] = {
			155267, -- [1]
		},
		["groupID"] = "group:8",
	},
	["team:132"] = {
		["pets"] = {
			"BattlePet-0-000012B673F3", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6995\n\nStrategy added by Shenk\nYou had your chance Remte.\n\nTurn 1: Alert!\nTurn 2: Supercharge\nTurn 3: Ion Cannon\n",
		["name"] = "Crawg in the Bog",
		["tags"] = {
			"12272KT", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:132",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			141588, -- [1]
		},
	},
	["team:248"] = {
		["pets"] = {
			"BattlePet-0-000012B15603", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Ratsch#21832\nFlying level pets need atleast 306 HP otherwise they'll die to Psionic StormIf we don't count crits, your leveling pets needs these amounts of hp:Flying: >306Mechanic: >134everything else: >203\n\nTurn 1: Flame Breath\nTurn 2: Razor Talons\nTurn 3: Flame Breath\nTurn 4: Armageddon\nBring in your Mechanical Pandaren Dragonling\nTurn 5: Explode\n",
		["name"] = "Mini Manafiend Melee (2)",
		["tags"] = {
			"112430S", -- [1]
			"0015QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:248",
		["groupID"] = "group:none",
		["preferences"] = {
			["minHP"] = 204,
			["minXP"] = 3,
		},
	},
	["team:191"] = {
		["pets"] = {
			"BattlePet-0-000012BA956E", -- [1]
			"BattlePet-0-000012B01DBC", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Reilly\nPriority 1: Maintain Toxic Skin\nPriority 2: Whirlpool if debuff is not active\nPriority 3: Tentacle Slap\nBring in your Leviathan Hatchling\nPriority 1: Maintain Toxic Skin\nPriority 2: Whirlpool if debuff is not active\nPriority 3: Water Jet\nAny standard attack will finish the fight\n",
		["name"] = "Bloated Leper Rat",
		["tags"] = {
			"12152CU", -- [1]
			"21171IN", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:191",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:6",
		["targets"] = {
			146005, -- [1]
		},
	},
	["team:237"] = {
		["pets"] = {
			"BattlePet-0-000006E4C782", -- [1]
			"BattlePet-0-000012B4874E", -- [2]
			"BattlePet-0-000011F771E8", -- [3]
		},
		["notes"] = "Strategy added by Simion\nThere seems to be a bit of RNG involved, because sometimes the attack order does vary.\n\nTurn 1: Bite\nTurn 2: Howl\nTurn 3: Bite until Chrominius dies (Lifft should be dead and 2 Bite have hit Brul'dan)\nBring in your Nexus Whelpling\nTurn 1: Frost Breath until Nexus Whelpling dies (Brul'dan should be dead and Nexus Whelpling gets killed by Swoles Headbutt) \nBring in your Untamed Hatchling\nTurn 7: Roar because Swole will use Dive\nTurn 8: Claw until Swole dies\n",
		["name"] = "Do You Even Train? (Dragon)",
		["tags"] = {
			"1106140", -- [1]
			"200414D", -- [2]
			"110713V", -- [3]
		},
		["teamID"] = "team:237",
		["groupID"] = "group:none",
	},
	["team:42"] = {
		["pets"] = {
			"BattlePet-0-000006E4C782", -- [1]
			"BattlePet-0-000008968258", -- [2]
			"BattlePet-0-000012B5CB59", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/12678\n\nStrategy added by Summon#1193\nI mangled most of my teams and spare pets doing the challenge mode dungeon. I had a hand full of pets left that could kill Infectus but would die to his invulnerability turn. With Stitched Pup we have Flurry and 2x heals and our own invulnerability turn if we get some bad RNG. A Flayer Youngling running 1/2/1 and deflecting Bolt, stunning on CD works for Anub Idols spot too, Thanks to DeJules Strategy for inspiring this when I thought I was doomed. Need to test validity of Rabid Strike, Flurry usage. Not sure TD would work since Deflection use is situational.\n\nTurn 1: Bite\nTurn 2: Howl\nTurns 3-5: Surge of Power\nSmokey dies\nAn enemy pet comes in Pyro\nBite till Chrominius dies\nBring in your Anubisath Idol\nBeware Elemintium Bolt, its a delayed nuke make sure to deflect when it shows turn 1 left\nKeep up Sandstorm, Crush for Filler and Deflection Bolt Fall\nPyro Dies \nAn enemy pet comes in Infectus\nCrush till Idol dies\nBring in your Stitched Pup\nFlurry Filler\nConsume Corpse at half health, can use twice since we lost 2 pets.\nFlurry till Infectus falls over\n",
		["name"] = "Ezra Grimm",
		["tags"] = {
			"1126140", -- [1]
			"1116143", -- [2]
			"201713Q", -- [3]
		},
		["teamID"] = "team:42",
		["targets"] = {
			155414, -- [1]
		},
		["groupID"] = "group:8",
	},
	["team:74"] = {
		["pets"] = {
			"BattlePet-0-000012B5CB60", -- [1]
			"BattlePet-0-000012B5CDB5", -- [2]
			"BattlePet-0-000012B146CC", -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\nSubject to multiple crits mostly with;Timeless Mechanical Dragonling as alt #2 pet.\n\nTurn 1: Void Crash\nTurn 2: Swap to your Obsidian Warwhelp / Timeless Mechanical Dragonling\nTurn 3: Flame Breath\nTurn 4: Time Bomb\nTurn 5: Armageddon\nBring in your Chrominius\nTurn 6: Arcane Explosion (Pass instead if Star Tail is at or below 206)\nTurn 7: Arcane Explosion\nTurn 8: Howl (Can be skipped if Brite is at or below 1665 and Dragonkin racial available)\nTurn 9: Surge of Power\n",
		["name"] = "Airborne Defense Force",
		["tags"] = {
			"00232OR", -- [1]
			"1223455", -- [2]
			"2126140", -- [3]
		},
		["teamID"] = "team:74",
		["targets"] = {
			173377, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:112"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"BattlePet-0-000012B15603", -- [2]
			"BattlePet-0-000011F1418A", -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\nTurn 1: Toxic Fumes\nTurn 2: Poison Protocol\nBring in your Timeless Mechanical Dragonling\nTurn 3: Time Bomb\nTurn 4: Armageddon\nGorm Harrier comes in\nTurn 5: Impale\nDrakeula comes in\nTurn 6: Slicing Wind\nTurn 7: Puncture Wound, Yu'shor is swapped in and hit by this\nDrakeula comes in, Or ( Yu'shor might survive if you're not using Gorm Harrier )\nTurn 8: Pass if Drakeula is back in, OR ( Use Impale if Yu'shor is still alive )\n",
		["name"] = "Paws of Thunder",
		["tags"] = {
			"01142OQ", -- [1]
			"022430S", -- [2]
			"12242R9", -- [3]
		},
		["teamID"] = "team:112",
		["targets"] = {
			201878, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:239"] = {
		["pets"] = {
			"BattlePet-0-000012B96DD7", -- [1]
			"BattlePet-0-000012B9027A", -- [2]
			"BattlePet-0-000012B90271", -- [3]
		},
		["notes"] = "Strategy added by Sleepywillo\nStrat is from 7181995 on Wowhead. None of the other strats here worked for me but this worked first time. Hope it helps.\n\nTurn 1: Apocalypse\nTurn 2: Swap to Scooter the Snail\nTurn 3: Maintain Acidic Goo\nTurn 4: Use Ooze Touch to get Bassalt as low as possible before dying\nTurn 5: Bring in Rapana Whelk\nTurn 6: Finish Bassalt off with Rapana Whelk and maintain Acidic Goo\nTurn 7: Use Dive to dodge the Whirlpool on Clawz\nTurn 8: Apocalypse should be coming to a close when Murrey is left. You just have to survive here.\n",
		["name"] = "To a Land Down Under (Critter)",
		["tags"] = {
			"12262J8", -- [1]
			"111CN7", -- [2]
			"111CN7", -- [3]
		},
		["teamID"] = "team:239",
		["groupID"] = "group:none",
	},
	["team:47"] = {
		["pets"] = {
			"BattlePet-0-000012B4874E", -- [1]
			"BattlePet-0-000012B01E0B", -- [2]
			"BattlePet-0-000006E4C7A1", -- [3]
		},
		["notes"] = "Strategy added by Kalagren\nNexus Whelpling comes in\nTurn 1: Arcane Storm\nThen follow priorities for both Nexus Whelpling and Stormie:\n(This means bringing in Stormie when Nexus Whelpling dies)\nPrio 1: Mana Surge\nPrio 2: Arcane Storm\nPrio 3: Jolt / Tail Sweep\nBring in your Lil' Tarecgosa\nPrio 1: Surge of Power when Talons is active and within kill range \nor Dragonkin racial is active (Must be the finisher)\nPrio 2: Arcane Blast / Arcane Storm if not in Surge of Power finishing range\n",
		["name"] = "Are They Not Beautiful? (Dragon)",
		["tags"] = {
			"122414D", -- [1]
			"222739M", -- [2]
			"2117A0", -- [3]
		},
		["teamID"] = "team:47",
		["targets"] = {
			204792, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:15"] = {
		["pets"] = {
			"BattlePet-0-000012B146CC", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Saintgabrial\nTurn 1+: Arcane Explosion until Chrominius dies\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Breath\nTurn 2: Thunderbolt\nTurn 3+: Breath until Apexis Guardian resurrects\nThen:: Explode - your small pet gets the full experience points :-)\n",
		["name"] = "Vesharr",
		["tags"] = {
			"2126140", -- [1]
			"1215QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:15",
		["targets"] = {
			87123, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:54"] = {
		["pets"] = {
			"BattlePet-0-000012B3E786", -- [1]
			"BattlePet-0-000012B01DC0", -- [2]
			"BattlePet-0-000012B673F3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7098\n\nStrategy added by Shenk\nTurn 1: Black Claw\nTurn 2-4: Swarm\nTurn 4/5: Pass during the undead round (Depending on the breed you are using this happens either in the 4th or 5th round.)\nFury comes in\nTurn 1: Black Claw (Your Chitterspine Skitterling might be dead already depending on the breed or bad luck. That's not a problem, just go on.)\nBring in your Lil' Bling\nAgainst Fury follow this priority list:\nPrio 1: Extra Plating\nPrio 2: Make it Rain\nPrio 3: Inflation\nGlitzy comes in\nTurn 1+: Inflation until Lil' Bling dies\nBring in your Microbot XD\nTurn 1: Supercharge\nTurn 2: Ion Cannon\n",
		["name"] = "Tasha Riley",
		["tags"] = {
			"122B2IO", -- [1]
			"2215198", -- [2]
			"12272KT", -- [3]
		},
		["teamID"] = "team:54",
		["targets"] = {
			160210, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:13"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"BattlePet-0-000012B5CB67", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Askevin\nA simple AoE strat that wins in 12-13 rounds, typically.\n\nTurn 1: Poison Protocol\nTurn 2: Void Nova\nTurn 3: Swap to Infernal Pyreclaw\nTurn 4: Great Sting\nTurn 5: Cleave\nTurn 6: Cleave\nTurn 7: Cleave\nTurn 8: Swap to Level Pet\nTurn 9: Swap to Anomalus\nTurn 10: Poison Protocol\nTurn 11: Void Nova\nTurn 12: Ooze Touch. Anomalus dies and Mist Wraith enters Undead round, swap to Infernal Pyreclaw\nTurn 13: Pass\n",
		["name"] = "Jarrun's Ladder",
		["tags"] = {
			"12142OQ", -- [1]
			"011C219", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:13",
		["targets"] = {
			105455, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:224"] = {
		["pets"] = {
			"BattlePet-0-000012B67A9B", -- [1]
			"BattlePet-0-000012B6AE3C", -- [2]
			"BattlePet-0-000012B90213", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).This strategy will just result in a win or disaster, so please don't complain about having to repeat the fight. Family Battler is a one-time thing, so please be patient or just try another strategy that suits you better.For the 3rd Slot, there are tons of alternate Nazjatar Slimy pets with that move set, but I only tried with the B/B Hermit, so I added its stats as a requirement.There are two situations when continuing makes little to no sense:1. Beeks kills Voidskimmer (don't even go further, Script will also immediately Forfeit)2. Voidskimmer dies without affecting Talons (I don't recommend going further, I don't think you can win without critical hits, and the Script will Forfeit unless you comment that line out or delete it)\n\nTurn 1: Pump\nTurn 2: Prowl\nTurn 3: Pump\nTurns 4+: Rush (Fethres dies, Beeks comes in, spam until dead)\nBring in your Voidskimmer and stick to these priorities:\nPrio 1:: When Beeks kills your Voidskimmer -> Forfeit\nPrio 2:: Void Tremors\nPrio 3:: Feedback\nSlimy Hermit Crab comes in\nTurn 1: When Voidskimmer didn't apply Void Tremors OR deal direct damage to Talons -> Forfeit (or ignore this when you wanna try to kill Talons with critical hits ;-)\nStick to these priorities:\nPrio 1:: No Void Tremors active, Talons has 968HP or more -> Sewage Eruption\nPrio 2:: Moonfire\nPrio 3:: Nether Blast\n",
		["name"] = "Are They Not Beautiful? (Aquatic)",
		["tags"] = {
			"21152K4", -- [1]
			"20182PH", -- [2]
			"221C2MD", -- [3]
		},
		["teamID"] = "team:224",
		["groupID"] = "group:none",
	},
	["team:6"] = {
		["pets"] = {
			"BattlePet-0-000012BB19D8", -- [1]
			"BattlePet-0-00000D5451F8", -- [2]
			"BattlePet-0-00000D511EB1", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nTurn 1: Illuminate\nTurn 2: Swap to your Baa'l\nTurn 3: Murder the Innocent\nTurn 4: Swap to your Death Seeker\nTurn 5: Murder the Innocent\n",
		["name"] = "Wildfire - Legendary",
		["tags"] = {
			"002A1L4", -- [1]
			"020329G", -- [2]
			"02062V1", -- [3]
		},
		["teamID"] = "team:6",
		["targets"] = {
			200688, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:180"] = {
		["pets"] = {
			"BattlePet-0-000012B67566", -- [1]
			"BattlePet-0-000006E4C793", -- [2]
			"BattlePet-0-000012B5E5CA", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5612\n\nStrategy added by Reilly\nAny pet with Toxic Skin and a direct damage abiliy will work in slots 2 and 3.\n\nTurn 1: Corpse Explosion\nBring in your Leviathan Hatchling\nTurn 1: Toxic Skin\nTurn 2: Water Jet\nTurn 3: Water Jet\nYour Boghopper is swapped in\nTurn 1: Toxic Skin\nTurn 2+: Steam Vent until Sludge Belcher dies\n",
		["name"] = "Sludge Belcher",
		["tags"] = {
			"002AJJ", -- [1]
			"210A1IN", -- [2]
			"11052AU", -- [3]
		},
		["teamID"] = "team:180",
		["targets"] = {
			150922, -- [1]
		},
		["groupID"] = "group:8",
	},
	["team:192"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1233\n\nTurn 1: Pass\nTurn 2: Pass\nTurn 3: Haunt\nTurn 4: Bring in Ikky\nTurn 5: Black Claw\nTurns 6+: Flock",
		["name"] = "\"Captain\" Klutz",
		["tags"] = {
			"221616M", -- [1]
			"11181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:192",
		["targets"] = {
			119408, -- [1]
		},
		["groupID"] = "group:4",
	},
	["team:52"] = {
		["pets"] = {
			"BattlePet-0-000012B6760E", -- [1]
			"BattlePet-0-000012B118ED", -- [2]
			"BattlePet-0-000012BA9541", -- [3]
		},
		["notes"] = "Strategy added by Dysphoric\nCredit to Comment in wowhead from Buuloki: https://ptr.wowhead.com/npc=160209/horu-cloudwatcher#commentsAdded TD from DragonsAfterDark on 1/16/2020\n\nTurn 1: Bubble\nTurn 2-4: Stampede\nTurn 5: Punch\nTurn 6: Punch\nBeta comes in\nTurn 6: Stampede\nBring in your Draenei Micro Defender\nTurn 1+: Batter until Beta dies\nAlpha comes in\nTurn 2: If your health >1061 Batter two times else Batter only 1 time\nTurn 3: Explode\nBring in your Personal World Destroyer\nTurn 1: Supercharge\nTurn 2: Metal Fist\nTurn 3: Metal Fist\n",
		["name"] = "Horu Cloudwatcher",
		["tags"] = {
			"12231SF", -- [1]
			"21181DA", -- [2]
			"121485", -- [3]
		},
		["teamID"] = "team:52",
		["targets"] = {
			160209, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:101"] = {
		["pets"] = {
			"BattlePet-0-000012B146CA", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			"BattlePet-0-000012B146D1", -- [3]
		},
		["notes"] = "Strategy added by unknown\nStrategy by Rendigar published on [url=https://www.warcraftpets.com/community/forum/viewtopic.php?f=3&t=7556#p57980]Warcraft Pets[/url].\n\nTurn 1: Missile \nTurn 2: Decoy \nTurns 3+: Missile until Woodcarver is dead \nLightstalker comes in \nTurn 1: Swap to Chrominius\nTurn 2: Howl \nTurn 3: Surge of Power – Lightstalker dies\nNeedleback comes in and kills Chrominius \nBring back in your Darkmoon Zeppelin\nTurn 1 : Missile \nTurn 2: Missile \nTurn 3: Decoy \nTurns 4+: Missile until Needleback is below 619 health \nExplode \nYour level pet enjoys the XP!\n",
		["name"] = "Mo'ruk",
		["tags"] = {
			"2215198", -- [1]
			"2126140", -- [2]
			"1225QC", -- [3]
		},
		["teamID"] = "team:101",
		["targets"] = {
			66733, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:50"] = {
		["pets"] = {
			"BattlePet-0-000012BEE376", -- [1]
			"BattlePet-0-000012B607A8", -- [2]
			"BattlePet-0-000012C570D3", -- [3]
		},
		["notes"] = "Strategy added by 하늘용#3273\n9\n\nTurn 1: Unholy Ascension\nTurn 2: Void Nova\nTurn 3: Poison Protocol\nTurn 4: Ooze Touch\nBring in your Anomalus\nTurn 1: Call Darkness\nTurn 7: Lesser Charged Gale dead & Lesser Twisted Current come in\nTurn 8: Nocturnal Strike\nLesser Twisted Current dead & Mind Warper come in\nTurn 1: Quills\n",
		["name"] = "Captured Evil",
		["tags"] = {
			"00282KM", -- [1]
			"12142OQ", -- [2]
			"21141LH", -- [3]
		},
		["teamID"] = "team:50",
		["targets"] = {
			141046, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:40"] = {
		["pets"] = {
			"BattlePet-0-000012B99B2E", -- [1]
			"BattlePet-0-000012B675D0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7590\n\nStrategy added by Shenk\nTurn 1: Phase Shift\nTurn 2+: Tail Sweep until your dragonkin racial proccs (2-3 times)\nTurn 3: Twilight Meteorite with your racial buff\nTurn 4: Tail Sweep. Wisdom dies\nPatience comes in\nTurn 1: Tail Sweep\nTurn 2: Phase Shift\nTurn 3+: Tail Sweep until either one of the pets dies\nUsually Twilight Clutch-Sister dies against Patience, but with some luck you will beat it and can actually go on against Knowledge. In that scenario play the same rotation like you did against the 1st pet.\nBring in your Scourged Whelpling\nTurn 1: Tail Sweep. Patience dies\nKnowledge comes in\nTurn 1: Call Darkness\nTurn 2+: Dreadful Breath\n",
		["name"] = "Lorewalker Cho",
		["tags"] = {
			"112B211", -- [1]
			"2128GQ", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:40",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:3",
		["targets"] = {
			71926, -- [1]
		},
	},
	["team:85"] = {
		["pets"] = {
			"BattlePet-0-000012B01ED3", -- [1]
			"BattlePet-0-000012B58B24", -- [2]
			"BattlePet-0-000012B146CC", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6117\n\nStrategy added by Neevi#2149\nWorked pretty well for me\n\nTurn 1: Wind-Up\nTurn 2: Wind-Up\nTurn 3: Explode, switch to other Explode Pet\nBring in your Explode Pet\nTurn 4: Explode\nBring in your Chrominius\nTurn 5: Howl\nTurn 6: Surge of Power\n",
		["name"] = "Giant Opaline Conch",
		["tags"] = {
			"10271BB", -- [1]
			"020CAJ", -- [2]
			"0126140", -- [3]
		},
		["teamID"] = "team:85",
		["targets"] = {
			154921, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:167"] = {
		["pets"] = {
			"BattlePet-0-000012B146CB", -- [1]
			"BattlePet-0-000012B48707", -- [2]
			"BattlePet-0-000012B5CE8E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4600\n\nStrategy added by DragonsAfterDark\nS/S Foulfeather (2,2,1) is a good alternative to Ikky. I changed the Script so there won't be a conflict between Savage Talon and Peck :)\n\nPriority 1: Black Claw\nPriority 2: Flock\nPriority 3: Savage Talon to finish off an enemy if needed\nBring in your Nexus Whelpling\nTurn 1+: Mana Surge & Tail Sweep to finish fight\n",
		["name"] = "Son of Skum",
		["tags"] = {
			"11181FS", -- [1]
			"122814D", -- [2]
			"212B1G9", -- [3]
		},
		["teamID"] = "team:167",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:7",
		["targets"] = {
			116789, -- [1]
		},
	},
	["team:31"] = {
		["pets"] = {
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			"BattlePet-0-000012B146CA", -- [3]
		},
		["notes"] = "Strategy added by Lazey\n*** 9.0.2 approved ***\n\nTurn 1: Black Claw\nTurn 2+: Flock until Atherton is dead.\nBybee comes in\nTurn 1: Black Claw\nTurn 2+: Flock until Bybee is dead.\nJennings comes in\nTurn 1: Black Claw until Ikky has 366HP or less. (Ikky must be killed by Jennings!)\nTurn 2: Flock until Ikky is dead.\nBring in your Level Pet\nSwap to your Lil' Bling\nTurn 1: Make it Rain\nAny standard attack will finish the fight\n",
		["name"] = "Night Horrors",
		["tags"] = {
			"21181FS", -- [1]
			"ZL", -- [2]
			"1215198", -- [3]
		},
		["teamID"] = "team:31",
		["targets"] = {
			140461, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:178"] = {
		["pets"] = {
			"BattlePet-0-000012B0D34C", -- [1]
			0, -- [2]
			"BattlePet-0-000012B146CC", -- [3]
		},
		["notes"] = "Strategy added by Kalagren\nScript by Damiez\n\nTimeless Mechanical Dragonling comes in\nTurn 1: Time Bomb\nTurn 2: Armageddon\nBring in your Level Pet\nTurn 3: Swap to your Chrominius\nTurn 4: Howl (Time Bomb does NOT consume Howl at this time, yet gains the multiplier.)\nTurn 5: Surge of Power\n",
		["name"] = "Flight of the Vil'thik",
		["tags"] = {
			"022430S", -- [1]
			"ZL", -- [2]
			"0126140", -- [3]
		},
		["teamID"] = "team:178",
		["preferences"] = {
			["minHP"] = 851,
			["minXP"] = 15,
		},
		["groupID"] = "group:none",
		["targets"] = {
			162471, -- [1]
		},
	},
	["team:163"] = {
		["pets"] = {
			"BattlePet-0-000012B118E8", -- [1]
			"BattlePet-0-000006E4C775", -- [2]
			"BattlePet-0-000012B99B2C", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nWhatever pet you have in the third slot should only need to be there to soak backline damage, so make sure it's one you won't be using later on. \n\nTurn 1: Ice Tomb\nTurn 2: Pass\nTurn 3: Call Blizzard\nTurn 4: Ice Lance\nTurn 5: Ice Lance\nTurn 6: Pass\nTurn 7: Ice Tomb\nTurn 8: Pass – your Rotten Little Helper dies\nBring in your Father Winter's Helper\nTurn 1: Call Blizzard\nTurn 2: Ice Lance\nTurn 3: Ice Tomb\nTurn 4: Pass\nTurn 5: Call Blizzard\nTurn 6+: Ice Lance until Annoy-O-Tron dies\n",
		["name"] = "Prototype Annoy-O-Tron",
		["tags"] = {
			"22241A5", -- [1]
			"21133N", -- [2]
			"12262CR", -- [3]
		},
		["teamID"] = "team:163",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:6",
		["targets"] = {
			146001, -- [1]
		},
	},
	["team:79"] = {
		["pets"] = {
			"BattlePet-0-000012B485C2", -- [1]
			"BattlePet-0-000012B4874E", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nThere seems to be an issue with using Duration and < or > conditionals with non-active enemy abilites. The script I posted *did* work, just not with the most recent update. I had some kind of leftover from the previous version that didn't cause this issue for me. I've posted a new script. Deleted the one in-game, copied from here, and re-tested. It worked. [url=https://www.youtube.com/watch?v=XggSOaSORe4&t=6s]Video for Fight[/url]\n\nTurn 1: Whirlpool\nTurns 2-3: Dive\nTurn 4+: Water Jet until Ash dies\nFang comes in\nTurn 1: Whirlpool\nTurn 2+: Water Jet until Pandaren Water Spirit dies\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\nSwarm comes in\nTurn 1+: Mana Surge may continue\n~~: Arcane Storm & Tail Sweep until Swarm or Nexus Whelp dies\nIf needed:\nBring in your Beast pet\nTurn 1: Any standard attack will finish the fight\n",
		["name"] = "Resilient Survivors",
		["tags"] = {
			"1219R4", -- [1]
			"122414D", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:79",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			173315, -- [1]
		},
	},
	["team:157"] = {
		["pets"] = {
			"BattlePet-0-000012B5C356", -- [1]
			"BattlePet-0-000012B48707", -- [2]
			"BattlePet-0-000012B6751A", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7895\n\nStrategy added by Orpartlu\nTurn 1: Falcosaur Swarm!\nTurn 2: Falcosaur Swarm! Continues.\nTurn 3: Predatory Strike\nLilly Dies.\nTurn 4: Falcosaur Swarm!\nSnowfeather Hatchling gets swapped out for Nexus Whelpling by Molaze.\nTurn 5: Arcane Storm\nTurn 6: Mana Surge\nMolaze Dies.\nTurn 7: Mana Surge continues.\nTicker may die here. If not finish with anything.\n",
		["name"] = "Marshdwellers",
		["tags"] = {
			"12151TM", -- [1]
			"122814D", -- [2]
			"12281LP", -- [3]
		},
		["teamID"] = "team:157",
		["targets"] = {
			141529, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:8"] = {
		["pets"] = {
			"BattlePet-0-000012B99D14", -- [1]
			"BattlePet-0-000012C1A7C1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Kalagren\nLevel pet takes 129 Elemental damage.[url=https://www.wow-petguide.com/Strategy/10874/Fight_Night:_Amalia]Credit[/url] goes to Berendain for giving me the idea to mitigate Sunlight with Sandstorm.WhyDaRumGone gets credit for the 2nd pet regarding his comment [url=https://www.wow-petguide.com/Comment/110188]here[/url].\n\nChip comes in\nTurn 1: Sandstorm\nTurn 2: Swap to your Voidskimmer\nTurn 3: Cleansing Rain\nTurns 4-5: Pump and Sunny dies\nTurns 6-7: Pump and Roots dies\nTurn 8: Pass unless Voidskimmer HP < 667 use Cleansing Rain and eat the stun\nTurn 9: Pass and Voidskimmer eats Lift-Off and dies\nBring in your Level Pet\nTurn 10: Swap to your Chip\nTurn 11: Sandstorm\nTurn 12: Stone Rush\nTurn 13: Quicksand\nTurn 14: Stone Rush\n",
		["name"] = "Training with Durian",
		["tags"] = {
			"212339G", -- [1]
			"11242PH", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:8",
		["preferences"] = {
			["minHP"] = 130,
		},
		["groupID"] = "group:none",
		["targets"] = {
			99035, -- [1]
		},
	},
	["team:145"] = {
		["pets"] = {
			"BattlePet-0-000012B01DC0", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"BattlePet-0-00000D70BC6D", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1827\n\nStrategy added by NostrA#2338\nprops to Aranesh for his/her strategy, i just changed the TD Script and Strategy to make Teroclaw viable again\n\nTurn 1: use Extra Plating\nTurn 2: use Make it Rain\nTurn 3+: use Inflation until Dreadcoil is dead\nan enemy comes in\nTurn 1+: use Inflation until Lil' Bling dies\nBring in your Teroclaw Hatchling\nenemy HP < 618: use Ravage\nif the target enemy is a Flying enemy, you want to use Ravage when the enemy HP is under 406\nwhen not active: use Nature's Ward\nelse: use Alpha Strike\n",
		["name"] = "Dreadcoil",
		["tags"] = {
			"2215198", -- [1]
			"22271C8", -- [2]
			"11141TC", -- [3]
		},
		["teamID"] = "team:145",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:7",
		["targets"] = {
			116791, -- [1]
		},
	},
	["team:259"] = {
		["pets"] = {
			"BattlePet-0-000012B589F6", -- [1]
			"BattlePet-0-000012B58A19", -- [2]
			"BattlePet-0-000012B58989", -- [3]
		},
		["name"] = "wankah",
		["tags"] = {
			"121531F", -- [1]
			"121B31F", -- [2]
			"121A31F", -- [3]
		},
		["teamID"] = "team:259",
		["groupID"] = "group:10",
	},
	["team:162"] = {
		["pets"] = {
			"BattlePet-0-00000D5451F8", -- [1]
			"BattlePet-0-00000D511EB1", -- [2]
			"BattlePet-0-000012B01E92", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/17855\n\nStrategy added by WhyDaRumGone\nTurn 1: Murder the Innocent\nTurn 2: Swap to your Death Seeker\nTurn 3: Murder the Innocent\nTurn 4: Eyeblast\nTurn 5: Pass, Death Seeker dies.\nBring in your Level Pet\nTurn 6: Swap to your Baa'l\nTurn 7: Darkflame\nTurn 8: Murder the Innocent\n",
		["name"] = "Yu'la, Broodling of Yu'lon",
		["tags"] = {
			"222329G", -- [1]
			"12162V1", -- [2]
			"11153Q", -- [3]
		},
		["teamID"] = "team:162",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:3",
		["targets"] = {
			72291, -- [1]
		},
	},
	["team:75"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B67566", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\n[url=https://www.youtube.com/watch?v=pgoeN1Vbrrg]Video for Fight[/url]\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Infected Squirrel\nTurn 1: Pass\nTurn 2: Creeping Fungus\nTurn 3+: Stampede until Infected Squirrel & Chi-Chi, Hatchling of Chi-Ji dies\nIf needed:\nBring in any pet to clean up\n",
		["name"] = "Chi-Chi, Hatchling of Chi-Ji",
		["tags"] = {
			"021316M", -- [1]
			"220AJJ", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:75",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			72285, -- [1]
		},
	},
	["team:86"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Werloz\nTurn 1: Curse of Doom\nTurn 2: Haunt\nTurn 3: Black Claw\nTurns 4-6: Flock\nRascal die\n",
		["name"] = "Ardenweald's Tricksters",
		["tags"] = {
			"121316M", -- [1]
			"21181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:86",
		["targets"] = {
			173381, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:65"] = {
		["pets"] = {
			"BattlePet-0-000012B99C74", -- [1]
			"BattlePet-0-000012B99CCC", -- [2]
			"random:7", -- [3]
		},
		["notes"] = "Strategy added by Reilly\nTurn 1: Barkskin\nTurn 2: Bite\nTurn 3: Bite\nTurn 4: Dazzling Dance\nTurn 5+: Bite\nAn enemy pet comes in\nPriority 1: Maintain Barkskin\nPriority 2: Maintain Dazzling Dance\nPriority 3: Fill with Bite\nAn enemy pet comes in\nTurn 1+: Bite until Dandelion Frolicker dies\nBring in your Bonkers\nTurn 1+: Bite until Bonkers dies\nBring in your Elemental pet\nAny standard attack will finish the fight\n",
		["name"] = "Cockroach",
		["tags"] = {
			"222519H", -- [1]
			"221419V", -- [2]
			"ZR7", -- [3]
		},
		["teamID"] = "team:65",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:6",
		["targets"] = {
			145971, -- [1]
		},
	},
	["team:106"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by bios\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up\nTurn 5: Wind-Up\n",
		["name"] = "Mega Bite",
		["tags"] = {
			"10181BB", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:106",
		["targets"] = {
			173133, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:95"] = {
		["pets"] = {
			0, -- [1]
			"BattlePet-0-000012B146C7", -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["notes"] = "Strategy added by Dpaul\nLevel pet variation on Kylana#1731's strategy\n\nTurn 1: Pass\nBring in your Boneshard\nTurn 3: Blistering Cold\nTurn 4: Chop\nBring in your Ikky\nTurn 6: Black Claw\nTurn 7: Flock\n",
		["name"] = "Creakclank",
		["tags"] = {
			"ZL", -- [1]
			"11231TB", -- [2]
			"01181FS", -- [3]
		},
		["teamID"] = "team:95",
		["targets"] = {
			154925, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:241"] = {
		["pets"] = {
			"BattlePet-0-000012C2D394", -- [1]
			"BattlePet-0-000012B607A8", -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["name"] = "Deeptide Fingerling",
		["tags"] = {
			"222B1T1", -- [1]
			"22142OQ", -- [2]
			"21181FS", -- [3]
		},
		["teamID"] = "team:241",
		["groupID"] = "group:9",
	},
	["team:230"] = {
		["pets"] = {
			"BattlePet-0-000012B673F3", -- [1]
			"BattlePet-0-000012B146D0", -- [2]
			"BattlePet-0-000012B0D34C", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Supercharge\nTurn 2: Ion Cannon\nBeeks comes in\nTurn 3+: Alert! until dead\nBring in your Iron Starlette\nTurn 1: Wind-Up\nTurn 2: Supercharge -- Skip this if Beeks has < 894 hp\nTurn 3: Wind-Up\nTurn 4: Powerball if needed to kill Beeks\nTalons comes in\nTurn 1+: Powerball until dead\nBring in your Timeless Mechanical Dragonling\nPrio 1: Decoy when there's 1 round left on Conflagrate's CD\nPrio 2: Time Bomb\nPrio 3: Flame Breath\n",
		["name"] = "Are They Not Beautiful? (Mech)",
		["tags"] = {
			"12272KT", -- [1]
			"11181BB", -- [2]
			"121430S", -- [3]
		},
		["teamID"] = "team:230",
		["groupID"] = "group:none",
	},
	["team:72"] = {
		["pets"] = {
			"BattlePet-0-000012B482D2", -- [1]
			"BattlePet-0-000012B4C5B0", -- [2]
			"BattlePet-0-000012B01E47", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nThis team & strat is part of my Emperor Crab & Soul of the Forge challenge run. I tried to use a very limited number of no super rare pets who usually survive multiple fights.[url=https://www.wow-petguide.com/index.php?Strategy=3018]Start & Description  [/url] << - - - - - - - - -  - - - - - - - >> [url=https://www.wow-petguide.com/index.php?Strategy=3487]  Next battle[/url]                             \n\n(Start): (1x Primal Cry when your Zandalari Anklerender is not S/S breed)\nPrio 1:: Apply Black Claw if not active\nPrio 2:: Hunting Party\n Zandalari Anklerender dies. Bring in your Stampede pet.\nTurn 1+: Stampede until your pet dies\nBring in your Plump Jelly\nPrio 1:: Squeeze\nPrio 2:: Tentacle Slap\n",
		["name"] = "Door Control Console",
		["tags"] = {
			"222A15R", -- [1]
			"20131CJ", -- [2]
			"10291MQ", -- [3]
		},
		["teamID"] = "team:72",
		["targets"] = {
			146932, -- [1]
		},
		["groupID"] = "group:6",
	},
	["team:160"] = {
		["pets"] = {
			"BattlePet-0-000012B4AB86", -- [1]
			"BattlePet-0-000012B01ED3", -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14131\n\nStrategy added by SunFlight#2765\nTurn 1: Dazzling Dance\nTurn 2: Howl\nTurn 3: Pass\nBring in your Iron Starlette\nTurn 1: Toxic Smoke\nTurn 2: Explode\nBring in your Ikky\nTurn 1: Black Claw\nTurns 2-4: Flock\n",
		["name"] = "Xu-Fu, Cub of Xuen",
		["tags"] = {
			"122AMK", -- [1]
			"12271BB", -- [2]
			"11181FS", -- [3]
		},
		["teamID"] = "team:160",
		["targets"] = {
			72009, -- [1]
		},
		["groupID"] = "group:3",
	},
	["team:198"] = {
		["pets"] = {
			"BattlePet-0-000012C2DB32", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by nogulpfrog\nTurn 1: Sunlight\nTurn 2: Swap to your Mechanical Pandaren Dragonling\nTurn 3: Explode\nBring in your Level Pet\nTurn 4: Swap to your Sunglow Cobra\nTurn 5: Bite, Deebs died\nTurn 6: Solar Beam, Tyri died\nTurn 7: Pass\nTurn 8: Pass\nTurn 9: Solar Beam, Puzzle died\n",
		["name"] = "Deebs, Tyri and Puzzle",
		["tags"] = {
			"21183D1", -- [1]
			"0015QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:198",
		["targets"] = {
			79179, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:260"] = {
		["pets"] = {
			"BattlePet-0-000012B48958", -- [1]
			"BattlePet-0-000012B01DC0", -- [2]
			"BattlePet-0-000012BAC92C", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/228\n\nTurn 1: Call Lightning\nTurn 2: Swap to your Lil' Bling\nTurn 3: Make it Rain\nTurn 4+5: Inflation until Lil' Bling is dead\nBring in your Darkmoon Tonk\nTurn 1: Shock and Awe\nTurn 2: Ion Cannon\n",
		["name"] = "Xu-Fu, Cub of Xuen (2)",
		["tags"] = {
			"211414Q", -- [1]
			"2215198", -- [2]
			"1127AI", -- [3]
		},
		["teamID"] = "team:260",
		["groupID"] = "group:1",
	},
	["team:45"] = {
		["pets"] = {
			"BattlePet-0-000012B99962", -- [1]
			"BattlePet-0-000012B01E16", -- [2]
			"BattlePet-0-000012B96DD7", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14034\n\nStrategy added by Nmyler\nTurn 1: Apocalypse\nTurn 2: Cauterize\nBring in your Stinkrot\nTurn 1: pass if you are stunned\nTurn 2: Rot\nTurn 2: pass if you are stunned\nTurn 3: Corpse Explosion\nBring in your Experimental Roach\nTurn 1: Adrenal Glands\nTurns 2-4: Swarm\nTurn 5: Diseased Bite until Ruddy dies\nTurns 6-8: Swarm until Experimental Roach dies\nAt some point Wandering will enter and die by Apocalypse\nBring in your Lava Beetle\nTurn 1: Cauterize in CD\nTurn 2: Burn\nrepeat these two until finished\n",
		["name"] = "Alran Heartshade",
		["tags"] = {
			"1226DD", -- [1]
			"011A1IT", -- [2]
			"11162J8", -- [3]
		},
		["teamID"] = "team:45",
		["targets"] = {
			160206, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:142"] = {
		["pets"] = {
			"BattlePet-0-000012B15603", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Ratsch#21832\nFlying level pets need atleast 306 HP otherwise they'll die to Psionic StormIf we don't count crits, your leveling pets needs these amounts of hp:Flying: >306Mechanic: >134everything else: >203\n\nTurn 1: Flame Breath\nTurn 2: Razor Talons\nTurn 3: Flame Breath\nTurn 4: Armageddon\nBring in your Mechanical Pandaren Dragonling\nTurn 5: Explode\n",
		["name"] = "Mini Manafiend Melee",
		["tags"] = {
			"112430S", -- [1]
			"0015QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:142",
		["preferences"] = {
			["minHP"] = 204,
			["minXP"] = 3,
		},
		["groupID"] = "group:none",
		["targets"] = {
			197417, -- [1]
		},
	},
	["team:60"] = {
		["pets"] = {
			"BattlePet-0-000012B99943", -- [1]
			"BattlePet-0-000012B99946", -- [2]
			"BattlePet-0-000012B482D2", -- [3]
		},
		["notes"] = "Strategy added by Threewolves\nHave you ever noticed that anybody driving slower than you is an idiot, and anyone going faster than you is a maniac?\n\nTurn 1: Pass - Servant of Demidos is forced in.\nTurns 2+: Magic Sword til Clubber dies.\nSwap to your Zandalari Anklerender\nTurn 1: (Squirt Dives) Pass\nTurn 2: Black Claw\nTurn 3: Hunting Party\nSquirt dies. Squeezer enters.\nTurn 1: Black Claw\nTurns 2+: Leap til Zandalari Anklerender dies.\nBring in your Zandalari Kneebiter\nTurn 1: Hunting Party\nTurn 2: Leap til done.\n",
		["name"] = "Snakes on a Terrace",
		["tags"] = {
			"221414S", -- [1]
			"10041I1", -- [2]
			"212A15R", -- [3]
		},
		["teamID"] = "team:60",
		["targets"] = {
			141945, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:194"] = {
		["pets"] = {
			"BattlePet-0-000012B48707", -- [1]
			"BattlePet-0-000012B4838C", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1236\n\nStrategy added by Aranesh\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge - Klutz's Battle Bird dies\nAn enemy pet comes in\nTurns 1+: Continue using Arcane Storm and Mana Surge when available, otherwise Tail Sweep until your Nexus Whelpling dies\n\nIf you need your Emerald Proto-Whelp, keep Emerald Presence active, use Emerald Dream if you drop low on health and otherwise use Emerald Bite",
		["name"] = "Klutz's Battle Bird",
		["tags"] = {
			"122814D", -- [1]
			"222814F", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:194",
		["targets"] = {
			119344, -- [1]
		},
		["groupID"] = "group:4",
	},
	["team:99"] = {
		["pets"] = {
			"BattlePet-0-000012B01ED3", -- [1]
			0, -- [2]
			"BattlePet-0-000012B146D1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1745\n\nStrategy added by Lazey\n*** 9.0.2 approved ***\n\nIt's very rare, but if an early Sweep forces a pet swap on your side, I recommend a Restart.\n\nLevel Pet will get all XP cause both carry pets die.\n\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up, Dead Deckhand Leonard dies.\nCorrupted Slime comes in\nTurn 1: Powerball\nTurn 2: Supercharge\nTurn 3+: Prio 1: Unleash Wind-Up attack if Failsafe was triggered. Don't apply new Wind-Up\nPrio 2: Powerball\nIron Starlette dies, bring in your Mechanical Pandaren Dragonling\nTurn 1+: Use Thunderbolt if you're sure the split damage will kill Corrupted Slime, otherwise Breath.\nReanimated Kraken Tentacle comes in\nTurn 1: Prio 1: Explode if Kraken Tentacle has 560HP or less.\nPrio 2: Thunderbolt\nPrio 3: Breath\n",
		["name"] = "Sea Creatures Are Weird",
		["tags"] = {
			"11171BB", -- [1]
			"ZL", -- [2]
			"1215QC", -- [3]
		},
		["teamID"] = "team:99",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			141002, -- [1]
		},
	},
	["team:4"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by panchan\nTurn 1: Wind-Up\nTurn 2: Toxic Smoke\nTurn 3: Wind-Up\nWolfus die\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nFangra die\nTurn 7: while Iron Starlette alive : Toxic Smoke\nTurn 8: while Wolfgar > 40% HP Mechanical Pandaren Dragonling : Breath\nkill Wolfgar using Explode \n",
		["name"] = "Gargra",
		["tags"] = {
			"12181BB", -- [1]
			"1115QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:4",
		["targets"] = {
			87122, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:234"] = {
		["pets"] = {
			"BattlePet-0-000012B607A8", -- [1]
			"BattlePet-0-000012B17368", -- [2]
			"BattlePet-0-0000122BADD1", -- [3]
		},
		["notes"] = "Strategy added by Doledippers\nI've tried this 4 times and have won each time. I know this fight has a lot of RNG with the ability order so, there may be cases where this doesn't work. However, each of the 4 attempts I did have resulted in a pretty clean win, with the 3rd Anomalus having atleast 600 HP at the end.Let me know if you run into any cases where this fails, thank you!\n\nPriority 1:: Void Nova\nPriority 2:: Poison Protocol\nPriority 3:: Ooze Touch\nPriority 4:: Pass if Lifft / Swole is underwater AND Poison Protocol +  Void Nova are on cd\nPriority 5:: Ooze Touch when only Swole is left\n",
		["name"] = "Do You Even Train? (Magic) (2)",
		["tags"] = {
			"12142OQ", -- [1]
			"12142OQ", -- [2]
			"1128148", -- [3]
		},
		["teamID"] = "team:234",
		["groupID"] = "group:none",
	},
	["team:176"] = {
		["pets"] = {
			"BattlePet-0-000012B146D1", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1237\n\nStrategy added by Aranesh\nTurn 1: Decoy\nTurn 2: Thunderbolt\nTurns 3+: Now keep Thunderbolt and Decoy on cooldown and otherwise use Breath\nYour Mechanical Pandaren Dragonling will usually solo the fight.\nIf you are unlucky, bring in your Teroclaw Hatchling and use Dodge + Alpha Strike\n\nCongrats!",
		["name"] = "Cookie's Leftovers",
		["tags"] = {
			"1225QC", -- [1]
			"21071C8", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:176",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:4",
		["targets"] = {
			119407, -- [1]
		},
	},
	["team:210"] = {
		["pets"] = {
			"BattlePet-0-000006E4C7A6", -- [1]
			"BattlePet-0-000012843ED8", -- [2]
			"BattlePet-0-000006E4C78A", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6776\n\nStrategy added by Iggzy#2288\nScript thanks to Nikyou\n\nTurn 1: Supercharge\nTurn 2: Metal Fist\nTurns 3-5: Repair\nTurn 6: Metal Fist\nTurn 7: Supercharge\nTurn 8: Metal Fist\nTurn 9+: Metal Fist until dead\nBring in your other pets\nTurn 1+: Any standard attack will finish the fights\n",
		["name"] = "Phyxia",
		["tags"] = {
			"112816H", -- [1]
			"111737R", -- [2]
			"11161T9", -- [3]
		},
		["teamID"] = "team:210",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:7",
		["targets"] = {
			116792, -- [1]
		},
	},
	["team:225"] = {
		["pets"] = {
			"BattlePet-0-000012B5CBA7", -- [1]
			"BattlePet-0-000012B9027A", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by unknown\nTurn 1: Immolation\nTurn 2: Wild Magic\nTurn 3: Swap to your Rapana Whelk\nTurn 4: Acidic Goo\nTurn 5: Ooze Touch\nTurn 6: Ooze Touch\nTurns 7+8: Dive\n",
		["name"] = "Chi-Chi, Hatchling of Chi-Ji (2)",
		["tags"] = {
			"212813T", -- [1]
			"111CN7", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:225",
		["groupID"] = "group:3",
	},
	["team:67"] = {
		["pets"] = {
			"BattlePet-0-000012BC13BD", -- [1]
			"BattlePet-0-000012B4C1CA", -- [2]
			"BattlePet-0-000012B99CE5", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9977\n\nStrategy added by shpungout\n255 aquatic damage for Level pet.\n\nTurn 1: Black Claw\nTurns 2-4: Flock\nTurn 5: Pass\nBring in your Darkmoon Zeppelin\nTurn 1: Explode\n",
		["name"] = "Pearlhusk Crawler",
		["tags"] = {
			"11133E3", -- [1]
			"2128KA", -- [2]
			"11182G7", -- [3]
		},
		["teamID"] = "team:67",
		["preferences"] = {
			["minHP"] = 256,
			["minXP"] = 3,
		},
		["groupID"] = "group:none",
		["targets"] = {
			154914, -- [1]
		},
	},
	["team:242"] = {
		["pets"] = {
			"BattlePet-0-000012B67E7B", -- [1]
			"BattlePet-0-000006E4C7B7", -- [2]
			"BattlePet-0-000012B822C1", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Arcane Blast\nTurns 2-4: Surge of Power -- Bassalt will die & Clawz will come in during your Recovery\nTurn 5+: Arcane Blast - if none of these hit it's (probably) fine\nBring in your Creeping Tentacle\nPrio 1: Illusionary Barrier if there's 1 round left on Whirlpool\n~: Pass while Illusionary Barrier is up\nPrio 2: Forboding Curse if Clawz has > 778 hp\nPrio 3: Tentacle Slap until Clawz dies\nMurrey comes in\nTurn 1: Forboding Curse\nTurn 2: Swap to your Eye of Corruption\nTurn 3: Chaos Beam\nTurn 4: Life Exchange\nTurn 5: Chaos Beam\nTurn 6: Eyeblast\nTurn 7+: Chaos Beam until Murrey dies\n\nIf your Creeping Tentacle needs to come back in:\nTurn 1: Illusionary Barrier\nTurn 2: Pass - skip this if you're slower than Murrey\nTurn 3: Forboding Curse\nTurn 4+: Tentacle Slap\n",
		["name"] = "To a Land Down Under (Magic)",
		["tags"] = {
			"12041N6", -- [1]
			"12281TA", -- [2]
			"12282OK", -- [3]
		},
		["teamID"] = "team:242",
		["groupID"] = "group:none",
	},
	["team:140"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10148\n\nStrategy added by Lazey\n*** Created on Beta, so maybe not final ***\n\nTurn 1: Blistering Cold\nTurn 2: BONESTORM\nTurn 3: Chop (Boneshard dies)\nBring in your Ikky\nTurn 4: Black Claw\nTurns 5-7: Flock\n",
		["name"] = "Kostos",
		["tags"] = {
			"11231TB", -- [1]
			"21181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:140",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			175785, -- [1]
		},
	},
	["team:59"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B01DC0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nI specifically went out and caught a B/B Unborn Val'kyr, made it rare and lvl 25, and unless Chomp crits with Devour X the UBV has enough health to take both hits to use Haunt. 643 + 643 = 1,286B/B UBV HP = 1562\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Lil' Bling\nTurn 1: Pass\nTurn 2+: Inflation\n",
		["name"] = "Chomp",
		["tags"] = {
			"021316M", -- [1]
			"2005198", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:59",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			154911, -- [1]
		},
	},
	["team:115"] = {
		["pets"] = {
			"BattlePet-0-000012B15603", -- [1]
			"BattlePet-0-000012B607A8", -- [2]
			"BattlePet-0-000012B673F3", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nTurn 1: Time Bomb\nTurn 2: Armageddon\nBring in your Anomalus\nTurn 3: Corrosion\nTurn 4: Poison Protocol\nTurn 5: Corrosion (second #2 enemy comes in)\nTurn 6: Void Nova\nTurn 7: Pass\nBring in your Microbot XD\nQuestion: Second enemy is still activ?\nYES: pass (Turn8) --> next round Ion Cannon (Turn 9-10)\nNO: Ion Cannon (Turn 8-9)\n",
		["name"] = "Extra Pieces",
		["tags"] = {
			"022430S", -- [1]
			"22142OQ", -- [2]
			"00272KT", -- [3]
		},
		["teamID"] = "team:115",
		["targets"] = {
			173263, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:173"] = {
		["pets"] = {
			"BattlePet-0-000012B0D34C", -- [1]
			"BattlePet-0-000012B1DC70", -- [2]
			"BattlePet-0-00000A3564FB", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/19106\n\nStrategy added by Remte\nTurn 1: Flame Breath\nTurn 2: Razor Talons\nTurns 3-4: Flame Breath x2\nTurn 5: Armageddon or another Flame Breath\n",
		["name"] = "Liz the Tormentor",
		["tags"] = {
			"112430S", -- [1]
			"11192FM", -- [2]
			"21292FM", -- [3]
		},
		["teamID"] = "team:173",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:8",
		["targets"] = {
			150925, -- [1]
		},
	},
	["team:66"] = {
		["pets"] = {
			"BattlePet-0-000012B01DC0", -- [1]
			"BattlePet-0-000012B99CB5", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/133\n\nTurn 1: Make it Rain\nTurns 2-4: Inflation\nTurn 5: Blingtron Gift Package\nContinue from Turn 1 until Lil' Bling dies.\nHe will easily destroy Carpe Diem and Spirus. Sometimes taking a good chunk out of River as well.\n\nBring in Netherspawn, Spawn of Netherspawn \nTurns 1+: If you have a Whirlpool incoming, use Consume Magic. Otherwise use Creeping Ooze and Nether Blast as a filler.\n",
		["name"] = "Wise Mari",
		["tags"] = {
			"2115198", -- [1]
			"11271FK", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:66",
		["targets"] = {
			71932, -- [1]
		},
		["groupID"] = "group:2",
	},
	["team:121"] = {
		["pets"] = {
			"BattlePet-0-000006E4C775", -- [1]
			"BattlePet-0-000012B17368", -- [2]
			"BattlePet-0-000012B01DE0", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nTurn 1: Ice Tomb\nTurn 2: Call Blizzard\nTurn 3: Ice Lance\nMPD comes in\nTurn 1: Ice Lance\nTurn 2: Ice Lance\nTurn 3: Swap to your Anomalus\nTurn 4: Poison Protocol\nTurn 5: Void Nova\nTurn1 6+: Corrosion until Anomalus dies\nBring in your Winter's Little Helper\nTurns 1+: Ice Lance until Spectral Tiger Cub dies\n\n",
		["name"] = "The Grand Master",
		["tags"] = {
			"21133N", -- [1]
			"22142OQ", -- [2]
			"20033O", -- [3]
		},
		["teamID"] = "team:121",
		["targets"] = {
			196069, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:181"] = {
		["pets"] = {
			"BattlePet-0-000012B96CAE", -- [1]
			"BattlePet-0-000012BA94D6", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\nCan survive 1 crit.Script will check if you take a crit round 5 then use Soul Ward (adds 5 seconds and 1 round).If you don't care about the 1% risk then use the OG script that is in the comments.\n\nTurn 1: Illuminate\nTurn 2: Swap to your Umbrafen Spore\nTurn 3: Blinding Powder\nTurn 4: Explode\nBring in your Level Pet\nTurn 5: Swap to your Enchanted Lantern\nOptional: Use Soul Ward if you want 100% crit protection\nTurn 6: Beam.\nTurn 7: Illuminate\n",
		["name"] = "The Oldest Dragonfly",
		["tags"] = {
			"11138B", -- [1]
			"02251G2", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:181",
		["targets"] = {
			197336, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:226"] = {
		["pets"] = {
			"BattlePet-0-000012B96E7D", -- [1]
			"BattlePet-0-000011C8C36A", -- [2]
			"BattlePet-0-000012B96E89", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Howl\nThen:\nPrio 1: Dodge when Lifft is Underwater\nPrio 2: Howl on CD\nPrio 3: Claw\nBrul'dan comes in\nPrio 1: Dodge when Brul'dan has the power buff, or whenever you can after Brul'dan's Turn 2\nPrio 2: Claw\nBring in your Mawsworn Minion\nPrio 1: Deflection for Headbutt\nPrio 2: Dark Fate on Brul'dan when he hits you with Shadow Shock, then if you can on Swole \nPrio 3: Soul Steal\nBring in your Flayer Youngling\nPrio 1: Deflection for Headbutt\nPrio 2: Rampage when Headbutt is on CD for > 2 rounds\nPrio 3: Triple Snap\n",
		["name"] = "Do You Even Train? (Humanoid)",
		["tags"] = {
			"121816A", -- [1]
			"111331R", -- [2]
			"2225G2", -- [3]
		},
		["teamID"] = "team:226",
		["groupID"] = "group:none",
	},
	["team:11"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B482D2", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nThe same team can be used for the [url=https://www.wow-petguide.com/Strategy/18585/Wildfire_-_Legendary]Legendary[/url] & [url=https://www.wow-petguide.com/Strategy/18586/Wildfire_-_Epic]Epic[/url] versions.My Team for defeating the Storm-Touched Skitterers can be found [url=https://youtu.be/UDUYys-uxuk?t=55]here[/url].\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: BONESTORM\nTurn 4: Blistering Cold\nBring in your Zandalari Anklerender\nTurn 5: Black Claw\nTurn 6: Hunting Party\n",
		["name"] = "Wildfire - Rare",
		["tags"] = {
			"11231TB", -- [1]
			"202A15R", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:11",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			200689, -- [1]
		},
	},
	["team:144"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Alexstrasza\nThis is relatively RNG-proof, with a bonus if you actually get Toxic Smoke to hit, which will make double Breath enough to kill him.As far as your 2nd pet, Any pet with Explode will do, in which case Breath gets replaced by whatever other damaging ability the pet you choose has.\n\nIron Starlette\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Toxic Smoke till died 2nd time\nBring in your Level Pet\n\nLevel Pet\nTurn 1: Swap to your Mechanical Pandaren Dragonling\n\nMechanical Pandaren Dragonling\nTurn 1: Breath if Greyhoof HP is above 768, else Explode\nif Greyhoof is not yet dead:\nTurn 2: Explode if Greyhoof HP is above 240 else Breath\n\nGreyhoof Should be dead now.\n",
		["name"] = "Greyhoof",
		["tags"] = {
			"12181BB", -- [1]
			"1015QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:144",
		["targets"] = {
			68560, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:119"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by F1NCH#2182\nBooth Val'kyr work, but with H/H Breed the fight is 1 round longer\n\nTurn 1: Siphon Life\nTurn 2: Haunt\nBring in your Ikky\nTurn 1: Black Claw\nTurn 2: Flock\n",
		["name"] = "Living Statues Are Tough",
		["tags"] = {
			"011316M", -- [1]
			"01181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:119",
		["targets"] = {
			162470, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:3"] = {
		["pets"] = {
			"BattlePet-0-000012B01ED3", -- [1]
			"BattlePet-0-000006E4C782", -- [2]
			"BattlePet-0-000012B98D26", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7395\n\nStrategy added by EVOluti0n#11601\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Powerball until Starlette dies\nBring in your Chrominius\nTurn 1: Howl\nTurn 2: Surge of Power (Chrominius will die while it recovers. If not try to use Bite.)\nBring in your Dust Bunny\nTurn 1: Dodge\nTurn 2-4: Stampede\nTurn 5+: Flurry \n",
		["name"] = "Nefarious Terry",
		["tags"] = {
			"11171BB", -- [1]
			"1126140", -- [2]
			"22281NI", -- [3]
		},
		["teamID"] = "team:3",
		["targets"] = {
			150929, -- [1]
		},
		["groupID"] = "group:8",
	},
	["team:55"] = {
		["pets"] = {
			"BattlePet-0-000012B528FE", -- [1]
			"BattlePet-0-000012BAFD31", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by 하늘용#3273\n 9\n\nBring in your Xu-Fu, Cub of Xuen &윙부리 comes in\nTurn 1: Prowl\nTurn 2: Moonfire\nTurn 2: Buzzbeak dies & Tikka come in & Swap to your Dibbler\nTurn 3: Drill Charge\nTurn 4: Wind-Up\nTurn 5: Wind-Up\nTurn 6: Tikka dies & Milo come in\nTurn 7: Explode\nTurn 8: Dibbler dies & Xu-Fu, Cub of Xuen come in\nTurn 9: Prowl\nTurn 10: Spirit Claws\nMilo dies \n",
		["name"] = "Keeyo's Champions of Vol'dun",
		["tags"] = {
			"122417I", -- [1]
			"11131UH", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:55",
		["targets"] = {
			141879, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:186"] = {
		["pets"] = {
			0, -- [1]
			"BattlePet-0-000012B521D4", -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["notes"] = "Strategy added by Vanpelt#1866\nTurn 1: Pass\nTurn 2: Swap to your Unborn Val'kyr\nTurn 3: Curse of Doom\nTurn 4: Haunt - Unborn Val'kyr dies\nBring in your Ikky\nTurn 5: Black Claw\nTurns 6-8: Flock\n",
		["name"] = "Storm-Touched Ohuna",
		["tags"] = {
			"ZL", -- [1]
			"021316M", -- [2]
			"01181FS", -- [3]
		},
		["teamID"] = "team:186",
		["targets"] = {
			200680, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:88"] = {
		["pets"] = {
			"BattlePet-0-0000083A0A6A", -- [1]
			"BattlePet-0-000012B0D34C", -- [2]
			"BattlePet-0-000012B146C7", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nThanks to Remte for testing <3\n\nTurn 1: Sting\nTurn 2: Blinding Powder\nTurn 3: Swap to your Timeless Mechanical Dragonling\nTurn 4: Razor Talons\nTurn 5: Swap to your Crimson Spore\nTurn 6: Blinding Powder\nTurn 7: Sting\nTurn 8: Explode\nBring in your Boneshard\nComet still alive? --> Chop\nComet dies\nCosmos comes in\nTurn 1: Blistering Cold\nTurn 2: Pass (Timeless Mechanical Dragonling forced in)\nTurn 3: Razor Talons\nTurn 4: Swap to your Boneshard\nTurn 5: Chop (Cosmos dies)\nConstellatius comes in\nPrio list\nPrio 1: Blistering Cold\nPrio 2: Chop\nTimeless Mechanical Dragonling comes in\nTurn 1: Decoy\nTurn 2: Razor Talons\nTurns 3+: Flame Breath\n",
		["name"] = "Algalon the Observer",
		["tags"] = {
			"11261G1", -- [1]
			"111430S", -- [2]
			"11031TB", -- [3]
		},
		["teamID"] = "team:88",
		["targets"] = {
			115307, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:208"] = {
		["pets"] = {
			"BattlePet-0-000012B01E39", -- [1]
			"BattlePet-0-000012B5CB68", -- [2]
			0, -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/18685\n\nStrategy added by ImpossiblGrl#1136\nTurn 1: Curse of Doom\nTurn 2: Shadow Shock Till Nairn dies (4-5 casts) Stormoen enters\nTurn 3: Lovestruck \nTurn 4: Curse of Doom Stormoen swaps, and the CoD hits Summer\nTurn 5: Swap to Level Pet\nTurn 6: Swap to Ashstone Core\nTurn 7: Crystal Prison\nTurn 8: Stoneskin Summer swaps and Stormoen is back\nTurn 9:  Burn till Stormoen dies (around 5 casts). Summer returns\nTurn 10: Stoneskin\nTurn 11: Pass\nTurn 12: Crystal Prison\nTurn 13: Burn\nTurn 14: Burn\nTurn 15: Swap to your Sister of Temptation\nTurn 16: Pass\nTurn 17: Shadow Shock\nTurn 18: Lovestruck\nTurn 19: Shadow Shock\n",
		["name"] = "Shademaster Kiryn",
		["tags"] = {
			"111C1IS", -- [1]
			"221913U", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:208",
		["preferences"] = {
			["minXP"] = 2,
		},
		["groupID"] = "group:2",
		["targets"] = {
			71930, -- [1]
		},
	},
	["team:134"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			0, -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by unknown\nTurn 1: Crush\nTurn 2: Sandstorm\nTurn 3: Deflection\nTurns 4+: Crush until Crimson is dead (refresh Sandstorm if it comes off cooldown)\nPandaren Fire Spirit comes in\nTurn 1: Deflection (NOTE: Unfortunately if you get a crit on Crimson then Deflection will not be available and you will have to restart the fight)\nTurns 2+: Keep Sandstorm on cooldown and use Crush in between.\nImportant: When Deflection comes off cooldown, cast Crush or Sandstorm, then use Deflection again.\nPandaren Fire Spirit should die shortly after the second Deflection. \nGlowy comes in\nUse Crush until Sandstorm comes off cooldown\nThen use Sandstorm\nSwap in Level-Pet 1\nSwap in Level-Pet 2 if you want\nSwap back to Anubisath Idol\nSame as before, Sandstorm on cooldown and Crush in between until Glowy dies.\n",
		["name"] = "Burning Pandaren Spirit",
		["tags"] = {
			"1116143", -- [1]
			"ZL", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:134",
		["preferences"] = {
			["minXP"] = 5,
		},
		["groupID"] = "group:none",
		["targets"] = {
			68463, -- [1]
		},
	},
	["team:212"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			0, -- [2]
			"BattlePet-0-000012B4838C", -- [3]
		},
		["notes"] = "Strategy added by unknown\nGood strategy but has some variations in it. If you don't use addons for pet battles or keep a close eye on the fight progress, I recommend not using this one.\n\nTurn 1: Sandstorm\nTurn 2: Swap to Level Pet\nTurn 3: Swap back to Anubisath Idol\nTurns 4+: Crush until Chirrup is dead - do not re-apply Sandstorm!\nStormlash comes in\nTurn 1: Deflection\nTurns 2+: Crush until Stormlash is dead as well\nSometimes your Idol will die before that. You can still finish the fight with the Emerald Proto-Whelp, just use Proto-Strike first thing when Whiskers comes in.\nWhiskers comes in\nTurn 1: Pass\nTurn 2: Deflection\nTurns 3+: Crush until your Idol dies.\nBring in your Emerald Proto-Whelp\nUse Emerald Bite whenever you can and if you have an addon showing you the enemies spells, use Proto-Strike as soon as Whiskers Dive comes off cooldown.\n",
		["name"] = "Aki the Chosen",
		["tags"] = {
			"1116143", -- [1]
			"ZL", -- [2]
			"211814F", -- [3]
		},
		["teamID"] = "team:212",
		["targets"] = {
			66741, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:255"] = {
		["pets"] = {
			"BattlePet-0-000012B67B94", -- [1]
			"BattlePet-0-000012B5CDBD", -- [2]
			"BattlePet-0-000012B67EA7", -- [3]
		},
		["notes"] = "Strategy added by Kalixa\nThis fight is tough with elementals, due to the nature of the opponent's abilities. Bassalt, Clawz, and Murrey do NOT follow a set move pattern, its randomized for every encounter. There are roughly 3-4 different ways this can play out (at least from what I've seen in my testing). If there is a crit or something cast by the opponent's out of order, you're better off reseting the battle.If you have any suggestions, or found a tweak to this strat that works better, let me know! There are probably other combinations - feel free to add them in the comments, and I'll adjust the strat :)\n\nTurn 1: Blast of Hatred\nTurns 2-4: Surge of Power\nClawz comes in\nTurn 1: Breath of Sorrow (If possible - your Ravenous Prideling is gonna die or be dead by this point)\nBring in your Playful Frostkin If Clawz casts Whirlpool before your Frostkin enters, reset - Frostkin will die in 2 turns if you don't.\nTurn 1: Flash Freeze\nTurn 3: Water Jet\nTurn 4: Water Jet (Frostkin either dies here, or on the next round)\nTurn 5: Geyser (If Frostkin is still alive)\nMurrey comes in ; Bring in Tiny Twister\nTurn 1: Flyby\nTurn 2: Call Lightning (If Murrey casts Tough 'N' Cuddly, reset the fight)\n",
		["name"] = "To a Land Down Under (Elemental)",
		["tags"] = {
			"211A2GU", -- [1]
			"11272D1", -- [2]
			"2126DT", -- [3]
		},
		["teamID"] = "team:255",
		["groupID"] = "group:none",
	},
	["team:235"] = {
		["pets"] = {
			"BattlePet-0-000006E4C79F", -- [1]
			"BattlePet-0-000012B146C7", -- [2]
			"BattlePet-0-000012B01E66", -- [3]
		},
		["notes"] = "Strategy added by Refreshe#1641\nIt worked multiple times safe-ish. It's good enough.\n\nTurn 1: Acid Rain\nTurns 2~10: Dreadful Breath until Blightbreath dies.\nBring in your Boneshard\nTurn 11: BONESTORM\nTurn 12: BONESTORM\nTurn 13: BONESTORM\nTurn 14: Pass\nBring in your Risen Saber Kitten\nPrio 1: Prowl When the snail dives.\nPrio 2: Rake on CD\nPrio 3: Pounce\n",
		["name"] = "Do You Even Train? (Undead)",
		["tags"] = {
			"10171TD", -- [1]
			"22231TB", -- [2]
			"21231OC", -- [3]
		},
		["teamID"] = "team:235",
		["groupID"] = "group:none",
	},
	["team:110"] = {
		["pets"] = {
			"BattlePet-0-000012B485C2", -- [1]
			"BattlePet-0-000012B2E223", -- [2]
			"BattlePet-0-000012B66C49", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2293\n\nStrategy added by tacagero#2570\nTurn 1: Whirlpool\nTurn 2: Dive\nTurn 3: Water Jet\nAzerite Geode comes in\nTurn 4: Whirlpool\nTurn 5: Water Jet\nTurn 6: Water Jet\nBring in your Emperor Crab\nTurn 7: Surge\nTurn 8: Surge\nAzerite Elemental comes in\nTurn 9: Whirlpool\nTurn 10: Healing Wave\nTurn 11: Surge\nTurn 12: Surge\nBring in your Benax\nTurn 13: Water Jet\nTurn 14: Water Jet\n",
		["name"] = "Rogue Azerite",
		["tags"] = {
			"1219R4", -- [1]
			"10071SE", -- [2]
			"2224NA", -- [3]
		},
		["teamID"] = "team:110",
		["targets"] = {
			140813, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:265"] = {
		["pets"] = {
			"BattlePet-0-000011C9500C", -- [1]
			"BattlePet-0-000012B544FE", -- [2]
			"BattlePet-0-000012B67B94", -- [3]
		},
		["notes"] = "Strategy added by Cacobeitor\nTurn 1: Dark Bolt + Weakness until your pet dies\nTurn 2: Arcane Storm + Wild Winds until your pet dies\nTurns 3-5: Surge of Power it has to be one shot ability, if enemy HP are higher than the damage of your ability, do a random attack before to lower enemy HP more and then use the strong abliity to finish\nTurn 4: \nTurn 5: \nTurn 6: \nTurn 7: \nTurn 8: \n",
		["name"] = "Are They Not Beautiful? (Elemental)",
		["tags"] = {
			"021A2QI", -- [1]
			"10263BM", -- [2]
			"001A2GU", -- [3]
		},
		["teamID"] = "team:265",
		["groupID"] = "group:none",
	},
	["team:29"] = {
		["pets"] = {
			"BattlePet-0-000012B67BBE", -- [1]
			"BattlePet-0-000006E4C7AB", -- [2]
			"BattlePet-0-000006E4C794", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4769\n\nStrategy added by DragonsAfterDark\nTurn 1: Paralyzing Venom\nTurn 2: Acidic Goo\nTurn 3+4: Swallow You Whole\nRepeat 1-4 until Bloodstone Tunneler dies\n\nBring in other pets to clean up random backline pets. \n\n~~: For those who haven't done this dungeon much, the backline pets will be a random combination of: Beast, Flying, or Aquatic\n",
		["name"] = "Everliving Spore",
		["tags"] = {
			"12152CJ", -- [1]
			"21151TC", -- [2]
			"11131TC", -- [3]
		},
		["teamID"] = "team:29",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:7",
		["targets"] = {
			116795, -- [1]
		},
	},
	["team:247"] = {
		["pets"] = {
			"BattlePet-0-000012B4874E", -- [1]
			"BattlePet-0-000012B01E0B", -- [2]
			"BattlePet-0-000006E4C7A1", -- [3]
		},
		["notes"] = "Strategy added by Kalagren\nNexus Whelpling comes in\nTurn 1: Arcane Storm\nThen follow priorities for both Nexus Whelpling and Stormie:\n(This means bringing in Stormie when Nexus Whelpling dies)\nPrio 1: Mana Surge\nPrio 2: Arcane Storm\nPrio 3: Jolt / Tail Sweep\nBring in your Lil' Tarecgosa\nPrio 1: Surge of Power when Talons is active and within kill range \nor Dragonkin racial is active (Must be the finisher)\nPrio 2: Arcane Blast / Arcane Storm if not in Surge of Power finishing range\n",
		["name"] = "Are They Not Beautiful? (Dragon) (2)",
		["tags"] = {
			"122414D", -- [1]
			"222739M", -- [2]
			"2117A0", -- [3]
		},
		["teamID"] = "team:247",
		["groupID"] = "group:none",
	},
	["team:151"] = {
		["pets"] = {
			"BattlePet-0-000012B146CB", -- [1]
			"random:3", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nIkky should be good to take out both, or almost both, Skitterers with no healing between the fights.Script thanks to Schlumpf\n\nTurn 1: Black Claw\nTurns 2-4: Flock\nTurn 5+: Quills until the fight is won\n",
		["name"] = "Storm-Touched Skitterer",
		["tags"] = {
			"21181FS", -- [1]
			"ZR3", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:151",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			200679, -- [1]
		},
	},
	["team:137"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by TrundleButt#2544\nTurn 1: Blistering Cold\nTurn 2: Choose option 1 for Mind games (damage to team)\nTurn 3: Chop\nTurn 4: Blistering Cold\nTurn 5: Chop\nTurn 6: Chop\nTurn 7: Bonestorm should die here, switch to Ikky\nTurn 8: Black Claw\nTurn 9: Flock Until it dies\n",
		["name"] = "The Mind Games of Addius",
		["tags"] = {
			"11231TB", -- [1]
			"21181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:137",
		["targets"] = {
			173331, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:200"] = {
		["pets"] = {
			0, -- [1]
			"BattlePet-0-000012B484E9", -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["notes"] = "Strategy added by Getafiks#1391\nTurn 1: Pass\nTurn 2: Swap to your Unborn Val'kyr\nTurn 3: Curse of Doom\nTurn 4: Unholy Ascension\nBring in your Ikky\nTurn 1: Black Claw\nTurns 2-4: Flock\n",
		["name"] = "Dos-Ryga",
		["tags"] = {
			"ZL", -- [1]
			"122616M", -- [2]
			"21181FS", -- [3]
		},
		["teamID"] = "team:200",
		["targets"] = {
			68564, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:22"] = {
		["pets"] = {
			"BattlePet-0-000012B6764A", -- [1]
			"BattlePet-0-000012BAC92C", -- [2]
			"BattlePet-0-000012B146D0", -- [3]
		},
		["notes"] = "Strategy added by RedBeard\nTurn 1: Decoy\nTurn 2: Haywire\nTurn 3: Peck\nTurn 4: Peck\nScars comes in\nTurn 5: Peck\nTurn 6: Haywire\nBring in your Darkmoon Tonk\nTurn 7: Shock and Awe\nTurn 8+: Missile until Scars dies\nUndead: Pass\nLittle Blue comes in\nTurn 9: Missile\nTurn 10: Ion Cannon\nBring in your Iron Starlette\nTurn 1: Toxic Smoke\n",
		["name"] = "Pack Leader",
		["tags"] = {
			"22171BR", -- [1]
			"1127AI", -- [2]
			"12181BB", -- [3]
		},
		["teamID"] = "team:22",
		["targets"] = {
			141799, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:89"] = {
		["pets"] = {
			"BattlePet-0-000012B146CB", -- [1]
			"BattlePet-0-000012B5CBA7", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Skwirrel\nTurn 1: Black Claw\nTurn 2: Flock - Ikky dies\nBring in Corefire Imp\nTurn 3: Flamethrower\nTurn 4: Burn\nTurn 5: Burn\n",
		["name"] = "Sputtertube",
		["tags"] = {
			"11181FS", -- [1]
			"121813T", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:89",
		["targets"] = {
			154923, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:199"] = {
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).\n\nTurn 1: Time Bomb\nTurn 2: Flame Breath\nTurn 3: Armageddon\nBring in your Emmigosa\nTurn 4: Ice Tomb\nTurn 5: Arcane Storm (Tempe comes in, Swoggy dies in the backline)\nTurns 6+: Arcane Storm or Breath (until dead)\nChrominius comes in\nCheck conditions each Round and continue based on these priorities:\nPrio 1:: Tempe still alive? -> Bite\nPrio 2:: Dragonkin Passive is up and Dustie has 1665HP or less? -> Surge of Power\nPrio 3:: Dustie has 1110HP or less? -> Surge of Power\nPrio 4:: Howl\nPrio 5:: Surge of Power\n",
		["tags"] = {
			"122430S", -- [1]
			"21281LO", -- [2]
			"1126140", -- [3]
		},
		["teamID"] = "team:199",
		["homeID"] = "group:none",
		["targets"] = {
			204926, -- [1]
		},
		["pets"] = {
			"BattlePet-0-000012B0D34C", -- [1]
			"BattlePet-0-000006E4C76A", -- [2]
			"BattlePet-0-000006E4C782", -- [3]
		},
		["name"] = "Delver Mardei",
		["groupID"] = "group:favorites",
		["favorite"] = true,
	},
	["team:26"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"BattlePet-0-000012B01ED3", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by unknown\nDepending on your Iron Starlette, you might need to bring another pet with strong attacks. For example a Darkmoon Tonk (Ion Cannon) or a strider (2x Pump) or any pet with Surge of Power.\n\nTurn 1: Wind-Up\nTurn 2: Wind-Up\nTurn 3: Wind-Up\nTurn 4: Pass\nTurn 5: Supercharge\nTurn 6: Wind-Up\nTurn 7: Wind-Up\nTurn 8: Wind-Up\nTurn 9: Pass - Stitches dead!\n",
		["name"] = "Fight Night: Stitches Jr. Jr.",
		["tags"] = {
			"11181BB", -- [1]
			"11171BB", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:26",
		["targets"] = {
			105840, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:14"] = {
		["pets"] = {
			"BattlePet-0-000012B15603", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			"BattlePet-0-000006E4C762", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15687\n\nStrategy added by Mutanis\nTurn 1: Time Bomb\nTurn 2: Decoy\nTurn 3: Swap to your Chrominius\nTurn 4: Howl\nTurns 5-6: Surge of Power\n",
		["name"] = "Char",
		["tags"] = {
			"121430S", -- [1]
			"1126140", -- [2]
			"222A7J", -- [3]
		},
		["teamID"] = "team:14",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:5",
		["targets"] = {
			161662, -- [1]
		},
	},
	["team:94"] = {
		["pets"] = {
			"BattlePet-0-000006E4C754", -- [1]
			"BattlePet-0-000012B673F3", -- [2]
			"BattlePet-0-000012B4874E", -- [3]
		},
		["notes"] = "Strategy added by Faymos#1176\nBased on strategy added by DragonsAfterDark, substituted Court Scribe for Lesser Voidwalker\n\nTurn 1: Curse of Doom\nTurn 2: Consume Magic\nTurn 3+: Shadow Shock until Bloog dies\nBone Crusher comes in\nTurn 1+: Shadow Shock until Court Scribe dies\nBring in your Microbot XD\nTurn 1: Supercharge\nTurn 2: Ion Cannon\nChipper comes in\nTurn 1: Recover\nTurn 2: Recover\nTurn 3: Swap to your Nexus Whelpling\nTurn 4: Arcane Storm\nTurns 5-7: Mana Surge\nIf your Microbot XD is swapped in:\nTurn 1: Alert!\nTurn 2: Supercharge\nTurn 3: Ion Cannon\n",
		["name"] = "Mighty Minions of Maldraxxus",
		["tags"] = {
			"21281SB", -- [1]
			"12272KT", -- [2]
			"122414D", -- [3]
		},
		["teamID"] = "team:94",
		["targets"] = {
			173257, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:166"] = {
		["pets"] = {
			"BattlePet-0-000012B99CF2", -- [1]
			"BattlePet-0-000007C1D04D", -- [2]
			"BattlePet-0-000012B99CFC", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6224\n\nStrategy added by Lowlander#2941\nTurn 1: Fire Shield\nTurn 2: Lightning Shield\nTurn 3+: Arcane Blast (Keep spamming this till all are dead)\n",
		["name"] = "Deviate Flapper",
		["tags"] = {
			"112620U", -- [1]
			"11141IO", -- [2]
			"11132G6", -- [3]
		},
		["teamID"] = "team:166",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:7",
		["targets"] = {
			116787, -- [1]
		},
	},
	["team:141"] = {
		["pets"] = {
			"BattlePet-0-000006E4C76E", -- [1]
			"BattlePet-0-000012B17368", -- [2]
			"BattlePet-0-000012B118ED", -- [3]
		},
		["notes"] = "Strategy added by 하늘용#3273\n8\n\nTurn 1: Supercharge\nTurn 2: Call Lightning\nTurn 3: Swap to your Anomalus\nTurn 4: Corrosion\nTurn 5: Poison Protocol\nTurn 6: Void Nova\nBring in your Draenei Micro Defender\nTurn 7: Ion Cannon\n",
		["name"] = "Uncomfortably Undercover",
		["tags"] = {
			"02231T5", -- [1]
			"22142OQ", -- [2]
			"00281DA", -- [3]
		},
		["teamID"] = "team:141",
		["targets"] = {
			173267, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:204"] = {
		["pets"] = {
			"BattlePet-0-000012B4C910", -- [1]
			"BattlePet-0-000008968258", -- [2]
			"BattlePet-0-0000129535D3", -- [3]
		},
		["name"] = "Fel Flame",
		["tags"] = {
			"112434H", -- [1]
			"2116143", -- [2]
			"11133EG", -- [3]
		},
		["teamID"] = "team:204",
		["targets"] = {
			62621, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:146"] = {
		["pets"] = {
			"BattlePet-0-000012B5CC26", -- [1]
			"BattlePet-0-000012B5CE9F", -- [2]
			"BattlePet-0-000006E4C75E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8940\n\nStrategy added by Pankracy#2378\n11 rounds fast, using relatively easy to get pets. Enjoy ;)\n\nTD Script provided by Shadowball (https://www.wow-petguide.com/User/13817/Shadowball), Thank you!!!\n\nTurn 1: Flamethrower\nTurn 2: Conflagrate\nTurn 3: Flamethrower\nTurn 4: swap to Phoenix Hatchling\nTurn 5: Conflagrate\nTurn 6: Immolate\nTurn 7: Burn\nTurn 8: Burn, Phoenix Hatchling dies, bring Dark Phoenix Hatchling\nTurn 9: Conflagrate, Shred enters Failsafe mode\nTurn 10: Burn\nTurn 11: Burn\n",
		["name"] = "Shred",
		["tags"] = {
			"111836P", -- [1]
			"12255F", -- [2]
			"12198E", -- [3]
		},
		["teamID"] = "team:146",
		["targets"] = {
			161658, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:155"] = {
		["pets"] = {
			"BattlePet-0-000012B99948", -- [1]
			"BattlePet-0-000012B5CDB4", -- [2]
			"BattlePet-0-000011CA3D76", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7224\n\nStrategy added by Reilly\nTested with P/S and P/H Young Venomfang\n\nTurn 1: Toxic Skin\nTurn 2: Flyby\nTurn 3: Infected Claw\nTurn 4: Infected Claw\nTurn 5: Infected Claw\nTurn 6: Toxic Skin\nTurn 7: Flyby\nTurn 8: Infected Claw until Rampage dies\n",
		["name"] = "Rampage",
		["tags"] = {
			"12281UG", -- [1]
			"111744V", -- [2]
			"11162RJ", -- [3]
		},
		["teamID"] = "team:155",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:5",
		["targets"] = {
			161649, -- [1]
		},
	},
	["team:153"] = {
		["pets"] = {
			"BattlePet-0-000011E9D229", -- [1]
			"BattlePet-0-000012B15603", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nTurn 1: Needle Claw\nTurn 2: Needle Claw\nTurn 3: Needle Claw\nTurn 4: Swarm of Flies\nTurn 5: Needle Claw\nSludgy comes in\nTurn 6: Feign Death – your Timeless Mechanical Dragonling is brought in\nTurn 7: Flame Breath\nTurn 8: Razor Talons\nTurn 9: Swap to your Undying Deathroach (Sludgy dies)\nDarnak the Tunneler comes in\nTurn 10: Needle Claw\nTurn 11: Swarm of Flies\nTurn 12: Pass (Undying Deathroach dies)\nBring in your Timeless Mechanical Dragonling\nTurn 13: Razor Talons\nTurn 14: Flame Breath\nTurn 15: Pass (Timeless Mechanical Dragonling dies & Darnak the Tunneler dies)\n",
		["name"] = "Thundering Pandaren Spirit",
		["tags"] = {
			"22272UU", -- [1]
			"110430S", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:153",
		["preferences"] = {
			["maxHP"] = 1440,
		},
		["groupID"] = "group:none",
		["targets"] = {
			68465, -- [1]
		},
	},
	["team:222"] = {
		["pets"] = {
			"BattlePet-0-000012B15603", -- [1]
			0, -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Remte\nSomeone had to do it :P\n\nTurn 1: Flame Breath\nTurn 2: Razor Talons\nTurn 3: Flame Breath – enemy Pixiebell dies\nDoodle comes in\nTurn 4: Flame Breath\nTurn 5: Razor Talons – enemy Doodle falls asleep\nTally comes in\nTurn 6: Flame Breath\nTurn 7: Razor Talons\nTurn 8: Armageddon – everything but your level pets is roasted\n",
		["name"] = "Ashlei",
		["tags"] = {
			"112430S", -- [1]
			"ZL", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:222",
		["targets"] = {
			87124, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:223"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"BattlePet-0-000012B146CA", -- [3]
		},
		["notes"] = "Strategy added by JoCo#2522\nTurn 1: Curse of Doom\nTurn 2: Replacement for a pet with maximum health. Change back to Unborn Val'kyr\nTurn 3: Unholy Ascension\nTurn 4: Choose Ikky and use Black Claw – it will die\nYour Lil' Bling remains on the battlefield\nTurn 5: Inflation to death the enemy\n",
		["name"] = "Little Tommy Newcomer",
		["tags"] = {
			"222616M", -- [1]
			"11181FS", -- [2]
			"2115198", -- [3]
		},
		["teamID"] = "team:223",
		["targets"] = {
			73626, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:232"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B482D2", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Shenk\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Zandalari Anklerender\nTurn 1: Black Claw\nTurn 2-3: Hunting Party\n",
		["name"] = "Ashes Will Fall (2)",
		["tags"] = {
			"021616M", -- [1]
			"202A15R", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:232",
		["groupID"] = "group:none",
	},
	["team:170"] = {
		["pets"] = {
			"BattlePet-0-000012B58B24", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Clarx\nFast repeatable Pet-leveling while this WQ is active for almost 2k xp (base) each run, for those without a Draenei Micro Defender\n\nTurn 1: Missile\nTurn 2: Missile\nTurn 3: Explode\nBring in your 2nd pet with 'Explode'\nTurn 4: Explode\n",
		["name"] = "Rydyr",
		["tags"] = {
			"122CAJ", -- [1]
			"1215QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:170",
		["targets"] = {
			105386, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:7"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Remte\nIf possible, pick one additional pet that has any damaging spell that does more than 500 damage in one hit.\n\nTurn 1: Wind-Up\nTurn 2: Wind-Up\nTurn 3: Pass\nTurn 4: Wind-Up\nTurn 5: Supercharge\nTurn 6: Wind-Up\n",
		["name"] = "Stitches Jr.",
		["tags"] = {
			"11181BB", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:7",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			85685, -- [1]
		},
	},
	["team:182"] = {
		["pets"] = {
			"BattlePet-0-000012B5C2FF", -- [1]
			"BattlePet-0-000012B6763C", -- [2]
			"BattlePet-0-000012B96E89", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5693\n\nStrategy added by DragonsAfterDark\nPriority 1: Ironskin on CD\nPriority 2: Predatory Strike on Shattered Defenses\nPriority 3: Falcosaur Swarm! as filler\n",
		["name"] = "Vilefang",
		["tags"] = {
			"12171TN", -- [1]
			"2227G2", -- [2]
			"2225G2", -- [3]
		},
		["teamID"] = "team:182",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:7",
		["targets"] = {
			116790, -- [1]
		},
	},
	["team:39"] = {
		["pets"] = {
			"BattlePet-0-000012B4874E", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Infernal\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\n\nThat's it ^^\n",
		["name"] = "The Beakinator",
		["tags"] = {
			"122414D", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:39",
		["targets"] = {
			85659, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:58"] = {
		["pets"] = {
			"BattlePet-0-000012B66C49", -- [1]
			"BattlePet-0-000012B607A5", -- [2]
			"BattlePet-0-000012B5CBAA", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/19467\n\nStrategy added by Nalika#2313\nTurn 1: Renewing Mists\nTurn 2: Shell Shield\nTurn 3: Surge\nTurn 4: Surge\nTurn 5: Surge\nTurn 6: Renewing Mists\nTurn 7: Shell Shield\nTurn 8: until the end\n",
		["name"] = "Leper Rat",
		["tags"] = {
			"2114NA", -- [1]
			"12252NA", -- [2]
			"1118214", -- [3]
		},
		["teamID"] = "team:58",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:6",
		["targets"] = {
			145968, -- [1]
		},
	},
	["team:1"] = {
		["pets"] = {
			"BattlePet-0-000012B4838C", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Johny\nTurn 1: Emerald Proto-Whelp use Emerald Presence if lower than 1 duration left\nTurn 2: Emerald Proto-Whelp use Emerald Dream if hp is lower than 800\nTurn 3: Emerald Proto-Whelp use Emerald Bite\nTurn 4: Pass if stunned\n",
		["name"] = "A New Vocation",
		["tags"] = {
			"222814F", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:1",
		["targets"] = {
			1, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:175"] = {
		["pets"] = {
			"BattlePet-0-000006E4C77C", -- [1]
			"BattlePet-0-000012B01EA8", -- [2]
			"BattlePet-0-000012B118AA", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6332\n\nStrategy added by ddj88#1113\nThis strategy works if all enemy pets are mechanical, adjust other pets according to the enemy back line pets (beast if critter, elemental if mechanical). I've used tiny snowman twice now and he can take out all the pets.\n\nTurn 1: Call Blizzard\nTurn 2: Howling Blast\nTurn 3: Snowball\nTurn 4: Priority Call Blizzard>Howling Blast>Snowball. If enemy pet is near death cast snowball save the cd's of other two big spells for higher HP pet\n",
		["name"] = "Gnomeregan Guard Tiger",
		["tags"] = {
			"11133L", -- [1]
			"1118144", -- [2]
			"121B1GT", -- [3]
		},
		["teamID"] = "team:175",
		["preferences"] = {
			["minXP"] = 22,
		},
		["groupID"] = "group:6",
		["targets"] = {
			146003, -- [1]
		},
	},
	["team:143"] = {
		["pets"] = {
			"BattlePet-0-000012B4838C", -- [1]
			0, -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Kurasu#2861\nConsiderably slower compared to the use of Nexus or Stormborn whelp, but if you are leveling pets, this one gives you two pet level-up slots instead of just one. EDIT 05/24/2022: Very slight tweak for wording and efficiency but steps are still essentially the same.\n\nTurn 1: Emerald Bite. \nTurn 2: Pass\nTurn 3: Emerald Presence\nTurn 4: Swap to your Level Pet #1\nTurn 5: Swap to your Emerald Proto-Whelp\nTurn 6: Pass\nTurn 7: If Emerald Proto-Whelp is at half HP or below, Emerald Dream. Otherwise, Emerald Presence\nDusty will always use the same pattern: Moth Dust, Cocoon, Moth Ball, nothing. \nEmerald Dream at half HP, keep Emerald Presence up, Emerald Bite until dead.\nWhispertail comes in\nTurn 1+: Refresh Emerald Presence at 1 turn, Emerald Dream if at half health, Emerald Bite otherwise until dead.\nPandaren Air Spirit comes in\nTurn 1: Swap to your Level Pet #2.\nTurn 2: Swap to your Emerald Proto-Whelp\nTurn 3+: Refresh Emerald Presence at 1 turn (or if gone), Emerald Dream if at half health, Emerald Bite otherwise until dead.\n",
		["name"] = "Whispering Pandaren Spirit",
		["tags"] = {
			"222814F", -- [1]
			"ZL", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:143",
		["targets"] = {
			68464, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:185"] = {
		["pets"] = {
			"BattlePet-0-000012B5C2FF", -- [1]
			"BattlePet-0-000008A85848", -- [2]
			"BattlePet-0-000012B66D54", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2148\n\nStrategy added by DragonsAfterDark\nGreat flocking Falcosaurs! It's hard to go wrong with any order of attacks on this one, just try to keep the debuff from Falcosaur Swarm! up, and you should have no issues. \n\nTurn 1 + 2: Falcosaur Swarm!\nTurn 3: Predatory Strike\nTurn 4: Falcosaur Swarm! until Shelly is dead. \nSheldon comes in\nTurn 1: Falcosaur Swarm! until Direbeak Hatchling dies. \nBring in your Bloodgazer Hatchling\nTurn 1: Predatory Strike\nTurn 2: Savage Talon until Sheldon is dead. \nShelby comes in\nTurn 1: Falcosaur Swarm! until Predatory Strike is up. \nTurn 2: Predatory Strike\n",
		["name"] = "Crab People",
		["tags"] = {
			"10171TN", -- [1]
			"21181TP", -- [2]
			"10141TO", -- [3]
		},
		["teamID"] = "team:185",
		["targets"] = {
			139489, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:43"] = {
		["pets"] = {
			"BattlePet-0-000012B99A03", -- [1]
			"BattlePet-0-000006E4C780", -- [2]
			"BattlePet-0-000012B5CC18", -- [3]
		},
		["notes"] = "Strategy added by Fungus\nPhotosynthesis with Sunlight is able to outheal the damage, but with a string of bad Luck this might fail.Takes around 30-35 turns.\n\nTurn 1: Sunlight. Refresh when 1 or 0 turn remaining.\nTurn 2: Photosynthesis. Refresh when not up.\nTurn 3: Lash\nPriorities: Photosynthesis and Sunlight Weather >> Lash >> Sunlight Cast\nTurn 5: \nTurn 6: \nTurn 7: \nTurn 8: \n",
		["name"] = "Pixy Wizzle",
		["tags"] = {
			"112C93", -- [1]
			"21277K", -- [2]
			"221721C", -- [3]
		},
		["teamID"] = "team:43",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:5",
		["targets"] = {
			160205, -- [1]
		},
	},
	["team:96"] = {
		["pets"] = {
			"BattlePet-0-000006E4C756", -- [1]
			"BattlePet-0-0000088F2EFD", -- [2]
			"BattlePet-0-000012B673F3", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nIf you don't have Microbot XD then try [url=https://wow-petguide.com/?Strategy=11370]this one.[/url]\n\nTurn 1: Stun Seed\nTurn 2: Poison Lash\nTurn 3: Leech Seed (Slasher comes in)\nTurn 4: Poison Lash\nTurn 5: Swap to your Fel-Afflicted Skyfin\nTurn 6: Wild Magic\nTurn 7: Wing Buffet (Battery comes in)\nTurn 8: Fel Immolate --> Battery dies (Slasher comes in)\nTurn 9: Fel Immolate --> Slasher dies (Pounder comes in)\nTurn 10: Swap to your Microbot XD\nTurn 11: Supercharge\nTurn 12: Ion Cannon (Pounder uses explode)\n",
		["name"] = "Micro Defense Force",
		["tags"] = {
			"222A52", -- [1]
			"2224227", -- [2]
			"12272KT", -- [3]
		},
		["teamID"] = "team:96",
		["targets"] = {
			173130, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:128"] = {
		["pets"] = {
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			"BattlePet-0-000012B822C0", -- [3]
		},
		["notes"] = "Strategy added by Makare#1693\nI'm surprised no one has published an Ikky/Idol strat before. \n\nTurn 1: Black Claw\nTurns 2-4: Flock\nMarley dies.\nTurns 5+: Flock until Ikky dies.\nBring in your Level Pet\nTurn 1: Swap to your Void-Scarred Anubisath\nTurn 2: Sandstorm\nTurn 3+: Spiritfire Bolt until Tiptoe dies.\nPandaren Water Spirit comes in\nTurn 1: Sandstorm when available.\nWhen the Whirlpool and Geyser debuff have 1 turn left, use Deflection.\nSpiritfire Bolt and Sandstorm until Pandaren Water Spirit dies.\n",
		["name"] = "Flowing Pandaren Spirit",
		["tags"] = {
			"01181FS", -- [1]
			"ZL", -- [2]
			"21162OH", -- [3]
		},
		["teamID"] = "team:128",
		["preferences"] = {
			["minHP"] = 301,
			["minXP"] = 5,
		},
		["groupID"] = "group:none",
		["targets"] = {
			68462, -- [1]
		},
	},
	["team:252"] = {
		["pets"] = {
			"BattlePet-0-000012B66DA8", -- [1]
			"BattlePet-0-000012B96E95", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Strategy added by Kyzna\nBring in your Teroclaw Hatchling\nPrio 1: Hawk Eye\nPrio 2: Claw\nPrio 3: Dodge (try dodging big attacks like Curse of Doom or Dive)\nBring in your Nether Ray Fry\nPrio 1: Tail Sweep against Brul'dan\nPrio 2: Bite against Swole\nIn case something survives, you can use a backup pet.\n",
		["name"] = "Do You Even Train? (Flyer)",
		["tags"] = {
			"11171C8", -- [1]
			"11045Q", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:252",
		["groupID"] = "group:none",
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:82"] = {
		["pets"] = {
			"BattlePet-0-000008A85848", -- [1]
			"BattlePet-0-000012B5C356", -- [2]
			"BattlePet-0-000012B5C2FF", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5501\n\nStrategy added by DragonsAfterDark\nKnifefang's Blood in the Water has a 25% Hit Chance for over 1592 damage.\n\nRound 1: Blood in the Water Does Not hit your Bloodgazer Hatchling\nTurns 1-2: Falcosaur Swarm!\nTurn 3: Predatory Strike\nTurns 4+: Falcosaur Swarm! until dead\nBring in your Snowfeather Hatchling\nTurn 1: Predatory Strike\nTurns 2-3: Falcosaur Swarm!\n\nRound 1: Blood in the Water Does hit your Bloodgazer Hatchling\nTurn 1: Falcosaur Swarm!\nBring in your Snowfeather Hatchling\nTurn 1: Predatory Strike\nTurns 2+: Falcosaur Swarm! until dead\nBring in your Direbeak Hatchling\nTurn 1: Predatory Strike\n",
		["name"] = "Frenzied Knifefang",
		["tags"] = {
			"01181TP", -- [1]
			"10151TM", -- [2]
			"00171TN", -- [3]
		},
		["teamID"] = "team:82",
		["targets"] = {
			154920, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:78"] = {
		["pets"] = {
			"BattlePet-0-000012B607A4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6131\n\nStrategy added by CallLightnin\nThree abilities in five turns makes this fight seem trivial. \n\n/way 46.6 28.0 Kelpstone (Cave)\n\nTurn 1: Exposed Wounds\nTurn 2: Pass--Zandalari Footslasher dies\nTurn 3: Black Claw\nTurn 4: Flock\nTurn 5: Flock continues\n",
		["name"] = "Kelpstone",
		["tags"] = {
			"222A15S", -- [1]
			"11181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:78",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			154918, -- [1]
		},
	},
	["team:122"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			0, -- [2]
			"BattlePet-0-000012B01DC0", -- [3]
		},
		["notes"] = "Strategy added by gsanta\nI was able to bring a Level 1 pet with no damage taken.\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nTurn 3: Bring in your Level Pet\nTurn 4: Swap to your Lil' Bling\nTurn 5: Make it Rain\nTurn 6+: Inflation\n",
		["name"] = "This Little Piggy Has Sharp Tusks",
		["tags"] = {
			"021316M", -- [1]
			"ZL", -- [2]
			"2015198", -- [3]
		},
		["teamID"] = "team:122",
		["targets"] = {
			139987, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:243"] = {
		["pets"] = {
			"BattlePet-0-000012B48958", -- [1]
			"BattlePet-0-000012B96D57", -- [2]
			"BattlePet-0-000012B146D0", -- [3]
		},
		["notes"] = "Strategy added by Sevena\nTurn 1: Extra Plating\nTurn 2: Supercharge\nTurn 3: Laser\nTurn 4: Laser\nClawz comes in\nBring in your Motorized Croaker\nTurn 1: Supercharge\nTurn 2: Water Jet\nTurn 3: Water Jet\nMurrey comes in\nTurn 1: Water Jet\nTurn 2: Supercharge\nTurn 3: Explode\nBring in your Iron Starlette\nTurn 1: Wind-Up\nTurn 2: Wind-Up\n",
		["name"] = "To a Land Down Under (Mech)",
		["tags"] = {
			"112414Q", -- [1]
			"11272JB", -- [2]
			"11181BB", -- [3]
		},
		["teamID"] = "team:243",
		["groupID"] = "group:none",
	},
	["team:2"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B528FE", -- [2]
			"BattlePet-0-000012B6751A", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9168\n\nStrategy added by 하늘용#3273\nTime: ~1:20 (~10 rounds)\n\nTested 6 January 2021\n\nTurn 1: Unholy Ascension\nBring in your Xu-Fu, Cub of Xuen\nTurn 2: Moonfire\nTurn 3: Spirit Claws\nEighty Eight dead & Turbo come in\nTurn 4: Prowl\nTurn 5: Spirit Claws\nTurn 6: Turbo dead & Whiplash come in & Swap to your Stormborne Whelpling\nTurn 7: Arcane Storm\nTurn 8: Mana Surge\n",
		["name"] = "Add More to the Collection",
		["tags"] = {
			"002616M", -- [1]
			"122417I", -- [2]
			"02281LP", -- [3]
		},
		["teamID"] = "team:2",
		["targets"] = {
			142114, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:193"] = {
		["pets"] = {
			"BattlePet-0-000012B6764A", -- [1]
			"BattlePet-0-000012B146D0", -- [2]
			"BattlePet-0-000012BA94D5", -- [3]
		},
		["notes"] = "Strategy added by norng\n14~15 rounds.PP, PS Iron Starlette recommend.\n\nTurn 1: Alpha Strike\nTurn 2: Decoy\nTurn 3: Alpha Strike\nTurn 4: Alpha Strike - Scuttles dies\nClamps comes in\nTurn 1: Swap to your Iron Starlette\nTurn 2: Wind-Up\nTurn 3: Supercharge\nTurn 4: Wind-Up\nTurn 5: Powerball - Clamps resurrects\nTurn 6: Swap to your Sapphire Cub - Clamps dies\nKiazor the Destroyer comes in\nTurn 1: Prowl\nTurn 2: Pounce\nTurn 3: Pounce\nTurn 4: Swap to your Mechanical Axebeak\nTurns 5: Haywire - Kiazor the Destroyer dies\n",
		["name"] = "Shipwrecked Captive",
		["tags"] = {
			"12171BR", -- [1]
			"11181BB", -- [2]
			"2025QE", -- [3]
		},
		["teamID"] = "team:193",
		["targets"] = {
			98489, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:149"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"BattlePet-0-000012B99CF2", -- [2]
			"BattlePet-0-000012B01E78", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13135\n\nStrategy added by Pankracy#2378\nFast and simple ;). Enjoy.\n\n-------------------------\nFight time: 9 - 13 rounds\n-------------------------\n\nTD Script provided by Maybellene (https://www.wow-petguide.com/User/34133/Maybellene), THANK YOU!!!!!!!\n\nTurn 1: Toxic Fumes\nTurn 2: Poison Protocol\nTurn 3: Corrosion\nTurn 4: swap to Tinytron\nTurn 5: Flamethrower\nTurn 6: Poison Protocol\nTurn 7: Lightning Shield\nTurn 8: Flamethrower\nTurn 9: Flamethrower\nTurn 10: Flamethrower\nTurn 11: Flamethrower\nTurn 12: Lightning Shield\nTurn 13: Flamethrower. Done. In case Tinytron won't do it, just bring 3rd pet and finish ;]\n",
		["name"] = "Gnomeregan Guard Wolf",
		["tags"] = {
			"21142OQ", -- [1]
			"211620U", -- [2]
			"121838K", -- [3]
		},
		["teamID"] = "team:149",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:6",
		["targets"] = {
			146002, -- [1]
		},
	},
	["team:71"] = {
		["pets"] = {
			"BattlePet-0-000012B48958", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by sioupe\nTurn 1: Call Lightning\nTurns 2-3: Haywire\nTurn 3: GG\n",
		["name"] = "Lurking In The Shadows",
		["tags"] = {
			"221414Q", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:71",
		["targets"] = {
			173376, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:131"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:10", -- [3]
		},
		["name"] = "Shadowlands Wormhole",
		["tags"] = {
			"12181BB", -- [1]
			"21181FS", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:131",
		["targets"] = {
			169501, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:34"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Sevena\nTurn 1: Shadow Slash\nTurn 2: Shadow Slash\nTurn 3: Curse of Doom\nTurn 4: Haunt\nBring in Ikky\nTurn 1: Black Claw\nTurn 2: Flock\n",
		["name"] = "Flow - Legendary",
		["tags"] = {
			"121316M", -- [1]
			"01181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:34",
		["targets"] = {
			200696, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:195"] = {
		["pets"] = {
			"BattlePet-0-000012B146CA", -- [1]
			"random:10", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2492\n\nStrategy added by Eekwibble\nPreferably bring another mech with Launch Rocket\n\nTurn 1: Launch Rocket\nTurns 2-4: Inflation\nTurn 5: Launch Rocket - Mining Monkey dies\nClean up with preferred pet/s",
		["name"] = "Mining Monkey",
		["tags"] = {
			"2125198", -- [1]
			"ZRA", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:195",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:4",
		["targets"] = {
			119341, -- [1]
		},
	},
	["team:69"] = {
		["pets"] = {
			"BattlePet-0-000012B18C43", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"BattlePet-0-000006E4C75E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/139\n\nTurn 1: Pump\nTurn 2: Water Jet\nTurn 3: Pump\nTurns 4+: Water Jet until Au dies (mostly not necessary)\nBanks comes in\nTurns 1+: Water Jet until Eternal Strider dies\nBring in your Teroclaw Hatchling\n\nTurn 1: Nature's Ward\nTurn 2: Hawk Eye\nTurn 3: Claw\nTurn 4: Claw\nTurn 5: Claw\n\nRepeat this rotation over and over until you won the fight.\nWith some bad luck your Hatchling dies at Lil'B. If so bring in your Dark Phoenix Hatchling and:\nTurn 1: Immolate\nTurn 2: Conflagrate\nTurns 3+: Burn until Lil'B dies\n",
		["name"] = "Blingtron 4000",
		["tags"] = {
			"1028BV", -- [1]
			"12171C8", -- [2]
			"12198E", -- [3]
		},
		["teamID"] = "team:69",
		["targets"] = {
			71933, -- [1]
		},
		["groupID"] = "group:2",
	},
	["team:188"] = {
		["pets"] = {
			"BattlePet-0-000006E4C79F", -- [1]
			"BattlePet-0-000012B99B2E", -- [2]
			"BattlePet-0-000012B99CFC", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6045\n\nStrategy added by Shenk\nAny pet with a cleave attack in the 2nd slot should fine. Sometimes Blightbreath will solo the fight.\n\nTurn 1: Acid Rain\nTurn 2+: Dreadful Breath until either the fight is won or Blightbreath is dead\nTurn 3: If necessary bring in Twilight Clutch-Sister and finish with Twilight Meteorite\n",
		["name"] = "Belchling",
		["tags"] = {
			"12171TD", -- [1]
			"112B211", -- [2]
			"11132G6", -- [3]
		},
		["teamID"] = "team:188",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:8",
		["targets"] = {
			150923, -- [1]
		},
	},
	["team:220"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B15603", -- [2]
			"BattlePet-0-000006E4C782", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nTurn 1: Shadow Slash\nTurn 2: Curse of Doom\nTurn 3: Unholy Ascension\nBring in your Timeless Mechanical Dragonling\nTurn 4: Time Bomb\nTurn 5: Flame Breath\nTurn 6: Armageddon\n(Chrominius comes in)\nTurn 7: Bite\nTurn 8: Surge of Power\n",
		["name"] = "They're Full of Stars!",
		["tags"] = {
			"122316M", -- [1]
			"122430S", -- [2]
			"1026140", -- [3]
		},
		["teamID"] = "team:220",
		["targets"] = {
			202458, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:76"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["notes"] = "Strategy added by TobeDeleted#2852\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up\nTurn 5: Wind-Up\nTurn 6: Toxic Smoke until Wind-Up dies. You might get two goes with this if you're lucky. Swap in Mechanical Pandaren Dragonling\nTurn 7+: Breath until second pet dies.\nBlack Claw\nFlock\n",
		["name"] = "Sharp as Flint",
		["tags"] = {
			"12181BB", -- [1]
			"1225QC", -- [2]
			"01181FS", -- [3]
		},
		["teamID"] = "team:76",
		["targets"] = {
			201802, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:27"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11414\n\nStrategy added by angbad#1501\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: Chop\nTurn 4: Swap to your Ikky\nTurn 5: Black Claw\nTurns 6-8: Flock\n",
		["name"] = "The Countess",
		["tags"] = {
			"11231TB", -- [1]
			"21181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:27",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			175782, -- [1]
		},
	},
	["team:68"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6070\n\nStrategy added by Farmacitron#2190\nTurn 1: Curse of Doom\nTurn 2: Unholy Ascension\nTurn 3: Ikky Black Claw\nTurn 4: Flock\nTurn 5: GG WP\n",
		["name"] = "Elderspawn of Nalaada",
		["tags"] = {
			"022616M", -- [1]
			"01181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:68",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			154915, -- [1]
		},
	},
	["team:138"] = {
		["pets"] = {
			"BattlePet-0-000012B146D1", -- [1]
			"BattlePet-0-000012B146D0", -- [2]
			"BattlePet-0-00000D450504", -- [3]
		},
		["notes"] = "Strategy added by loller#2712\nThis might be bit breed dependent on Iron Starlette, but most breeds should work. Thanks to  DeltaHit#1131 for the TD Script!\n\nTurn 1: Thunderbolt\nTurn 2: Decoy\nTurn 3: Breath\nCast Thunderbolt and decoy on CD, use breath as a filler until the first pet is dead. Continue hitting with dragonling until it dies.\nPut on Iron Starlette and cast Wind-UpSuperchargeWind-Up If you get unlucky and miss, restart if not, you should kill the second pet.\nLast pet should be weak from your thunderbolts from earlier, just cast 2x Wind-Up and you should win\n",
		["name"] = "Wastewalker Shu",
		["tags"] = {
			"1225QC", -- [1]
			"11181BB", -- [2]
			"11152HU", -- [3]
		},
		["teamID"] = "team:138",
		["targets"] = {
			66739, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:270"] = {
		["pets"] = {
			"BattlePet-0-000012DE8652", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			"BattlePet-0-000012B96E89", -- [3]
		},
		["notes"] = "Strategy added by AgentRock#1964\nScript thanks to FMJustice\n\nTurn 1: Moonfire\nTurn 2: Prowl\nTurn 3 -4: Spirit Claws until Lifft is dead\nTurn 5-7: Brul'dan comes in.  Spirit Claws until Xu-Fu, Cub of Xuen is dead.\nBring in Mechanical Pandaren Dragonling\nTurn 8-9: Breath until Brul'dan is dead.\nTurn 10: Swole comes in.  Decoy\nTurn 11-15: Breath until Mechanical Pandaren Dragonling is dead.\nBring is Flayer Youngling\nTurn 16: Triple Snap until Swole uses Dive.  Note, if Swole is already underground when Flayer Youngling comes in, then skip to next step.\nTurn 17: Deflection\nTurn 18+: Rampage until Swole is dead.\n",
		["name"] = "Wurallie",
		["tags"] = {
			"11133GI", -- [1]
			"1225QC", -- [2]
			"2225G2", -- [3]
		},
		["teamID"] = "team:270",
		["targets"] = {
			207572, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:83"] = {
		["pets"] = {
			"BattlePet-0-000012B0D34C", -- [1]
			0, -- [2]
			"BattlePet-0-000012B528FE", -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\nObsidian Warwhelp works as alt #1 pet\n\nTurn 1: Time Bomb\nTurn 2: Armageddon\nBring in your Level Pet\nTurn 3: Swap to your Xu-Fu, Cub of Xuen. (You get hit by Whirlpool but even all crits wont kill you).\nTurn 4: Prowl\nTurn 5: Moonfire\nTurn 6+: Spirit Claws, until they all dead.\n",
		["name"] = "Fight Night: Bodhi Sunwayver",
		["tags"] = {
			"022430S", -- [1]
			"ZL", -- [2]
			"122417I", -- [3]
		},
		["teamID"] = "team:83",
		["targets"] = {
			99210, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:63"] = {
		["pets"] = {
			"BattlePet-0-000012B4874E", -- [1]
			"BattlePet-0-000006E4C76E", -- [2]
			"BattlePet-0-000006E4C782", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nBreed recommendation Nexus Whelpling:P/P >> P/B > P/SUpdated the Strategy (8.3.2021). It's safer now. Chrominius can't die anymore.\n\nTurn 1: Tail Sweep\nTurn 2: Arcane Storm\nTurns 3+: Mana Surge until Nexus Whelpling dies\nBring in your Runeforged Servitor\nif Slugger isn't dead then Wind-Up (2x) until Slugger dies\nRunehoof comes in\nTurn 1: Supercharge\nTurn 2: Call Lightning (Runehoof dies)\nDuster comes in\nTurn 1+: Wind-Up until Runeforged Servitor dies\nBring in your Chrominius\nPrio 1: if Duster health > 1110 then Howl\nPrio 2: Surge of Power\n",
		["name"] = "Natural Defenders",
		["tags"] = {
			"122414D", -- [1]
			"22231T5", -- [2]
			"0126140", -- [3]
		},
		["teamID"] = "team:63",
		["targets"] = {
			173372, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:98"] = {
		["pets"] = {
			"BattlePet-0-000012B58B24", -- [1]
			"BattlePet-0-000012B146D0", -- [2]
			"BattlePet-0-000012B146CC", -- [3]
		},
		["notes"] = "Strategy added by Taizun\nStrategy is based on another strategy by [url=https://www.wow-petguide.com/?user=4320]Lazey[/url], found [url=https://www.wow-petguide.com/?Strategy=9906]here[/url], but with enough changes that I felt a new strategy and updated tdscript was needed.Strategy has only been tested with P/P, P/B and P/S Iron Starlette, please leave a comment if other variations work as well.\n\nTurn 1: Decoy\nTurn 2+: Missile until Shelby HP <= 618, then Explode\nShelby dies, bring in Iron Starlette\nTurn 1-2: 2x Wind-Up\nTinyhoof dies, Glitterwing comes in\nTurn 3+: Toxic Smoke until Iron Starlette dies\nBring in Chrominius\nTurn 1: Surge of Power if enemy HP <= 1110, otherwise Howl\nTurn 2: Surge of Power\n",
		["name"] = "Cliffs of Bastion",
		["tags"] = {
			"122CAJ", -- [1]
			"12081BB", -- [2]
			"0126140", -- [3]
		},
		["teamID"] = "team:98",
		["targets"] = {
			173131, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:21"] = {
		["pets"] = {
			"BattlePet-0-000012B0D34C", -- [1]
			0, -- [2]
			"BattlePet-0-000012B118E8", -- [3]
		},
		["notes"] = "Strategy added by Aerolite2017\nBy Aerolite2017, 8 Steps, 66s\n\nTurn 1: Time Bomb\nTurn 2: Armageddon\nBring in your Level Pet\nTurn 3: Swap to your Rotten Little Helper\nTurn 4: Booby-Trapped Presents\nTurn 5: Ice Lance\nTurn 6: Greench's Gift\nTurn 7: Ice Lance\nTurn 8: Ice Lance\n",
		["name"] = "My Beast's Bidding",
		["tags"] = {
			"022430S", -- [1]
			"ZL", -- [2]
			"21141A5", -- [3]
		},
		["teamID"] = "team:21",
		["targets"] = {
			98270, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:123"] = {
		["pets"] = {
			"BattlePet-0-000012BA950B", -- [1]
			"BattlePet-0-000012B61DE8", -- [2]
			"BattlePet-0-000012BA9570", -- [3]
		},
		["notes"] = "Strategy added by Krafty\nTurn 1: Shell Armor\nTurn 2+: Deep Bite until Living Napalm is defeated\nAn enemy pet comes in\nFinish off backline pets. Your Hydraling packs quite  a punch with a fully stacked Deep Bite! \n",
		["name"] = "Living Napalm",
		["tags"] = {
			"121A1G5", -- [1]
			"2229QO", -- [2]
			"111323D", -- [3]
		},
		["teamID"] = "team:123",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:6",
		["targets"] = {
			146183, -- [1]
		},
	},
	["team:105"] = {
		["pets"] = {
			"BattlePet-0-000012B15603", -- [1]
			0, -- [2]
			"BattlePet-0-000012C5B130", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nTurn 1: Flame Breath\nTurn 2: Flame Breath\nTurn 3: Time Bomb\nTurn 4: Armageddon\nBring in your Level Pet\nTurn 5: Swap to your Albino Chimaeraling\nTurns 6-7: Deep Breath\nTurn 8: Call Darkness\n",
		["name"] = "Fight Night: Sir Galveston",
		["tags"] = {
			"122430S", -- [1]
			"ZL", -- [2]
			"12251B9", -- [3]
		},
		["teamID"] = "team:105",
		["targets"] = {
			99182, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:92"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			0, -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["notes"] = "Strategy added by Akxur#2166\nTurn 1: Blistering Cold\nTurn 2: Pass\nTurn 3: Swap to your Level Pet\nTurn 4: Swap to your Boneshard\nTurn 5: Blistering Cold\nTurn 6: Pass\nBring in your Ikky\nTurn 1: Black Claw\nTurns 2-4: Flock\n",
		["name"] = "Goldenbot XD",
		["tags"] = {
			"01031TB", -- [1]
			"ZL", -- [2]
			"01181FS", -- [3]
		},
		["teamID"] = "team:92",
		["targets"] = {
			154924, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:100"] = {
		["pets"] = {
			"BattlePet-0-0000080DA4CD", -- [1]
			"BattlePet-0-000012B482D1", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10424\n\nStrategy added by norng\n5 rounds.\n\nTurn 1: Nut Barrage\nTurn 2: Woodchipper - Nuts dies\nBring in your Zandalari Kneebiter\nTurn 1: Black Claw\nTurns 2-3: Hunting Party - Zao, Calfling of Niuzao dies\n",
		["name"] = "Zao, Calfling of Niuzao",
		["tags"] = {
			"2018A3", -- [1]
			"220514S", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:100",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:3",
		["targets"] = {
			72290, -- [1]
		},
	},
	["team:156"] = {
		["pets"] = {
			"BattlePet-0-000012B67649", -- [1]
			"BattlePet-0-000012B99D43", -- [2]
			"BattlePet-0-000012BA9540", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4597\n\nStrategy added by DragonsAfterDark\nPriority 1: Evanescence\nPriority 2: Forboding Curse\nPriority 3: Quills all else\nBring in your next pet\nAny standard attack will finish the fight\n",
		["name"] = "Deviate Chomper",
		["tags"] = {
			"111B1L5", -- [1]
			"11131B9", -- [2]
			"11191H3", -- [3]
		},
		["teamID"] = "team:156",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:7",
		["targets"] = {
			116788, -- [1]
		},
	},
	["team:37"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"BattlePet-0-000012B146C9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11830\n\nStrategy added by DavidG\nNice and simple, and no hard-to-find pets involved.  You can also replace the third pet with a Direbeak Hatchling, or one of the other Hatchlings that has Falcosaur Swarm!\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nBring in your Ikky\nTurn 3: Black Claw\nHis Meat Hook brings in your third pet\nTurn 4: Flock\nHis Hateful Strike kills your third pet - Ikky comes back in\nTurn 5: Flock\n",
		["name"] = "Glurp",
		["tags"] = {
			"11231TB", -- [1]
			"21181FS", -- [2]
			"121568", -- [3]
		},
		["teamID"] = "team:37",
		["targets"] = {
			175786, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:266"] = {
		["pets"] = {
			"BattlePet-0-000012B3995F", -- [1]
			"BattlePet-0-000012B4C910", -- [2]
			"BattlePet-0-000012B4838C", -- [3]
		},
		["name"] = "healfuck",
		["tags"] = {
			"11252PJ", -- [1]
			"112434H", -- [2]
			"222814F", -- [3]
		},
		["teamID"] = "team:266",
		["groupID"] = "group:none",
	},
	["team:38"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-0000083A0A6A", -- [2]
			"BattlePet-0-00000D511EB1", -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\n1st/2nd Pet doesn't have to be flier/above 300speed but suggested;(Put slower pets in slot 2)If health pool of Exploders is >2811 (1440max per), murder insta kill\n\nTurn 1: Explode\nBring in your Crimson Spore / 2nd pet\nTurn 2: Explode\nBaa'lial / Death Seeker / Baa'l comes in\nTurn 3: Murder the Innocent\n",
		["name"] = "Adinakon",
		["tags"] = {
			"0015QC", -- [1]
			"00261G1", -- [2]
			"02062V1", -- [3]
		},
		["teamID"] = "team:38",
		["targets"] = {
			201849, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:159"] = {
		["pets"] = {
			"BattlePet-0-000012B0D34C", -- [1]
			"BattlePet-0-000012C82AA8", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nTurn 1: Time Bomb\nTurn 2: Pass (Irradiated Elementaling comes in)\nTurn 3: Elementium Bolt\nTurn 4: Immolate\nGlobs comes in\nTurn 5: Immolate\nNightmare Sprout comes in\nTurns 6+: Immolate until Irradiated Elementaling dies (1-2x)\nBring in your Timeless Mechanical Dragonling\nQestion: Trixy is dead? -->YES go to Step B\nNo --> Priolist\nPrio 1: Flame Breath until Nightmare Sprout health < 397 (1-2x)\nPrio 2: Armageddon\n\nStep B (only if  Trixy is dead)\nTurn 1: Time Bomb\nTurn 2: Flame Breath\nTurn 3: Flame Breath\nTurn 4: Armageddon\n",
		["name"] = "Dealing with Satyrs",
		["tags"] = {
			"122430S", -- [1]
			"10242M4", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:159",
		["targets"] = {
			104970, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:139"] = {
		["pets"] = {
			"BattlePet-0-000012B118ED", -- [1]
			"BattlePet-0-000011D76CB1", -- [2]
			"BattlePet-0-000012B482D1", -- [3]
		},
		["notes"] = "Strategy added by LogicPoodle#1550\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up, Pyth dies.\nSpring comes in\nTurn 1+: Powerball until Iron Starlette dies, Pass if you get slept\nBring in your Ikky \nTurn 1: Black Claw\nTurn 2+: Flock, Spring dies. If  Ikky dies partway through, clean up with MPD.\nClatter comes in\nTurns 1+: Once Flock finishes, Black Claw then Flock until dead\nTurn 7: Decoy\nTurn 8: Breath until Clatter dies. Easy peasy.\n",
		["name"] = "Obalis",
		["tags"] = {
			"11281DA", -- [1]
			"211731D", -- [2]
			"221514S", -- [3]
		},
		["teamID"] = "team:139",
		["targets"] = {
			66824, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:184"] = {
		["pets"] = {
			"BattlePet-0-000006E4C76E", -- [1]
			"BattlePet-0-000012B01EBA", -- [2]
			"BattlePet-0-000012B01ED3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14342\n\nStrategy added by Druzil#2921\nPass if stunned.\n\n Iron Starlette backup pet\n\nTurn 1: Supercharge\nTurn 2: Call Lightning - Chum dies\nTurn 3: Bring in Lurking Owl Kitten\nTurn 4: Screech\nTurn 5: Quills\nTurn 6: Feathered Frenzy - Bruce should die\nTurn 7: Quills - Lurking Owl Kitten dies\nTurn 8: Bring in Runeforged Servitor\nTurn 9: Supercharge\nTurn 10: Call Lightning - Maws Jr. dies\n",
		["name"] = "Not So Bad Down Here",
		["tags"] = {
			"22231T5", -- [1]
			"22181S2", -- [2]
			"12171BB", -- [3]
		},
		["teamID"] = "team:184",
		["targets"] = {
			141077, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:240"] = {
		["pets"] = {
			"BattlePet-0-000012B01EED", -- [1]
			"BattlePet-0-000012B01EEC", -- [2]
			"random:4", -- [3]
		},
		["notes"] = "Strategy added by Dreamingdust\nTurn 1: Spiritfire Beam\nTurn 2: Soulrush\nContinue even if the pet got stunned\nTurn 3: Spiritfire Bolt\nTurn 4: Spiritfire Bolt until Fragment of Anger is dead\nFragment of Desire comes in\nTurn 5: Soulrush\nTurn 6: Spiritfire Bolt until fight is over, or Fragment of Desire is dead\n\nAny standard attack will finish the fight\n",
		["name"] = "Are They Not Beautiful? (Undead)",
		["tags"] = {
			"11171IP", -- [1]
			"10191IR", -- [2]
			"ZR4", -- [3]
		},
		["teamID"] = "team:240",
		["groupID"] = "group:none",
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:32"] = {
		["pets"] = {
			"BattlePet-0-000012B4838C", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13523\n\nStrategy added by Doc#1345\nCredit to Nilremife\n\nTurn 1: Breath\nTurn 2: Breath\nTurn 3: Ancient Blessing\nTurn 4: Emerald Dream\nRepeat these step until Gelatinous is defeat. Does not matter what pet 2 or 3 are, they will die and your dragon will be near full health.\n",
		["name"] = "Gelatinous",
		["tags"] = {
			"112814F", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:32",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			175784, -- [1]
		},
	},
	["team:28"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Miamoon\nTurn 1: Pass\nTurn 2: Wind-Up\nTurn 3: Supercharge\nTurn 4: Wind-Up\nGrace comes in\nTurn 1: Toxic Smoke\nTurn 2: Toxic Smoke\nBring in your Level Pet\nTurn 1: Swap to your Chrominius\nTurn 2: Arcane Explosion\nTurn 3: Arcane Explosion\nTurn 4: Arcane Explosion\nAtonement comes in\nTurn 1: Howl\nTurn 2: Surge of Power\n",
		["name"] = "Taralune",
		["tags"] = {
			"12181BB", -- [1]
			"2126140", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:28",
		["targets"] = {
			87125, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:41"] = {
		["pets"] = {
			"BattlePet-0-000012C4A66F", -- [1]
			"BattlePet-0-00000D5451F8", -- [2]
			"BattlePet-0-000012B3956C", -- [3]
		},
		["notes"] = "Strategy added by KaikkuQQ#2332\nTurn 1: Bubble\nTurns 2-4: Stampede\nTurn 5: Pinch until Main-gauche die\nAn enemy pet comes in\nTurn 6: Bubble if possible if not go next turn\nTurns 7-9: Stampede until your pet die\nBring in your Baa'l\nTurn 1: Scorched Earth\nTurn 2-...: Shadowflame until Postier-lémentaire pestiféré die\nAn enemy pet comes in\nTurn 3: Murder the Innocent\nTurn 4: Shadowflame until Baa'l die, if isn't already\nBring in your Glimmershell Scuttler\nTurn 1: Bubble\nTurn 2-3: Pinch\nTurns 4-5: Dive\nRepeat 3 last action until WIN.\n",
		["name"] = "Postmaster Malown",
		["tags"] = {
			"111C2AI", -- [1]
			"122329G", -- [2]
			"12292IN", -- [3]
		},
		["teamID"] = "team:41",
		["targets"] = {
			155413, -- [1]
		},
		["groupID"] = "group:6",
	},
	["team:169"] = {
		["pets"] = {
			"BattlePet-0-000012B146CA", -- [1]
			"BattlePet-0-000012B118A8", -- [2]
			"BattlePet-0-0000128A10CB", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5694\n\nStrategy added by DragonsAfterDark\nTurn 1: Extra Plating\nTurn 2: Make it Rain\nTurn 3-5: Inflation\nTurn 6: Make it Rain\nRandom Enemy comes in:\nTurn 1+: Inflation until dead\nBring in your Sentinel's Companion\nPriority 1: Moonfire & Soulrush on CD\nPriority 2: Peck as filler\n",
		["name"] = "Hiss",
		["tags"] = {
			"2115198", -- [1]
			"12181GV", -- [2]
			"111737R", -- [3]
		},
		["teamID"] = "team:169",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:7",
		["targets"] = {
			116793, -- [1]
		},
	},
	["team:24"] = {
		["pets"] = {
			"BattlePet-0-000012BA9572", -- [1]
			"BattlePet-0-000012BEEEA6", -- [2]
			"BattlePet-0-00000D511EB1", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nTurn 1: Wild Magic\nTurn 2: Illuminate\nTurn 3: Swap to your Seaborne Spore\nTurn 4: Glowing Toxin\nTurn 5: Explode\nBring in your Death Seeker\nTurn 6: Murder the Innocent\n",
		["name"] = "Tremblor - Legendary",
		["tags"] = {
			"021839U", -- [1]
			"22241G3", -- [2]
			"02062V1", -- [3]
		},
		["teamID"] = "team:24",
		["targets"] = {
			200692, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:269"] = {
		["pets"] = {
			"BattlePet-0-00001234372A", -- [1]
			"BattlePet-0-000012B5CB5D", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Strategy added by glowcloud\nEven with the worst luck possible, your third pet should only need to get in a hit or two, so preferably the first slot ability is a Beast ability (I use Dodger because I don't get to use them enough).With good luck, Gizmo almost solos the fight. It's just the classic \"hurt all three enemies at once with one pet\" strat.\n\nTurn 1: Mangle\nAfter this the fight becomes more variable\nPriority 1:: Ethereal when Lifft is Underwater\nPriority 2:: Refresh Mangle on enemy pet if it falls off\nPriority 3:: Swipe\nGizmo dies\nBring in your Infernal Pyreclaw\nTurn 1: Great Sting (if more than one enemy pet is alive)\nTurn 2: Scorched Earth\nTurn 3: Flame Breath\nUse Scorched Earth on CD and Flame Breath as filler\n\nIf Infernal Pyreclaw dies and one or two enemies are still alive, bring in 3rd pet and just hit them once or twice\n",
		["name"] = "Do You Even Train? (Beast)",
		["tags"] = {
			"2228316", -- [1]
			"221A219", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:269",
		["groupID"] = "group:none",
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:254"] = {
		["pets"] = {
			"BattlePet-0-000012B11883", -- [1]
			"BattlePet-0-000012B11899", -- [2]
			"BattlePet-0-0000080D00C4", -- [3]
		},
		["notes"] = "Strategy added by isthevao#1164\nStrategy posted on [url=https://www.wowhead.com/npc=204934/trainer-orlogg#comments:id=5600054]WoWhead[/url] by DraikoGinger.\n\nPrio 1: Burrow if Lifft used Dive\nPrio 2: Woodchipper if fighting Brul'dan without the bleeding debuff\nPrio 3: Spirit Claws\nBring in your Plaguelouse Larva\nPrio 1: Plague Breath\nBring in your Orphaned Marsuul\nPrio 1: Feign Death if Swole can use Headbutt\nPrio 2: Burrow if Swole used Dive\nBite\n",
		["name"] = "Do You Even Train? (Critter)",
		["tags"] = {
			"22152UC", -- [1]
			"20092SA", -- [2]
			"1119224", -- [3]
		},
		["teamID"] = "team:254",
		["groupID"] = "group:none",
	},
	["team:219"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Plougz#2307\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Ikky\nTurn 1: Black Claw\nTurn 2: Flock\n",
		["name"] = "Unit 6",
		["tags"] = {
			"121316M", -- [1]
			"11181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:219",
		["targets"] = {
			154928, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:250"] = {
		["pets"] = {
			"BattlePet-0-000012B01EED", -- [1]
			"BattlePet-0-000012B01EEC", -- [2]
			"BattlePet-0-000006E4C79F", -- [3]
		},
		["notes"] = "Strategy added by Anesthetize\nPrio 1: Soulrush\nPrio 2: Spiritfire Bolt\nThis two abilities should kill Bassalt and Clawz.\nOnes Murrey is in use Reflective Shield and same priorities until Fragment of Desire is dead\nBlightbreath comes in \nPrio 1 : Toxic Smoke\nPrio 2: Slime\n",
		["name"] = "To a Land Down Under (Undead)",
		["tags"] = {
			"10171IP", -- [1]
			"11191IR", -- [2]
			"22071TD", -- [3]
		},
		["teamID"] = "team:250",
		["groupID"] = "group:none",
	},
	["team:87"] = {
		["pets"] = {
			"BattlePet-0-000008A86E91", -- [1]
			"BattlePet-0-000012B146CF", -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["notes"] = "Strategy added by Bösendorfer\nI am using this every day, works flawlessly, and its fast. \n\nTurn 1: Emerald Presence\nTurn 2: Emerald Bite x 2\nTurn 3: Emerald Presence (Always use this when the dragon buff is active)\nTurn 4: Emerald Bite, Skyshaper dies\nFangor enters\nTurn 5: Emerald Bite (with dragon buff active)\nTurn 6: Proto-Strike\nTurn 7: Emerald Bite until Fangor dies\nDor the Wall enters\nTurn 8: Emerald Bite x 1, Emerald Proto-Whelp might die here\nif Emerald Proto-Whelp survives the Headbutt from Dor the Wall, go to next step\nTurn 9: Bring in Level Pet\nTurn 10: bring in Ikky\nTurn 11: Black Claw\nTurn 12: Flock\nTurn 13: Savage Talon if Dor the Wall is still alive\n",
		["name"] = "Hyuna of the Shrines",
		["tags"] = {
			"22181S7", -- [1]
			"111C1QT", -- [2]
			"11181FS", -- [3]
		},
		["teamID"] = "team:87",
		["targets"] = {
			66730, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:197"] = {
		["pets"] = {
			"BattlePet-0-000012B607A8", -- [1]
			"BattlePet-0-000012B15603", -- [2]
			"BattlePet-0-000012B866BC", -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\nHigher powered Moths are preferred\n\nTurn 1: Poison Protocol\nTurn 2: Corrosion\nTurn 3: Pass. Note: If Anomalus died round 2 before getting off Corrosion; use Flame Breath\nBring in your Timeless Mechanical Dragonling\nTurn 4: Time Bomb\nTurn 5: Armageddon\nBring in your Moth\nTurn 6: Reckless Strike. Note: Skip this step if Bassalt is already dead\nClawz comes in\nTurn 7: Counterspell\nNote:: If Murrey is still in; pass until Time Bomb hits\nMurrey comes in\nTurn 8: Call Lightning\n",
		["name"] = "To a Land Down Under",
		["tags"] = {
			"20142OQ", -- [1]
			"122430S", -- [2]
			"22291HK", -- [3]
		},
		["teamID"] = "team:197",
		["targets"] = {
			201004, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:36"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B482D1", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Halyanth#1611\nI tried it the first time today. I will update the strategy as I continue to play with it. \n\nTurn 1: Haunt\nBring in Kneebitter\nTurn 2: Black Claw\nTurn 3: Hunting Party\nTurn 4: Hunting Party continues\nTurn 5: Leap\n",
		["name"] = "Flow - Rare",
		["tags"] = {
			"221316M", -- [1]
			"221514S", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:36",
		["targets"] = {
			200697, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:249"] = {
		["pets"] = {
			"BattlePet-0-00000D5451F8", -- [1]
			"BattlePet-0-00000D511EB1", -- [2]
			0, -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/17855\n\nStrategy added by WhyDaRumGone\nTurn 1: Murder the Innocent\nTurn 2: Swap to your Death Seeker\nTurn 3: Murder the Innocent\nTurn 4: Eyeblast\nTurn 5: Pass, Death Seeker dies.\nBring in your Level Pet\nTurn 6: Swap to your Baa'l\nTurn 7: Darkflame\nTurn 8: Murder the Innocent\n",
		["name"] = "Yu'la, Broodling of Yu'lon (2)",
		["tags"] = {
			"220329G", -- [1]
			"12062V1", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:249",
		["groupID"] = "group:1",
		["preferences"] = {
			["minXP"] = 1,
		},
	},
	["team:179"] = {
		["pets"] = {
			"BattlePet-0-000012B01DC0", -- [1]
			"BattlePet-0-000012B99C7F", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Obi-Wahn\nStrategy by Buuloki on Wowheadany Hare/Rabbit should do\n\nTurn 1: Extra Plating\nTurn 2: Make it Rain\nTurn 3: Inflation\nTurn 4: Make it Rain\nBlackmane turns undead\nTurn 5: Inflation - Lil' Bling dies\nBring in your Tolai Hare\nTurn 6: Flurry\nTurn 7: Flurry\n",
		["name"] = "Blackmane",
		["tags"] = {
			"2215198", -- [1]
			"222528", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:179",
		["targets"] = {
			150858, -- [1]
		},
		["groupID"] = "group:6",
	},
	["team:209"] = {
		["pets"] = {
			"BattlePet-0-000012B99945", -- [1]
			"BattlePet-0-000012B6764A", -- [2]
			"BattlePet-0-000012692A6E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15795\n\nStrategy added by GCSuns\nTurn 1: Call Lightning\nTurn 2: Swarm of Flies\nTurn 3: Zap\nTurn 4: Zap\nTurn 5: Ranishu Runt dies. Switch in Mechanical Axebeak\nTurn 6: Decoy. Haywire if needed.\n",
		["name"] = "Liz",
		["tags"] = {
			"12242BH", -- [1]
			"22171BR", -- [2]
			"11163AN", -- [3]
		},
		["teamID"] = "team:209",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:5",
		["targets"] = {
			161650, -- [1]
		},
	},
	["team:201"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/18464\n\nStrategy added by DragonsAfterDark\nThe script will run for Ikky & the Zandalari Raptors\n\nVideo for Fight (https://youtu.be/NjYD3heC3Js)\n\nTurn 1: Curse of Doom\nTurn 2: Shadow Slash / Shadow Shock\nTurn 3: Haunt\nBring in your Ikky\nTurn 4: Black Claw\nTurns 5-6: Flock\n",
		["name"] = "Enok the Stinky",
		["tags"] = {
			"021616M", -- [1]
			"01181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:201",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			202440, -- [1]
		},
	},
	["team:150"] = {
		["pets"] = {
			"BattlePet-0-000012BEEEA6", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			"BattlePet-0-000012B673F3", -- [3]
		},
		["notes"] = "Strategy added by norng\n6 rounds.\n\nTurn 1: Glowing Toxin\nTurn 2: Explode\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Explode\nBring in your Microbot XD\nTurn 1: Supercharge\nTurns 2-3: Ion Cannon - Gorgemouth dies\n",
		["name"] = "Failed Experiment",
		["tags"] = {
			"20241G3", -- [1]
			"0015QC", -- [2]
			"02272KT", -- [3]
		},
		["teamID"] = "team:150",
		["targets"] = {
			173274, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:102"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B482D2", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Vulpixie\nWorked well for me when I had to have the Shadowbarb Hatchling in the team.Ikky with Black Claw and Flock is also an acceptable alternative to the Zandalari.Thank you to DragonsAfterDark for fixing my script.\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: BONESTORM\nTurn 4: Chop until Boneshard dies\nBring in your Zandalari Anklerender\nTurn 1: Black Claw\nTurn 2: Hunting Party\nTurn 8: Zandalari dies, Blistering Cold should finish off the battle with your level pet getting some XP\n",
		["name"] = "Dune Buggy",
		["tags"] = {
			"11231TB", -- [1]
			"202A15R", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:102",
		["targets"] = {
			162465, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:113"] = {
		["pets"] = {
			"BattlePet-0-0000088F2EFD", -- [1]
			"BattlePet-0-000012B146C7", -- [2]
			"BattlePet-0-0000086053F1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/17924\n\nStrategy added by itsemmaelise#1345\nTurn 1: Wild Magic\nBoneshard comes in\nTurn 2: Blistering Cold\nTurn 3: Chop\nTurn 4: Chop\nTurn 5: Blistering Cold\nTurn 6: Chop\nTurn 7: Chop\nBring in your Fel-Afflicted Skyfin\nTurn 8: Wild Magic\n",
		["name"] = "Pulverizer Bot Mk 6001",
		["tags"] = {
			"2224227", -- [1]
			"11231TB", -- [2]
			"2226226", -- [3]
		},
		["teamID"] = "team:113",
		["targets"] = {
			145988, -- [1]
		},
		["groupID"] = "group:6",
	},
	["team:12"] = {
		["pets"] = {
			"BattlePet-0-000012B146C9", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10122\n\nStrategy added by DragonsAfterDark\nIt will take a while, but your bunny will end with 100% hp\n\nYou can also do this method with Lagan / Slithershock Elver (1,1,1), Scrapyard Tunneler (2,1,1), Alloyed Alleyrat (1,2,1), Specimen 97 (1,1,1)\n\nIt's also possible to do this with Inky / Nameless Octopode (1,2,2), & Sneaky Marmot (1,2,2), but you use the blind on turn two and pass on turn three, which loses one round of attack, and will make this last longer.\n\nVideo for Fight (https://www.youtube.com/watch?v=SAQqQd5HWT0)\n\nTurn 1: Scratch\nTurn 2: Scratch\nTurn 3: Dodge\nTurn 4: Scratch\nTurn 5: Scratch\nTurn 6: Burrow goes underground\nTurn 7: Burrow lands\n\nRepeat from TURN 2\n",
		["name"] = "Briarpaw",
		["tags"] = {
			"221568", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:12",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			175778, -- [1]
		},
	},
	["team:35"] = {
		["pets"] = {
			"BattlePet-0-000012B3E06C", -- [1]
			"BattlePet-0-000012B15603", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Remte\nIn this vast jungle, a low-hanging fruit isn't entirely unexpected.While Immolation is much, much better for backline healing, I've found out Flamethrower adds a little more stability, as dropping a DoT later means it smoothes out the Burn's RNG. You can use Immolation first cast only, but you will risk Gyrexle healing out because Failsafe didn't trigger. I think it has something to do with different backline/weather abilities affecting the Gyrexle's health in a way that causes them to use Repair late/early enough.Managed to [url=https://pastebin.com/raw/xsay3pFH ]succeed with a crit of[/url] Rot. (A forfeit is for continued testing.)\n\nTurn 1: Flamethrower (Don't worry about the 'strong' Rot.)\nTurn 2: Nether Gate – enemy Wishbright Lantern is forced in\nTurn 3: Swap to your Timeless Mechanical Dragonling\nTurns 4-6: Flame Breath x3 – enemy Wishbright Lantern dies\nIdol of Decay comes back in\nTurn 7: Time Bomb\nTurn 8: Armageddon – your Timeless Mechanical Dragonling dies\nBring in your Level Pet\nTurn 9: Swap to your Fiendish Imp\nTurn 10: Flamethrower – enemy Idol of Decay is stunned and will die after Damned in the backline\nGyrexle, the Eternal Mechanic comes in\nTurns 11+: Burn 'til the end, no more than 4 times.\n",
		["name"] = "Cymre Brightblade",
		["tags"] = {
			"122516D", -- [1]
			"122430S", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:35",
		["targets"] = {
			83837, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:196"] = {
		["pets"] = {
			"BattlePet-0-000012C2DA6F", -- [1]
			"BattlePet-0-000012BC09D8", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by kachooman\n5 rounds :D still working\n\nTurn 1: Build Turret\nTurn 2: Swap to your Experiment 13\nTurn 3: Build Turret\nTurn 4: U-238 Rounds\nTurn 5: U-238 Rounds\n",
		["name"] = "Unbreakable",
		["tags"] = {
			"020A2KS", -- [1]
			"10252PK", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:196",
		["groupID"] = "group:none",
		["targets"] = {
			141215, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:231"] = {
		["pets"] = {
			"BattlePet-0-000012B96E94", -- [1]
			"BattlePet-0-000012B608F8", -- [2]
			"BattlePet-0-000006E4C770", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).**Right now we have 4 different Power stats on pets for the 2nd Slot, the script includes them all, but for the written steps I'm just using the weakest Scorched Earth damage tick to decide if I can kill Swole before it dives. Molten Corgi's Blazing Yip alone deals 315 damage, so you may wanna adjust that based on the Power of your second pet:315 + 56 (260P) = 371 (I'm using this in written steps)315 + 59 (276P) = 374315 + 61 (289P) = 376315 + 65 (305P) = 380\n\nWith your Stout Alemental stick to these priorities until dead:\nPrio 1:: Bubble\nPrio 2:: Barrel Toss\n\nBring in your Fel Flame and stick to these priorities until dead:\nPrio 1:: Scorched Earth\nPrio 2:: Enemy is Swole -> Conflagrate\nPrio 3:: Flame Breath\n\nMolten Corgi comes in, stick to these priorities:\nPrio 1:: Enemy is Brul'dan -> Blazing Yip\nPrio 2:: Swole is Underwater -> Puppies of the Flame\nPrio 3:: Swole has >371HP** (>315HP without Scorched Earth), can't use Headbutt, Dive is available -> Puppies of the Flame\nPrio 4:: Scorched Earth is active, Swole is the enemy and not Underwater -> Superbark \nPrio 5:: Swole has >315HP and is not Underwater -> Superbark\nPrio 6:: Blazing Yip\nPrio 7:: Pass turn when your pet got stunned (on your last pet that happens automatically)\n",
		["name"] = "Do You Even Train? (Elemental)",
		["tags"] = {
			"21241FE", -- [1]
			"2216G7", -- [2]
			"11151DB", -- [3]
		},
		["teamID"] = "team:231",
		["groupID"] = "group:none",
	},
	["team:91"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by SpruceOP\nTurn 1: Shadow Slash\nTurn 2: Curse of Doom\nTurn 3: Haunt\nBring in your Ikky\nTurn 4: Black Claw\nTurn 5+: Flock\n",
		["name"] = "I Am The One Who Whispers",
		["tags"] = {
			"121316M", -- [1]
			"01181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:91",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			162461, -- [1]
		},
	},
	["team:135"] = {
		["pets"] = {
			"BattlePet-0-000012B146D1", -- [1]
			"BattlePet-0-000012B1731B", -- [2]
			"BattlePet-0-000012B17369", -- [3]
		},
		["notes"] = "Strategy added by frag\nTurn 1: Wind-Up\nChange to Zandalari Anklerender\nTurn 2: Black Claw\nTurn 3-5: Hunting Party untill Anklerender is dead\nChange to Ikky\nTurn 6-9: Savage Talon untill No-No is dead (if Ikky die change to Iron Starlette)\nChange to Iron Starlette\nTurn 10: Wind-Up to end No-No\n",
		["name"] = "No-No",
		["tags"] = {
			"2215QC", -- [1]
			"1125G1", -- [2]
			"112A14P", -- [3]
		},
		["teamID"] = "team:135",
		["targets"] = {
			68559, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:158"] = {
		["pets"] = {
			"BattlePet-0-000012B4861E", -- [1]
			0, -- [2]
			"BattlePet-0-000012B4874E", -- [3]
		},
		["notes"] = "Strategy added by Lazey\n*** 9.0.2 approved ***Korval Darkbeard:4AFM:221AHD:ZL:122414D:P:240::3::::Aquatic level pets need more HP.\n\nTurn 1: Moonfire\nTurn 2+: Arcane Blast until Feathers is dead.\nSplat comes in\nTurn 1: Life Exchange\nTurn 2: Moonfire\nTurn 3+: Arcane Blast until Splat is dead. (Jump to level pet swap if your Nether Faerie Dragon is dead too.)\nBrite comes in\nTurn 1: Arcane Blast until your Nether Faerie Dragon dies. (Pass turns if you would kill Brite!)\nSwap to your Level Pet\nSwap to your Nexus Whelpling\nTurn 1: Arcane Storm\nTurn 2+: Mana Surge\n",
		["name"] = "Accidental Dread",
		["tags"] = {
			"2215HD", -- [1]
			"ZL", -- [2]
			"122414D", -- [3]
		},
		["teamID"] = "team:158",
		["preferences"] = {
			["minHP"] = 241,
			["minXP"] = 4,
		},
		["groupID"] = "group:none",
		["targets"] = {
			141814, -- [1]
		},
	},
	["team:205"] = {
		["pets"] = {
			"BattlePet-0-000012B5C2FF", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2490\n\nStrategy added by Eekwibble\nTurns 1&2: Falcosaur Swarm!\nTurn 3: Ironskin\nTurn 4: Predatory Strike\nTurns 5&6: Falcosaur Swarm! - Krutz's Battle Monkey dies\nClean up with preferred pet/s",
		["name"] = "Klutz's Battle Monkey",
		["tags"] = {
			"12171TN", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:205",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:4",
		["targets"] = {
			119345, -- [1]
		},
	},
	["team:111"] = {
		["pets"] = {
			0, -- [1]
			"BattlePet-0-000012B18C43", -- [2]
			"BattlePet-0-000012B146D0", -- [3]
		},
		["notes"] = "Strategy added by Malhado\nTurn 1: Your best one round defensive or, if none, ofensive ability.\nTurn 2: Swap to your Eternal Strider\nTurn 3: Cleansing Rain\nTurn 4: Pump\nTurn 5: Pump\nTurn 6: Water Jet\nSiren dies and Toothbreaker enters the fight.\nTurn 1: Water Jet\nTurn 2: Cleansing Rain\nTurn 3: Pump\nTurn 4: Pump\nToothbreaker dies. Brood of Mothallus comes in.\nTurn 1: Water Jet\nTurn 2: Pass if slower / Water Jet if faster\nTurn 3: Pass\nEternal Strider dies. Bring your Iron Starlette in.\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\n",
		["name"] = "Farmer Nishi",
		["tags"] = {
			"ZL", -- [1]
			"1228BV", -- [2]
			"11181BB", -- [3]
		},
		["teamID"] = "team:111",
		["targets"] = {
			66734, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:174"] = {
		["pets"] = {
			"BattlePet-0-000012B5C607", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1834\n\nStrategy added by NostrA#2338\nProps to Aranesh for his/her strategy, I just changed the TD Script and Strategy to make Teroclaw viable again\n\n\n\nTurn 1-3: use Rampage\nTurn 4+: use Thrash until Klutz's Battle Rat dies\nan enemy Pet comes in\nTurn 1+: use Rampage on cooldown otherwise use Thrash until your Kun-Lai Runt dies\nBring in your Teroclaw Hatchling\nenemy HP < 618: use Ravage\nif the enemy is a Flying Type, you want to use Ravage when the enemy HP is under 406 \nwhen not active: use Nature's Ward\nelse: use Alpha Strike",
		["name"] = "Klutz's Battle Rat",
		["tags"] = {
			"111814E", -- [1]
			"22271C8", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:174",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:4",
		["targets"] = {
			119343, -- [1]
		},
	},
	["team:120"] = {
		["pets"] = {
			"BattlePet-0-000012B67C89", -- [1]
			"BattlePet-0-000012B3E786", -- [2]
			"BattlePet-0-000012B4C1CA", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9709\n\nStrategy added by versailes\nPrio 1: Dive\nPrio 2: Bubble\nPrio 3: Pinch until Living Sludge is dead.\n\nAn enemy pet comes in Switch pet according to the next pet's family\nCredit: Backline Pet Strategy is by GermanPolo#2220 https://www.wow-petguide.com/?Strategy=9514\n\nUndead=Chitterspine\nPrio 1: Black Claw\nPrio 2: Swarm\nPrio 3: Skitter\n\nMechanical= Terrible Turnip\nPrio 1: Sons of the Root\nPrio 2: Leech Seed\nPrio 3: Tidal Wave\n",
		["name"] = "Living Sludge",
		["tags"] = {
			"12152AV", -- [1]
			"222B2IO", -- [2]
			"2128KA", -- [3]
		},
		["teamID"] = "team:120",
		["targets"] = {
			146182, -- [1]
		},
		["groupID"] = "group:6",
	},
	["team:207"] = {
		["pets"] = {
			"BattlePet-0-000012B485C2", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1229\n\nTurn 1: Geyser\nTurn 2+3: Dive\nTurn 4: Water Jet\nTurn 5+: Keep Geyser and Dive on cooldown, otherwise use Water Jet\nIf your Pandaren Water Spirit dies too early, bring in your level 25 pet and use any damaging spell. The incoming Geyser will finish the fight anyway.",
		["name"] = "Foe Reaper 50",
		["tags"] = {
			"1229R4", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:207",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:4",
		["targets"] = {
			119409, -- [1]
		},
	},
	["team:126"] = {
		["pets"] = {
			"BattlePet-0-000012B99CF2", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"BattlePet-0-000006E4C794", -- [3]
		},
		["notes"] = "Strategy added by Kirandji\nIt depends on the backliners if its a onepetstrat or not. Against magics this setup strat is a onepetter, the mech pandaren will punch the undead and the magics. Thanks & credits to Shaka 4 the script\n\nTurn 1: Fire Shield on CD\nTurn 2: Lightning Shield on cd\nTurn 3: Arcane Blast as spammer\nTurn 4: it depends on the back, if no magics tron wont make it alone. Bring in the dragonling.\nTurn 5: Decoy\nTurn 6: Thunderbolt\nTurn 7: Breath\n",
		["name"] = "Crypt Fiend",
		["tags"] = {
			"112620U", -- [1]
			"1115QC", -- [2]
			"11131TC", -- [3]
		},
		["teamID"] = "team:126",
		["targets"] = {
			150911, -- [1]
		},
		["groupID"] = "group:8",
	},
	["team:23"] = {
		["pets"] = {
			"BattlePet-0-000012B482D2", -- [1]
			"BattlePet-0-000012B4838C", -- [2]
			"BattlePet-0-000012B67A9C", -- [3]
		},
		["notes"] = "Strategy added by Aranesh\nTurn 1: Black Claw\nTurns 2+3: Hunting Party\nTurn 4: Leap until Growing Ectoplasm is dead\nAn enemy pet comes in\nTurns 1+: Black Claw and Hunting Party until your Zandalari Anklerender dies\nBring in your Emerald Proto-Whelp\nTurn 1: Emerald Presence\nTurns 2+: Keep Emerald Presence active, use Emerald Dream when you drop below 1000 health and use Emerald Bite to finish the enemy pets.\n",
		["name"] = "Growing Ectoplasm 2",
		["tags"] = {
			"212A15R", -- [1]
			"222814F", -- [2]
			"11163BP", -- [3]
		},
		["teamID"] = "team:23",
		["targets"] = {
			116794, -- [1]
		},
		["groupID"] = "group:7",
	},
	["team:236"] = {
		["pets"] = {
			"BattlePet-0-000012B01EED", -- [1]
			"BattlePet-0-000012B01EEC", -- [2]
			"random:4", -- [3]
		},
		["notes"] = "Strategy added by Dreamingdust\nTurn 1: Spiritfire Beam\nTurn 2: Soulrush\nContinue even if the pet got stunned\nTurn 3: Spiritfire Bolt\nTurn 4: Spiritfire Bolt until Fragment of Anger is dead\nFragment of Desire comes in\nTurn 5: Soulrush\nTurn 6: Spiritfire Bolt until fight is over, or Fragment of Desire is dead\n\nAny standard attack will finish the fight\n",
		["name"] = "Are They Not Beautiful? (Undead) (2)",
		["tags"] = {
			"11171IP", -- [1]
			"10191IR", -- [2]
			"ZR4", -- [3]
		},
		["teamID"] = "team:236",
		["groupID"] = "group:none",
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:20"] = {
		["pets"] = {
			"BattlePet-0-000012B4C1CA", -- [1]
			"BattlePet-0-00001274E208", -- [2]
			"random:4", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11167\n\nStrategy added by Mutanis\n6 rounds.\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: Swap to your Arachnoid Skitterbot\nTurn 4: Smoke Cloud\nTurn 5: Toxic Spray\nTurn 6: Flurry\n",
		["name"] = "Mistwing",
		["tags"] = {
			"1218KA", -- [1]
			"111C39I", -- [2]
			"ZR4", -- [3]
		},
		["teamID"] = "team:20",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			175780, -- [1]
		},
	},
	["team:251"] = {
		["pets"] = {
			"BattlePet-0-000012B5CBA7", -- [1]
			"BattlePet-0-000012B9027A", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/214\n\nTurn 1: Immolation\nTurn 2: Wild Magic\nTurn 3: Swap to your Rapana Whelk\nTurn 4: Acidic Goo\nTurn 5: Ooze Touch\nTurn 6: Ooze Touch\nTurns 7+8: Dive\n",
		["name"] = "Chi-Chi, Hatchling of Chi-Ji (3)",
		["tags"] = {
			"212813T", -- [1]
			"111CN7", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:251",
		["groupID"] = "group:1",
	},
	["team:107"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B01DC0", -- [2]
			"BattlePet-0-000012B146D1", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Lil' Bling\nTurn 1-3: Inflation\nTurn 4: Make it Rain\nTurn 5+: Inflation\n\nIf needed: \nBring in your Mechanical Pandaren Dragonling\nTurn 1+: Breath\n",
		["name"] = "Watch Where You Step",
		["tags"] = {
			"021316M", -- [1]
			"2015198", -- [2]
			"1225QC", -- [3]
		},
		["teamID"] = "team:107",
		["targets"] = {
			162466, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:130"] = {
		["pets"] = {
			"BattlePet-0-000012B99CF8", -- [1]
			"BattlePet-0-000012B5CDB5", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Kalagren\n2nd pet must be Obsidian Warwhelp.Level pet crit safe damage = 247 or more HP.\n\nPet Bombling comes in\nTurn 1: Minefield\nTurn 2: Explode\nBring in your Obsidian Warwhelp\nTurn 3: Time Bomb\nTurn 4: Flame Breath\nTurn 5: Armageddon both Cockroach and Cat die\nBring in your Level Pet\nTurn 6: Pass and Level Pet takes 164 non-critical strike critter damage\nChicken dies to Time Bomb\n",
		["name"] = "You Have to Start Somewhere",
		["tags"] = {
			"01292L", -- [1]
			"1223455", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:130",
		["preferences"] = {
			["minHP"] = 165,
			["minXP"] = 2,
		},
		["groupID"] = "group:none",
		["targets"] = {
			197350, -- [1]
		},
	},
	["team:161"] = {
		["pets"] = {
			"BattlePet-0-000012B66C49", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1832\n\nStrategy added by NostrA#2338\nprops to Aranesh for his/her strategy, i just changed the TD Script and Strategy to make Teroclaw viable again\n\nTurn 1: use Whirlpool\nTurn 2: use Surge\nTurn 3: Pass\nTurn 4: use Surge\nTurn 5: use Whirlpool\nTurn 6: use Healing Wave\nTurn 7+: use Surge until Angry Geode dies\nan enemy pet comes in\nTurn 1+: Keep Whirlpool and Healing Wave on cooldown, otherwise use Surge until your Emperor Crab dies\nBring in your Teroclaw Hatchling\nenemy HP < 618: use Ravage\nif the enemy is a Flying Type, you want to use Ravage when the enemy HP is under 406 \nwhen not active: use Nature's Ward\nelse: use Alpha Strike",
		["name"] = "Angry Geode",
		["tags"] = {
			"2224NA", -- [1]
			"22271C8", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:161",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:4",
		["targets"] = {
			119342, -- [1]
		},
	},
	["team:215"] = {
		["pets"] = {
			"BattlePet-0-000012B4874E", -- [1]
			"BattlePet-0-000012B6751A", -- [2]
			"BattlePet-0-000012B67C89", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nThe enemies don't use their abilities in a particular order, hence the priority system.[url=https://youtu.be/qGCV-Bk7bLg]Video for Fight[/url]\n\n~: Priorities for pets 1 & 2\nPriority 1: Arcane Storm on CD\nPriority 2: Mana Surge on CD\nPriority 3: Tail Sweep\nBring in your Hermit Crab\nPriority 1: Bubble or Dive when Kazzquack is Lifted-Off\nPriority 2: Fish Slap\n",
		["name"] = "A New Vocation (2)",
		["tags"] = {
			"122414D", -- [1]
			"12281LP", -- [2]
			"22152AV", -- [3]
		},
		["teamID"] = "team:215",
		["targets"] = {
			201899, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:218"] = {
		["pets"] = {
			"BattlePet-0-000012B99CF2", -- [1]
			"BattlePet-0-000012B99C8C", -- [2]
			"BattlePet-0-000012B5CC26", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Rabid Strike\nTurn 2: Corpse Explosion\nBring in your Magma Rageling\nTurn 1: Fire Shield\n",
		["name"] = "Unit 35",
		["tags"] = {
			"212620U", -- [1]
			"21142D2", -- [2]
			"111836P", -- [3]
		},
		["teamID"] = "team:218",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			154927, -- [1]
		},
	},
	["team:57"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5969\n\nStrategy added by nurkka\nThird pet not brought in. I used a Magic pet to assure it would stay alive from the wave attacks.\n\nTurn 1: Shadow Shock\nTurn 2: Curse of Doom\nTurn 3: Haunt\nBring in your Ikky\nTurns 1-3: Flock\n",
		["name"] = "Prince Wiggletail",
		["tags"] = {
			"221616M", -- [1]
			"00181FS", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:57",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			154910, -- [1]
		},
	},
	["team:108"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			0, -- [2]
			"BattlePet-0-000012B482D2", -- [3]
		},
		["notes"] = "Strategy added by Tinlar#1408\nThank you to shpungout for the suggestion on how to streamline the strategy\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: Swap to your Level Pet\nTurn 4: Swap to your Zandalari Anklerender\nTurn 5: Black Claw\nTurns 6-7: Hunting Party\n",
		["name"] = "Unit 17",
		["tags"] = {
			"11031TB", -- [1]
			"ZL", -- [2]
			"202A15R", -- [3]
		},
		["teamID"] = "team:108",
		["targets"] = {
			154929, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:25"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B482D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11420\n\nStrategy added by Xerxes\nAny pet with Black Claw should work in slot 2.\n\nThe first attack from the enemy pet has a small chance to crit and drop Boneshard to 1 HP. In this case, restart the fight.\n\nYour level pet can have less than 700 HP.\nThe last hit will do about 400 damage, but I've seen it crit for around 700 HP.\n\nTD Script by Yolo (https://www.wow-petguide.com/index.php?user=11440)\n\nEnjoy :)\n\nTurn 1: Blistering Cold\nBoneshard should be roughly half HP. If he's 1 HP, restart the fight.\nTurn 2: Chop\nBoneshard should be 20 HP\nTurn 3: BONESTORM\nTurn 4: Blistering Cold\nBring in your Zandalari Kneebiter\nTurn 5: Black Claw\nTurn 6: Pass\nTurn 7: Pass\n",
		["name"] = "Sewer Creeper",
		["tags"] = {
			"11231TB", -- [1]
			"020514S", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:25",
		["preferences"] = {
			["minHP"] = 701,
			["minXP"] = 15,
		},
		["groupID"] = "group:none",
		["targets"] = {
			175781, -- [1]
		},
	},
	["team:171"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Wonderpray\nStraight forward pet battle, very strong team very effective!Script made by: Calipso\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nTurn 3: Bring in Ikky\nTurn 4: Black Claw\nTurns 5-7: Flock\nTurn 8: If necessary finish off with 3rd pet or Ikky\n",
		["name"] = "Right Twice a Day",
		["tags"] = {
			"021316M", -- [1]
			"01181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:171",
		["targets"] = {
			202452, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:53"] = {
		["pets"] = {
			"BattlePet-0-000012C4A5C4", -- [1]
			"BattlePet-0-000012B99CE5", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Berendain\nTurn 1+: Flurry until Socks enters undead round\nTurn 2: Drain Blood\nMonte comes in\nTurn 1: Flurry\nTurns 2-3: Lift-Off\nTurn 4: Drain Blood\nTurn 5: Flurry until Monte dies\nRikki comes in\nTurn 1: Drain Blood, Lift-Off, and Flurry until Parasitic Boarfly dies\nBring in your Crimson Bat Pup\n(If Monte is still active when you bring in Crimson Bat Pup, Bite until Monte dies)\nTurn 1: Call Darkness\nTurn 2: Nocturnal Strike\nTurn 3: Bite until Rikki dies\n",
		["name"] = "Sully \"The Pickle\" McLeary",
		["tags"] = {
			"21172AC", -- [1]
			"21182G7", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:53",
		["targets"] = {
			71929, -- [1]
		},
		["groupID"] = "group:3",
	},
	["team:164"] = {
		["pets"] = {
			"BattlePet-0-000011F1418A", -- [1]
			"BattlePet-0-000012B5CB71", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by nogulpfrog\nAverage time ：57S\n\nTurn 1: Great Sting\nTurn 2: Swap to your Kunchong Hatchling\nTurn 3: Pheromones\nTurn 4: Swap to your Level Pet\nTurn 5: Swap to your Gorm Harrier\nTurn 6: Great Sting\nTurn 7: Enrage\nTurn 8: Impale, finish.\n",
		["name"] = "Snail Fight!",
		["tags"] = {
			"22142R9", -- [1]
			"01042CM", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:164",
		["targets"] = {
			104553, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:257"] = {
		["pets"] = {
			"BattlePet-0-00000D450504", -- [1]
			"BattlePet-0-00001234372A", -- [2]
			"BattlePet-0-000012B528FE", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).In all my testing I've only seen Fethres using Feign Death once, so please excuse me for completely ignoring the RNG that would add to the fights.\n\nTurn 1: Feathered Frenzy\nTurn 2: Gift of Winter's Veil\nTurns 3+: Pounce (until dead, meanwhile Fethres dies and Beeks comes in)\nBring in your Gizmo\nTurn 1: Prowl\nTurn 2: Arcane Dash (Beeks dies, Talons comes in)\nSwap to your Xu-Fu, Cub of Xuen\nTurn 1: Prowl\nTurn 2: Moonfire\n",
		["name"] = "Are They Not Beautiful? (Beast)",
		["tags"] = {
			"11252HU", -- [1]
			"1118316", -- [2]
			"122417I", -- [3]
		},
		["teamID"] = "team:257",
		["groupID"] = "group:none",
	},
	["team:152"] = {
		["pets"] = {
			"BattlePet-0-000012B3E786", -- [1]
			"BattlePet-0-000012B6AE80", -- [2]
			"BattlePet-0-000012B6C84B", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6035\n\nStrategy added by Shenk\nTurn 1: Black Claw\nTurn 2-4: Swarm\n",
		["name"] = "Tommy the Cruel",
		["tags"] = {
			"122B2IO", -- [1]
			"12182PI", -- [2]
			"11182PI", -- [3]
		},
		["teamID"] = "team:152",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:8",
		["targets"] = {
			150918, -- [1]
		},
	},
	["team:233"] = {
		["pets"] = {
			"BattlePet-0-0000080DA4CD", -- [1]
			"BattlePet-0-000012B482D1", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10424\n\nStrategy added by norng\n5 rounds.\n\nTurn 1: Nut Barrage\nTurn 2: Woodchipper - Nuts dies\nBring in your Zandalari Kneebiter\nTurn 1: Black Claw\nTurns 2-3: Hunting Party - Zao, Calfling of Niuzao dies\n",
		["name"] = "Zao, Calfling of Niuzao (2)",
		["tags"] = {
			"2018A3", -- [1]
			"220514S", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:233",
		["groupID"] = "group:1",
		["preferences"] = {
			["minXP"] = 1,
		},
	},
	["team:103"] = {
		["pets"] = {
			"BattlePet-0-000012B146CA", -- [1]
			"BattlePet-0-000012B146D0", -- [2]
			"BattlePet-0-000012B484E9", -- [3]
		},
		["notes"] = "Strategy added by Haervael#2816\nI was struggling to win this fight so I tried to mix up some strategies and I came up with this one which has never failed so far.Hope this helps some of you.\n\nYour Lil' Bling comes in\nTurn 1: Make it Rain\nTurn 2: Extra Plating\nTurns 3-5: Inflation\nBoneclaw dies\nSpindler comes in\nTurn 6: Make it Rain or Lil' Bling is dead already.\n\nBring in your Iron Starlette\nTurn 7: Wind-Up\nTurn 8: Supercharge\nTurn 9: Wind-Up\nSpindler dies\nRocko comes in\nTurn 10: Wind-Up\nTurn 11: Wind-Up\nTurn 12: Toxic Smoke\nIron Starlette dies\n\nBring in your Unborn Val'kyr\nTurn 13: Curse of Doom\nTurn 14~19: Shadow Slash until Rocko dies.\n",
		["name"] = "Eyegor's Special Friends",
		["tags"] = {
			"2215198", -- [1]
			"12181BB", -- [2]
			"120616M", -- [3]
		},
		["teamID"] = "team:103",
		["targets"] = {
			173324, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:213"] = {
		["pets"] = {
			"BattlePet-0-000012B6763C", -- [1]
			"random:8", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2048\n\nStrategy added by DragonsAfterDark\nScript thanks to Prudentius\n\nTurn 1: Deflection\nTurn 2-4: Rampage\nTurn 5+: Triple Snap until Beets dies\nRawly comes in\nTurn 1: Pass if you're slower than Rawly, Triple Snap if you're faster\nTurn 2: Deflection\nTurn 3: Triple Snap\nTurn 4+5: Rampage\nStinger comes in\nTurn 1: Rampage continues\nTurn 2+: Triple Snap until dead\nBring in your Beast pet\nAny standard Beast attack will finish the fight\n",
		["name"] = "Desert Survivors",
		["tags"] = {
			"2227G2", -- [1]
			"ZR8", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:213",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			142054, -- [1]
		},
	},
	["team:93"] = {
		["pets"] = {
			"BattlePet-0-000012B118A8", -- [1]
			"BattlePet-0-000012B4874E", -- [2]
			"BattlePet-0-000012B673F3", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nIf you're eager to save 1 round, you could start with Soulrush directly. This way you can use any Soulrush pet with >300 Power with the risk that your pet is put to sleep and you'll have to Pass & Soulrush again. But when the Sleep happens, you could also restart the fight without healing, your Soulrush pet has only one job...trigger the forced pet swap with one big hit.(Script and steps will include Ethereal of a Sentinel's Companion to avoid the Sleep, but the script should react properly if you manually used Soulrush first round)(10-11 rounds)*** Created on Beta, so maybe not final  ***\n\nTurn 1: Ethereal\nTurn 2: Soulrush\nTurn 3: If Soulrush stunned the enemy, swap your Dragonkin, otherwise Pass (forced pet swap)\nTurn 4: Arcane Storm\nTurn 5-7: Mana Surge (at least one enemy pet will die, maybe two)\n(Turn 8): (Arcane Storm / Soulrush to kill the second pet if needed)\nBring in your Mech\nTurn 1: Supercharge\nTurn 1: Ion Cannon\n",
		["name"] = "Thenia's Loyal Companions",
		["tags"] = {
			"02281GV", -- [1]
			"022414D", -- [2]
			"02272KT", -- [3]
		},
		["teamID"] = "team:93",
		["targets"] = {
			173129, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:18"] = {
		["pets"] = {
			"BattlePet-0-000012B146CB", -- [1]
			"BattlePet-0-000006E4C7A1", -- [2]
			"BattlePet-0-000006E4C788", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7179\n\nStrategy added by Shenk\nTurn 1: Black Claw\nTurn 2-4: Flock\n",
		["name"] = "Tempton",
		["tags"] = {
			"21181FS", -- [1]
			"2117A0", -- [2]
			"111C6B", -- [3]
		},
		["teamID"] = "team:18",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:5",
		["targets"] = {
			161663, -- [1]
		},
	},
	["team:264"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"BattlePet-0-000012B15603", -- [2]
			"BattlePet-0-000012B673F3", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).I recommend using the P/S Iron Starlette because it only needs 1x Powerball to be faster than the enemy pets, usually lands 2x Wind-Up hits on Brul'dan and therefore adds more control.\n\nWith your Iron Starlette stick to these priorities until dead:\nvs. Lifft\nPrio 1:: When your pet is slower than the actual enemy pet -> Powerball\nPrio 2:: Wind-Up is active, Dive is not usable this and the next turn -> Supercharge\nPrio 3:: Wind-Up is active, Lifft is Underwater -> Powerball\nPrio 4:: Wind-Up\nvs. Brul'dan\nPrio 1:: When your pet is slower than the actual enemy pet -> Powerball\nPrio 2:: Wind-Up is active -> Wind-Up\nPrio 3:: Your pet's Failsafe has been triggered, Drain Power not usable -> Powerball \nPrio 4:: Wind-Up\n\nBring in your Timeless Mechanical Dragonling and stick to these priorities:\nPrio 1:: Enemy is Swole, Decoy exists -> Swap to your Microbot XD\nPrio 2:: Enemy is Swole, you've taken the Headbutt -> Swap to your Microbot XD\nPrio 3:: Enemy is Brul'dan with <1097HP -> Time Bomb\nPrio 4:: Enemy is Brul'dan with <549HP, no Flame Breath DoT active -> Decoy\nPrio 5:: Enemy is Brul'dan -> Flame Breath\nPrio 6:: Enemy is Swole -> Pass turn or Flame Breath\n\nWith your Microbot XD stick to these priorities:\nPrio 1:: Brul'dan is still alive or Swole has >1726HP -> Alert!\nPrio 2:: Supercharge\nPrio 3:: Ion Cannon\n",
		["name"] = "Do You Even Train? (Mech)",
		["tags"] = {
			"11181BB", -- [1]
			"121430S", -- [2]
			"12272KT", -- [3]
		},
		["teamID"] = "team:264",
		["groupID"] = "group:none",
	},
	["team:48"] = {
		["pets"] = {
			"BattlePet-0-000012B99CF8", -- [1]
			"BattlePet-0-0000083A0A6A", -- [2]
			"BattlePet-0-000006E4C7A0", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nPet 1: Any Pet with Explode and 1575 hp or morePet 2: Any Pet with Explode and 1575 hp or morePet 3: Any Pet with Pump and 272 power or more[url=https://youtu.be/-NFCK-QT1V0]Video for Fight[/url]\n\nTurn 1: Explode\nBring in Explode Pet 2\nTurn 2: Explode\nBring in Pump Pet\nTurn 3: Pump loads\nTurn 4: Pump lands\n",
		["name"] = "Eye of the Stormling",
		["tags"] = {
			"00292L", -- [1]
			"00261G1", -- [2]
			"002CQF", -- [3]
		},
		["teamID"] = "team:48",
		["targets"] = {
			197447, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:62"] = {
		["pets"] = {
			"BattlePet-0-000012B146CB", -- [1]
			"BattlePet-0-000012B48707", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5567\n\nStrategy added by Lazey\n*** 9.0.2 approved '''\n\nThis Manta Ray has two Beast attacks and an empowered Flyby X which will increase the damage your pet takes by 25% for 5 rounds (classic Flyby does for 3 rounds).\n\nI am using a Black Claw + Swarm ability pet in the first slot to buff attacks of my Dragonkin. The script includes Flock and Swarm because when these 8.2 pet battles go live, the Aquatic pet Chitterspine Skitterling will be available as a wild catch in Nazjatar and it has Black Claw and Swarm. Please do not use Hunting Party pets.\n\nThe Skitterling will take more damage from Flyby X so there's a chance it will die 1 round earlier than Flying pets and you can benefit of 2 rounds Shattered Defenses and Black Claw.\n\nTurn 1: Black Claw\nTurn 2+: Flock / Swarm until your pet dies. (When it does without applying Shattered Defenses, please Forfeit, Revive pets & Restart.)\n\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm\nTurn 2-3: Mana Surge\nWhen your Dragon dies without killing Silence, bring in your third pet\nAny standard attack will finish the fight\n",
		["name"] = "Silence",
		["tags"] = {
			"01181FS", -- [1]
			"022814D", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:62",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			154912, -- [1]
		},
	},
	["team:245"] = {
		["pets"] = {
			"BattlePet-0-000012B90213", -- [1]
			"BattlePet-0-000012B6AE3C", -- [2]
			"BattlePet-0-000012B01E72", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nThe 1325 health restriction will get you through a Mudslide & Alpha Strike attack, but not if any of it crits.Update: Added instructions in case your Voidskimmer will survive Murrey's Bite, which will throw off Quack-E's turns.\n\nTurn 1: Sewage Eruption\nTurn 2: Moonfire if you don't survive to apply this, restart\nTurn 3: Pass\nBring in your Voidskimmer\nTurn 1: Feedback if Bassalt is still alive\nClawz comes in\nTurn 1: Pump\nTurn 2: Feedback\nTurn 3: Pump\n~: If your Voidskimmer does not survive Clawz or to eat the Superbark from Murrey, restart\nMurrey comes in\nTurn 1: Feedback\nTurn 2: Void Tremors\nTurn 3: Pass if you have < 353 hp OR Swap to your Quack-E if you have > 352 hp\nBring in your Quack-E\nTurn 1: Wind-Up\nTurn 2: Wind-Up -- This should hit when Tough n' Cuddly has dropped off. If it still has 1 round then Overcharge > Wind-Up\n~: If Murrey's hp is < 116 Overcharge, otherwise:\nTurn 4: Wind-Up\nTurn 5: Wind-Up - you win with 1 hp because lol Superbark\n",
		["name"] = "To a Land Down Under (Aquatic)",
		["tags"] = {
			"021C2MD", -- [1]
			"21182PH", -- [2]
			"201337A", -- [3]
		},
		["teamID"] = "team:245",
		["groupID"] = "group:none",
	},
	["team:147"] = {
		["pets"] = {
			"BattlePet-0-000012B607A4", -- [1]
			"BattlePet-0-000012B482D2", -- [2]
			"BattlePet-0-000012BA9540", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6566\n\nStrategy added by DavidG\nTurn 1: Exposed Wounds\nTurn 2: Black Claw\nTurn 3-4: Hunting Party\nTurn 5: By the time Hunting party finishes he'll be in his undead round, so just do whatever and let him die\n",
		["name"] = "Huncher",
		["tags"] = {
			"222A15S", -- [1]
			"212A15R", -- [2]
			"11191H3", -- [3]
		},
		["teamID"] = "team:147",
		["preferences"] = {
			["minHP"] = 1303,
			["minXP"] = 25,
		},
		["groupID"] = "group:8",
		["targets"] = {
			150917, -- [1]
		},
	},
	["team:190"] = {
		["pets"] = {
			"BattlePet-0-000006E4C768", -- [1]
			"BattlePet-0-00000D5451F8", -- [2]
			0, -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/17410\n\nStrategy added by WhyDaRumGone\nSinging Sunflower can only survive 1 crit.\nMOD: Have modified the script to account for losing Sunflower early. It will potentially save a normal run but you will need to the select the following abilities if you want it to work:\n* On Baa'l; select Darkflame, Scorched Earth\n* On Baa'lial; select Trample\n* On Death Seeker; select Eyeblast, Eye Beam\n\nAlternative pets #1 pets:\n* Golden Chirper S/S - This is a few seconds slower due to animations.\n* Soul of the Aspects (untested) - This is a the best (theoretical) for this strat BUT is a shop pet.\n\nTurn 1: Sunlight\nTurn 2: Swap to your Baa'l\nTurn 3: Murder the Innocent\nTurn 4: Swap to your Level Pet\nTurn 5: Swap to your Singing Sunflower/Soul of the Aspects/Golden Chirper\nNote:: If your Singing Sunflower dies after the swap see below alternative steps.\nTurn 6: Solar Beam or Skitter if using S/S Golden Chirper\nTurn 7: This turn will be skipped, or use Skitter if using S/S Golden Chirper\nBring in your Baa'l\nTurn 8: Murder the Innocent\n\n\nAlternative steps if #1 pet died round 5. (If you got double crit)\n----------------------------------\nBring in your Baa'l / Death Seeker\nTurn 6: Darkflame / Eyeblast\nTurn 7: Murder the Innocent\nTurn 8: Scorched Earth / Eye Beam",
		["name"] = "Swog the Elder",
		["tags"] = {
			"202C93", -- [1]
			"020329G", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:190",
		["preferences"] = {
			["minXP"] = 1,
		},
		["groupID"] = "group:none",
		["targets"] = {
			189376, -- [1]
		},
	},
	["team:9"] = {
		["pets"] = {
			"BattlePet-0-000012B4C1CA", -- [1]
			"BattlePet-0-000012B3E06C", -- [2]
			"BattlePet-0-000008968258", -- [3]
		},
		["notes"] = "Strategy added by Skattyman#21150\nTurn 1: Sunlight, enemy forces you to swap every turn with Pandaren Fire Spirit until dead\nTurn 2: Immolate\nTurn 3: Inspiring Song\nTurn 4: Conflagrate\nTurn 5: Weakening Blow\nTurn 6: Burn\nTurn 7: Sunlight\nTurn 8: Inspiring Song\nTurn 9-11: Weakening Blow until Terrible Turnip dies\nTurn 12: Pandaren Fire Spirit comes in, Immolate\nTurn 13: Conflagrate, Pandaren Fire Spirit dies\nTurn 14: Anubisath Idol comes in, Sandstorm\nTurn 15: Rupture\nTurn 16-20: Crush to victory\n",
		["name"] = "Environeer Bert",
		["tags"] = {
			"1218KA", -- [1]
			"122516D", -- [2]
			"1126143", -- [3]
		},
		["teamID"] = "team:9",
		["targets"] = {
			124617, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:104"] = {
		["pets"] = {
			"BattlePet-0-000006E4C775", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nI got inspired by Slayer [url=https://www.wow-petguide.com/?Strategy=12215]strategy[/url].Time: ~1:30 (11-12 rounds)Updated TD Script (5.04.2021). Strategy works also in rare critical cases now\n\nTurn 1: Ice Tomb\nTurn 2: Call Blizzard\nTurn 3: Ice Lance\nTurn 4: Ice Lance (Egcellent comes in)\nTurn 5: Ice Lance\nTurn 6: Call Blizzard\nTurn 7: Ice Tomb (Red Wire comes in)\nTurn 8: Ice Lance (Father Winter's Helper dies)\nBring in your Mechanical Pandaren Dragonling\nTurn 9: Breath\nTurn 10: Thunderbolt (Gulp comes in)\nTurn 11: Breath (if Gulp is alredy dead(crits) then Egcellent comes in --> Explode)\nEgcellent comes in\nTurn 12: Explode\n",
		["name"] = "Tiny Poacher, Tiny Animals",
		["tags"] = {
			"21133N", -- [1]
			"1215QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:104",
		["targets"] = {
			99150, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:136"] = {
		["pets"] = {
			"BattlePet-0-000012C47B1C", -- [1]
			"BattlePet-0-000012B5CB5D", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Rosqo\n~11 rounds (1:31mins)Follow the steps around when to use Call Darkness carefully as for the levelling pet to get XP this must be on the Cursed Birmans Immortal round.Your Pyreclaw can sometimes crit/get missed so you may need to pass to ensure that it doesn't mess up the end of the fight.Only the P/B breed will consistently winAt the end of the fight Scorched Earth ticks can crit twice and cause the last pet to heal which is super unlucky.\n\nTurn 1: Prowl\nTurn 2: Call Darkness\nSwap to Infernal Pyreclaw\nTurn 1: Shell Armor\nTurn 2: Scorched Earth\nTurn 3+: Flame Breath (If the Pyreclaw has above 500HP when Quillino 460 or less HP pass)\nQuillino dies, Fethyr comes in\nPrio: Pass until Infernal Pyreclaw dies when Fethry is active\nBring in Cursed Birman\nTurn 1: Prowl\nCheck: If Undead racial not active at the start of the turn Pass\nCheck: Call Darkness if Undead racial active (you need to be on the immortal round at the start of the turn you attack for levelling pet to get all XP)\n\n",
		["name"] = "Training with Bredda",
		["tags"] = {
			"01281FH", -- [1]
			"222A219", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:136",
		["targets"] = {
			99077, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:246"] = {
		["pets"] = {
			"BattlePet-0-00000D5451F8", -- [1]
			"BattlePet-0-0000129D3A43", -- [2]
			"BattlePet-0-00000A3564FB", -- [3]
		},
		["notes"] = "Strategy added by glowcloud\nSucceeds more often than it fails, but really I just wanted to let Baa'l and Baa'lial hangout <3\n\n**: If at any time your 1 ability will kill the enemy, just use that.\n\nTurn 1: Murder the Innocent\nTurn 2: Nether Gate\nTurn 3: Darkflame\n\n~~: Swap to your Baa'lial\nTurn 1: Hatred Manifest\nTurns 2-4: Stampede\nBeeks should die and Fethres come in\nTurn 5: Stampede\n\nBring in your Zur'aj the Depleted\nIf Fethres and/or Beeks still alive, Spiritfire Bolt\nTurn 1: Spectral Spine\nTurn 2+: Spiritfire Bolt\n\n~~: If Talons lives, bring in Baa'l\nTurn 1: Murder the Innocent\n",
		["name"] = "Are They Not Beautiful? (Magic)",
		["tags"] = {
			"221329G", -- [1]
			"01173FS", -- [2]
			"20292FM", -- [3]
		},
		["teamID"] = "team:246",
		["groupID"] = "group:none",
	},
	["team:49"] = {
		["pets"] = {
			"BattlePet-0-000012B99B2D", -- [1]
			"BattlePet-0-000012B99B2C", -- [2]
			"BattlePet-0-000012B99B2E", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nTime: ~2:10 (~23 rounds)Tested and verified 20 April 2022\n\nTurn 1: Glowing Toxin\nTurn 2: Amber Prison\nTurn 3: Glowing Toxin\nTurn 4: Swap to your Snort\nTurn 5: Bash\nTurn 6: Trample\nTurn 7: Crouch\nTurn 8-10: Trample (3 times)\nTurn 11: Bash\nTurn 12: Swap to your Amberglow Stinger\nTurn 13: Glowing Toxin\nTurn 14: Amber Prison\nTurn 15: Swap to your Snort\nTurn 16: Trample --> Crushface dies\nTurn 17: Trample --> Fozling dies\nTurn 18: Bash\nTurn 19+: Trample until Snort dies\nBring in your Twilight Clutch-Sister\nTurn 1: Phase Shift (if Tremors health < 800 you can skip this turn)\nTurn 2: Tail Sweep\nTurn 3: Twilight Meteorite\n(in case Twilight Clutch-Sister dies bring in Amberglow Stinger --> Predatory Strike --> Tremor dies)\n",
		["name"] = "Zuna Skullcrush",
		["tags"] = {
			"21262GQ", -- [1]
			"12262CR", -- [2]
			"112B211", -- [3]
		},
		["teamID"] = "team:49",
		["targets"] = {
			160208, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:177"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B482D2", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by station384\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: BONESTORM\nTurn 4: Repeat till Boneshard dead\nTurn 5: Primal Cry\nTurn 6: Black Claw\nTurn 7: Hunting Party\nTurn 8: Repeat 5-7 till target dead\n",
		["name"] = "Tremblor - Rare",
		["tags"] = {
			"11231TB", -- [1]
			"222A15R", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:177",
		["targets"] = {
			200693, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:33"] = {
		["pets"] = {
			"BattlePet-0-000012B5C2FF", -- [1]
			"BattlePet-0-000012B5C356", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2255\n\nStrategy added by Eekwibble\nI changed this from having a carry pet because the xp is so lame since the nerf. The upside is, it now only lasts 13 rounds.\n\nTurn 1: Ironskin\nTurns 2&3: Falcosaur Swarm!\nTurn 4: Predatory Strike - Fungus dies\nMort comes in\nTurn 1: Pass\nTurn 2: Ironskin\nTurns 3&4: Falcosaur Swarm!\nTurn 5: Predatory Strike - Mort dies\nOld Blue comes in\nTurn 1+: Falcosaur Swarm! until Direbeak Hatchling dies\nBring in your Snowfeather Hatchling\nThen:: Predatory Strike - Old Blue dies\n",
		["name"] = "That's a Big Carcass",
		["tags"] = {
			"12171TN", -- [1]
			"00151TM", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:33",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			141292, -- [1]
		},
	},
	["team:262"] = {
		["pets"] = {
			"BattlePet-0-000012B528FE", -- [1]
			"BattlePet-0-00000D450504", -- [2]
			"BattlePet-0-00001234372A", -- [3]
		},
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).\n\n-------: XU-FU, CUB OF XUEN priorities: -------\nPrio 1:: In Round 5 swap to your Jingles (or earlier when your pet dies)\nPrio 2:: Enemy pet is not Clawz -> Prowl\nPrio 3:: Moonfire\nPrio 4:: Spirit Claws\n\n-------: JINGLES priorities: -------\nPrio 1:: Enemy is Clawz -> Booby-Trapped Presents\nPrio 2:: Huge Fang\nPrio 3:: Gift of Winter's Veil\nPrio 4:: Pass\nPrio 5:: When Jingles didn't kill Clawz, bring back your Xu-Fu, Cub of Xuen\n\n-------: GIZMO priorities: -------\nPrio 1:: When you're sure it will kill Murrey -> Arcane Dash\n(check Murrey's 50% damage reduce, Moonlight bonus damage, Beast Passive, etc.)\nPrio 2:: Prowl\nPrio 3:: Scrabble\n",
		["name"] = "To a Land Down Under (Beast)",
		["tags"] = {
			"122417I", -- [1]
			"22252HU", -- [2]
			"1118316", -- [3]
		},
		["teamID"] = "team:262",
		["groupID"] = "group:none",
	},
	["team:84"] = {
		["pets"] = {
			"BattlePet-0-000012B146CB", -- [1]
			"BattlePet-0-000012B58B24", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Redorkulated#1291\nCreated this based on a comment from Nebulae on one of the other strats here. worked really well and i couldnt see a simular strat. hope this helps someone as much as it helped me.\n\nTurn 1: Black Claw\nTurn 2-3: Flock Ikky Dies\nBring in your Darkmoon Zeppelin\nTurn 1: Thunderbolt\nTurn 2-?: Missile untill Seeker HP<610\nTurn ?: Explode when Seeker HP<610\n",
		["name"] = "Retinus the Seeker",
		["tags"] = {
			"01181FS", -- [1]
			"121CAJ", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:84",
		["targets"] = {
			162458, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:56"] = {
		["pets"] = {
			"BattlePet-0-000012B146CB", -- [1]
			"random:0", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by HotdogPotato\nTurn 1: Black Claw\nTurns 2-4: Flock\nTurn 5: Savage Talon\n",
		["name"] = "Lyver",
		["tags"] = {
			"11181FS", -- [1]
			"ZR0", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:56",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:none",
		["targets"] = {
			201858, -- [1]
		},
	},
	["team:61"] = {
		["pets"] = {
			"BattlePet-0-000012B99945", -- [1]
			"BattlePet-0-000012B5CB5D", -- [2]
			"BattlePet-0-000012B607A8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9047\n\nStrategy added by DarDar#21108\nTurn 1: Call Lightning\nTurn 2: Pass\nTurn 3: Swap to your Infernal Pyreclaw\nTurn 4: Great Sting\nTurn 5: Cleave\nTurn 6: Cleave\nTurn 7: Cleave\nTurn 8: Pass\nTurn 9: Pass\nTurn 10: Great Sting\nTurn 11: Swap to your Anomalus\nTurn 12: Poison Protocol\nTurn 13: Void Nova\nTurn 14: Corrosion\n",
		["name"] = "Taran Zhu",
		["tags"] = {
			"00242BH", -- [1]
			"011A219", -- [2]
			"22142OQ", -- [3]
		},
		["teamID"] = "team:61",
		["targets"] = {
			71931, -- [1]
		},
		["groupID"] = "group:1",
	},
	["team:16"] = {
		["pets"] = {
			"BattlePet-0-000012B146D0", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Sarahlinii\nCredit for this strategy goes to Chrosta. Please see the information below to go check out Chrosta's in-depth WoWhead post regarding all things Garrison Pet Menagerie! https://www.wowhead.com/guide=3831/garrison-pet-battles-with-12-pets-xp-petLeveling Pet: Safe for ANY Level 1+ Pet; it will take 0 damage**Please feel free to leave suggested TDScripts below as I’ve no idea how to properly create them myself. Thanks and enjoy! UPDATE: Changed TD Script from HeXoDuS' to MERMEL#1857's (found in the comments). Please let me know if there are any issues with the Script!\n\nBring in your Iron Starlette\nTurn 1: Wind-Up to charge\nTurn 2: Supercharge\nTurn 3: Wind-Up to hit and defeat Brutus\nRukus comes in\nTurn 1: Wind-Up to charge\nTurn 2: Wind-Up to hit\nTurn 3: Toxic Smoke if you're able to before your Iron Starlette is defeated\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Thunderbolt\nTurn 2: Breath IF Rukus has more than 560 HP\nTurn 3: Explode when Rukus has 560 or less HP\nYour Leveling Pet will get the XP\n\n",
		["name"] = "Brutus and Rukus",
		["tags"] = {
			"12181BB", -- [1]
			"1215QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:16",
		["targets"] = {
			85622, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:127"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"BattlePet-0-000012B5C2FF", -- [3]
		},
		["notes"] = "Strategy added by Gershuun#1131\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Ikky\nTurn 1: Black Claw\nTurn 2: Flock\nTurn 3: Flock\nTurn 4: Flock\nTurn 5: Pass\nTurn 6: Savage Talon\nTurn 7: Black Claw (Ikky dies)\nBring in your Direbeak Hatchling\nTurn 1: Falcosaur Swarm!\n",
		["name"] = "What Do You Mean, Mind Controlling Plants?",
		["tags"] = {
			"121316M", -- [1]
			"11181FS", -- [2]
			"12171TN", -- [3]
		},
		["teamID"] = "team:127",
		["targets"] = {
			141969, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:117"] = {
		["pets"] = {
			"BattlePet-0-000006E4C761", -- [1]
			"BattlePet-0-00001299F70E", -- [2]
			"BattlePet-0-000006E4C757", -- [3]
		},
		["notes"] = "Strategy added by Krafty\nCreated this so I won't have to watch Blistering Cold tick down.every.round.and.damage.proc.Oracle Hatchling can sometimes solo this fight if the backline pets are weak and slower. Bring pets to defeat machines, leper rats and cockroaches.Script only includes Oracle Hatchlings priority\n\nTurn 1: Backflip\nTurn 2: Water Jet\nTurn 3: Aged Yolk\nTurn 4+: Backflip on cooldown (unless you face Cockroach or are slower, and at round 2 or 3 against Gnomish Rocket Chicken)\nAged Yolk if Blistering Cold is applied\nWater Jet as filler\n",
		["name"] = "Living Permafrost",
		["tags"] = {
			"221371", -- [1]
			"11183DN", -- [2]
			"11161LA", -- [3]
		},
		["teamID"] = "team:117",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:6",
		["targets"] = {
			146181, -- [1]
		},
	},
	["team:148"] = {
		["pets"] = {
			"BattlePet-0-000012B48958", -- [1]
			"random:6", -- [2]
			"BattlePet-0-000012BA955E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4596\n\nStrategy added by DragonsAfterDark\nTurn 1: Supercharge\nTurn 2: Haywire\nAn enemy pet comes in\nTurn 1: Haywire continues\n\nAfter Turn 1 against Enemy #2:\nBeasts:: Supercharge & Haywire on CD, Laser as filler\nFlying:: Supercharge on CD & Laser \nAquatic:: Supercharge & Haywire on CD, Laser as filler\n\nFlying enemies were the only ones I needed a second pet for, so having a pet with magic abilities on hand is best. Dragonkin with Magic abilities are better.\n",
		["name"] = "Deviate Smallclaw",
		["tags"] = {
			"122414Q", -- [1]
			"ZR6", -- [2]
			"111B1H9", -- [3]
		},
		["teamID"] = "team:148",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:7",
		["targets"] = {
			116786, -- [1]
		},
	},
	["team:221"] = {
		["pets"] = {
			"BattlePet-0-000011F7F5D4", -- [1]
			"BattlePet-0-000008968258", -- [2]
			"BattlePet-0-000012C22319", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/204\n\nScript by DaR#1285\n\nTurn 1: Scratch\nTurn 2: Scratch\nTurn 3: Dodge\nTurns 4-6: Stampede\nTurns 7+: Scratch until Cindy is dead\nAlex comes in\nCheck the Ice Tomb debuff\nEither:: 2 Turns left: Scratch, Dodge\nOr:: 1 Turn left => Dodge\nThen:: Stampede until your Rabbit is dead\nBring in your Anubisath Idol\nTurn 1: Crush\nTurn 2: Crush\nIs Alex dead?\nYes:: Skip down to Dah'da\nNo:: Use Stoneskin and then Crush until Alex is dead\n\nDah'da comes in\nTurn 1: Crush\nTurn 2: Crush\nTurn 3: Deflection\nTurns 4+: Continue to use Crush until either Dah'da or Anubisath Idol is dead\n\nIf Anubisath Idol has died, bring in your Macabre Marionette\nTurns 1-3: Dead Man's Party\nTurns 2+: Macabre Maraca until Dah'da is dead\n",
		["name"] = "Wrathion",
		["tags"] = {
			"122BBQ", -- [1]
			"1216143", -- [2]
			"12171A7", -- [3]
		},
		["teamID"] = "team:221",
		["targets"] = {
			71924, -- [1]
		},
		["groupID"] = "group:1",
	},
	["team:261"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"BattlePet-0-000012C2D394", -- [2]
			"BattlePet-0-000012B146CB", -- [3]
		},
		["name"] = "Catch team",
		["tags"] = {
			"22142OQ", -- [1]
			"222B1T1", -- [2]
			"21181FS", -- [3]
		},
		["teamID"] = "team:261",
		["homeID"] = "group:9",
		["favorite"] = true,
		["groupID"] = "group:favorites",
	},
	["team:109"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B01E39", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Cenobite\n11-12 TurnsI've been using the snail/grub strat for forever and thought, why don't I try to optimize this 20+ turn strat and make it faster.Sister of Temptation New Meta\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Sister of Temptation\nTurn 3: Lovestruck <<< This will prevent SHIELDSTORM >>>\nTurn 4: SHADOW SHOCK\nTurn 5: Shadow Shock --- Murkalot Dies ---\nTurn 6: Shadow Shock --- Deathy Dies ---\nTurn 7: Curse of Doom\nTurn 8: Bring in your Leveling Pet\nTurn 9: Bring in whichever of Unborn or Sister with highest hp\nTurn 10-11(12): Shadow Shock to finish ++++ Usually takes 2 hits. If you die to the leap just switch to the other pet and do the last hit.\n11 turns if you survive the leap, otherwise 12. My breeds are B/B Valk and P/B Sister. But I don't think it will mather whichever one you got.\n",
		["name"] = "Tarr the Terrible",
		["tags"] = {
			"221616M", -- [1]
			"111C1IS", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:109",
		["targets"] = {
			87110, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:81"] = {
		["pets"] = {
			"BattlePet-0-000012B528FE", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			"BattlePet-0-000012B96E89", -- [3]
		},
		["notes"] = "Strategy added by AgentRock#1964\nScript thanks to FMJustice\n\nTurn 1: Moonfire\nTurn 2: Prowl\nTurn 3 -4: Spirit Claws until Lifft is dead\nTurn 5-7: Brul'dan comes in.  Spirit Claws until Xu-Fu, Cub of Xuen is dead.\nBring in Mechanical Pandaren Dragonling\nTurn 8-9: Breath until Brul'dan is dead.\nTurn 10: Swole comes in.  Decoy\nTurn 11-15: Breath until Mechanical Pandaren Dragonling is dead.\nBring is Flayer Youngling\nTurn 16: Triple Snap until Swole uses Dive.  Note, if Swole is already underground when Flayer Youngling comes in, then skip to next step.\nTurn 17: Deflection\nTurn 18+: Rampage until Swole is dead.\n",
		["name"] = "Do You Even Train?",
		["tags"] = {
			"122417I", -- [1]
			"1025QC", -- [2]
			"2225G2", -- [3]
		},
		["teamID"] = "team:81",
		["targets"] = {
			204934, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:256"] = {
		["pets"] = {
			"BattlePet-0-000006E4C767", -- [1]
			"BattlePet-0-000006E4C753", -- [2]
			"BattlePet-0-000012B146D0", -- [3]
		},
		["notes"] = "Strategy added by Rockmar#1116\nTurn 1: Call Blizzard\nTurn 2: Bash\nTurn 3: Bite\nClawz comes in\nTurn 1: Bite\nTurn 2: Call Blizzard\nTurn 3: Swap to your Baby Winston\nTurn 4: Barrier Projector\nTurn 5: Logic\nBassalt comes in\nTurn 6: Body Slam\nTurn 7: Logic\nTurn 8: Body Slam\nMurrey comes in\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up\nTurn 5: Wind-Up\n",
		["name"] = "To a Land Down Under (2)",
		["tags"] = {
			"11276A", -- [1]
			"22171P4", -- [2]
			"11181BB", -- [3]
		},
		["teamID"] = "team:256",
		["groupID"] = "group:none",
	},
	["team:271"] = {
		["pets"] = {
			"BattlePet-0-000012B6764A", -- [1]
			0, -- [2]
			87, -- [3]
		},
		["notes"] = "Strategy added by Berendain\n9.0.2 Update:  Adjusted TD script to account for the questionable buffs to weather abilities, including Sunlight, Moonfire, and Cleansing Rain, which are all present in this fight.  The fight is slightly less reliable now because Dignity heals for more with Cleansing Rain, but that will only matter if you get incredibly unlucky and don't crit during Hawk Eye.This strategy allows you to level any level one pet.  It doesn't need to have a certain amount of health, it won't take damage at all.  The leveling pet must be in the second slot for this to work.I recommend the Sprite Darter Hatchling if you have one, due to its higher health.  You can use an S/S Nether Faerie Dragon, but you'll risk having to restart if Beauty and Conviction land too many crits for your Faerie Dragon to survive the third turn against Conviction.  \n\nTurn 1: Decoy\nTurn 2: Swap to your Sprite Darter Hatchling\nTurn 3: Life Exchange\nTurn 4: Moonfire\nTurns 5-7: Arcane Blast until Beauty dies\nConviction comes in\nTurn 1: Pass\nTurn 2: Life Exchange\nTurn 3: Moonfire\nTurn 4: Arcane Blast\nTurn 4: Swap to your Level Pet  -  Conviction uses Dark Rebirth\nTurn 5: Swap to your Sprite Darter Hatchling  -  it dies\nBring in your Mechanical Axebeak\nTurn 1: Decoy\nTurn 2: Hawk Eye\nTurn 3: Alpha Strike  -  Conviction dies\nDignity comes in\nTurn 1: Alpha Strike until Dignity dies\n",
		["name"] = "The Master of Pets",
		["tags"] = {
			"11101BR", -- [1]
			"ZL", -- [2]
			"22102N", -- [3]
		},
		["teamID"] = "team:271",
		["groupID"] = "group:none",
		["targets"] = {
			105250, -- [1]
		},
	},
}
Rematch5SavedGroups = {
	["group:2"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "cerlestial week 2",
		["groupID"] = "group:2",
		["icon"] = 132123,
		["teams"] = {
			"team:69", -- [1]
			"team:208", -- [2]
			"team:66", -- [3]
		},
	},
	["group:9"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "Catchers",
		["groupID"] = "group:9",
		["icon"] = 132149,
		["teams"] = {
			"team:241", -- [1]
		},
	},
	["group:4"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "deadmines",
		["groupID"] = "group:4",
		["icon"] = 132796,
		["teams"] = {
			"team:192", -- [1]
			"team:161", -- [2]
			"team:176", -- [3]
			"team:207", -- [4]
			"team:194", -- [5]
			"team:205", -- [6]
			"team:174", -- [7]
			"team:195", -- [8]
			"team:216", -- [9]
		},
	},
	["group:3"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "Celestial week 3",
		["groupID"] = "group:3",
		["icon"] = 645203,
		["teams"] = {
			"team:225", -- [1]
			"team:77", -- [2]
			"team:40", -- [3]
			"team:53", -- [4]
			"team:160", -- [5]
			"team:162", -- [6]
			"team:100", -- [7]
		},
	},
	["group:6"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "Gnomera",
		["groupID"] = "group:6",
		["icon"] = 4548874,
		["teams"] = {
			"team:179", -- [1]
			"team:191", -- [2]
			"team:65", -- [3]
			"team:72", -- [4]
			"team:189", -- [5]
			"team:175", -- [6]
			"team:149", -- [7]
			"team:58", -- [8]
			"team:123", -- [9]
			"team:117", -- [10]
			"team:120", -- [11]
			"team:41", -- [12]
			"team:163", -- [13]
			"team:113", -- [14]
		},
	},
	["group:none"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["name"] = "Ungrouped Teams",
		["teams"] = {
			"team:1", -- [1]
			"team:215", -- [2]
			"team:158", -- [3]
			"team:2", -- [4]
			"team:38", -- [5]
			"team:74", -- [6]
			"team:212", -- [7]
			"team:88", -- [8]
			"team:86", -- [9]
			"team:224", -- [10]
			"team:257", -- [11]
			"team:263", -- [12]
			"team:47", -- [13]
			"team:247", -- [14]
			"team:265", -- [15]
			"team:228", -- [16]
			"team:244", -- [17]
			"team:246", -- [18]
			"team:230", -- [19]
			"team:240", -- [20]
			"team:236", -- [21]
			"team:51", -- [22]
			"team:232", -- [23]
			"team:222", -- [24]
			"team:154", -- [25]
			"team:116", -- [26]
			"team:12", -- [27]
			"team:16", -- [28]
			"team:134", -- [29]
			"team:50", -- [30]
			"team:75", -- [31]
			"team:17", -- [32]
			"team:59", -- [33]
			"team:217", -- [34]
			"team:183", -- [35]
			"team:98", -- [36]
			"team:185", -- [37]
			"team:132", -- [38]
			"team:95", -- [39]
			"team:124", -- [40]
			"team:35", -- [41]
			"team:159", -- [42]
			"team:198", -- [43]
			"team:213", -- [44]
			"team:30", -- [45]
			"team:81", -- [46]
			"team:258", -- [47]
			"team:269", -- [48]
			"team:254", -- [49]
			"team:237", -- [50]
			"team:231", -- [51]
			"team:252", -- [52]
			"team:226", -- [53]
			"team:229", -- [54]
			"team:234", -- [55]
			"team:264", -- [56]
			"team:235", -- [57]
			"team:200", -- [58]
			"team:102", -- [59]
			"team:68", -- [60]
			"team:201", -- [61]
			"team:9", -- [62]
			"team:115", -- [63]
			"team:48", -- [64]
			"team:103", -- [65]
			"team:150", -- [66]
			"team:111", -- [67]
			"team:204", -- [68]
			"team:125", -- [69]
			"team:83", -- [70]
			"team:105", -- [71]
			"team:26", -- [72]
			"team:80", -- [73]
			"team:178", -- [74]
			"team:34", -- [75]
			"team:36", -- [76]
			"team:128", -- [77]
			"team:82", -- [78]
			"team:4", -- [79]
			"team:32", -- [80]
			"team:85", -- [81]
			"team:37", -- [82]
			"team:92", -- [83]
			"team:144", -- [84]
			"team:266", -- [85]
			"team:87", -- [86]
			"team:91", -- [87]
			"team:13", -- [88]
			"team:55", -- [89]
			"team:78", -- [90]
			"team:140", -- [91]
			"team:223", -- [92]
			"team:119", -- [93]
			"team:71", -- [94]
			"team:56", -- [95]
			"team:157", -- [96]
			"team:106", -- [97]
			"team:96", -- [98]
			"team:94", -- [99]
			"team:73", -- [100]
			"team:142", -- [101]
			"team:248", -- [102]
			"team:20", -- [103]
			"team:101", -- [104]
			"team:21", -- [105]
			"team:63", -- [106]
			"team:31", -- [107]
			"team:135", -- [108]
			"team:184", -- [109]
			"team:139", -- [110]
			"team:22", -- [111]
			"team:112", -- [112]
			"team:67", -- [113]
			"team:90", -- [114]
			"team:57", -- [115]
			"team:70", -- [116]
			"team:79", -- [117]
			"team:84", -- [118]
			"team:171", -- [119]
			"team:110", -- [120]
			"team:170", -- [121]
			"team:99", -- [122]
			"team:25", -- [123]
			"team:131", -- [124]
			"team:64", -- [125]
			"team:76", -- [126]
			"team:193", -- [127]
			"team:62", -- [128]
			"team:172", -- [129]
			"team:164", -- [130]
			"team:60", -- [131]
			"team:89", -- [132]
			"team:7", -- [133]
			"team:186", -- [134]
			"team:151", -- [135]
			"team:214", -- [136]
			"team:19", -- [137]
			"team:190", -- [138]
			"team:28", -- [139]
			"team:109", -- [140]
			"team:33", -- [141]
			"team:39", -- [142]
			"team:27", -- [143]
			"team:121", -- [144]
			"team:271", -- [145]
			"team:137", -- [146]
			"team:181", -- [147]
			"team:129", -- [148]
			"team:93", -- [149]
			"team:220", -- [150]
			"team:122", -- [151]
			"team:153", -- [152]
			"team:114", -- [153]
			"team:104", -- [154]
			"team:197", -- [155]
			"team:256", -- [156]
			"team:245", -- [157]
			"team:262", -- [158]
			"team:239", -- [159]
			"team:267", -- [160]
			"team:255", -- [161]
			"team:238", -- [162]
			"team:227", -- [163]
			"team:242", -- [164]
			"team:243", -- [165]
			"team:250", -- [166]
			"team:136", -- [167]
			"team:8", -- [168]
			"team:24", -- [169]
			"team:177", -- [170]
			"team:168", -- [171]
			"team:196", -- [172]
			"team:141", -- [173]
			"team:108", -- [174]
			"team:218", -- [175]
			"team:219", -- [176]
			"team:15", -- [177]
			"team:187", -- [178]
			"team:206", -- [179]
			"team:138", -- [180]
			"team:107", -- [181]
			"team:127", -- [182]
			"team:118", -- [183]
			"team:143", -- [184]
			"team:6", -- [185]
			"team:11", -- [186]
			"team:270", -- [187]
			"team:130", -- [188]
			"team:97", -- [189]
		},
		["meta"] = true,
		["groupID"] = "group:none",
		["icon"] = "Interface\\Icons\\PetJournalPortrait",
		["isExpanded"] = true,
	},
	["group:favorites"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["name"] = "Favorite Teams",
		["teams"] = {
			"team:261", -- [1]
			"team:199", -- [2]
		},
		["meta"] = true,
		["groupID"] = "group:favorites",
		["icon"] = "Interface\\Icons\\ACHIEVEMENT_GUILDPERK_MRPOPULARITY_RANK2",
		["isExpanded"] = true,
	},
	["group:1"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "celestial week 1",
		["groupID"] = "group:1",
		["icon"] = 1519351,
		["teams"] = {
			"team:44", -- [1]
			"team:251", -- [2]
			"team:61", -- [3]
			"team:221", -- [4]
			"team:260", -- [5]
			"team:249", -- [6]
			"team:233", -- [7]
		},
	},
	["group:10"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "pvp",
		["groupID"] = "group:10",
		["icon"] = 132485,
		["teams"] = {
			"team:253", -- [1]
			"team:259", -- [2]
		},
	},
	["group:5"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "BRD",
		["groupID"] = "group:5",
		["icon"] = 134337,
		["teams"] = {
			"team:45", -- [1]
			"team:14", -- [2]
			"team:52", -- [3]
			"team:209", -- [4]
			"team:211", -- [5]
			"team:43", -- [6]
			"team:165", -- [7]
			"team:155", -- [8]
			"team:146", -- [9]
			"team:203", -- [10]
			"team:54", -- [11]
			"team:18", -- [12]
			"team:46", -- [13]
			"team:10", -- [14]
			"team:49", -- [15]
		},
	},
	["group:8"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "Stratholme HC",
		["groupID"] = "group:8",
		["icon"] = 135983,
		["teams"] = {
			"team:188", -- [1]
			"team:126", -- [2]
			"team:42", -- [3]
			"team:147", -- [4]
			"team:173", -- [5]
			"team:3", -- [6]
			"team:5", -- [7]
			"team:202", -- [8]
			"team:180", -- [9]
			"team:152", -- [10]
			"team:133", -- [11]
		},
	},
	["group:7"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "WC HC",
		["groupID"] = "group:7",
		["icon"] = 132253,
		["teams"] = {
			"team:156", -- [1]
			"team:166", -- [2]
			"team:148", -- [3]
			"team:145", -- [4]
			"team:29", -- [5]
			"team:268", -- [6]
			"team:23", -- [7]
			"team:169", -- [8]
			"team:210", -- [9]
			"team:167", -- [10]
			"team:182", -- [11]
		},
	},
}
Rematch5SavedTargets = {
	{
		"team:1", -- [1]
	}, -- [1]
	[150922] = {
		"team:180", -- [1]
	},
	[200679] = {
		"team:151", -- [1]
	},
	[71924] = {
		"team:221", -- [1]
	},
	[175785] = {
		"team:140", -- [1]
	},
	[173267] = {
		"team:141", -- [1]
	},
	[173331] = {
		"team:137", -- [1]
	},
	[150923] = {
		"team:188", -- [1]
	},
	[200680] = {
		"team:186", -- [1]
	},
	[204792] = {
		"team:47", -- [1]
	},
	[175786] = {
		"team:37", -- [1]
	},
	[105250] = {
		"team:271", -- [1]
	},
	[116789] = {
		"team:167", -- [1]
	},
	[105840] = {
		"team:26", -- [1]
	},
	[115307] = {
		"team:88", -- [1]
	},
	[99035] = {
		"team:8", -- [1]
	},
	[150925] = {
		"team:173", -- [1]
	},
	[142096] = {
		"team:124", -- [1]
	},
	[66730] = {
		"team:87", -- [1]
	},
	[154910] = {
		"team:57", -- [1]
	},
	[141969] = {
		"team:127", -- [1]
	},
	[197336] = {
		"team:181", -- [1]
	},
	[116790] = {
		"team:182", -- [1]
	},
	[71926] = {
		"team:40", -- [1]
	},
	[141077] = {
		"team:184", -- [1]
	},
	[154911] = {
		"team:59", -- [1]
	},
	[173303] = {
		"team:51", -- [1]
	},
	[200684] = {
		"team:206", -- [1]
	},
	[141046] = {
		"team:50", -- [1]
	},
	[141588] = {
		"team:132", -- [1]
	},
	[154912] = {
		"team:62", -- [1]
	},
	[68564] = {
		"team:200", -- [1]
	},
	[116791] = {
		"team:145", -- [1]
	},
	[71927] = {
		"team:44", -- [1]
	},
	[201004] = {
		"team:197", -- [1]
	},
	[154913] = {
		"team:64", -- [1]
	},
	[150929] = {
		"team:3", -- [1]
	},
	[79179] = {
		"team:198", -- [1]
	},
	[162468] = {
		"team:114", -- [1]
	},
	[140315] = {
		"team:154", -- [1]
	},
	[201802] = {
		"team:76", -- [1]
	},
	[154914] = {
		"team:67", -- [1]
	},
	[204926] = {
		"team:199", -- [1]
	},
	[202440] = {
		"team:201", -- [1]
	},
	[119342] = {
		"team:161", -- [1]
	},
	[162469] = {
		"team:116", -- [1]
	},
	[146181] = {
		"team:117", -- [1]
	},
	[154915] = {
		"team:68", -- [1]
	},
	[201899] = {
		"team:215", -- [1]
	},
	[200688] = {
		"team:6", -- [1]
	},
	[162470] = {
		"team:119", -- [1]
	},
	[146182] = {
		"team:120", -- [1]
	},
	[141879] = {
		"team:55", -- [1]
	},
	[154916] = {
		"team:70", -- [1]
	},
	[99150] = {
		"team:104", -- [1]
	},
	[155267] = {
		"team:202", -- [1]
	},
	[141529] = {
		"team:157", -- [1]
	},
	[162471] = {
		"team:178", -- [1]
	},
	[146183] = {
		"team:123", -- [1]
	},
	[119407] = {
		"team:176", -- [1]
	},
	[72009] = {
		"team:160", -- [1]
	},
	[160209] = {
		"team:52", -- [1]
	},
	[66734] = {
		"team:111", -- [1]
	},
	[154918] = {
		"team:78", -- [1]
	},
	[141945] = {
		"team:60", -- [1]
	},
	[196069] = {
		"team:121", -- [1]
	},
	[119344] = {
		"team:194", -- [1]
	},
	[71930] = {
		"team:208", -- [1]
	},
	[160210] = {
		"team:54", -- [1]
	},
	[116788] = {
		"team:156", -- [1]
	},
	[119408] = {
		"team:192", -- [1]
	},
	[189376] = {
		"team:190", -- [1]
	},
	[160208] = {
		"team:49", -- [1]
	},
	[201858] = {
		"team:56", -- [1]
	},
	[200692] = {
		"team:24", -- [1]
	},
	[160207] = {
		"team:46", -- [1]
	},
	[162466] = {
		"team:107", -- [1]
	},
	[160206] = {
		"team:45", -- [1]
	},
	[154920] = {
		"team:82", -- [1]
	},
	[160205] = {
		"team:43", -- [1]
	},
	[142234] = {
		"team:172", -- [1]
	},
	[173376] = {
		"team:71", -- [1]
	},
	[116795] = {
		"team:29", -- [1]
	},
	[71931] = {
		"team:61", -- [1]
	},
	[161663] = {
		"team:18", -- [1]
	},
	[119409] = {
		"team:207", -- [1]
	},
	[154921] = {
		"team:85", -- [1]
	},
	[72290] = {
		"team:100", -- [1]
	},
	[141215] = {
		"team:196", -- [1]
	},
	[173377] = {
		"team:74", -- [1]
	},
	[162465] = {
		"team:102", -- [1]
	},
	[204934] = {
		"team:81", -- [1]
	},
	[104970] = {
		"team:159", -- [1]
	},
	[155145] = {
		"team:5", -- [1]
	},
	[83837] = {
		"team:35", -- [1]
	},
	[196264] = {
		"team:129", -- [1]
	},
	[173372] = {
		"team:63", -- [1]
	},
	[85622] = {
		"team:16", -- [1]
	},
	[119346] = {
		"team:216", -- [1]
	},
	[71932] = {
		"team:66", -- [1]
	},
	[161662] = {
		"team:14", -- [1]
	},
	[139987] = {
		"team:122", -- [1]
	},
	[154923] = {
		"team:89", -- [1]
	},
	[173315] = {
		"team:79", -- [1]
	},
	[116792] = {
		"team:210", -- [1]
	},
	[161649] = {
		"team:155", -- [1]
	},
	[107489] = {
		"team:125", -- [1]
	},
	[62621] = {
		"team:204", -- [1]
	},
	[145988] = {
		"team:113", -- [1]
	},
	[85685] = {
		"team:7", -- [1]
	},
	[154924] = {
		"team:92", -- [1]
	},
	[124617] = {
		"team:9", -- [1]
	},
	[154925] = {
		"team:95", -- [1]
	},
	[161650] = {
		"team:209", -- [1]
	},
	[200697] = {
		"team:36", -- [1]
	},
	[71933] = {
		"team:69", -- [1]
	},
	[162458] = {
		"team:84", -- [1]
	},
	[145968] = {
		"team:58", -- [1]
	},
	[105386] = {
		"team:170", -- [1]
	},
	[161661] = {
		"team:10", -- [1]
	},
	[200696] = {
		"team:34", -- [1]
	},
	[161651] = {
		"team:165", -- [1]
	},
	[141814] = {
		"team:158", -- [1]
	},
	[205065] = {
		"team:90", -- [1]
	},
	[87122] = {
		"team:4", -- [1]
	},
	[154926] = {
		"team:217", -- [1]
	},
	[146001] = {
		"team:163", -- [1]
	},
	[201878] = {
		"team:112", -- [1]
	},
	[155413] = {
		"team:41", -- [1]
	},
	[202452] = {
		"team:171", -- [1]
	},
	[105323] = {
		"team:183", -- [1]
	},
	[71934] = {
		"team:77", -- [1]
	},
	[72291] = {
		"team:162", -- [1]
	},
	[173274] = {
		"team:150", -- [1]
	},
	[154927] = {
		"team:218", -- [1]
	},
	[66824] = {
		"team:139", -- [1]
	},
	[150911] = {
		"team:126", -- [1]
	},
	[72285] = {
		"team:75", -- [1]
	},
	[142114] = {
		"team:2", -- [1]
	},
	[197417] = {
		"team:142", -- [1]
	},
	[87123] = {
		"team:15", -- [1]
	},
	[145971] = {
		"team:65", -- [1]
	},
	[146003] = {
		"team:175", -- [1]
	},
	[119345] = {
		"team:205", -- [1]
	},
	[68559] = {
		"team:135", -- [1]
	},
	[173129] = {
		"team:93", -- [1]
	},
	[173381] = {
		"team:86", -- [1]
	},
	[201849] = {
		"team:38", -- [1]
	},
	[146004] = {
		"team:189", -- [1]
	},
	[173257] = {
		"team:94", -- [1]
	},
	[154929] = {
		"team:108", -- [1]
	},
	[87110] = {
		"team:109", -- [1]
	},
	[99182] = {
		"team:105", -- [1]
	},
	[173130] = {
		"team:96", -- [1]
	},
	[99077] = {
		"team:136", -- [1]
	},
	[68465] = {
		"team:153", -- [1]
	},
	[87124] = {
		"team:222", -- [1]
	},
	[99210] = {
		"team:83", -- [1]
	},
	[146005] = {
		"team:191", -- [1]
	},
	[146002] = {
		"team:149", -- [1]
	},
	[141479] = {
		"team:19", -- [1]
	},
	[161656] = {
		"team:203", -- [1]
	},
	[197102] = {
		"team:168", -- [1]
	},
	[142151] = {
		"team:97", -- [1]
	},
	[202458] = {
		"team:220", -- [1]
	},
	[161657] = {
		"team:211", -- [1]
	},
	[175778] = {
		"team:12", -- [1]
	},
	[173133] = {
		"team:106", -- [1]
	},
	[140461] = {
		"team:31", -- [1]
	},
	[141002] = {
		"team:99", -- [1]
	},
	[142054] = {
		"team:213", -- [1]
	},
	[66741] = {
		"team:212", -- [1]
	},
	[87125] = {
		"team:28", -- [1]
	},
	[73626] = {
		"team:223", -- [1]
	},
	[173131] = {
		"team:98", -- [1]
	},
	[173324] = {
		"team:103", -- [1]
	},
	[85659] = {
		"team:39", -- [1]
	},
	[161658] = {
		"team:146", -- [1]
	},
	[141799] = {
		"team:22", -- [1]
	},
	[146932] = {
		"team:72", -- [1]
	},
	[175779] = {
		"team:17", -- [1]
	},
	[98489] = {
		"team:193", -- [1]
	},
	[68462] = {
		"team:128", -- [1]
	},
	[150914] = {
		"team:133", -- [1]
	},
	[150917] = {
		"team:147", -- [1]
	},
	[68463] = {
		"team:134", -- [1]
	},
	[97804] = {
		"team:80", -- [1]
	},
	[140813] = {
		"team:110", -- [1]
	},
	[175780] = {
		"team:20", -- [1]
	},
	[66739] = {
		"team:138", -- [1]
	},
	[154928] = {
		"team:219", -- [1]
	},
	[169501] = {
		"team:131", -- [1]
	},
	[150918] = {
		"team:152", -- [1]
	},
	[116786] = {
		"team:148", -- [1]
	},
	[141292] = {
		"team:33", -- [1]
	},
	[116793] = {
		"team:169", -- [1]
	},
	[175781] = {
		"team:25", -- [1]
	},
	[173263] = {
		"team:115", -- [1]
	},
	[98270] = {
		"team:21", -- [1]
	},
	[197447] = {
		"team:48", -- [1]
	},
	[162461] = {
		"team:91", -- [1]
	},
	[68464] = {
		"team:143", -- [1]
	},
	[105455] = {
		"team:13", -- [1]
	},
	[197350] = {
		"team:130", -- [1]
	},
	[175782] = {
		"team:27", -- [1]
	},
	[155414] = {
		"team:42", -- [1]
	},
	[119343] = {
		"team:174", -- [1]
	},
	[68560] = {
		"team:144", -- [1]
	},
	[116794] = {
		"team:23", -- [1]
	},
	[116787] = {
		"team:166", -- [1]
	},
	[154917] = {
		"team:73", -- [1]
	},
	[104553] = {
		"team:164", -- [1]
	},
	[175783] = {
		"team:30", -- [1]
	},
	[140880] = {
		"team:118", -- [1]
	},
	[154919] = {
		"team:187", -- [1]
	},
	[139489] = {
		"team:185", -- [1]
	},
	[119341] = {
		"team:195", -- [1]
	},
	[200678] = {
		"team:214", -- [1]
	},
	[200693] = {
		"team:177", -- [1]
	},
	[71929] = {
		"team:53", -- [1]
	},
	[175784] = {
		"team:32", -- [1]
	},
	[66733] = {
		"team:101", -- [1]
	},
	[150858] = {
		"team:179", -- [1]
	},
	[200689] = {
		"team:11", -- [1]
	},
	[207572] = {
		"team:270", -- [1]
	},
}
Rematch4Saved = {
	{
		{
			"BattlePet-0-000012B4838C", -- [1]
			525, -- [2]
			597, -- [3]
			598, -- [4]
			1167, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "A New Vocation",
		["notes"] = "Strategy added by Johny\nTurn 1: Emerald Proto-Whelp use Emerald Presence if lower than 1 duration left\nTurn 2: Emerald Proto-Whelp use Emerald Dream if hp is lower than 800\nTurn 3: Emerald Proto-Whelp use Emerald Bite\nTurn 4: Pass if stunned\n",
	}, -- [1]
	[142114] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			0, -- [2]
			0, -- [3]
			321, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B528FE", -- [1]
			974, -- [2]
			595, -- [3]
			536, -- [4]
			1266, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B6751A", -- [1]
			0, -- [2]
			489, -- [3]
			589, -- [4]
			1721, -- [5]
		}, -- [3]
		["teamName"] = "Add More to the Collection",
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9168\n\nStrategy added by 하늘용#3273\nTime: ~1:20 (~10 rounds)\n\nTested 6 January 2021\n\nTurn 1: Unholy Ascension\nBring in your Xu-Fu, Cub of Xuen\nTurn 2: Moonfire\nTurn 3: Spirit Claws\nEighty Eight dead & Turbo come in\nTurn 4: Prowl\nTurn 5: Spirit Claws\nTurn 6: Turbo dead & Whiplash come in & Swap to your Stormborne Whelpling\nTurn 7: Arcane Storm\nTurn 8: Mana Surge\n",
	},
	["Are They Not Beautiful? (Aquatic)"] = {
		{
			"BattlePet-0-000012B67A9B", -- [1]
			567, -- [2]
			297, -- [3]
			536, -- [4]
			2692, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B6AE3C", -- [1]
			484, -- [2]
			0, -- [3]
			2360, -- [4]
			2865, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B90213", -- [1]
			608, -- [2]
			2062, -- [3]
			595, -- [4]
			2765, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).This strategy will just result in a win or disaster, so please don't complain about having to repeat the fight. Family Battler is a one-time thing, so please be patient or just try another strategy that suits you better.For the 3rd Slot, there are tons of alternate Nazjatar Slimy pets with that move set, but I only tried with the B/B Hermit, so I added its stats as a requirement.There are two situations when continuing makes little to no sense:1. Beeks kills Voidskimmer (don't even go further, Script will also immediately Forfeit)2. Voidskimmer dies without affecting Talons (I don't recommend going further, I don't think you can win without critical hits, and the Script will Forfeit unless you comment that line out or delete it)\n\nTurn 1: Pump\nTurn 2: Prowl\nTurn 3: Pump\nTurns 4+: Rush (Fethres dies, Beeks comes in, spam until dead)\nBring in your Voidskimmer and stick to these priorities:\nPrio 1:: When Beeks kills your Voidskimmer -> Forfeit\nPrio 2:: Void Tremors\nPrio 3:: Feedback\nSlimy Hermit Crab comes in\nTurn 1: When Voidskimmer didn't apply Void Tremors OR deal direct damage to Talons -> Forfeit (or ignore this when you wanna try to kill Talons with critical hits ;-)\nStick to these priorities:\nPrio 1:: No Void Tremors active, Talons has 968HP or more -> Sewage Eruption\nPrio 2:: Moonfire\nPrio 3:: Nether Blast\n",
	},
	[150929] = {
		{
			"BattlePet-0-000012B01ED3", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C782", -- [1]
			110, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B98D26", -- [1]
			360, -- [2]
			312, -- [3]
			163, -- [4]
			1778, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7395\n\nStrategy added by EVOluti0n#11601\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Powerball until Starlette dies\nBring in your Chrominius\nTurn 1: Howl\nTurn 2: Surge of Power (Chrominius will die while it recovers. If not try to use Bite.)\nBring in your Dust Bunny\nTurn 1: Dodge\nTurn 2-4: Stampede\nTurn 5+: Flurry \n",
		["teamName"] = "Nefarious Terry",
	},
	[87122] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			647, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Gargra",
		["notes"] = "Strategy added by panchan\nTurn 1: Wind-Up\nTurn 2: Toxic Smoke\nTurn 3: Wind-Up\nWolfus die\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nFangra die\nTurn 7: while Iron Starlette alive : Toxic Smoke\nTurn 8: while Wolfgar > 40% HP Mechanical Pandaren Dragonling : Breath\nkill Wolfgar using Explode \n",
	},
	[155145] = {
		{
			"BattlePet-0-000012B5CBA5", -- [1]
			118, -- [2]
			419, -- [3]
			1062, -- [4]
			1687, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B751E1", -- [1]
			110, -- [2]
			1545, -- [3]
			706, -- [4]
			3319, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00001275D175", -- [1]
			110, -- [2]
			1545, -- [3]
			706, -- [4]
			3319, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5489\n\nStrategy added by DragonsAfterDark\nIf the backline pets don't die before the active pet, you will face all the enemy pets. \n\nTurn 1: Tidal Wave\nTurn 2: Tidal Wave\nTurn 3: Rain Dance\nAfter that:\nPriority 1: Rain Dance on CD\nPriority 2: Tidal Wave as filler\nPriority 3: Once the backline enemies are dead Rain Dance & Water Jet to kill enemy #1\n",
		["teamName"] = "Plagued Critters",
		["minXP"] = 25,
	},
	[200688] = {
		{
			"BattlePet-0-000012BB19D8", -- [1]
			0, -- [2]
			0, -- [3]
			460, -- [4]
			1700, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00000D5451F8", -- [1]
			0, -- [2]
			2223, -- [3]
			0, -- [4]
			2352, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00000D511EB1", -- [1]
			0, -- [2]
			2223, -- [3]
			0, -- [4]
			3041, -- [5]
		}, -- [3]
		["teamName"] = "Wildfire - Legendary",
		["notes"] = "Strategy added by Lazey\nTurn 1: Illuminate\nTurn 2: Swap to your Baa'l\nTurn 3: Murder the Innocent\nTurn 4: Swap to your Death Seeker\nTurn 5: Murder the Innocent\n",
	},
	[85685] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by Remte\nIf possible, pick one additional pet that has any damaging spell that does more than 500 damage in one hit.\n\nTurn 1: Wind-Up\nTurn 2: Wind-Up\nTurn 3: Pass\nTurn 4: Wind-Up\nTurn 5: Supercharge\nTurn 6: Wind-Up\n",
		["teamName"] = "Stitches Jr.",
		["minXP"] = 25,
	},
	[99035] = {
		{
			"BattlePet-0-000012B99D14", -- [1]
			621, -- [2]
			453, -- [3]
			912, -- [4]
			3376, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012C1A7C1", -- [1]
			118, -- [2]
			297, -- [3]
			230, -- [4]
			2865, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["minHP"] = 130,
		["notes"] = "Strategy added by Kalagren\nLevel pet takes 129 Elemental damage.[url=https://www.wow-petguide.com/Strategy/10874/Fight_Night:_Amalia]Credit[/url] goes to Berendain for giving me the idea to mitigate Sunlight with Sandstorm.WhyDaRumGone gets credit for the 2nd pet regarding his comment [url=https://www.wow-petguide.com/Comment/110188]here[/url].\n\nChip comes in\nTurn 1: Sandstorm\nTurn 2: Swap to your Voidskimmer\nTurn 3: Cleansing Rain\nTurns 4-5: Pump and Sunny dies\nTurns 6-7: Pump and Roots dies\nTurn 8: Pass unless Voidskimmer HP < 667 use Cleansing Rain and eat the stun\nTurn 9: Pass and Voidskimmer eats Lift-Off and dies\nBring in your Level Pet\nTurn 10: Swap to your Chip\nTurn 11: Sandstorm\nTurn 12: Stone Rush\nTurn 13: Quicksand\nTurn 14: Stone Rush\n",
		["teamName"] = "Training with Durian",
	},
	[124617] = {
		{
			"BattlePet-0-000012B4C1CA", -- [1]
			826, -- [2]
			298, -- [3]
			404, -- [4]
			650, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B3E06C", -- [1]
			113, -- [2]
			503, -- [3]
			466, -- [4]
			1229, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000008968258", -- [1]
			406, -- [2]
			453, -- [3]
			814, -- [4]
			1155, -- [5]
		}, -- [3]
		["teamName"] = "Environeer Bert",
		["notes"] = "Strategy added by Skattyman#21150\nTurn 1: Sunlight, enemy forces you to swap every turn with Pandaren Fire Spirit until dead\nTurn 2: Immolate\nTurn 3: Inspiring Song\nTurn 4: Conflagrate\nTurn 5: Weakening Blow\nTurn 6: Burn\nTurn 7: Sunlight\nTurn 8: Inspiring Song\nTurn 9-11: Weakening Blow until Terrible Turnip dies\nTurn 12: Pandaren Fire Spirit comes in, Immolate\nTurn 13: Conflagrate, Pandaren Fire Spirit dies\nTurn 14: Anubisath Idol comes in, Sandstorm\nTurn 15: Rupture\nTurn 16-20: Crush to victory\n",
	},
	[161661] = {
		{
			"BattlePet-0-000008A85848", -- [1]
			1370, -- [2]
			1773, -- [3]
			1772, -- [4]
			1977, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			1773, -- [2]
			1758, -- [3]
			1772, -- [4]
			1975, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B66D54", -- [1]
			1773, -- [2]
			514, -- [3]
			1772, -- [4]
			1976, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8624\n\nStrategy added by Kylmyys#2878\nTurn 1: Warning Squawk\nTurn 2+3: Falcosaur Swarm! until Bloodgazer Hatchling dies\nBring in your Direbeak Hatchling\nTurn 1: Warning Squawk\nTurn 2: Falcosaur Swarm! until Wilbur dies\n",
		["teamName"] = "Wilbur",
	},
	["Chi-Chi, Hatchling of Chi-Ji"] = {
		{
			"BattlePet-0-000012B5CBA7", -- [1]
			567, -- [2]
			409, -- [3]
			592, -- [4]
			1149, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B9027A", -- [1]
			445, -- [2]
			369, -- [3]
			564, -- [4]
			743, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 4,
		["notes"] = "Strategy added by unknown\nTurn 1: Immolation\nTurn 2: Wild Magic\nTurn 3: Swap to your Rapana Whelk\nTurn 4: Acidic Goo\nTurn 5: Ooze Touch\nTurn 6: Ooze Touch\nTurns 7+8: Dive\n",
	},
	[200689] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			0, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nThe same team can be used for the [url=https://www.wow-petguide.com/Strategy/18585/Wildfire_-_Legendary]Legendary[/url] & [url=https://www.wow-petguide.com/Strategy/18586/Wildfire_-_Epic]Epic[/url] versions.My Team for defeating the Storm-Touched Skitterers can be found [url=https://youtu.be/UDUYys-uxuk?t=55]here[/url].\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: BONESTORM\nTurn 4: Blistering Cold\nBring in your Zandalari Anklerender\nTurn 5: Black Claw\nTurn 6: Hunting Party\n",
		["teamName"] = "Wildfire - Rare",
		["minXP"] = 25,
	},
	[175778] = {
		{
			"BattlePet-0-000012B146C9", -- [1]
			360, -- [2]
			312, -- [3]
			159, -- [4]
			200, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10122\n\nStrategy added by DragonsAfterDark\nIt will take a while, but your bunny will end with 100% hp\n\nYou can also do this method with Lagan / Slithershock Elver (1,1,1), Scrapyard Tunneler (2,1,1), Alloyed Alleyrat (1,2,1), Specimen 97 (1,1,1)\n\nIt's also possible to do this with Inky / Nameless Octopode (1,2,2), & Sneaky Marmot (1,2,2), but you use the blind on turn two and pass on turn three, which loses one round of attack, and will make this last longer.\n\nVideo for Fight (https://www.youtube.com/watch?v=SAQqQd5HWT0)\n\nTurn 1: Scratch\nTurn 2: Scratch\nTurn 3: Dodge\nTurn 4: Scratch\nTurn 5: Scratch\nTurn 6: Burrow goes underground\nTurn 7: Burrow lands\n\nRepeat from TURN 2\n",
		["teamName"] = "Briarpaw",
		["minXP"] = 1,
	},
	[105455] = {
		{
			"BattlePet-0-000012B17368", -- [1]
			445, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CB67", -- [1]
			0, -- [2]
			1273, -- [3]
			1966, -- [4]
			2089, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Jarrun's Ladder",
		["notes"] = "Strategy added by Askevin\nA simple AoE strat that wins in 12-13 rounds, typically.\n\nTurn 1: Poison Protocol\nTurn 2: Void Nova\nTurn 3: Swap to Infernal Pyreclaw\nTurn 4: Great Sting\nTurn 5: Cleave\nTurn 6: Cleave\nTurn 7: Cleave\nTurn 8: Swap to Level Pet\nTurn 9: Swap to Anomalus\nTurn 10: Poison Protocol\nTurn 11: Void Nova\nTurn 12: Ooze Touch. Anomalus dies and Mist Wraith enters Undead round, swap to Infernal Pyreclaw\nTurn 13: Pass\n",
	},
	[161662] = {
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			602, -- [3]
			334, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CC", -- [1]
			110, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C762", -- [1]
			122, -- [2]
			172, -- [3]
			169, -- [4]
			243, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15687\n\nStrategy added by Mutanis\nTurn 1: Time Bomb\nTurn 2: Decoy\nTurn 3: Swap to your Chrominius\nTurn 4: Howl\nTurns 5-6: Surge of Power\n",
		["teamName"] = "Char",
		["minXP"] = 1,
	},
	[87123] = {
		{
			"BattlePet-0-000012B146CC", -- [1]
			299, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			779, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Vesharr",
		["notes"] = "Strategy added by Saintgabrial\nTurn 1+: Arcane Explosion until Chrominius dies\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Breath\nTurn 2: Thunderbolt\nTurn 3+: Breath until Apexis Guardian resurrects\nThen:: Explode - your small pet gets the full experience points :-)\n",
	},
	[85622] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			779, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Brutus and Rukus",
		["notes"] = "Strategy added by Sarahlinii\nCredit for this strategy goes to Chrosta. Please see the information below to go check out Chrosta's in-depth WoWhead post regarding all things Garrison Pet Menagerie! https://www.wowhead.com/guide=3831/garrison-pet-battles-with-12-pets-xp-petLeveling Pet: Safe for ANY Level 1+ Pet; it will take 0 damage**Please feel free to leave suggested TDScripts below as I’ve no idea how to properly create them myself. Thanks and enjoy! UPDATE: Changed TD Script from HeXoDuS' to MERMEL#1857's (found in the comments). Please let me know if there are any issues with the Script!\n\nBring in your Iron Starlette\nTurn 1: Wind-Up to charge\nTurn 2: Supercharge\nTurn 3: Wind-Up to hit and defeat Brutus\nRukus comes in\nTurn 1: Wind-Up to charge\nTurn 2: Wind-Up to hit\nTurn 3: Toxic Smoke if you're able to before your Iron Starlette is defeated\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Thunderbolt\nTurn 2: Breath IF Rukus has more than 560 HP\nTurn 3: Explode when Rukus has 560 or less HP\nYour Leveling Pet will get the XP\n\n",
	},
	[175779] = {
		{
			"BattlePet-0-00000D5451F8", -- [1]
			0, -- [2]
			2223, -- [3]
			0, -- [4]
			2352, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01ED3", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146D1", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [3]
		["teamName"] = "Chittermaw",
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10639\n\nStrategy added by DragonsAfterDark\n**For those without the Seaborne Spore**\n\nAny combination of Explode pets should work here. \n\nVideo for Fight (https://www.youtube.com/watch?v=whfyt1i8Zxs)\n\nTurn 1: Murder the Innocent\nTurn 2: Swap to your Iron Starlette\nTurn 3: Explode\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Explode\nBring in your Baa'l\nTurn 1: Murder the Innocent\n",
	},
	[161663] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C7A1", -- [1]
			421, -- [2]
			593, -- [3]
			589, -- [4]
			320, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C788", -- [1]
			493, -- [2]
			254, -- [3]
			539, -- [4]
			203, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7179\n\nStrategy added by Shenk\nTurn 1: Black Claw\nTurn 2-4: Flock\n",
		["teamName"] = "Tempton",
		["minXP"] = 1,
	},
	[141479] = {
		{
			"BattlePet-0-000012BAC9E8", -- [1]
			384, -- [2]
			204, -- [3]
			208, -- [4]
			116, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C76E", -- [1]
			0, -- [2]
			208, -- [3]
			204, -- [4]
			1957, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B673F3", -- [1]
			0, -- [2]
			208, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [3]
		["teamName"] = "Strange Looking Dogs",
		["notes"] = "Strategy added by norng\n10 rounds.\n\nTurn 1: Metal Fist\nTurn 2: Supercharge\nTurn 3: Call Lightning - Timbo resurrects\nTurn 4: Swap to your Runeforged Servitor - Timbo dies\nPokey comes in\nTurn 1: Supercharge\nTurn 2: Call Lightning - Pokey resurrects\nTurn 3: Swap to your Microbot XD - Pokey dies\nBurly Jr. comes in\nTurn 1: Supercharge\nTurns 2-3: Ion Cannon - Burly Jr. dies\n",
	},
	[175780] = {
		{
			"BattlePet-0-000012B4C1CA", -- [1]
			826, -- [2]
			298, -- [3]
			404, -- [4]
			650, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00001274E208", -- [1]
			115, -- [2]
			488, -- [3]
			612, -- [4]
			3378, -- [5]
		}, -- [2]
		{
			"random:4", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11167\n\nStrategy added by Mutanis\n6 rounds.\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: Swap to your Arachnoid Skitterbot\nTurn 4: Smoke Cloud\nTurn 5: Toxic Spray\nTurn 6: Flurry\n",
		["teamName"] = "Mistwing",
		["minXP"] = 1,
	},
	[98270] = {
		{
			"BattlePet-0-000012B0D34C", -- [1]
			0, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B118E8", -- [1]
			413, -- [2]
			1080, -- [3]
			1076, -- [4]
			1349, -- [5]
		}, -- [3]
		["teamName"] = "My Beast's Bidding",
		["notes"] = "Strategy added by Aerolite2017\nBy Aerolite2017, 8 Steps, 66s\n\nTurn 1: Time Bomb\nTurn 2: Armageddon\nBring in your Level Pet\nTurn 3: Swap to your Rotten Little Helper\nTurn 4: Booby-Trapped Presents\nTurn 5: Ice Lance\nTurn 6: Greench's Gift\nTurn 7: Ice Lance\nTurn 8: Ice Lance\n",
	},
	[141799] = {
		{
			"BattlePet-0-000012B6764A", -- [1]
			112, -- [2]
			916, -- [3]
			334, -- [4]
			1403, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012BAC92C", -- [1]
			777, -- [2]
			646, -- [3]
			209, -- [4]
			338, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [3]
		["teamName"] = "Pack Leader",
		["notes"] = "Strategy added by RedBeard\nTurn 1: Decoy\nTurn 2: Haywire\nTurn 3: Peck\nTurn 4: Peck\nScars comes in\nTurn 5: Peck\nTurn 6: Haywire\nBring in your Darkmoon Tonk\nTurn 7: Shock and Awe\nTurn 8+: Missile until Scars dies\nUndead: Pass\nLittle Blue comes in\nTurn 9: Missile\nTurn 10: Ion Cannon\nBring in your Iron Starlette\nTurn 1: Toxic Smoke\n",
	},
	[116794] = {
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			364, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4838C", -- [1]
			525, -- [2]
			597, -- [3]
			598, -- [4]
			1167, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B67A9C", -- [1]
			297, -- [2]
			416, -- [3]
			513, -- [4]
			3449, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Strategy added by Aranesh\nTurn 1: Black Claw\nTurns 2+3: Hunting Party\nTurn 4: Leap until Growing Ectoplasm is dead\nAn enemy pet comes in\nTurns 1+: Black Claw and Hunting Party until your Zandalari Anklerender dies\nBring in your Emerald Proto-Whelp\nTurn 1: Emerald Presence\nTurns 2+: Keep Emerald Presence active, use Emerald Dream when you drop below 1000 health and use Emerald Bite to finish the enemy pets.\n",
		["teamName"] = "Growing Ectoplasm 2",
	},
	[200692] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			0, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			364, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [3]
		["teamName"] = "Tremblor - Legendary",
		["notes"] = "Strategy added by Ravenousdead\nFirst: Blistering Cold on CD\nSecond: use Chop as filler\nBoneshard dies - Bring in Ikky\nFirst: Black Claw if missing\nSecond: Flock on CD\nIkky dies - Bring in Zandalari Anklerender\nFirst: Black Claw if missing\nSecond: Hunting Party on CD\nThird: Leap as filler\n",
	},
	[175781] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D1", -- [1]
			0, -- [2]
			919, -- [3]
			0, -- [4]
			1180, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["minHP"] = 701,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11420\n\nStrategy added by Xerxes\nAny pet with Black Claw should work in slot 2.\n\nThe first attack from the enemy pet has a small chance to crit and drop Boneshard to 1 HP. In this case, restart the fight.\n\nYour level pet can have less than 700 HP.\nThe last hit will do about 400 damage, but I've seen it crit for around 700 HP.\n\nTD Script by Yolo (https://www.wow-petguide.com/index.php?user=11440)\n\nEnjoy :)\n\nTurn 1: Blistering Cold\nBoneshard should be roughly half HP. If he's 1 HP, restart the fight.\nTurn 2: Chop\nBoneshard should be 20 HP\nTurn 3: BONESTORM\nTurn 4: Blistering Cold\nBring in your Zandalari Kneebiter\nTurn 5: Black Claw\nTurn 6: Pass\nTurn 7: Pass\n",
		["teamName"] = "Sewer Creeper",
		["minXP"] = 15,
	},
	["Do You Even Train? (Humanoid)"] = {
		{
			"BattlePet-0-000012B96E7D", -- [1]
			429, -- [2]
			312, -- [3]
			362, -- [4]
			1226, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000011C8C36A", -- [1]
			2294, -- [2]
			490, -- [3]
			2432, -- [4]
			3131, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B96E89", -- [1]
			355, -- [2]
			490, -- [3]
			124, -- [4]
			514, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Howl\nThen:\nPrio 1: Dodge when Lifft is Underwater\nPrio 2: Howl on CD\nPrio 3: Claw\nBrul'dan comes in\nPrio 1: Dodge when Brul'dan has the power buff, or whenever you can after Brul'dan's Turn 2\nPrio 2: Claw\nBring in your Mawsworn Minion\nPrio 1: Deflection for Headbutt\nPrio 2: Dark Fate on Brul'dan when he hits you with Shadow Shock, then if you can on Swole \nPrio 3: Soul Steal\nBring in your Flayer Youngling\nPrio 1: Deflection for Headbutt\nPrio 2: Rampage when Headbutt is on CD for > 2 rounds\nPrio 3: Triple Snap\n",
	},
	[105840] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01ED3", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Fight Night: Stitches Jr. Jr.",
		["notes"] = "Strategy added by unknown\nDepending on your Iron Starlette, you might need to bring another pet with strong attacks. For example a Darkmoon Tonk (Ion Cannon) or a strider (2x Pump) or any pet with Surge of Power.\n\nTurn 1: Wind-Up\nTurn 2: Wind-Up\nTurn 3: Wind-Up\nTurn 4: Pass\nTurn 5: Supercharge\nTurn 6: Wind-Up\nTurn 7: Wind-Up\nTurn 8: Wind-Up\nTurn 9: Pass - Stitches dead!\n",
	},
	[175782] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11414\n\nStrategy added by angbad#1501\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: Chop\nTurn 4: Swap to your Ikky\nTurn 5: Black Claw\nTurns 6-8: Flock\n",
		["teamName"] = "The Countess",
		["minXP"] = 25,
	},
	["To a Land Down Under (Humanoid)"] = {
		{
			"BattlePet-0-000012B0D34E", -- [1]
			447, -- [2]
			1556, -- [3]
			466, -- [4]
			1887, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B6760E", -- [1]
			1737, -- [2]
			350, -- [3]
			934, -- [4]
			1935, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B118E8", -- [1]
			413, -- [2]
			624, -- [3]
			206, -- [4]
			1349, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Alainon#1617\nTurn 1: Jar of Smelly Liquid\nTurn 2: Corrosion\nTurn 3: Nether Gate \nClawz comes in\nTurn 4: Jar of Smelly Liquid\nTurn 5: Corrosion until Wyrmy Tunkin dies\nBring in your Squirky\nTurn 1: Clobber\nBassalt comes in\nTurn 2: Fish Slap Until Bassalt dies, Claws comes in\nTurn 3: Bubble\nTurn 4+: Clobber when available otherwise Fish Slap until Squirky dies\nBring in your Winter's Little Helper\nTurn 1: Ice Tomb\nTurn 2: Call Blizzard\nTurn 3+: Ice Lance Murrey should die before Winter's Little Helper\n",
	},
	[87125] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CC", -- [1]
			299, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Taralune",
		["notes"] = "Strategy added by Miamoon\nTurn 1: Pass\nTurn 2: Wind-Up\nTurn 3: Supercharge\nTurn 4: Wind-Up\nGrace comes in\nTurn 1: Toxic Smoke\nTurn 2: Toxic Smoke\nBring in your Level Pet\nTurn 1: Swap to your Chrominius\nTurn 2: Arcane Explosion\nTurn 3: Arcane Explosion\nTurn 4: Arcane Explosion\nAtonement comes in\nTurn 1: Howl\nTurn 2: Surge of Power\n",
	},
	[116795] = {
		{
			"BattlePet-0-000012B67BBE", -- [1]
			369, -- [2]
			276, -- [3]
			1559, -- [4]
			2451, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C7AB", -- [1]
			445, -- [2]
			657, -- [3]
			1043, -- [4]
			1964, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C794", -- [1]
			499, -- [2]
			657, -- [3]
			1043, -- [4]
			1964, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4769\n\nStrategy added by DragonsAfterDark\nTurn 1: Paralyzing Venom\nTurn 2: Acidic Goo\nTurn 3+4: Swallow You Whole\nRepeat 1-4 until Bloodstone Tunneler dies\n\nBring in other pets to clean up random backline pets. \n\n~~: For those who haven't done this dungeon much, the backline pets will be a random combination of: Beast, Flying, or Aquatic\n",
		["teamName"] = "Everliving Spore",
		["minXP"] = 25,
	},
	[175783] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			0, -- [2]
			786, -- [3]
			0, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11352\n\nStrategy added by angbad#1501\nQuick and Easy\n\nTurn 1: Blistering Cold\nTurn 2: Swap to your Ikky\nTurn 3: Black Claw\nTurn 4: Flock\nBring in your Boneshard\nTurn 5: Pass\n",
		["teamName"] = "Digallo",
		["minXP"] = 25,
	},
	[140461] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B146CA", -- [1]
			983, -- [2]
			392, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [3]
		["teamName"] = "Night Horrors",
		["notes"] = "Strategy added by Lazey\n*** 9.0.2 approved ***\n\nTurn 1: Black Claw\nTurn 2+: Flock until Atherton is dead.\nBybee comes in\nTurn 1: Black Claw\nTurn 2+: Flock until Bybee is dead.\nJennings comes in\nTurn 1: Black Claw until Ikky has 366HP or less. (Ikky must be killed by Jennings!)\nTurn 2: Flock until Ikky is dead.\nBring in your Level Pet\nSwap to your Lil' Bling\nTurn 1: Make it Rain\nAny standard attack will finish the fight\n",
	},
	[175784] = {
		{
			"BattlePet-0-000012B4838C", -- [1]
			115, -- [2]
			611, -- [3]
			598, -- [4]
			1167, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13523\n\nStrategy added by Doc#1345\nCredit to Nilremife\n\nTurn 1: Breath\nTurn 2: Breath\nTurn 3: Ancient Blessing\nTurn 4: Emerald Dream\nRepeat these step until Gelatinous is defeat. Does not matter what pet 2 or 3 are, they will die and your dragon will be near full health.\n",
		["teamName"] = "Gelatinous",
		["minXP"] = 1,
	},
	["Are They Not Beautiful? (Flyer)"] = {
		{
			"BattlePet-0-000012B118A8", -- [1]
			1233, -- [2]
			752, -- [3]
			998, -- [4]
			1567, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01E1E", -- [1]
			421, -- [2]
			784, -- [3]
			589, -- [4]
			2441, -- [5]
		}, -- [2]
		{
			"random:3", -- [1]
		}, -- [3]
		["minXP"] = 25,
		["notes"] = "Strategy added by Kyzna\nIm just posting my strategy that worked for me. This strategy required that you sucessfully stun. .\n\nBring in your Sentinel's Companion\nTurn 1: Soulrush if Fethres is not stunned = reset\nBeeks comes in\nTurn 2: Dark Talon\nTurn 3: Ethereal (you need to block Surge of Power) if not = reset\nTurn 4: Dark Talon\nTurn 5: Dark Talon\nTurn 6: Dark Talon\nBeeks dies. Fethres comes in\nTurn 7: Dark Talon\nTurn 8: Dark Talon\nFethres dies. Talons comes in\nTurn 9: Soulrush, Dark Talon if talons is stunned\nBring in your Squawkling\nTurn 10: Shriek\nTurn 11: Arcane Storm\nTurn 12: Arcane Blast\n",
	},
	[141292] = {
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			1773, -- [2]
			1758, -- [3]
			518, -- [4]
			1975, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5C356", -- [1]
			0, -- [2]
			0, -- [3]
			518, -- [4]
			1974, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2255\n\nStrategy added by Eekwibble\nI changed this from having a carry pet because the xp is so lame since the nerf. The upside is, it now only lasts 13 rounds.\n\nTurn 1: Ironskin\nTurns 2&3: Falcosaur Swarm!\nTurn 4: Predatory Strike - Fungus dies\nMort comes in\nTurn 1: Pass\nTurn 2: Ironskin\nTurns 3&4: Falcosaur Swarm!\nTurn 5: Predatory Strike - Mort dies\nOld Blue comes in\nTurn 1+: Falcosaur Swarm! until Direbeak Hatchling dies\nBring in your Snowfeather Hatchling\nThen:: Predatory Strike - Old Blue dies\n",
		["teamName"] = "That's a Big Carcass",
		["minXP"] = 25,
	},
	[200696] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			210, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Flow - Legendary",
		["notes"] = "Strategy added by Sevena\nTurn 1: Shadow Slash\nTurn 2: Shadow Slash\nTurn 3: Curse of Doom\nTurn 4: Haunt\nBring in Ikky\nTurn 1: Black Claw\nTurn 2: Flock\n",
	},
	["Do You Even Train? (Magic)"] = {
		{
			"BattlePet-0-000012B607A8", -- [1]
			445, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B17368", -- [1]
			445, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B81435", -- [1]
			445, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Doledippers\nI've tried this 4 times and have won each time. I know this fight has a lot of RNG with the ability order so, there may be cases where this doesn't work. However, each of the 4 attempts I did have resulted in a pretty clean win, with the 3rd Anomalus having atleast 600 HP at the end.Let me know if you run into any cases where this fails, thank you!\n\nPriority 1:: Void Nova\nPriority 2:: Poison Protocol\nPriority 3:: Ooze Touch\nPriority 4:: Pass if Lifft / Swole is underwater AND Poison Protocol +  Void Nova are on cd\nPriority 5:: Ooze Touch when only Swole is left\n",
	},
	[83837] = {
		{
			"BattlePet-0-000012B3E06C", -- [1]
			113, -- [2]
			503, -- [3]
			466, -- [4]
			1229, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Cymre Brightblade",
		["notes"] = "Strategy added by Remte\nIn this vast jungle, a low-hanging fruit isn't entirely unexpected.While Immolation is much, much better for backline healing, I've found out Flamethrower adds a little more stability, as dropping a DoT later means it smoothes out the Burn's RNG. You can use Immolation first cast only, but you will risk Gyrexle healing out because Failsafe didn't trigger. I think it has something to do with different backline/weather abilities affecting the Gyrexle's health in a way that causes them to use Repair late/early enough.Managed to [url=https://pastebin.com/raw/xsay3pFH ]succeed with a crit of[/url] Rot. (A forfeit is for continued testing.)\n\nTurn 1: Flamethrower (Don't worry about the 'strong' Rot.)\nTurn 2: Nether Gate – enemy Wishbright Lantern is forced in\nTurn 3: Swap to your Timeless Mechanical Dragonling\nTurns 4-6: Flame Breath x3 – enemy Wishbright Lantern dies\nIdol of Decay comes back in\nTurn 7: Time Bomb\nTurn 8: Armageddon – your Timeless Mechanical Dragonling dies\nBring in your Level Pet\nTurn 9: Swap to your Fiendish Imp\nTurn 10: Flamethrower – enemy Idol of Decay is stunned and will die after Damned in the backline\nGyrexle, the Eternal Mechanic comes in\nTurns 11+: Burn 'til the end, no more than 4 times.\n",
	},
	[200697] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			422, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D1", -- [1]
			921, -- [2]
			919, -- [3]
			364, -- [4]
			1180, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Flow - Rare",
		["notes"] = "Strategy added by Halyanth#1611\nI tried it the first time today. I will update the strategy as I continue to play with it. \n\nTurn 1: Haunt\nBring in Kneebitter\nTurn 2: Black Claw\nTurn 3: Hunting Party\nTurn 4: Hunting Party continues\nTurn 5: Leap\n",
	},
	[175786] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146C9", -- [1]
			119, -- [2]
			312, -- [3]
			159, -- [4]
			200, -- [5]
		}, -- [3]
		["teamName"] = "Glurp",
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/11830\n\nStrategy added by DavidG\nNice and simple, and no hard-to-find pets involved.  You can also replace the third pet with a Direbeak Hatchling, or one of the other Hatchlings that has Falcosaur Swarm!\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nBring in your Ikky\nTurn 3: Black Claw\nHis Meat Hook brings in your third pet\nTurn 4: Flock\nHis Hateful Strike kills your third pet - Ikky comes back in\nTurn 5: Flock\n",
	},
	[201849] = {
		{
			"BattlePet-0-000012BC0A5A", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [1]
		{
			"BattlePet-0-0000083A0A6A", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			1537, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00000D511EB1", -- [1]
			0, -- [2]
			2223, -- [3]
			0, -- [4]
			3041, -- [5]
		}, -- [3]
		["teamName"] = "Adinakon",
		["notes"] = "Strategy added by WhyDaRumGone\n1st/2nd Pet doesn't have to be flier/above 300speed but suggested;(Put slower pets in slot 2)If health pool of Exploders is >2811 (1440max per), murder insta kill\n\nTurn 1: Explode\nBring in your Crimson Spore / 2nd pet\nTurn 2: Explode\nBaa'lial / Death Seeker / Baa'l comes in\nTurn 3: Murder the Innocent\n",
	},
	["Are They Not Beautiful? (Mech)"] = {
		{
			"BattlePet-0-000012B673F3", -- [1]
			1585, -- [2]
			208, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B0D34C", -- [1]
			501, -- [2]
			602, -- [3]
			334, -- [4]
			3100, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Supercharge\nTurn 2: Ion Cannon\nBeeks comes in\nTurn 3+: Alert! until dead\nBring in your Iron Starlette\nTurn 1: Wind-Up\nTurn 2: Supercharge -- Skip this if Beeks has < 894 hp\nTurn 3: Wind-Up\nTurn 4: Powerball if needed to kill Beeks\nTalons comes in\nTurn 1+: Powerball until dead\nBring in your Timeless Mechanical Dragonling\nPrio 1: Decoy when there's 1 round left on Conflagrate's CD\nPrio 2: Time Bomb\nPrio 3: Flame Breath\n",
	},
	[85659] = {
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "The Beakinator",
		["notes"] = "Strategy added by Infernal\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\n\nThat's it ^^\n",
	},
	[71926] = {
		{
			"BattlePet-0-000012B99B2E", -- [1]
			122, -- [2]
			764, -- [3]
			1960, -- [4]
			2081, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B675D0", -- [1]
			122, -- [2]
			256, -- [3]
			668, -- [4]
			538, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 4,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7590\n\nStrategy added by Shenk\nTurn 1: Phase Shift\nTurn 2+: Tail Sweep until your dragonkin racial proccs (2-3 times)\nTurn 3: Twilight Meteorite with your racial buff\nTurn 4: Tail Sweep. Wisdom dies\nPatience comes in\nTurn 1: Tail Sweep\nTurn 2: Phase Shift\nTurn 3+: Tail Sweep until either one of the pets dies\nUsually Twilight Clutch-Sister dies against Patience, but with some luck you will beat it and can actually go on against Knowledge. In that scenario play the same rotation like you did against the 1st pet.\nBring in your Scourged Whelpling\nTurn 1: Tail Sweep. Patience dies\nKnowledge comes in\nTurn 1: Call Darkness\nTurn 2+: Dreadful Breath\n",
		["teamName"] = "Lorewalker Cho",
		["minXP"] = 1,
	},
	[155413] = {
		{
			"BattlePet-0-000012C4A66F", -- [1]
			2067, -- [2]
			163, -- [3]
			934, -- [4]
			2386, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00000D5451F8", -- [1]
			393, -- [2]
			2223, -- [3]
			172, -- [4]
			2352, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B3956C", -- [1]
			2067, -- [2]
			934, -- [3]
			564, -- [4]
			2647, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Strategy added by KaikkuQQ#2332\nTurn 1: Bubble\nTurns 2-4: Stampede\nTurn 5: Pinch until Main-gauche die\nAn enemy pet comes in\nTurn 6: Bubble if possible if not go next turn\nTurns 7-9: Stampede until your pet die\nBring in your Baa'l\nTurn 1: Scorched Earth\nTurn 2-...: Shadowflame until Postier-lémentaire pestiféré die\nAn enemy pet comes in\nTurn 3: Murder the Innocent\nTurn 4: Shadowflame until Baa'l die, if isn't already\nBring in your Glimmershell Scuttler\nTurn 1: Bubble\nTurn 2-3: Pinch\nTurns 4-5: Dive\nRepeat 3 last action until WIN.\n",
		["teamName"] = "Postmaster Malown",
	},
	["Do You Even Train? (Elemental)"] = {
		{
			"BattlePet-0-000012B96E94", -- [1]
			354, -- [2]
			1010, -- [3]
			934, -- [4]
			1518, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B608F8", -- [1]
			501, -- [2]
			172, -- [3]
			179, -- [4]
			519, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C770", -- [1]
			1359, -- [2]
			1357, -- [3]
			1354, -- [4]
			1451, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).**Right now we have 4 different Power stats on pets for the 2nd Slot, the script includes them all, but for the written steps I'm just using the weakest Scorched Earth damage tick to decide if I can kill Swole before it dives. Molten Corgi's Blazing Yip alone deals 315 damage, so you may wanna adjust that based on the Power of your second pet:315 + 56 (260P) = 371 (I'm using this in written steps)315 + 59 (276P) = 374315 + 61 (289P) = 376315 + 65 (305P) = 380\n\nWith your Stout Alemental stick to these priorities until dead:\nPrio 1:: Bubble\nPrio 2:: Barrel Toss\n\nBring in your Fel Flame and stick to these priorities until dead:\nPrio 1:: Scorched Earth\nPrio 2:: Enemy is Swole -> Conflagrate\nPrio 3:: Flame Breath\n\nMolten Corgi comes in, stick to these priorities:\nPrio 1:: Enemy is Brul'dan -> Blazing Yip\nPrio 2:: Swole is Underwater -> Puppies of the Flame\nPrio 3:: Swole has >371HP** (>315HP without Scorched Earth), can't use Headbutt, Dive is available -> Puppies of the Flame\nPrio 4:: Scorched Earth is active, Swole is the enemy and not Underwater -> Superbark \nPrio 5:: Swole has >315HP and is not Underwater -> Superbark\nPrio 6:: Blazing Yip\nPrio 7:: Pass turn when your pet got stunned (on your last pet that happens automatically)\n",
	},
	[155414] = {
		{
			"BattlePet-0-000006E4C782", -- [1]
			110, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000008968258", -- [1]
			406, -- [2]
			453, -- [3]
			490, -- [4]
			1155, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B5CB59", -- [1]
			360, -- [2]
			0, -- [3]
			665, -- [4]
			1146, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/12678\n\nStrategy added by Summon#1193\nI mangled most of my teams and spare pets doing the challenge mode dungeon. I had a hand full of pets left that could kill Infectus but would die to his invulnerability turn. With Stitched Pup we have Flurry and 2x heals and our own invulnerability turn if we get some bad RNG. A Flayer Youngling running 1/2/1 and deflecting Bolt, stunning on CD works for Anub Idols spot too, Thanks to DeJules Strategy for inspiring this when I thought I was doomed. Need to test validity of Rabid Strike, Flurry usage. Not sure TD would work since Deflection use is situational.\n\nTurn 1: Bite\nTurn 2: Howl\nTurns 3-5: Surge of Power\nSmokey dies\nAn enemy pet comes in Pyro\nBite till Chrominius dies\nBring in your Anubisath Idol\nBeware Elemintium Bolt, its a delayed nuke make sure to deflect when it shows turn 1 left\nKeep up Sandstorm, Crush for Filler and Deflection Bolt Fall\nPyro Dies \nAn enemy pet comes in Infectus\nCrush till Idol dies\nBring in your Stitched Pup\nFlurry Filler\nConsume Corpse at half health, can use twice since we lost 2 pets.\nFlurry till Infectus falls over\n",
		["teamName"] = "Ezra Grimm",
	},
	[160205] = {
		{
			"BattlePet-0-000012B99A03", -- [1]
			394, -- [2]
			268, -- [3]
			404, -- [4]
			291, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C780", -- [1]
			202, -- [2]
			362, -- [3]
			159, -- [4]
			244, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B5CC18", -- [1]
			1407, -- [2]
			172, -- [3]
			606, -- [4]
			2092, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Strategy added by Fungus\nPhotosynthesis with Sunlight is able to outheal the damage, but with a string of bad Luck this might fail.Takes around 30-35 turns.\n\nTurn 1: Sunlight. Refresh when 1 or 0 turn remaining.\nTurn 2: Photosynthesis. Refresh when not up.\nTurn 3: Lash\nPriorities: Photosynthesis and Sunlight Weather >> Lash >> Sunlight Cast\nTurn 5: \nTurn 6: \nTurn 7: \nTurn 8: \n",
		["teamName"] = "Pixy Wizzle",
		["minXP"] = 25,
	},
	[71927] = {
		{
			"BattlePet-0-000012B6764A", -- [1]
			504, -- [2]
			916, -- [3]
			334, -- [4]
			1403, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B66DA8", -- [1]
			429, -- [2]
			312, -- [3]
			802, -- [4]
			1416, -- [5]
		}, -- [3]
		["tab"] = 2,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9773\n\nStrategy added by Rebekha#21420\nTurn 1: Decoy\nTurn 2 & 3: Haywire\nTurn 4+: Alpha Strike until Tonsa dies\nChirps comes in\nBring in your Level Pet\nBring in your Teroclaw Hatchling\nTurn 1: Dodge\nTurn 2+: Claw until Chirps hp < 927\nTurn 3: Ravage until Chirps dies\nBrewly comes in\nTurn 1: Dodge when Brewly has the barrel throwing buff\nTurns 2-3: Ravage if Brewly hp < 619\nTurn 4: Claw until Brewly dies\nIf you have the world's worst RNG, bring back your Mech Axe to finish the job\n",
		["teamName"] = "Chen Stormstout",
		["minXP"] = 1,
	},
	[160206] = {
		{
			"BattlePet-0-000012B99962", -- [1]
			113, -- [2]
			173, -- [3]
			519, -- [4]
			429, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01E16", -- [1]
			0, -- [2]
			476, -- [3]
			663, -- [4]
			1629, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B96DD7", -- [1]
			499, -- [2]
			197, -- [3]
			706, -- [4]
			2664, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14034\n\nStrategy added by Nmyler\nTurn 1: Apocalypse\nTurn 2: Cauterize\nBring in your Stinkrot\nTurn 1: pass if you are stunned\nTurn 2: Rot\nTurn 2: pass if you are stunned\nTurn 3: Corpse Explosion\nBring in your Experimental Roach\nTurn 1: Adrenal Glands\nTurns 2-4: Swarm\nTurn 5: Diseased Bite until Ruddy dies\nTurns 6-8: Swarm until Experimental Roach dies\nAt some point Wandering will enter and die by Apocalypse\nBring in your Lava Beetle\nTurn 1: Cauterize in CD\nTurn 2: Burn\nrepeat these two until finished\n",
		["teamName"] = "Alran Heartshade",
	},
	[160207] = {
		{
			"BattlePet-0-000012B67B94", -- [1]
			1056, -- [2]
			1123, -- [3]
			277, -- [4]
			2590, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B14EFA", -- [1]
			901, -- [2]
			919, -- [3]
			1043, -- [4]
			2050, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			989, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7438\n\nStrategy added by Squirl\nUsually wins around round 15. Enemy crits do not appear to be an issue.\n\nTurn 1: Disruption\nRepeat until Prideling dies:\nPriority 1: Life Exchange if your HP <= 500\nPriority 2: Seethe\nRavenous Prideling dies; swap in your Orphaned Felbat\nTurn 1: Fel Immolate\nTurn 2: Drain Blood if the enemy's racial is triggered and their HP is <= 263; else Black Claw\nFollow this priority until enemy Logic dies:\nPriority 1: Black Claw if not applied\nPriority 2: Drain Blood if off CD\nPriority 3: Fel Immolate\nEnemy Logic dies; enemy Math comes in\nTurn 1: Fel Immolate\nTurn 2: Black Claw\nYour Lil' Bling is swapped in\nTurn 3: Inflation\n",
		["teamName"] = "Therin Skysong",
	},
	[204792] = {
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01E0B", -- [1]
			908, -- [2]
			489, -- [3]
			589, -- [4]
			3382, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C7A1", -- [1]
			421, -- [2]
			593, -- [3]
			589, -- [4]
			320, -- [5]
		}, -- [3]
		["teamName"] = "Are They Not Beautiful? (Dragon)",
		["notes"] = "Strategy added by Kalagren\nNexus Whelpling comes in\nTurn 1: Arcane Storm\nThen follow priorities for both Nexus Whelpling and Stormie:\n(This means bringing in Stormie when Nexus Whelpling dies)\nPrio 1: Mana Surge\nPrio 2: Arcane Storm\nPrio 3: Jolt / Tail Sweep\nBring in your Lil' Tarecgosa\nPrio 1: Surge of Power when Talons is active and within kill range \nor Dragonkin racial is active (Must be the finisher)\nPrio 2: Arcane Blast / Arcane Storm if not in Surge of Power finishing range\n",
	},
	["Ashes Will Fall"] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			0, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			0, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by Shenk\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Zandalari Anklerender\nTurn 1: Black Claw\nTurn 2-3: Hunting Party\n",
	},
	[197447] = {
		{
			"BattlePet-0-000012B99CF8", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			85, -- [5]
		}, -- [1]
		{
			"BattlePet-0-0000083A0A6A", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			1537, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C7A0", -- [1]
			0, -- [2]
			0, -- [3]
			297, -- [4]
			847, -- [5]
		}, -- [3]
		["teamName"] = "Eye of the Stormling",
		["notes"] = "Strategy added by DragonsAfterDark\nPet 1: Any Pet with Explode and 1575 hp or morePet 2: Any Pet with Explode and 1575 hp or morePet 3: Any Pet with Pump and 272 power or more[url=https://youtu.be/-NFCK-QT1V0]Video for Fight[/url]\n\nTurn 1: Explode\nBring in Explode Pet 2\nTurn 2: Explode\nBring in Pump Pet\nTurn 3: Pump loads\nTurn 4: Pump lands\n",
	},
	[160208] = {
		{
			"BattlePet-0-000012B99B2D", -- [1]
			270, -- [2]
			1026, -- [3]
			518, -- [4]
			2586, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99B2C", -- [1]
			377, -- [2]
			165, -- [3]
			348, -- [4]
			2459, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B99B2E", -- [1]
			122, -- [2]
			764, -- [3]
			1960, -- [4]
			2081, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Strategy added by Mutanis\nTime: ~2:10 (~23 rounds)Tested and verified 20 April 2022\n\nTurn 1: Glowing Toxin\nTurn 2: Amber Prison\nTurn 3: Glowing Toxin\nTurn 4: Swap to your Snort\nTurn 5: Bash\nTurn 6: Trample\nTurn 7: Crouch\nTurn 8-10: Trample (3 times)\nTurn 11: Bash\nTurn 12: Swap to your Amberglow Stinger\nTurn 13: Glowing Toxin\nTurn 14: Amber Prison\nTurn 15: Swap to your Snort\nTurn 16: Trample --> Crushface dies\nTurn 17: Trample --> Fozling dies\nTurn 18: Bash\nTurn 19+: Trample until Snort dies\nBring in your Twilight Clutch-Sister\nTurn 1: Phase Shift (if Tremors health < 800 you can skip this turn)\nTurn 2: Tail Sweep\nTurn 3: Twilight Meteorite\n(in case Twilight Clutch-Sister dies bring in Amberglow Stinger --> Predatory Strike --> Tremor dies)\n",
		["teamName"] = "Zuna Skullcrush",
	},
	[141046] = {
		{
			"BattlePet-0-000012BEE376", -- [1]
			0, -- [2]
			0, -- [3]
			321, -- [4]
			2710, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B607A8", -- [1]
			445, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012C570D3", -- [1]
			184, -- [2]
			256, -- [3]
			517, -- [4]
			1713, -- [5]
		}, -- [3]
		["teamName"] = "Captured Evil",
		["notes"] = "Strategy added by 하늘용#3273\n9\n\nTurn 1: Unholy Ascension\nTurn 2: Void Nova\nTurn 3: Poison Protocol\nTurn 4: Ooze Touch\nBring in your Anomalus\nTurn 1: Call Darkness\nTurn 7: Lesser Charged Gale dead & Lesser Twisted Current come in\nTurn 8: Nocturnal Strike\nLesser Twisted Current dead & Mind Warper come in\nTurn 1: Quills\n",
	},
	[173303] = {
		{
			"BattlePet-0-000012BC0A28", -- [1]
			0, -- [2]
			1865, -- [3]
			282, -- [4]
			2041, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by matarsaed#2362\nTurn 1-4: Frost Shot\nTurn 5: Explode\n",
		["teamName"] = "Ashes Will Fall",
		["minXP"] = 25,
	},
	["Zao, Calfling of Niuzao"] = {
		{
			"BattlePet-0-0000080DA4CD", -- [1]
			411, -- [2]
			0, -- [3]
			167, -- [4]
			323, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D1", -- [1]
			921, -- [2]
			919, -- [3]
			0, -- [4]
			1180, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 2,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10424\n\nStrategy added by norng\n5 rounds.\n\nTurn 1: Nut Barrage\nTurn 2: Woodchipper - Nuts dies\nBring in your Zandalari Kneebiter\nTurn 1: Black Claw\nTurns 2-3: Hunting Party - Zao, Calfling of Niuzao dies\n",
		["minXP"] = 1,
	},
	[160209] = {
		{
			"BattlePet-0-000012B6760E", -- [1]
			111, -- [2]
			163, -- [3]
			934, -- [4]
			1935, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B118ED", -- [1]
			455, -- [2]
			1105, -- [3]
			282, -- [4]
			1450, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012BA9541", -- [1]
			384, -- [2]
			208, -- [3]
			754, -- [4]
			261, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Strategy added by Dysphoric\nCredit to Comment in wowhead from Buuloki: https://ptr.wowhead.com/npc=160209/horu-cloudwatcher#commentsAdded TD from DragonsAfterDark on 1/16/2020\n\nTurn 1: Bubble\nTurn 2-4: Stampede\nTurn 5: Punch\nTurn 6: Punch\nBeta comes in\nTurn 6: Stampede\nBring in your Draenei Micro Defender\nTurn 1+: Batter until Beta dies\nAlpha comes in\nTurn 2: If your health >1061 Batter two times else Batter only 1 time\nTurn 3: Explode\nBring in your Personal World Destroyer\nTurn 1: Supercharge\nTurn 2: Metal Fist\nTurn 3: Metal Fist\n",
		["teamName"] = "Horu Cloudwatcher",
	},
	[71929] = {
		{
			"BattlePet-0-000012C4A5C4", -- [1]
			360, -- [2]
			170, -- [3]
			1043, -- [4]
			2380, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99CE5", -- [1]
			110, -- [2]
			256, -- [3]
			517, -- [4]
			2567, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 4,
		["notes"] = "Strategy added by Berendain\nTurn 1+: Flurry until Socks enters undead round\nTurn 2: Drain Blood\nMonte comes in\nTurn 1: Flurry\nTurns 2-3: Lift-Off\nTurn 4: Drain Blood\nTurn 5: Flurry until Monte dies\nRikki comes in\nTurn 1: Drain Blood, Lift-Off, and Flurry until Parasitic Boarfly dies\nBring in your Crimson Bat Pup\n(If Monte is still active when you bring in Crimson Bat Pup, Bite until Monte dies)\nTurn 1: Call Darkness\nTurn 2: Nocturnal Strike\nTurn 3: Bite until Rikki dies\n",
		["teamName"] = "Sully \"The Pickle\" McLeary",
	},
	["Do You Even Train? (Magic) (2)"] = {
		{
			"BattlePet-0-000012B607A8", -- [1]
			445, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B17368", -- [1]
			445, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [2]
		{
			"BattlePet-0-0000122BADD1", -- [1]
			473, -- [2]
			475, -- [3]
			489, -- [4]
			1160, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Doledippers\nI've tried this 4 times and have won each time. I know this fight has a lot of RNG with the ability order so, there may be cases where this doesn't work. However, each of the 4 attempts I did have resulted in a pretty clean win, with the 3rd Anomalus having atleast 600 HP at the end.Let me know if you run into any cases where this fails, thank you!\n\nPriority 1:: Void Nova\nPriority 2:: Poison Protocol\nPriority 3:: Ooze Touch\nPriority 4:: Pass if Lifft / Swole is underwater AND Poison Protocol +  Void Nova are on cd\nPriority 5:: Ooze Touch when only Swole is left\n",
	},
	[160210] = {
		{
			"BattlePet-0-000012B3E786", -- [1]
			2067, -- [2]
			919, -- [3]
			706, -- [4]
			2648, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			392, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B673F3", -- [1]
			1585, -- [2]
			208, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7098\n\nStrategy added by Shenk\nTurn 1: Black Claw\nTurn 2-4: Swarm\nTurn 4/5: Pass during the undead round (Depending on the breed you are using this happens either in the 4th or 5th round.)\nFury comes in\nTurn 1: Black Claw (Your Chitterspine Skitterling might be dead already depending on the breed or bad luck. That's not a problem, just go on.)\nBring in your Lil' Bling\nAgainst Fury follow this priority list:\nPrio 1: Extra Plating\nPrio 2: Make it Rain\nPrio 3: Inflation\nGlitzy comes in\nTurn 1+: Inflation until Lil' Bling dies\nBring in your Microbot XD\nTurn 1: Supercharge\nTurn 2: Ion Cannon\n",
		["teamName"] = "Tasha Riley",
	},
	[141879] = {
		{
			"BattlePet-0-000012B528FE", -- [1]
			974, -- [2]
			595, -- [3]
			536, -- [4]
			1266, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012BAFD31", -- [1]
			459, -- [2]
			1921, -- [3]
			282, -- [4]
			2001, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Keeyo's Champions of Vol'dun",
		["notes"] = "Strategy added by 하늘용#3273\n 9\n\nBring in your Xu-Fu, Cub of Xuen &윙부리 comes in\nTurn 1: Prowl\nTurn 2: Moonfire\nTurn 2: Buzzbeak dies & Tikka come in & Swap to your Dibbler\nTurn 3: Drill Charge\nTurn 4: Wind-Up\nTurn 5: Wind-Up\nTurn 6: Tikka dies & Milo come in\nTurn 7: Explode\nTurn 8: Dibbler dies & Xu-Fu, Cub of Xuen come in\nTurn 9: Prowl\nTurn 10: Spirit Claws\nMilo dies \n",
	},
	[201858] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by HotdogPotato\nTurn 1: Black Claw\nTurns 2-4: Flock\nTurn 5: Savage Talon\n",
		["teamName"] = "Lyver",
		["minXP"] = 25,
	},
	[154910] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			422, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			0, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:6", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5969\n\nStrategy added by nurkka\nThird pet not brought in. I used a Magic pet to assure it would stay alive from the wave attacks.\n\nTurn 1: Shadow Shock\nTurn 2: Curse of Doom\nTurn 3: Haunt\nBring in your Ikky\nTurns 1-3: Flock\n",
		["teamName"] = "Prince Wiggletail",
		["minXP"] = 25,
	},
	["Do You Even Train? (Undead)"] = {
		{
			"BattlePet-0-000006E4C79F", -- [1]
			668, -- [2]
			0, -- [3]
			1051, -- [4]
			1965, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146C7", -- [1]
			649, -- [2]
			1761, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B01E66", -- [1]
			535, -- [2]
			492, -- [3]
			536, -- [4]
			1804, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Refreshe#1641\nIt worked multiple times safe-ish. It's good enough.\n\nTurn 1: Acid Rain\nTurns 2~10: Dreadful Breath until Blightbreath dies.\nBring in your Boneshard\nTurn 11: BONESTORM\nTurn 12: BONESTORM\nTurn 13: BONESTORM\nTurn 14: Pass\nBring in your Risen Saber Kitten\nPrio 1: Prowl When the snail dives.\nPrio 2: Rake on CD\nPrio 3: Pounce\n",
	},
	[145968] = {
		{
			"BattlePet-0-000012B66C49", -- [1]
			509, -- [2]
			511, -- [3]
			310, -- [4]
			746, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B607A5", -- [1]
			394, -- [2]
			256, -- [3]
			517, -- [4]
			2794, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B5CBAA", -- [1]
			514, -- [2]
			120, -- [3]
			964, -- [4]
			2084, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/19467\n\nStrategy added by Nalika#2313\nTurn 1: Renewing Mists\nTurn 2: Shell Shield\nTurn 3: Surge\nTurn 4: Surge\nTurn 5: Surge\nTurn 6: Renewing Mists\nTurn 7: Shell Shield\nTurn 8: until the end\n",
		["teamName"] = "Leper Rat",
		["minXP"] = 25,
	},
	[154911] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			0, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			0, -- [3]
			0, -- [4]
			1320, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nI specifically went out and caught a B/B Unborn Val'kyr, made it rare and lvl 25, and unless Chomp crits with Devour X the UBV has enough health to take both hits to use Haunt. 643 + 643 = 1,286B/B UBV HP = 1562\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Lil' Bling\nTurn 1: Pass\nTurn 2+: Inflation\n",
		["teamName"] = "Chomp",
		["minXP"] = 25,
	},
	[141945] = {
		{
			"BattlePet-0-000012B99943", -- [1]
			921, -- [2]
			919, -- [3]
			364, -- [4]
			1180, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99946", -- [1]
			1085, -- [2]
			0, -- [3]
			0, -- [4]
			1601, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			364, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [3]
		["teamName"] = "Snakes on a Terrace",
		["notes"] = "Strategy added by Threewolves\nHave you ever noticed that anybody driving slower than you is an idiot, and anyone going faster than you is a maniac?\n\nTurn 1: Pass - Servant of Demidos is forced in.\nTurns 2+: Magic Sword til Clubber dies.\nSwap to your Zandalari Anklerender\nTurn 1: (Squirt Dives) Pass\nTurn 2: Black Claw\nTurn 3: Hunting Party\nSquirt dies. Squeezer enters.\nTurn 1: Black Claw\nTurns 2+: Leap til Zandalari Anklerender dies.\nBring in your Zandalari Kneebiter\nTurn 1: Hunting Party\nTurn 2: Leap til done.\n",
	},
	[71931] = {
		{
			"BattlePet-0-000012B99945", -- [1]
			0, -- [2]
			0, -- [3]
			204, -- [4]
			2417, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CB5D", -- [1]
			0, -- [2]
			1273, -- [3]
			1966, -- [4]
			2089, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B607A8", -- [1]
			447, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [3]
		["tab"] = 2,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9047\n\nStrategy added by DarDar#21108\nTurn 1: Call Lightning\nTurn 2: Pass\nTurn 3: Swap to your Infernal Pyreclaw\nTurn 4: Great Sting\nTurn 5: Cleave\nTurn 6: Cleave\nTurn 7: Cleave\nTurn 8: Pass\nTurn 9: Pass\nTurn 10: Great Sting\nTurn 11: Swap to your Anomalus\nTurn 12: Poison Protocol\nTurn 13: Void Nova\nTurn 14: Corrosion\n",
		["teamName"] = "Taran Zhu",
	},
	[154912] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B48707", -- [1]
			0, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5567\n\nStrategy added by Lazey\n*** 9.0.2 approved '''\n\nThis Manta Ray has two Beast attacks and an empowered Flyby X which will increase the damage your pet takes by 25% for 5 rounds (classic Flyby does for 3 rounds).\n\nI am using a Black Claw + Swarm ability pet in the first slot to buff attacks of my Dragonkin. The script includes Flock and Swarm because when these 8.2 pet battles go live, the Aquatic pet Chitterspine Skitterling will be available as a wild catch in Nazjatar and it has Black Claw and Swarm. Please do not use Hunting Party pets.\n\nThe Skitterling will take more damage from Flyby X so there's a chance it will die 1 round earlier than Flying pets and you can benefit of 2 rounds Shattered Defenses and Black Claw.\n\nTurn 1: Black Claw\nTurn 2+: Flock / Swarm until your pet dies. (When it does without applying Shattered Defenses, please Forfeit, Revive pets & Restart.)\n\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm\nTurn 2-3: Mana Surge\nWhen your Dragon dies without killing Silence, bring in your third pet\nAny standard attack will finish the fight\n",
		["teamName"] = "Silence",
		["minXP"] = 25,
	},
	[173372] = {
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C76E", -- [1]
			459, -- [2]
			208, -- [3]
			204, -- [4]
			1957, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C782", -- [1]
			0, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [3]
		["teamName"] = "Natural Defenders",
		["notes"] = "Strategy added by Mutanis\nBreed recommendation Nexus Whelpling:P/P >> P/B > P/SUpdated the Strategy (8.3.2021). It's safer now. Chrominius can't die anymore.\n\nTurn 1: Tail Sweep\nTurn 2: Arcane Storm\nTurns 3+: Mana Surge until Nexus Whelpling dies\nBring in your Runeforged Servitor\nif Slugger isn't dead then Wind-Up (2x) until Slugger dies\nRunehoof comes in\nTurn 1: Supercharge\nTurn 2: Call Lightning (Runehoof dies)\nDuster comes in\nTurn 1+: Wind-Up until Runeforged Servitor dies\nBring in your Chrominius\nPrio 1: if Duster health > 1110 then Howl\nPrio 2: Surge of Power\n",
	},
	[154913] = {
		{
			"BattlePet-0-000006E4C7B4", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			0, -- [2]
			0, -- [3]
			518, -- [4]
			1975, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Shadowspike Lurker",
		["notes"] = "Strategy added by Ktjn\nTurn 1: Black Claw\nTurn 2+: Flock\nIkky dies\nTurn 4: Bring in Direbeak Hatchling\nTurn 5: Predatory Strike\n",
	},
	[145971] = {
		{
			"BattlePet-0-000012B99C74", -- [1]
			110, -- [2]
			1045, -- [3]
			366, -- [4]
			1329, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99CCC", -- [1]
			110, -- [2]
			312, -- [3]
			762, -- [4]
			1343, -- [5]
		}, -- [2]
		{
			"random:7", -- [1]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Strategy added by Reilly\nTurn 1: Barkskin\nTurn 2: Bite\nTurn 3: Bite\nTurn 4: Dazzling Dance\nTurn 5+: Bite\nAn enemy pet comes in\nPriority 1: Maintain Barkskin\nPriority 2: Maintain Dazzling Dance\nPriority 3: Fill with Bite\nAn enemy pet comes in\nTurn 1+: Bite until Dandelion Frolicker dies\nBring in your Bonkers\nTurn 1+: Bite until Bonkers dies\nBring in your Elemental pet\nAny standard attack will finish the fight\n",
		["teamName"] = "Cockroach",
		["minXP"] = 25,
	},
	[71932] = {
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			989, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99CB5", -- [1]
			608, -- [2]
			1231, -- [3]
			448, -- [4]
			1524, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 3,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/133\n\nTurn 1: Make it Rain\nTurns 2-4: Inflation\nTurn 5: Blingtron Gift Package\nContinue from Turn 1 until Lil' Bling dies.\nHe will easily destroy Carpe Diem and Spirus. Sometimes taking a good chunk out of River as well.\n\nBring in Netherspawn, Spawn of Netherspawn \nTurns 1+: If you have a Whirlpool incoming, use Consume Magic. Otherwise use Creeping Ooze and Nether Blast as a filler.\n",
		["teamName"] = "Wise Mari",
	},
	[154914] = {
		{
			"BattlePet-0-000012BC13BD", -- [1]
			249, -- [2]
			319, -- [3]
			513, -- [4]
			3523, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4C1CA", -- [1]
			419, -- [2]
			745, -- [3]
			828, -- [4]
			650, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B99CE5", -- [1]
			357, -- [2]
			256, -- [3]
			517, -- [4]
			2567, -- [5]
		}, -- [3]
		["minHP"] = 256,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9977\n\nStrategy added by shpungout\n255 aquatic damage for Level pet.\n\nTurn 1: Black Claw\nTurns 2-4: Flock\nTurn 5: Pass\nBring in your Darkmoon Zeppelin\nTurn 1: Explode\n",
		["teamName"] = "Pearlhusk Crawler",
		["minXP"] = 3,
	},
	["Are They Not Beautiful? (Undead) (2)"] = {
		{
			"BattlePet-0-000012B01EED", -- [1]
			1066, -- [2]
			1035, -- [3]
			752, -- [4]
			1625, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01EEC", -- [1]
			1066, -- [2]
			0, -- [3]
			752, -- [4]
			1627, -- [5]
		}, -- [2]
		{
			"random:4", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by Dreamingdust\nTurn 1: Spiritfire Beam\nTurn 2: Soulrush\nContinue even if the pet got stunned\nTurn 3: Spiritfire Bolt\nTurn 4: Spiritfire Bolt until Fragment of Anger is dead\nFragment of Desire comes in\nTurn 5: Soulrush\nTurn 6: Spiritfire Bolt until fight is over, or Fragment of Desire is dead\n\nAny standard attack will finish the fight\n",
		["minXP"] = 25,
	},
	[154915] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			0, -- [2]
			218, -- [3]
			321, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6070\n\nStrategy added by Farmacitron#2190\nTurn 1: Curse of Doom\nTurn 2: Unholy Ascension\nTurn 3: Ikky Black Claw\nTurn 4: Flock\nTurn 5: GG WP\n",
		["teamName"] = "Elderspawn of Nalaada",
		["minXP"] = 1,
	},
	[71933] = {
		{
			"BattlePet-0-000012B18C43", -- [1]
			118, -- [2]
			0, -- [3]
			297, -- [4]
			383, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B66DA8", -- [1]
			429, -- [2]
			574, -- [3]
			521, -- [4]
			1416, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C75E", -- [1]
			113, -- [2]
			178, -- [3]
			179, -- [4]
			270, -- [5]
		}, -- [3]
		["tab"] = 3,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/139\n\nTurn 1: Pump\nTurn 2: Water Jet\nTurn 3: Pump\nTurns 4+: Water Jet until Au dies (mostly not necessary)\nBanks comes in\nTurns 1+: Water Jet until Eternal Strider dies\nBring in your Teroclaw Hatchling\n\nTurn 1: Nature's Ward\nTurn 2: Hawk Eye\nTurn 3: Claw\nTurn 4: Claw\nTurn 5: Claw\n\nRepeat this rotation over and over until you won the fight.\nWith some bad luck your Hatchling dies at Lil'B. If so bring in your Dark Phoenix Hatchling and:\nTurn 1: Immolate\nTurn 2: Conflagrate\nTurns 3+: Burn until Lil'B dies\n",
		["teamName"] = "Blingtron 4000",
	},
	[154916] = {
		{
			"BattlePet-0-000006E4C7B4", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B66DA8", -- [1]
			504, -- [2]
			0, -- [3]
			0, -- [4]
			1416, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Ravenous Scalespawn",
		["notes"] = "Strategy added by bios\nTurn 1: Black Claw\nTurn 2: Flock\nTurn 3: Swap to your Teroclaw Hatchling\nTurn 4: Alpha Strike\nAny standard attack will finish the fight\n",
	},
	[173376] = {
		{
			"BattlePet-0-000012B48958", -- [1]
			901, -- [2]
			916, -- [3]
			204, -- [4]
			1178, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Lurking In The Shadows",
		["notes"] = "Strategy added by sioupe\nTurn 1: Call Lightning\nTurns 2-3: Haywire\nTurn 3: GG\n",
	},
	[146932] = {
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			920, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4C5B0", -- [1]
			360, -- [2]
			0, -- [3]
			163, -- [4]
			1427, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B01E47", -- [1]
			1570, -- [2]
			0, -- [3]
			1572, -- [4]
			1754, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Strategy added by Lazey\nThis team & strat is part of my Emperor Crab & Soul of the Forge challenge run. I tried to use a very limited number of no super rare pets who usually survive multiple fights.[url=https://www.wow-petguide.com/index.php?Strategy=3018]Start & Description  [/url] << - - - - - - - - -  - - - - - - - >> [url=https://www.wow-petguide.com/index.php?Strategy=3487]  Next battle[/url]                             \n\n(Start): (1x Primal Cry when your Zandalari Anklerender is not S/S breed)\nPrio 1:: Apply Black Claw if not active\nPrio 2:: Hunting Party\n Zandalari Anklerender dies. Bring in your Stampede pet.\nTurn 1+: Stampede until your pet dies\nBring in your Plump Jelly\nPrio 1:: Squeeze\nPrio 2:: Tentacle Slap\n",
		["teamName"] = "Door Control Console",
	},
	["Do You Even Train? (Dragon)"] = {
		{
			"BattlePet-0-000006E4C782", -- [1]
			110, -- [2]
			362, -- [3]
			0, -- [4]
			1152, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4874E", -- [1]
			782, -- [2]
			0, -- [3]
			0, -- [4]
			1165, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000011F771E8", -- [1]
			429, -- [2]
			347, -- [3]
			0, -- [4]
			1151, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Simion\nThere seems to be a bit of RNG involved, because sometimes the attack order does vary.\n\nTurn 1: Bite\nTurn 2: Howl\nTurn 3: Bite until Chrominius dies (Lifft should be dead and 2 Bite have hit Brul'dan)\nBring in your Nexus Whelpling\nTurn 1: Frost Breath until Nexus Whelpling dies (Brul'dan should be dead and Nexus Whelpling gets killed by Swoles Headbutt) \nBring in your Untamed Hatchling\nTurn 7: Roar because Swole will use Dive\nTurn 8: Claw until Swole dies\n",
	},
	[154917] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			0, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [2]
		{
			"random:10", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by Lazey\n*** 9.0.2 approved ***Illusional Barrier X with only 3 rounds cooldown, Psionic Storm dealing AoE damage and changing the weather to Arcane Winds to give Psychic Blast an additional attack. Looks dangerous but my answer is... Blistering Cold :-)To get as much Frostbite applications as possible on Mindshackle I use Blistering Cold two times before I force my Boneshard to die. To make it even worse for the opponent I also add a Bleeding effect. Black Claw and Shattered Defenses applied by Hunting Party, Flock or Swarm will then buff Frostbite/Bleeding damage.You can replace Zandalari Raptors with Foulfeather, Ikky or Chitterspine Skitterling (8.2 Nazjatar wild catch), the script can handle them all and will also bring your third pet to pass the last turn if your birdies die.\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: BONESTORM\nTurn 4: Blistering Cold (Boneshard dies)\nBring in your Black Claw + Swarm ability pet\nTurn 1: Black Claw\nTurn 2+: Hunting Party, Flock or Swarm\n\nWhen your Mech comes in (while using vulnerable Flying pets with Black Claw)\nPass turn\n",
		["teamName"] = "Mindshackle",
		["minXP"] = 25,
	},
	[173377] = {
		{
			"BattlePet-0-000012B5CB60", -- [1]
			0, -- [2]
			0, -- [3]
			2358, -- [4]
			2843, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CDB5", -- [1]
			501, -- [2]
			602, -- [3]
			1025, -- [4]
			4261, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CC", -- [1]
			299, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [3]
		["teamName"] = "Airborne Defense Force",
		["notes"] = "Strategy added by WhyDaRumGone\nSubject to multiple crits mostly with;Timeless Mechanical Dragonling as alt #2 pet.\n\nTurn 1: Void Crash\nTurn 2: Swap to your Obsidian Warwhelp / Timeless Mechanical Dragonling\nTurn 3: Flame Breath\nTurn 4: Time Bomb\nTurn 5: Armageddon\nBring in your Chrominius\nTurn 6: Arcane Explosion (Pass instead if Star Tail is at or below 206)\nTurn 7: Arcane Explosion\nTurn 8: Howl (Can be skipped if Brite is at or below 1665 and Dragonkin racial available)\nTurn 9: Surge of Power\n",
	},
	[72285] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			0, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B67566", -- [1]
			163, -- [2]
			743, -- [3]
			0, -- [4]
			627, -- [5]
		}, -- [2]
		{
			"random:6", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\n[url=https://www.youtube.com/watch?v=pgoeN1Vbrrg]Video for Fight[/url]\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Infected Squirrel\nTurn 1: Pass\nTurn 2: Creeping Fungus\nTurn 3+: Stampede until Infected Squirrel & Chi-Chi, Hatchling of Chi-Ji dies\nIf needed:\nBring in any pet to clean up\n",
		["teamName"] = "Chi-Chi, Hatchling of Chi-Ji",
		["minXP"] = 25,
	},
	[201802] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			779, -- [3]
			334, -- [4]
			844, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [3]
		["teamName"] = "Sharp as Flint",
		["notes"] = "Strategy added by TobeDeleted#2852\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up\nTurn 5: Wind-Up\nTurn 6: Toxic Smoke until Wind-Up dies. You might get two goes with this if you're lucky. Swap in Mechanical Pandaren Dragonling\nTurn 7+: Breath until second pet dies.\nBlack Claw\nFlock\n",
	},
	[71934] = {
		{
			"BattlePet-0-000006E4C782", -- [1]
			299, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B608F8", -- [1]
			501, -- [2]
			172, -- [3]
			179, -- [4]
			519, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B673F3", -- [1]
			0, -- [2]
			0, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [3]
		["tab"] = 4,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10395\n\nStrategy added by Berendain\nBackground and explanation in the comments.\n\nIn slot 3, you can use any pet with Ion Cannon, but note that the G0-R41-0N Ultratonk is the only one that doesn't have a 1-round standard attack, so in that sense it's worse than the other options.  It will still work though, and often you won't even need to use any attacks to get Trike low before using Ion Cannon, especially with him burning each round.\n\nTurn 1: Arcane Explosion\nTurn 2: Howl\nTurn 3: Surge of Power, Screamer dies\nChaos comes in\nTurn 1+: Arcane Explosion until Chrominius dies\nBring in your Fel Flame\nTurn 1: Flame Breath\nTurn 2: Scorched Earth\nTurn 3+: Flame Breath until Chaos dies\nTrike comes in\nTurn 1: Conflagrate\nTurn 2: Apply Flame Breath\nTurn 3: Scorched Earth\nTurn 4+: Spam Flame Breath until Fel Flame dies\nBring in your Microbot XD\nTurn 1: If needed, use any standard attack until Trike is low enough to be killed with Ion Cannon\nTurn 2: Ion Cannon, Trike dies\n",
		["teamName"] = "Dr. Ion Goldbloom",
	},
	[154918] = {
		{
			"BattlePet-0-000012B607A4", -- [1]
			921, -- [2]
			920, -- [3]
			305, -- [4]
			1212, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6131\n\nStrategy added by CallLightnin\nThree abilities in five turns makes this fight seem trivial. \n\n/way 46.6 28.0 Kelpstone (Cave)\n\nTurn 1: Exposed Wounds\nTurn 2: Pass--Zandalari Footslasher dies\nTurn 3: Black Claw\nTurn 4: Flock\nTurn 5: Flock continues\n",
		["teamName"] = "Kelpstone",
		["minXP"] = 1,
	},
	["To a Land Down Under (Flyer)"] = {
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			1773, -- [2]
			1758, -- [3]
			518, -- [4]
			1975, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B6764A", -- [1]
			504, -- [2]
			916, -- [3]
			334, -- [4]
			1403, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Refreshe#1641\nNear copy of Alainon#1617's strategy #19177 using a modified script from Akéla#2848's comment there. I just didn't have that third pet and this expands the pool nicely.\n\nTurn 1: Ironskin\nTurns 2-3: Falcosaur Swarm!\nTurn 4: Predatory Strike\nTurn 5: Use Falcosaur Swarm! or bring in Ikky\nQuills until Bassalt is dead\nTurn 6: Black Claw\nTurns 7-9: Flock\nTurns 10-12: Flock\nBring in your Mechanical Axebeak\nTurns 1-2: Haywire\nTurn 3: Decoy\nTurn 4: Alpha Strike\nTurns 5-6: Haywire\n",
	},
	[173315] = {
		{
			"BattlePet-0-000012B485C2", -- [1]
			118, -- [2]
			564, -- [3]
			513, -- [4]
			868, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [2]
		{
			"random:8", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nThere seems to be an issue with using Duration and < or > conditionals with non-active enemy abilites. The script I posted *did* work, just not with the most recent update. I had some kind of leftover from the previous version that didn't cause this issue for me. I've posted a new script. Deleted the one in-game, copied from here, and re-tested. It worked. [url=https://www.youtube.com/watch?v=XggSOaSORe4&t=6s]Video for Fight[/url]\n\nTurn 1: Whirlpool\nTurns 2-3: Dive\nTurn 4+: Water Jet until Ash dies\nFang comes in\nTurn 1: Whirlpool\nTurn 2+: Water Jet until Pandaren Water Spirit dies\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\nSwarm comes in\nTurn 1+: Mana Surge may continue\n~~: Arcane Storm & Tail Sweep until Swarm or Nexus Whelp dies\nIf needed:\nBring in your Beast pet\nTurn 1: Any standard attack will finish the fight\n",
		["teamName"] = "Resilient Survivors",
		["minXP"] = 25,
	},
	[97804] = {
		{
			"BattlePet-0-000012BEEECA", -- [1]
			2399, -- [2]
			589, -- [3]
			489, -- [4]
			3099, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99CF8", -- [1]
			0, -- [2]
			634, -- [3]
			282, -- [4]
			85, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Fight Night: Tiffany Nelson",
		["notes"] = "Strategy added by nogulpfrog\n68-78S.  REMARK : Infused Etherwyrm ability data on XUFU is incorrect.\n\nTurn 1: Arcane Storm\nTurn 2: Swap to your Pet Bombling\nTurn 3: Minefield\nTurn 4: Explode\nBring in your Level Pet\nTurn 5: Swap to your Infused Etherwyrm\nTurn 6: Arcane Storm\nTurns 7-9: Mana Surge\nTurn 10: Arcane Storm  (if Mana Surge deal enough damage, enemy third pet died)\nTurn 11: Wind Burst, enemy third pet died.\n",
	},
	["To a Land Down Under (Critter)"] = {
		{
			"BattlePet-0-000012B96DD7", -- [1]
			499, -- [2]
			283, -- [3]
			519, -- [4]
			2664, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B9027A", -- [1]
			445, -- [2]
			369, -- [3]
			564, -- [4]
			743, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B90271", -- [1]
			445, -- [2]
			369, -- [3]
			564, -- [4]
			743, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Sleepywillo\nStrat is from 7181995 on Wowhead. None of the other strats here worked for me but this worked first time. Hope it helps.\n\nTurn 1: Apocalypse\nTurn 2: Swap to Scooter the Snail\nTurn 3: Maintain Acidic Goo\nTurn 4: Use Ooze Touch to get Bassalt as low as possible before dying\nTurn 5: Bring in Rapana Whelk\nTurn 6: Finish Bassalt off with Rapana Whelk and maintain Acidic Goo\nTurn 7: Use Dive to dodge the Whirlpool on Clawz\nTurn 8: Apocalypse should be coming to a close when Murrey is left. You just have to survive here.\n",
	},
	[204934] = {
		{
			"BattlePet-0-000012B528FE", -- [1]
			974, -- [2]
			595, -- [3]
			536, -- [4]
			1266, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			0, -- [3]
			334, -- [4]
			844, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B96E89", -- [1]
			355, -- [2]
			490, -- [3]
			124, -- [4]
			514, -- [5]
		}, -- [3]
		["teamName"] = "Do You Even Train?",
		["notes"] = "Strategy added by AgentRock#1964\nScript thanks to FMJustice\n\nTurn 1: Moonfire\nTurn 2: Prowl\nTurn 3 -4: Spirit Claws until Lifft is dead\nTurn 5-7: Brul'dan comes in.  Spirit Claws until Xu-Fu, Cub of Xuen is dead.\nBring in Mechanical Pandaren Dragonling\nTurn 8-9: Breath until Brul'dan is dead.\nTurn 10: Swole comes in.  Decoy\nTurn 11-15: Breath until Mechanical Pandaren Dragonling is dead.\nBring is Flayer Youngling\nTurn 16: Triple Snap until Swole uses Dive.  Note, if Swole is already underground when Flayer Youngling comes in, then skip to next step.\nTurn 17: Deflection\nTurn 18+: Rampage until Swole is dead.\n",
	},
	[154920] = {
		{
			"BattlePet-0-000008A85848", -- [1]
			0, -- [2]
			1773, -- [3]
			518, -- [4]
			1977, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5C356", -- [1]
			1773, -- [2]
			0, -- [3]
			518, -- [4]
			1974, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			0, -- [2]
			0, -- [3]
			518, -- [4]
			1975, -- [5]
		}, -- [3]
		["teamName"] = "Frenzied Knifefang",
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5501\n\nStrategy added by DragonsAfterDark\nKnifefang's Blood in the Water has a 25% Hit Chance for over 1592 damage.\n\nRound 1: Blood in the Water Does Not hit your Bloodgazer Hatchling\nTurns 1-2: Falcosaur Swarm!\nTurn 3: Predatory Strike\nTurns 4+: Falcosaur Swarm! until dead\nBring in your Snowfeather Hatchling\nTurn 1: Predatory Strike\nTurns 2-3: Falcosaur Swarm!\n\nRound 1: Blood in the Water Does hit your Bloodgazer Hatchling\nTurn 1: Falcosaur Swarm!\nBring in your Snowfeather Hatchling\nTurn 1: Predatory Strike\nTurns 2+: Falcosaur Swarm! until dead\nBring in your Direbeak Hatchling\nTurn 1: Predatory Strike\n",
	},
	["Are They Not Beautiful? (Undead)"] = {
		{
			"BattlePet-0-000012B01EED", -- [1]
			1066, -- [2]
			1035, -- [3]
			752, -- [4]
			1625, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01EEC", -- [1]
			1066, -- [2]
			0, -- [3]
			752, -- [4]
			1627, -- [5]
		}, -- [2]
		{
			"random:4", -- [1]
		}, -- [3]
		["minXP"] = 25,
		["notes"] = "Strategy added by Dreamingdust\nTurn 1: Spiritfire Beam\nTurn 2: Soulrush\nContinue even if the pet got stunned\nTurn 3: Spiritfire Bolt\nTurn 4: Spiritfire Bolt until Fragment of Anger is dead\nFragment of Desire comes in\nTurn 5: Soulrush\nTurn 6: Spiritfire Bolt until fight is over, or Fragment of Desire is dead\n\nAny standard attack will finish the fight\n",
	},
	[99210] = {
		{
			"BattlePet-0-000012B0D34C", -- [1]
			0, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B528FE", -- [1]
			974, -- [2]
			595, -- [3]
			536, -- [4]
			1266, -- [5]
		}, -- [3]
		["teamName"] = "Fight Night: Bodhi Sunwayver",
		["notes"] = "Strategy added by WhyDaRumGone\nObsidian Warwhelp works as alt #1 pet\n\nTurn 1: Time Bomb\nTurn 2: Armageddon\nBring in your Level Pet\nTurn 3: Swap to your Xu-Fu, Cub of Xuen. (You get hit by Whirlpool but even all crits wont kill you).\nTurn 4: Prowl\nTurn 5: Moonfire\nTurn 6+: Spirit Claws, until they all dead.\n",
	},
	[162458] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B58B24", -- [1]
			777, -- [2]
			282, -- [3]
			779, -- [4]
			339, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Retinus the Seeker",
		["notes"] = "Strategy added by Redorkulated#1291\nCreated this based on a comment from Nebulae on one of the other strats here. worked really well and i couldnt see a simular strat. hope this helps someone as much as it helped me.\n\nTurn 1: Black Claw\nTurn 2-3: Flock Ikky Dies\nBring in your Darkmoon Zeppelin\nTurn 1: Thunderbolt\nTurn 2-?: Missile untill Seeker HP<610\nTurn ?: Explode when Seeker HP<610\n",
	},
	[154921] = {
		{
			"BattlePet-0-000012B01ED3", -- [1]
			459, -- [2]
			0, -- [3]
			282, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B58B24", -- [1]
			0, -- [2]
			282, -- [3]
			0, -- [4]
			339, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CC", -- [1]
			0, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [3]
		["teamName"] = "Giant Opaline Conch",
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6117\n\nStrategy added by Neevi#2149\nWorked pretty well for me\n\nTurn 1: Wind-Up\nTurn 2: Wind-Up\nTurn 3: Explode, switch to other Explode Pet\nBring in your Explode Pet\nTurn 4: Explode\nBring in your Chrominius\nTurn 5: Howl\nTurn 6: Surge of Power\n",
	},
	[173381] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			210, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Ardenweald's Tricksters",
		["notes"] = "Strategy added by Werloz\nTurn 1: Curse of Doom\nTurn 2: Haunt\nTurn 3: Black Claw\nTurns 4-6: Flock\nRascal die\n",
	},
	[66730] = {
		{
			"BattlePet-0-000008A86E91", -- [1]
			535, -- [2]
			357, -- [3]
			595, -- [4]
			1927, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CF", -- [1]
			1682, -- [2]
			766, -- [3]
			767, -- [4]
			1885, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [3]
		["teamName"] = "Hyuna of the Shrines",
		["notes"] = "Strategy added by Bösendorfer\nI am using this every day, works flawlessly, and its fast. \n\nTurn 1: Emerald Presence\nTurn 2: Emerald Bite x 2\nTurn 3: Emerald Presence (Always use this when the dragon buff is active)\nTurn 4: Emerald Bite, Skyshaper dies\nFangor enters\nTurn 5: Emerald Bite (with dragon buff active)\nTurn 6: Proto-Strike\nTurn 7: Emerald Bite until Fangor dies\nDor the Wall enters\nTurn 8: Emerald Bite x 1, Emerald Proto-Whelp might die here\nif Emerald Proto-Whelp survives the Headbutt from Dor the Wall, go to next step\nTurn 9: Bring in Level Pet\nTurn 10: bring in Ikky\nTurn 11: Black Claw\nTurn 12: Flock\nTurn 13: Savage Talon if Dor the Wall is still alive\n",
	},
	[115307] = {
		{
			"BattlePet-0-0000083A0A6A", -- [1]
			359, -- [2]
			1015, -- [3]
			282, -- [4]
			1537, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B0D34C", -- [1]
			501, -- [2]
			2237, -- [3]
			334, -- [4]
			3100, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			0, -- [4]
			1963, -- [5]
		}, -- [3]
		["teamName"] = "Algalon the Observer",
		["notes"] = "Strategy added by Mutanis\nThanks to Remte for testing <3\n\nTurn 1: Sting\nTurn 2: Blinding Powder\nTurn 3: Swap to your Timeless Mechanical Dragonling\nTurn 4: Razor Talons\nTurn 5: Swap to your Crimson Spore\nTurn 6: Blinding Powder\nTurn 7: Sting\nTurn 8: Explode\nBring in your Boneshard\nComet still alive? --> Chop\nComet dies\nCosmos comes in\nTurn 1: Blistering Cold\nTurn 2: Pass (Timeless Mechanical Dragonling forced in)\nTurn 3: Razor Talons\nTurn 4: Swap to your Boneshard\nTurn 5: Chop (Cosmos dies)\nConstellatius comes in\nPrio list\nPrio 1: Blistering Cold\nPrio 2: Chop\nTimeless Mechanical Dragonling comes in\nTurn 1: Decoy\nTurn 2: Razor Talons\nTurns 3+: Flame Breath\n",
	},
	["Deeptide Fingerling"] = {
		{
			"BattlePet-0-000012B01EA5", -- [1]
			420, -- [2]
			741, -- [3]
			190, -- [4]
			2467, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B17368", -- [1]
			447, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B607A8", -- [1]
			447, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [3]
		["tab"] = 10,
	},
	[154923] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CBA7", -- [1]
			113, -- [2]
			503, -- [3]
			173, -- [4]
			1149, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Sputtertube",
		["notes"] = "Strategy added by Skwirrel\nTurn 1: Black Claw\nTurn 2: Flock - Ikky dies\nBring in Corefire Imp\nTurn 3: Flamethrower\nTurn 4: Burn\nTurn 5: Burn\n",
	},
	[205065] = {
		{
			"BattlePet-0-000011D76CB1", -- [1]
			420, -- [2]
			800, -- [3]
			1559, -- [4]
			3117, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B6047C", -- [1]
			111, -- [2]
			218, -- [3]
			1736, -- [4]
			4257, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B0D34B", -- [1]
			420, -- [2]
			611, -- [3]
			170, -- [4]
			309, -- [5]
		}, -- [3]
		["teamName"] = "Praying Stingray",
	},
	[162461] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			210, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by SpruceOP\nTurn 1: Shadow Slash\nTurn 2: Curse of Doom\nTurn 3: Haunt\nBring in your Ikky\nTurn 4: Black Claw\nTurn 5+: Flock\n",
		["teamName"] = "I Am The One Who Whispers",
		["minXP"] = 25,
	},
	["To a Land Down Under (Magic)"] = {
		{
			"BattlePet-0-000012B67E7B", -- [1]
			421, -- [2]
			593, -- [3]
			0, -- [4]
			1766, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C7B7", -- [1]
			1570, -- [2]
			465, -- [3]
			1068, -- [4]
			1962, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B822C1", -- [1]
			1938, -- [2]
			475, -- [3]
			277, -- [4]
			2836, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Arcane Blast\nTurns 2-4: Surge of Power -- Bassalt will die & Clawz will come in during your Recovery\nTurn 5+: Arcane Blast - if none of these hit it's (probably) fine\nBring in your Creeping Tentacle\nPrio 1: Illusionary Barrier if there's 1 round left on Whirlpool\n~: Pass while Illusionary Barrier is up\nPrio 2: Forboding Curse if Clawz has > 778 hp\nPrio 3: Tentacle Slap until Clawz dies\nMurrey comes in\nTurn 1: Forboding Curse\nTurn 2: Swap to your Eye of Corruption\nTurn 3: Chaos Beam\nTurn 4: Life Exchange\nTurn 5: Chaos Beam\nTurn 6: Eyeblast\nTurn 7+: Chaos Beam until Murrey dies\n\nIf your Creeping Tentacle needs to come back in:\nTurn 1: Illusionary Barrier\nTurn 2: Pass - skip this if you're slower than Murrey\nTurn 3: Forboding Curse\nTurn 4+: Tentacle Slap\n",
	},
	[154924] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			0, -- [2]
			786, -- [3]
			0, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [3]
		["teamName"] = "Goldenbot XD",
		["notes"] = "Strategy added by Akxur#2166\nTurn 1: Blistering Cold\nTurn 2: Pass\nTurn 3: Swap to your Level Pet\nTurn 4: Swap to your Boneshard\nTurn 5: Blistering Cold\nTurn 6: Pass\nBring in your Ikky\nTurn 1: Black Claw\nTurns 2-4: Flock\n",
	},
	[173129] = {
		{
			"BattlePet-0-000012B118A8", -- [1]
			0, -- [2]
			752, -- [3]
			998, -- [4]
			1567, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4874E", -- [1]
			0, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B673F3", -- [1]
			0, -- [2]
			208, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [3]
		["teamName"] = "Thenia's Loyal Companions",
		["notes"] = "Strategy added by Lazey\nIf you're eager to save 1 round, you could start with Soulrush directly. This way you can use any Soulrush pet with >300 Power with the risk that your pet is put to sleep and you'll have to Pass & Soulrush again. But when the Sleep happens, you could also restart the fight without healing, your Soulrush pet has only one job...trigger the forced pet swap with one big hit.(Script and steps will include Ethereal of a Sentinel's Companion to avoid the Sleep, but the script should react properly if you manually used Soulrush first round)(10-11 rounds)*** Created on Beta, so maybe not final  ***\n\nTurn 1: Ethereal\nTurn 2: Soulrush\nTurn 3: If Soulrush stunned the enemy, swap your Dragonkin, otherwise Pass (forced pet swap)\nTurn 4: Arcane Storm\nTurn 5-7: Mana Surge (at least one enemy pet will die, maybe two)\n(Turn 8): (Arcane Storm / Soulrush to kill the second pet if needed)\nBring in your Mech\nTurn 1: Supercharge\nTurn 1: Ion Cannon\n",
	},
	[173257] = {
		{
			"BattlePet-0-000006E4C754", -- [1]
			422, -- [2]
			1231, -- [3]
			218, -- [4]
			1931, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B673F3", -- [1]
			1585, -- [2]
			208, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [3]
		["teamName"] = "Mighty Minions of Maldraxxus",
		["notes"] = "Strategy added by Faymos#1176\nBased on strategy added by DragonsAfterDark, substituted Court Scribe for Lesser Voidwalker\n\nTurn 1: Curse of Doom\nTurn 2: Consume Magic\nTurn 3+: Shadow Shock until Bloog dies\nBone Crusher comes in\nTurn 1+: Shadow Shock until Court Scribe dies\nBring in your Microbot XD\nTurn 1: Supercharge\nTurn 2: Ion Cannon\nChipper comes in\nTurn 1: Recover\nTurn 2: Recover\nTurn 3: Swap to your Nexus Whelpling\nTurn 4: Arcane Storm\nTurns 5-7: Mana Surge\nIf your Microbot XD is swapped in:\nTurn 1: Alert!\nTurn 2: Supercharge\nTurn 3: Ion Cannon\n",
	},
	[154925] = {
		{
			0, -- [1]
		}, -- [1]
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [3]
		["teamName"] = "Creakclank",
		["notes"] = "Strategy added by Dpaul\nLevel pet variation on Kylana#1731's strategy\n\nTurn 1: Pass\nBring in your Boneshard\nTurn 3: Blistering Cold\nTurn 4: Chop\nBring in your Ikky\nTurn 6: Black Claw\nTurn 7: Flock\n",
	},
	[173130] = {
		{
			"BattlePet-0-000006E4C756", -- [1]
			398, -- [2]
			402, -- [3]
			745, -- [4]
			162, -- [5]
		}, -- [1]
		{
			"BattlePet-0-0000088F2EFD", -- [1]
			901, -- [2]
			592, -- [3]
			1756, -- [4]
			2119, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B673F3", -- [1]
			1585, -- [2]
			208, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [3]
		["teamName"] = "Micro Defense Force",
		["notes"] = "Strategy added by Mutanis\nIf you don't have Microbot XD then try [url=https://wow-petguide.com/?Strategy=11370]this one.[/url]\n\nTurn 1: Stun Seed\nTurn 2: Poison Lash\nTurn 3: Leech Seed (Slasher comes in)\nTurn 4: Poison Lash\nTurn 5: Swap to your Fel-Afflicted Skyfin\nTurn 6: Wild Magic\nTurn 7: Wing Buffet (Battery comes in)\nTurn 8: Fel Immolate --> Battery dies (Slasher comes in)\nTurn 9: Fel Immolate --> Slasher dies (Pounder comes in)\nTurn 10: Swap to your Microbot XD\nTurn 11: Supercharge\nTurn 12: Ion Cannon (Pounder uses explode)\n",
	},
	[142151] = {
		{
			"BattlePet-0-000012B01ED3", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["minHP"] = 501,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2216\n\nStrategy added by Laponko\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up\nTurn 5: Swap to Level Pet\nTurn 6: Swap to Iron Starlette\nTurn 7: Wind-Up\n",
		["teamName"] = "You've Never Seen Jammer Upset",
		["minXP"] = 25,
	},
	["To a Land Down Under (Mech)"] = {
		{
			"BattlePet-0-000012B48958", -- [1]
			482, -- [2]
			392, -- [3]
			208, -- [4]
			1178, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B96D57", -- [1]
			118, -- [2]
			208, -- [3]
			282, -- [4]
			2667, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Sevena\nTurn 1: Extra Plating\nTurn 2: Supercharge\nTurn 3: Laser\nTurn 4: Laser\nClawz comes in\nBring in your Motorized Croaker\nTurn 1: Supercharge\nTurn 2: Water Jet\nTurn 3: Water Jet\nMurrey comes in\nTurn 1: Water Jet\nTurn 2: Supercharge\nTurn 3: Explode\nBring in your Iron Starlette\nTurn 1: Wind-Up\nTurn 2: Wind-Up\n",
	},
	[173131] = {
		{
			"BattlePet-0-000012B58B24", -- [1]
			777, -- [2]
			282, -- [3]
			334, -- [4]
			339, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			640, -- [3]
			0, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CC", -- [1]
			0, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [3]
		["teamName"] = "Cliffs of Bastion",
		["notes"] = "Strategy added by Taizun\nStrategy is based on another strategy by [url=https://www.wow-petguide.com/?user=4320]Lazey[/url], found [url=https://www.wow-petguide.com/?Strategy=9906]here[/url], but with enough changes that I felt a new strategy and updated tdscript was needed.Strategy has only been tested with P/P, P/B and P/S Iron Starlette, please leave a comment if other variations work as well.\n\nTurn 1: Decoy\nTurn 2+: Missile until Shelby HP <= 618, then Explode\nShelby dies, bring in Iron Starlette\nTurn 1-2: 2x Wind-Up\nTinyhoof dies, Glitterwing comes in\nTurn 3+: Toxic Smoke until Iron Starlette dies\nBring in Chrominius\nTurn 1: Surge of Power if enemy HP <= 1110, otherwise Howl\nTurn 2: Surge of Power\n",
	},
	[141002] = {
		{
			"BattlePet-0-000012B01ED3", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			779, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1745\n\nStrategy added by Lazey\n*** 9.0.2 approved ***\n\nIt's very rare, but if an early Sweep forces a pet swap on your side, I recommend a Restart.\n\nLevel Pet will get all XP cause both carry pets die.\n\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up, Dead Deckhand Leonard dies.\nCorrupted Slime comes in\nTurn 1: Powerball\nTurn 2: Supercharge\nTurn 3+: Prio 1: Unleash Wind-Up attack if Failsafe was triggered. Don't apply new Wind-Up\nPrio 2: Powerball\nIron Starlette dies, bring in your Mechanical Pandaren Dragonling\nTurn 1+: Use Thunderbolt if you're sure the split damage will kill Corrupted Slime, otherwise Breath.\nReanimated Kraken Tentacle comes in\nTurn 1: Prio 1: Explode if Kraken Tentacle has 560HP or less.\nPrio 2: Thunderbolt\nPrio 3: Breath\n",
		["teamName"] = "Sea Creatures Are Weird ",
		["minXP"] = 1,
	},
	["Are They Not Beautiful? (Humanoid)"] = {
		{
			"BattlePet-0-000012B822C0", -- [1]
			1066, -- [2]
			752, -- [3]
			1760, -- [4]
			2833, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C775", -- [1]
			413, -- [2]
			206, -- [3]
			586, -- [4]
			119, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00000D640E69", -- [1]
			608, -- [2]
			471, -- [3]
			592, -- [4]
			1634, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by BurntGinger#1399\nYou should rely more heavily on the script then what's written down below. Don't waste cooldowns on mobs about to die, and quit if Beeks is still alive and all you got is a Withered boi. I test and fine tune strategies before posting, so let it be known there is RNG here.\n\nTurn 1: Creeping Insanity\nTurn 2: Spiritfire Bolt\nTurn 3: Spiritfire Bolt\nTurn 4: Swap to your Father Winter's Helper. Fethres dies due to Creeping Insanity....usually. Use Ice Lance if active still.\nTurn 5: Gift of Winter's Veil\nTurn 6: Call Blizzard if possible. Otherwise skip to Turn 8\nTurn 7: Ice Lance until you die. Bring back in Void-Scarred Anubisath\nTurn 8: Soulrush if Beeks still up. Otherwise, Turn 9.\nTurn 9: Creeping Insanity\nTurn 10: Spiritfire Bolt or pass. Void-Scarred Anubisath dies usually, bring in Wretched Servant\nTurn 11: Weakness\nTurn 12: Nether Blast until Talons dies.\n",
	},
	[72290] = {
		{
			"BattlePet-0-0000080DA4CD", -- [1]
			411, -- [2]
			0, -- [3]
			167, -- [4]
			323, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D1", -- [1]
			921, -- [2]
			919, -- [3]
			0, -- [4]
			1180, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 4,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10424\n\nStrategy added by norng\n5 rounds.\n\nTurn 1: Nut Barrage\nTurn 2: Woodchipper - Nuts dies\nBring in your Zandalari Kneebiter\nTurn 1: Black Claw\nTurns 2-3: Hunting Party - Zao, Calfling of Niuzao dies\n",
		["teamName"] = "Zao, Calfling of Niuzao",
		["minXP"] = 1,
	},
	[66733] = {
		{
			"BattlePet-0-000012B146CA", -- [1]
			1002, -- [2]
			392, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CC", -- [1]
			299, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			779, -- [3]
			334, -- [4]
			844, -- [5]
		}, -- [3]
		["teamName"] = "Mo'ruk",
		["notes"] = "Strategy added by unknown\nStrategy by Rendigar published on [url=https://www.warcraftpets.com/community/forum/viewtopic.php?f=3&t=7556#p57980]Warcraft Pets[/url].\n\nTurn 1: Missile \nTurn 2: Decoy \nTurns 3+: Missile until Woodcarver is dead \nLightstalker comes in \nTurn 1: Swap to Chrominius\nTurn 2: Howl \nTurn 3: Surge of Power – Lightstalker dies\nNeedleback comes in and kills Chrominius \nBring back in your Darkmoon Zeppelin\nTurn 1 : Missile \nTurn 2: Missile \nTurn 3: Decoy \nTurns 4+: Missile until Needleback is below 619 health \nExplode \nYour level pet enjoys the XP!\n",
	},
	[162465] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			0, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Dune Buggy",
		["notes"] = "Strategy added by Vulpixie\nWorked well for me when I had to have the Shadowbarb Hatchling in the team.Ikky with Black Claw and Flock is also an acceptable alternative to the Zandalari.Thank you to DragonsAfterDark for fixing my script.\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: BONESTORM\nTurn 4: Chop until Boneshard dies\nBring in your Zandalari Anklerender\nTurn 1: Black Claw\nTurn 2: Hunting Party\nTurn 8: Zandalari dies, Blistering Cold should finish off the battle with your level pet getting some XP\n",
	},
	[173324] = {
		{
			"BattlePet-0-000012B146CA", -- [1]
			1002, -- [2]
			392, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B484E9", -- [1]
			210, -- [2]
			218, -- [3]
			0, -- [4]
			1238, -- [5]
		}, -- [3]
		["teamName"] = "Eyegor's Special Friends",
		["notes"] = "Strategy added by Haervael#2816\nI was struggling to win this fight so I tried to mix up some strategies and I came up with this one which has never failed so far.Hope this helps some of you.\n\nYour Lil' Bling comes in\nTurn 1: Make it Rain\nTurn 2: Extra Plating\nTurns 3-5: Inflation\nBoneclaw dies\nSpindler comes in\nTurn 6: Make it Rain or Lil' Bling is dead already.\n\nBring in your Iron Starlette\nTurn 7: Wind-Up\nTurn 8: Supercharge\nTurn 9: Wind-Up\nSpindler dies\nRocko comes in\nTurn 10: Wind-Up\nTurn 11: Wind-Up\nTurn 12: Toxic Smoke\nIron Starlette dies\n\nBring in your Unborn Val'kyr\nTurn 13: Curse of Doom\nTurn 14~19: Shadow Slash until Rocko dies.\n",
	},
	[99150] = {
		{
			"BattlePet-0-000012B5CB74", -- [1]
			347, -- [2]
			453, -- [3]
			124, -- [4]
			3355, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000006E4C77C", -- [1]
			477, -- [2]
			206, -- [3]
			481, -- [4]
			117, -- [5]
		}, -- [3]
		["teamName"] = "Tiny Poacher, Tiny Animals",
		["notes"] = "Strategy added by Visard\nIf Echo of the Cave crits on sandstorm or the first rampage on Egcellent, you will have to swap to Tiny snowman after rampage and swap to your levelling pet after Deep freeze, then go back on Echo and use Rampage, script takes that into account.chance to fail if Red Wire applies flame jet and keeps critting before Tiny Snowman can Deep freeze\n\nTurn 1: Roar\nTurn 2: Sandstorm\nTurns 3-5: Rampage\nSkip to Turn 7 if Red Wire is active\nTurn 6: Swap to your Level Pet (Egcellent will feign death)\nTurn 7: Swap to your Tiny Snowman\nTurn 8: Snowball\nTurn 9: Call Blizzard\nTurn 10: Deep Freeze\nIf you swapped turn 6 to Tiny Snowman, swap to Level Pet\nTurn 11: Swap to your Echo of the Cave\nTurns 12-14: Rampage\n\n",
	},
	[99182] = {
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012C5B130", -- [1]
			393, -- [2]
			256, -- [3]
			169, -- [4]
			1385, -- [5]
		}, -- [3]
		["teamName"] = "Fight Night: Sir Galveston",
		["notes"] = "Strategy added by Mutanis\nTurn 1: Flame Breath\nTurn 2: Flame Breath\nTurn 3: Time Bomb\nTurn 4: Armageddon\nBring in your Level Pet\nTurn 5: Swap to your Albino Chimaeraling\nTurns 6-7: Deep Breath\nTurn 8: Call Darkness\n",
	},
	[173133] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			0, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Mega Bite",
		["notes"] = "Strategy added by bios\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up\nTurn 5: Wind-Up\n",
	},
	[162466] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			0, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			0, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			779, -- [3]
			334, -- [4]
			844, -- [5]
		}, -- [3]
		["teamName"] = "Watch Where You Step",
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Lil' Bling\nTurn 1-3: Inflation\nTurn 4: Make it Rain\nTurn 5+: Inflation\n\nIf needed: \nBring in your Mechanical Pandaren Dragonling\nTurn 1+: Breath\n",
	},
	["To a Land Down Under (Aquatic)"] = {
		{
			"BattlePet-0-000012B90213", -- [1]
			0, -- [2]
			2062, -- [3]
			595, -- [4]
			2765, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B6AE3C", -- [1]
			484, -- [2]
			297, -- [3]
			2360, -- [4]
			2865, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B01E72", -- [1]
			459, -- [2]
			0, -- [3]
			2342, -- [4]
			3306, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nThe 1325 health restriction will get you through a Mudslide & Alpha Strike attack, but not if any of it crits.Update: Added instructions in case your Voidskimmer will survive Murrey's Bite, which will throw off Quack-E's turns.\n\nTurn 1: Sewage Eruption\nTurn 2: Moonfire if you don't survive to apply this, restart\nTurn 3: Pass\nBring in your Voidskimmer\nTurn 1: Feedback if Bassalt is still alive\nClawz comes in\nTurn 1: Pump\nTurn 2: Feedback\nTurn 3: Pump\n~: If your Voidskimmer does not survive Clawz or to eat the Superbark from Murrey, restart\nMurrey comes in\nTurn 1: Feedback\nTurn 2: Void Tremors\nTurn 3: Pass if you have < 353 hp OR Swap to your Quack-E if you have > 352 hp\nBring in your Quack-E\nTurn 1: Wind-Up\nTurn 2: Wind-Up -- This should hit when Tough n' Cuddly has dropped off. If it still has 1 round then Overcharge > Wind-Up\n~: If Murrey's hp is < 116 Overcharge, otherwise:\nTurn 4: Wind-Up\nTurn 5: Wind-Up - you win with 1 hp because lol Superbark\n",
	},
	[154929] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			0, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			0, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [3]
		["teamName"] = "Unit 17",
		["notes"] = "Strategy added by Tinlar#1408\nThank you to shpungout for the suggestion on how to streamline the strategy\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: Swap to your Level Pet\nTurn 4: Swap to your Zandalari Anklerender\nTurn 5: Black Claw\nTurns 6-7: Hunting Party\n",
	},
	[87110] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			422, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01E39", -- [1]
			422, -- [2]
			218, -- [3]
			772, -- [4]
			1628, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Tarr the Terrible",
		["notes"] = "Strategy added by Cenobite\n11-12 TurnsI've been using the snail/grub strat for forever and thought, why don't I try to optimize this 20+ turn strat and make it faster.Sister of Temptation New Meta\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Sister of Temptation\nTurn 3: Lovestruck <<< This will prevent SHIELDSTORM >>>\nTurn 4: SHADOW SHOCK\nTurn 5: Shadow Shock --- Murkalot Dies ---\nTurn 6: Shadow Shock --- Deathy Dies ---\nTurn 7: Curse of Doom\nTurn 8: Bring in your Leveling Pet\nTurn 9: Bring in whichever of Unborn or Sister with highest hp\nTurn 10-11(12): Shadow Shock to finish ++++ Usually takes 2 hits. If you die to the leap just switch to the other pet and do the last hit.\n11 turns if you survive the leap, otherwise 12. My breeds are B/B Valk and P/B Sister. But I don't think it will mather whichever one you got.\n",
	},
	[140813] = {
		{
			"BattlePet-0-000012B485C2", -- [1]
			118, -- [2]
			564, -- [3]
			513, -- [4]
			868, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B2E223", -- [1]
			118, -- [2]
			0, -- [3]
			0, -- [4]
			1934, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B66C49", -- [1]
			509, -- [2]
			123, -- [3]
			513, -- [4]
			746, -- [5]
		}, -- [3]
		["teamName"] = "Rogue Azerite",
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2293\n\nStrategy added by tacagero#2570\nTurn 1: Whirlpool\nTurn 2: Dive\nTurn 3: Water Jet\nAzerite Geode comes in\nTurn 4: Whirlpool\nTurn 5: Water Jet\nTurn 6: Water Jet\nBring in your Emperor Crab\nTurn 7: Surge\nTurn 8: Surge\nAzerite Elemental comes in\nTurn 9: Whirlpool\nTurn 10: Healing Wave\nTurn 11: Surge\nTurn 12: Surge\nBring in your Benax\nTurn 13: Water Jet\nTurn 14: Water Jet\n",
	},
	[66734] = {
		{
			0, -- [1]
		}, -- [1]
		{
			"BattlePet-0-000012B18C43", -- [1]
			118, -- [2]
			230, -- [3]
			297, -- [4]
			383, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [3]
		["teamName"] = "Farmer Nishi",
		["notes"] = "Strategy added by Malhado\nTurn 1: Your best one round defensive or, if none, ofensive ability.\nTurn 2: Swap to your Eternal Strider\nTurn 3: Cleansing Rain\nTurn 4: Pump\nTurn 5: Pump\nTurn 6: Water Jet\nSiren dies and Toothbreaker enters the fight.\nTurn 1: Water Jet\nTurn 2: Cleansing Rain\nTurn 3: Pump\nTurn 4: Pump\nToothbreaker dies. Brood of Mothallus comes in.\nTurn 1: Water Jet\nTurn 2: Pass if slower / Water Jet if faster\nTurn 3: Pass\nEternal Strider dies. Bring your Iron Starlette in.\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\n",
	},
	[201878] = {
		{
			"BattlePet-0-000012B17368", -- [1]
			0, -- [2]
			2349, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B15603", -- [1]
			0, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000011F1418A", -- [1]
			420, -- [2]
			800, -- [3]
			1050, -- [4]
			2921, -- [5]
		}, -- [3]
		["teamName"] = "Paws of Thunder",
		["notes"] = "Strategy added by WhyDaRumGone\nTurn 1: Toxic Fumes\nTurn 2: Poison Protocol\nBring in your Timeless Mechanical Dragonling\nTurn 3: Time Bomb\nTurn 4: Armageddon\nGorm Harrier comes in\nTurn 5: Impale\nDrakeula comes in\nTurn 6: Slicing Wind\nTurn 7: Puncture Wound, Yu'shor is swapped in and hit by this\nDrakeula comes in, Or ( Yu'shor might survive if you're not using Gorm Harrier )\nTurn 8: Pass if Drakeula is back in, OR ( Use Impale if Yu'shor is still alive )\n",
	},
	[145988] = {
		{
			"BattlePet-0-0000088F2EFD", -- [1]
			901, -- [2]
			592, -- [3]
			1756, -- [4]
			2119, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [2]
		{
			"BattlePet-0-0000086053F1", -- [1]
			514, -- [2]
			592, -- [3]
			1756, -- [4]
			2118, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/17924\n\nStrategy added by itsemmaelise#1345\nTurn 1: Wild Magic\nBoneshard comes in\nTurn 2: Blistering Cold\nTurn 3: Chop\nTurn 4: Chop\nTurn 5: Blistering Cold\nTurn 6: Chop\nTurn 7: Chop\nBring in your Fel-Afflicted Skyfin\nTurn 8: Wild Magic\n",
		["teamName"] = "Pulverizer Bot Mk 6001",
	},
	["Are They Not Beautiful? (Magic)"] = {
		{
			"BattlePet-0-00000D5451F8", -- [1]
			792, -- [2]
			2223, -- [3]
			466, -- [4]
			2352, -- [5]
		}, -- [1]
		{
			"BattlePet-0-0000129D3A43", -- [1]
			0, -- [2]
			2505, -- [3]
			163, -- [4]
			3580, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00000A3564FB", -- [1]
			1066, -- [2]
			0, -- [3]
			913, -- [4]
			2550, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by glowcloud\nSucceeds more often than it fails, but really I just wanted to let Baa'l and Baa'lial hangout <3\n\n**: If at any time your 1 ability will kill the enemy, just use that.\n\nTurn 1: Murder the Innocent\nTurn 2: Nether Gate\nTurn 3: Darkflame\n\n~~: Swap to your Baa'lial\nTurn 1: Hatred Manifest\nTurns 2-4: Stampede\nBeeks should die and Fethres come in\nTurn 5: Stampede\n\nBring in your Zur'aj the Depleted\nIf Fethres and/or Beeks still alive, Spiritfire Bolt\nTurn 1: Spectral Spine\nTurn 2+: Spiritfire Bolt\n\n~~: If Talons lives, bring in Baa'l\nTurn 1: Murder the Innocent\n",
	},
	[162468] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			210, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B67566", -- [1]
			163, -- [2]
			666, -- [3]
			0, -- [4]
			627, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7732\n\nStrategy added by ForestBoy#2243\nTurn 1: Shadow Slash\nTurn 2: Pass\nTurn 3: Curse of Doom\nTurn 4: Haunt\nBring in your Infected squirrel\nTurn 1: Rabid Strike\nTurn 2: Stampede\nAt this point K'tiny should be dead, if not bring in 3rd pet and finish it.\n",
		["teamName"] = "Tiny Madness",
		["minXP"] = 25,
	},
	[173263] = {
		{
			"BattlePet-0-000012B15603", -- [1]
			0, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B607A8", -- [1]
			447, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B673F3", -- [1]
			0, -- [2]
			0, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [3]
		["teamName"] = "Extra Pieces",
		["notes"] = "Strategy added by Mutanis\nTurn 1: Time Bomb\nTurn 2: Armageddon\nBring in your Anomalus\nTurn 3: Corrosion\nTurn 4: Poison Protocol\nTurn 5: Corrosion (second #2 enemy comes in)\nTurn 6: Void Nova\nTurn 7: Pass\nBring in your Microbot XD\nQuestion: Second enemy is still activ?\nYES: pass (Turn8) --> next round Ion Cannon (Turn 9-10)\nNO: Ion Cannon (Turn 8-9)\n",
	},
	["Are They Not Beautiful? (Dragon)"] = {
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01E0B", -- [1]
			908, -- [2]
			489, -- [3]
			589, -- [4]
			3382, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C7A1", -- [1]
			421, -- [2]
			593, -- [3]
			589, -- [4]
			320, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Kalagren\nNexus Whelpling comes in\nTurn 1: Arcane Storm\nThen follow priorities for both Nexus Whelpling and Stormie:\n(This means bringing in Stormie when Nexus Whelpling dies)\nPrio 1: Mana Surge\nPrio 2: Arcane Storm\nPrio 3: Jolt / Tail Sweep\nBring in your Lil' Tarecgosa\nPrio 1: Surge of Power when Talons is active and within kill range \nor Dragonkin racial is active (Must be the finisher)\nPrio 2: Arcane Blast / Arcane Storm if not in Surge of Power finishing range\n",
	},
	["Mini Manafiend Melee"] = {
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			2237, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["minHP"] = 204,
		["notes"] = "Strategy added by Ratsch#21832\nFlying level pets need atleast 306 HP otherwise they'll die to Psionic StormIf we don't count crits, your leveling pets needs these amounts of hp:Flying: >306Mechanic: >134everything else: >203\n\nTurn 1: Flame Breath\nTurn 2: Razor Talons\nTurn 3: Flame Breath\nTurn 4: Armageddon\nBring in your Mechanical Pandaren Dragonling\nTurn 5: Explode\n",
		["minXP"] = 3,
	},
	[162469] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8935\n\nStrategy added by Tinlar#1408\nYour leveling pet will take some minor back-line damage.\n\nTurn 1: Blistering Cold\nTurn 2: Chop\nEnemy forces pet change to Ikky\nTurn 1: Black Claw\nTurn 2: Flock\nBring in your Level Pet\nTurn 1: Swap to your Boneshard\nTurn 2: BONESTORM or pass\n",
		["teamName"] = "Brain Tickling",
		["minXP"] = 1,
	},
	[146181] = {
		{
			"BattlePet-0-000006E4C761", -- [1]
			118, -- [2]
			667, -- [3]
			669, -- [4]
			225, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00001299F70E", -- [1]
			319, -- [2]
			945, -- [3]
			179, -- [4]
			3511, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C757", -- [1]
			429, -- [2]
			247, -- [3]
			345, -- [4]
			1706, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Strategy added by Krafty\nCreated this so I won't have to watch Blistering Cold tick down.every.round.and.damage.proc.Oracle Hatchling can sometimes solo this fight if the backline pets are weak and slower. Bring pets to defeat machines, leper rats and cockroaches.Script only includes Oracle Hatchlings priority\n\nTurn 1: Backflip\nTurn 2: Water Jet\nTurn 3: Aged Yolk\nTurn 4+: Backflip on cooldown (unless you face Cockroach or are slower, and at round 2 or 3 against Gnomish Rocket Chicken)\nAged Yolk if Blistering Cold is applied\nWater Jet as filler\n",
		["teamName"] = "Living Permafrost",
		["minXP"] = 25,
	},
	[140880] = {
		{
			"BattlePet-0-000012B4838C", -- [1]
			525, -- [2]
			597, -- [3]
			598, -- [4]
			1167, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by Runisco\nPrio 1: Emerald Presence up. Use when 1 turn left\nPrio 2: Emerald Dream when health < 750\nPrio 3: Standby. There is no point in attacking, the bees stinging is cooldown based\nAs soon as one bee uses sting and dies, the others will. Your whelp should survive all 3.\n",
		["teamName"] = "What's the Buzz?",
		["minXP"] = 25,
	},
	[162470] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			0, -- [2]
			212, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Living Statues Are Tough",
		["notes"] = "Strategy added by F1NCH#2182\nBooth Val'kyr work, but with H/H Breed the fight is 1 round longer\n\nTurn 1: Siphon Life\nTurn 2: Haunt\nBring in your Ikky\nTurn 1: Black Claw\nTurn 2: Flock\n",
	},
	[146182] = {
		{
			"BattlePet-0-000012B67C89", -- [1]
			2067, -- [2]
			934, -- [3]
			564, -- [4]
			2399, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B3E786", -- [1]
			626, -- [2]
			919, -- [3]
			706, -- [4]
			2648, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B4C1CA", -- [1]
			419, -- [2]
			745, -- [3]
			828, -- [4]
			650, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9709\n\nStrategy added by versailes\nPrio 1: Dive\nPrio 2: Bubble\nPrio 3: Pinch until Living Sludge is dead.\n\nAn enemy pet comes in Switch pet according to the next pet's family\nCredit: Backline Pet Strategy is by GermanPolo#2220 https://www.wow-petguide.com/?Strategy=9514\n\nUndead=Chitterspine\nPrio 1: Black Claw\nPrio 2: Swarm\nPrio 3: Skitter\n\nMechanical= Terrible Turnip\nPrio 1: Sons of the Root\nPrio 2: Leech Seed\nPrio 3: Tidal Wave\n",
		["teamName"] = "Living Sludge",
	},
	[196069] = {
		{
			"BattlePet-0-000006E4C775", -- [1]
			413, -- [2]
			206, -- [3]
			624, -- [4]
			119, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B17368", -- [1]
			447, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B01DE0", -- [1]
			413, -- [2]
			0, -- [3]
			0, -- [4]
			120, -- [5]
		}, -- [3]
		["teamName"] = "The Grand Master",
		["notes"] = "Strategy added by Mutanis\nTurn 1: Ice Tomb\nTurn 2: Call Blizzard\nTurn 3: Ice Lance\nMPD comes in\nTurn 1: Ice Lance\nTurn 2: Ice Lance\nTurn 3: Swap to your Anomalus\nTurn 4: Poison Protocol\nTurn 5: Void Nova\nTurn1 6+: Corrosion until Anomalus dies\nBring in your Winter's Little Helper\nTurns 1+: Ice Lance until Spectral Tiger Cub dies\n\n",
	},
	[139987] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			0, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			0, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [3]
		["teamName"] = "This Little Piggy Has Sharp Tusks",
		["notes"] = "Strategy added by gsanta\nI was able to bring a Level 1 pet with no damage taken.\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nTurn 3: Bring in your Level Pet\nTurn 4: Swap to your Lil' Bling\nTurn 5: Make it Rain\nTurn 6+: Inflation\n",
	},
	[146183] = {
		{
			"BattlePet-0-000012BA950B", -- [1]
			1372, -- [2]
			276, -- [3]
			1380, -- [4]
			1541, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B61DE8", -- [1]
			630, -- [2]
			268, -- [3]
			318, -- [4]
			856, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012BA9570", -- [1]
			803, -- [2]
			538, -- [3]
			160, -- [4]
			2157, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Strategy added by Krafty\nTurn 1: Shell Armor\nTurn 2+: Deep Bite until Living Napalm is defeated\nAn enemy pet comes in\nFinish off backline pets. Your Hydraling packs quite  a punch with a fully stacked Deep Bite! \n",
		["teamName"] = "Living Napalm",
		["minXP"] = 25,
	},
	["Yu'la, Broodling of Yu'lon"] = {
		{
			"BattlePet-0-00000D5451F8", -- [1]
			792, -- [2]
			2223, -- [3]
			0, -- [4]
			2352, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00000D511EB1", -- [1]
			475, -- [2]
			2223, -- [3]
			0, -- [4]
			3041, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["tab"] = 2,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/17855\n\nStrategy added by WhyDaRumGone\nTurn 1: Murder the Innocent\nTurn 2: Swap to your Death Seeker\nTurn 3: Murder the Innocent\nTurn 4: Eyeblast\nTurn 5: Pass, Death Seeker dies.\nBring in your Level Pet\nTurn 6: Swap to your Baa'l\nTurn 7: Darkflame\nTurn 8: Murder the Innocent\n",
		["minXP"] = 1,
	},
	[142096] = {
		{
			"BattlePet-0-000012B17368", -- [1]
			447, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B118A8", -- [1]
			1233, -- [2]
			752, -- [3]
			595, -- [4]
			1567, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7734\n\nStrategy added by Shenk\nThanks @Rosqo for the idea.\n\nTurn 1: Void Nova\nTurn 2: Poison Protocol\nTurn 3: Corrosion\nTurn 4: Corrosion. Both pets die (Should your Anomalus already be dead before it can attack just bring in Sentinel's Companion and finish Lazy with [spell=Dark Talon].)\nBring in your Sentinel's Companion\nSpokes comes in\nTurn 1: Soulrush. Spokes dies\nSkeeto comes in\nTurn 1: Moonfire\n",
		["teamName"] = "Critters are Friends, Not Food",
		["minXP"] = 1,
	},
	[107489] = {
		{
			"BattlePet-0-000012B99945", -- [1]
			116, -- [2]
			426, -- [3]
			453, -- [4]
			2417, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B6AE3C", -- [1]
			0, -- [2]
			297, -- [3]
			230, -- [4]
			2865, -- [5]
		}, -- [3]
		["teamName"] = "Fight Night: Amalia",
		["notes"] = "Strategy added by Berendain\nUpdate:  TD Script updated on 20th May, 2021.  Make sure you have the updated script.You should never need to use pet bandages when leveling using this team.  You may occasionally want to heal your pets, but the revive pets ability, available every 8 minutes, will be more than enough.Using this strategy, you will normally win between 1:15 and 1:25.  You may win in as short a time as 1:12.  On the other hand, if you get unlucky and miss Stumpers' Cute Face several times in a row, the fight may take much longer.  The longest the fight has taken me was 1:55, after I missed Stumpers four times.The TD script works if you're using an Abyssal Eel, which has Acid Rain instead of Cleansing Rain.  The fight will take the same amount of time, but without healing your team each fight you may need to use a pet bandage occasionally.  \n\nTurn 1: Focus\nTurn 2: Sandstorm\nTurn 3: Zap until Foof dies\nStumpers comes in\nTurn 1: Zap\nTurn 2: Swap to your Level Pet\nTurn 3: Swap to your Ranishu Runt\nFollow this priority list until Stumpers dies:\nPriority 1: Refresh Focus when it has 1 round remaining (or has expired)\nPriority 2: Sandstorm\nPriority 3: Zap\nLil' Sizzle comes in\nTurn 1: Swap to your Voidskimmer\nTurn 2: Pump\nTurn 3: Cleansing Rain\nTurn 4: Unleash Pump and Lil' Sizzle dies\n",
	},
	[150911] = {
		{
			"BattlePet-0-000012B99CF2", -- [1]
			421, -- [2]
			906, -- [3]
			1754, -- [4]
			2078, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012BC0A5A", -- [1]
			115, -- [2]
			647, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C794", -- [1]
			499, -- [2]
			657, -- [3]
			1043, -- [4]
			1964, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Strategy added by Kirandji\nIt depends on the backliners if its a onepetstrat or not. Against magics this setup strat is a onepetter, the mech pandaren will punch the undead and the magics. Thanks & credits to Shaka 4 the script\n\nTurn 1: Fire Shield on CD\nTurn 2: Lightning Shield on cd\nTurn 3: Arcane Blast as spammer\nTurn 4: it depends on the back, if no magics tron wont make it alone. Bring in the dragonling.\nTurn 5: Decoy\nTurn 6: Thunderbolt\nTurn 7: Breath\n",
		["teamName"] = "Crypt Fiend",
	},
	[141969] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			210, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			1773, -- [2]
			1758, -- [3]
			518, -- [4]
			1975, -- [5]
		}, -- [3]
		["teamName"] = "What Do You Mean, Mind Controlling Plants?",
		["notes"] = "Strategy added by Gershuun#1131\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Ikky\nTurn 1: Black Claw\nTurn 2: Flock\nTurn 3: Flock\nTurn 4: Flock\nTurn 5: Pass\nTurn 6: Savage Talon\nTurn 7: Black Claw (Ikky dies)\nBring in your Direbeak Hatchling\nTurn 1: Falcosaur Swarm!\n",
	},
	["To a Land Down Under (Undead)"] = {
		{
			"BattlePet-0-000012B01EED", -- [1]
			1066, -- [2]
			0, -- [3]
			752, -- [4]
			1625, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01EEC", -- [1]
			1066, -- [2]
			1105, -- [3]
			752, -- [4]
			1627, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C79F", -- [1]
			1763, -- [2]
			640, -- [3]
			0, -- [4]
			1965, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Anesthetize\nPrio 1: Soulrush\nPrio 2: Spiritfire Bolt\nThis two abilities should kill Bassalt and Clawz.\nOnes Murrey is in use Reflective Shield and same priorities until Fragment of Desire is dead\nBlightbreath comes in \nPrio 1 : Toxic Smoke\nPrio 2: Slime\n",
	},
	[68462] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B822C0", -- [1]
			1066, -- [2]
			453, -- [3]
			490, -- [4]
			2833, -- [5]
		}, -- [3]
		["minHP"] = 301,
		["notes"] = "Strategy added by Makare#1693\nI'm surprised no one has published an Ikky/Idol strat before. \n\nTurn 1: Black Claw\nTurns 2-4: Flock\nMarley dies.\nTurns 5+: Flock until Ikky dies.\nBring in your Level Pet\nTurn 1: Swap to your Void-Scarred Anubisath\nTurn 2: Sandstorm\nTurn 3+: Spiritfire Bolt until Tiptoe dies.\nPandaren Water Spirit comes in\nTurn 1: Sandstorm when available.\nWhen the Whirlpool and Geyser debuff have 1 turn left, use Deflection.\nSpiritfire Bolt and Sandstorm until Pandaren Water Spirit dies.\n",
		["teamName"] = "Flowing Pandaren Spirit",
		["minXP"] = 5,
	},
	["Chi-Chi, Hatchling of Chi-Ji (2)"] = {
		{
			"BattlePet-0-000012B5CBA7", -- [1]
			567, -- [2]
			409, -- [3]
			592, -- [4]
			1149, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B9027A", -- [1]
			445, -- [2]
			369, -- [3]
			564, -- [4]
			743, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 2,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/214\n\nTurn 1: Immolation\nTurn 2: Wild Magic\nTurn 3: Swap to your Rapana Whelk\nTurn 4: Acidic Goo\nTurn 5: Ooze Touch\nTurn 6: Ooze Touch\nTurns 7+8: Dive\n",
	},
	[196264] = {
		{
			"BattlePet-0-000012B81435", -- [1]
			447, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01E0C", -- [1]
			0, -- [2]
			0, -- [3]
			1025, -- [4]
			1632, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C782", -- [1]
			110, -- [2]
			0, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [3]
		["teamName"] = "The Terrible Three",
		["notes"] = "Strategy added by Mutanis\nTurn 1: Corrosion\nTurn 2: Void Nova\nTurn 3: Poison Protocol\nTurn 4: Corrosion\nTurn 5: Pass\nTurn 6: Void Nova\nBring in your Sunblade Micro-Defender\nTurn 7: Armageddon\nYour Chrominius comes in\nTurn 8: Bite\nTurn 9: Surge of Power\n",
	},
	[197350] = {
		{
			"BattlePet-0-000012B15603", -- [1]
			0, -- [2]
			0, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B0D34C", -- [1]
			0, -- [2]
			0, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C782", -- [1]
			110, -- [2]
			0, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [3]
		["teamName"] = "You Have to Start Somewhere",
		["notes"] = "Strategy added by Mutanis\nTurn 1: Armageddon\nBring in your Timeless Mechanical Dragonling\nTurn 2: Armageddon\nChrominius comes in\nTurn 3: Bite (Cockroach dies)\nTurn 4: Bite (Cat dies)\nTurn 5: Surge of Power (chicken dies)\n",
	},
	[169501] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:10", -- [1]
		}, -- [3]
		["teamName"] = "Shadowlands Wormhole",
	},
	[141588] = {
		{
			"BattlePet-0-000012B673F3", -- [1]
			1585, -- [2]
			208, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6995\n\nStrategy added by Shenk\nYou had your chance Remte.\n\nTurn 1: Alert!\nTurn 2: Supercharge\nTurn 3: Ion Cannon\n",
		["teamName"] = "Crawg in the Bog",
		["minXP"] = 1,
	},
	[150914] = {
		{
			"BattlePet-0-000006E4C754", -- [1]
			421, -- [2]
			1231, -- [3]
			218, -- [4]
			1931, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146C9", -- [1]
			360, -- [2]
			312, -- [3]
			163, -- [4]
			200, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B6C313", -- [1]
			319, -- [2]
			503, -- [3]
			792, -- [4]
			3448, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Strategy added by Cognosis\nTurn 1: Arcane Blast\nTurn 2: Consume Magic\nTurn 3+: Arcane Blast until all enemies are dead or Court Scribe is\nFinish off any surviving backline pets with your second pet.  I suggest a rabbit, in which case:\n1: Dodge\n2: Stampede\n3: Flurry\nRepeat until all enemies are dead\n",
		["teamName"] = "Wandering Phantasm",
	},
	[68463] = {
		{
			"BattlePet-0-000008968258", -- [1]
			406, -- [2]
			453, -- [3]
			490, -- [4]
			1155, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["notes"] = "Strategy added by unknown\nTurn 1: Crush\nTurn 2: Sandstorm\nTurn 3: Deflection\nTurns 4+: Crush until Crimson is dead (refresh Sandstorm if it comes off cooldown)\nPandaren Fire Spirit comes in\nTurn 1: Deflection (NOTE: Unfortunately if you get a crit on Crimson then Deflection will not be available and you will have to restart the fight)\nTurns 2+: Keep Sandstorm on cooldown and use Crush in between.\nImportant: When Deflection comes off cooldown, cast Crush or Sandstorm, then use Deflection again.\nPandaren Fire Spirit should die shortly after the second Deflection. \nGlowy comes in\nUse Crush until Sandstorm comes off cooldown\nThen use Sandstorm\nSwap in Level-Pet 1\nSwap in Level-Pet 2 if you want\nSwap back to Anubisath Idol\nSame as before, Sandstorm on cooldown and Crush in between until Glowy dies.\n",
		["teamName"] = "Burning Pandaren Spirit",
		["minXP"] = 5,
	},
	["Do You Even Train? (Flyer)"] = {
		{
			"BattlePet-0-000012B66DA8", -- [1]
			429, -- [2]
			312, -- [3]
			521, -- [4]
			1416, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B96E95", -- [1]
			110, -- [2]
			122, -- [3]
			0, -- [4]
			186, -- [5]
		}, -- [2]
		{
			"random:3", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by Kyzna\nBring in your Teroclaw Hatchling\nPrio 1: Hawk Eye\nPrio 2: Claw\nPrio 3: Dodge (try dodging big attacks like Curse of Doom or Dive)\nBring in your Nether Ray Fry\nPrio 1: Tail Sweep against Brul'dan\nPrio 2: Bite against Swole\nIn case something survives, you can use a backup pet.\n",
		["minXP"] = 25,
	},
	[68559] = {
		{
			"BattlePet-0-000012B146D1", -- [1]
			515, -- [2]
			779, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B1731B", -- [1]
			406, -- [2]
			521, -- [3]
			227, -- [4]
			513, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B17369", -- [1]
			111, -- [2]
			436, -- [3]
			912, -- [4]
			1177, -- [5]
		}, -- [3]
		["teamName"] = "No-No",
		["notes"] = "Strategy added by frag\nTurn 1: Wind-Up\nChange to Zandalari Anklerender\nTurn 2: Black Claw\nTurn 3-5: Hunting Party untill Anklerender is dead\nChange to Ikky\nTurn 6-9: Savage Talon untill No-No is dead (if Ikky die change to Iron Starlette)\nChange to Iron Starlette\nTurn 10: Wind-Up to end No-No\n",
	},
	[73626] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			422, -- [2]
			218, -- [3]
			321, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CA", -- [1]
			1002, -- [2]
			989, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [3]
		["teamName"] = "Little Tommy Newcomer",
		["notes"] = "Strategy added by JoCo#2522\nTurn 1: Curse of Doom\nTurn 2: Replacement for a pet with maximum health. Change back to Unborn Val'kyr\nTurn 3: Unholy Ascension\nTurn 4: Choose Ikky and use Black Claw – it will die\nYour Lil' Bling remains on the battlefield\nTurn 5: Inflation to death the enemy\n",
	},
	[87124] = {
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			2237, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Ashlei",
		["notes"] = "Strategy added by Remte\nSomeone had to do it :P\n\nTurn 1: Flame Breath\nTurn 2: Razor Talons\nTurn 3: Flame Breath – enemy Pixiebell dies\nDoodle comes in\nTurn 4: Flame Breath\nTurn 5: Razor Talons – enemy Doodle falls asleep\nTally comes in\nTurn 6: Flame Breath\nTurn 7: Razor Talons\nTurn 8: Armageddon – everything but your level pets is roasted\n",
	},
	[66739] = {
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			779, -- [3]
			334, -- [4]
			844, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00000D450504", -- [1]
			535, -- [2]
			1398, -- [3]
			1016, -- [4]
			2622, -- [5]
		}, -- [3]
		["teamName"] = "Wastewalker Shu",
		["notes"] = "Strategy added by loller#2712\nThis might be bit breed dependent on Iron Starlette, but most breeds should work. Thanks to  DeltaHit#1131 for the TD Script!\n\nTurn 1: Thunderbolt\nTurn 2: Decoy\nTurn 3: Breath\nCast Thunderbolt and decoy on CD, use breath as a filler until the first pet is dead. Continue hitting with dragonling until it dies.\nPut on Iron Starlette and cast Wind-UpSuperchargeWind-Up If you get unlucky and miss, restart if not, you should kill the second pet.\nLast pet should be weak from your thunderbolts from earlier, just cast 2x Wind-Up and you should win\n",
	},
	[71924] = {
		{
			"BattlePet-0-000011F7F5D4", -- [1]
			119, -- [2]
			312, -- [3]
			163, -- [4]
			378, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000008968258", -- [1]
			406, -- [2]
			436, -- [3]
			490, -- [4]
			1155, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012C22319", -- [1]
			1094, -- [2]
			212, -- [3]
			1093, -- [4]
			1351, -- [5]
		}, -- [3]
		["tab"] = 2,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/204\n\nScript by DaR#1285\n\nTurn 1: Scratch\nTurn 2: Scratch\nTurn 3: Dodge\nTurns 4-6: Stampede\nTurns 7+: Scratch until Cindy is dead\nAlex comes in\nCheck the Ice Tomb debuff\nEither:: 2 Turns left: Scratch, Dodge\nOr:: 1 Turn left => Dodge\nThen:: Stampede until your Rabbit is dead\nBring in your Anubisath Idol\nTurn 1: Crush\nTurn 2: Crush\nIs Alex dead?\nYes:: Skip down to Dah'da\nNo:: Use Stoneskin and then Crush until Alex is dead\n\nDah'da comes in\nTurn 1: Crush\nTurn 2: Crush\nTurn 3: Deflection\nTurns 4+: Continue to use Crush until either Dah'da or Anubisath Idol is dead\n\nIf Anubisath Idol has died, bring in your Macabre Marionette\nTurns 1-3: Dead Man's Party\nTurns 2+: Macabre Maraca until Dah'da is dead\n",
		["teamName"] = "Wrathion",
	},
	[202458] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			210, -- [2]
			218, -- [3]
			321, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C782", -- [1]
			110, -- [2]
			0, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [3]
		["teamName"] = "They're Full of Stars!",
		["notes"] = "Strategy added by Mutanis\nTurn 1: Shadow Slash\nTurn 2: Curse of Doom\nTurn 3: Unholy Ascension\nBring in your Timeless Mechanical Dragonling\nTurn 4: Time Bomb\nTurn 5: Flame Breath\nTurn 6: Armageddon\n(Chrominius comes in)\nTurn 7: Bite\nTurn 8: Surge of Power\n",
	},
	[154928] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			210, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Unit 6",
		["notes"] = "Strategy added by Plougz#2307\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Ikky\nTurn 1: Black Claw\nTurn 2: Flock\n",
	},
	[154927] = {
		{
			"BattlePet-0-000012B99CF2", -- [1]
			503, -- [2]
			906, -- [3]
			1754, -- [4]
			2078, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99C8C", -- [1]
			178, -- [2]
			1041, -- [3]
			1754, -- [4]
			2466, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B5CC26", -- [1]
			503, -- [2]
			1754, -- [3]
			179, -- [4]
			3289, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Rabid Strike\nTurn 2: Corpse Explosion\nBring in your Magma Rageling\nTurn 1: Fire Shield\n",
		["teamName"] = "Unit 35",
		["minXP"] = 25,
	},
	[197417] = {
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			2237, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["minHP"] = 204,
		["notes"] = "Strategy added by Ratsch#21832\nFlying level pets need atleast 306 HP otherwise they'll die to Psionic StormIf we don't count crits, your leveling pets needs these amounts of hp:Flying: >306Mechanic: >134everything else: >203\n\nTurn 1: Flame Breath\nTurn 2: Razor Talons\nTurn 3: Flame Breath\nTurn 4: Armageddon\nBring in your Mechanical Pandaren Dragonling\nTurn 5: Explode\n",
		["teamName"] = "Mini Manafiend Melee",
		["minXP"] = 3,
	},
	[68464] = {
		{
			"BattlePet-0-000012B4838C", -- [1]
			525, -- [2]
			597, -- [3]
			598, -- [4]
			1167, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Whispering Pandaren Spirit",
		["notes"] = "Strategy added by Kurasu#2861\nConsiderably slower compared to the use of Nexus or Stormborn whelp, but if you are leveling pets, this one gives you two pet level-up slots instead of just one. EDIT 05/24/2022: Very slight tweak for wording and efficiency but steps are still essentially the same.\n\nTurn 1: Emerald Bite. \nTurn 2: Pass\nTurn 3: Emerald Presence\nTurn 4: Swap to your Level Pet #1\nTurn 5: Swap to your Emerald Proto-Whelp\nTurn 6: Pass\nTurn 7: If Emerald Proto-Whelp is at half HP or below, Emerald Dream. Otherwise, Emerald Presence\nDusty will always use the same pattern: Moth Dust, Cocoon, Moth Ball, nothing. \nEmerald Dream at half HP, keep Emerald Presence up, Emerald Bite until dead.\nWhispertail comes in\nTurn 1+: Refresh Emerald Presence at 1 turn, Emerald Dream if at half health, Emerald Bite otherwise until dead.\nPandaren Air Spirit comes in\nTurn 1: Swap to your Level Pet #2.\nTurn 2: Swap to your Emerald Proto-Whelp\nTurn 3+: Refresh Emerald Presence at 1 turn (or if gone), Emerald Dream if at half health, Emerald Bite otherwise until dead.\n",
	},
	["Do You Even Train? (Critter)"] = {
		{
			"BattlePet-0-000012B11883", -- [1]
			974, -- [2]
			411, -- [3]
			159, -- [4]
			3020, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B11899", -- [1]
			1880, -- [2]
			0, -- [3]
			0, -- [4]
			2954, -- [5]
		}, -- [2]
		{
			"BattlePet-0-0000080D00C4", -- [1]
			110, -- [2]
			159, -- [3]
			568, -- [4]
			2116, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by isthevao#1164\nStrategy posted on [url=https://www.wowhead.com/npc=204934/trainer-orlogg#comments:id=5600054]WoWhead[/url] by DraikoGinger.\n\nPrio 1: Burrow if Lifft used Dive\nPrio 2: Woodchipper if fighting Brul'dan without the bleeding debuff\nPrio 3: Spirit Claws\nBring in your Plaguelouse Larva\nPrio 1: Plague Breath\nBring in your Orphaned Marsuul\nPrio 1: Feign Death if Swole can use Headbutt\nPrio 2: Burrow if Swole used Dive\nBite\n",
	},
	[154926] = {
		{
			"BattlePet-0-000012BC0A5A", -- [1]
			515, -- [2]
			779, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B58B24", -- [1]
			0, -- [2]
			282, -- [3]
			779, -- [4]
			339, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "CK-9 Micro-Oppression Unit",
		["notes"] = "Strategy added by WhyDaRumGone\nTurn 1: Flyby\nTurn 2: Thunderbolt\nOptional:: If CK-9 is below 1154HP due to a crit last round and you're not stunned; use Explode now (turn 3) with Mechanical Pandaren Dragonling instead of turn 6 to save a turn.\nTurn 3: Swap/Bring in your Darkmoon Zeppelin\nTurn 4: Thunderbolt\nTurn 5: Explode\nBring in your Mechanical Pandaren Dragonling\nTurn 6: Explode\n",
	},
	[68560] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			0, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Greyhoof",
		["notes"] = "Strategy added by Alexstrasza\nThis is relatively RNG-proof, with a bonus if you actually get Toxic Smoke to hit, which will make double Breath enough to kill him.As far as your 2nd pet, Any pet with Explode will do, in which case Breath gets replaced by whatever other damaging ability the pet you choose has.\n\nIron Starlette\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Toxic Smoke till died 2nd time\nBring in your Level Pet\n\nLevel Pet\nTurn 1: Swap to your Mechanical Pandaren Dragonling\n\nMechanical Pandaren Dragonling\nTurn 1: Breath if Greyhoof HP is above 768, else Explode\nif Greyhoof is not yet dead:\nTurn 2: Explode if Greyhoof HP is above 240 else Breath\n\nGreyhoof Should be dead now.\n",
	},
	[119346] = {
		{
			"BattlePet-0-000012B2E223", -- [1]
			228, -- [2]
			232, -- [3]
			934, -- [4]
			1934, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B66DA8", -- [1]
			504, -- [2]
			574, -- [3]
			802, -- [4]
			1416, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 5,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14532\n\nStrategy added by Grevenilvec\nPrio 1: Bubble on CD\nPrio 2: Swarm of Flies if enemy doesn't have Swarm of Flies debuff\nPrio 3: Tongue Lash as filler\nBenax should kill Unfortunate Defias and Deadmines Parrot\nSwap to your Teroclaw Hatchling\nPrio 1: Nature's Ward if buff is not active\nPrio 2: Alpha Strike if enemy's health is above 309\nPrio 3: Ravage",
		["teamName"] = "Unfortunate Defias",
	},
	["To a Land Down Under"] = {
		{
			"BattlePet-0-000006E4C767", -- [1]
			110, -- [2]
			348, -- [3]
			206, -- [4]
			202, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C753", -- [1]
			532, -- [2]
			975, -- [3]
			1627, -- [4]
			1828, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Rockmar#1116\nTurn 1: Call Blizzard\nTurn 2: Bash\nTurn 3: Bite\nClawz comes in\nTurn 1: Bite\nTurn 2: Call Blizzard\nTurn 3: Swap to your Baby Winston\nTurn 4: Barrier Projector\nTurn 5: Logic\nBassalt comes in\nTurn 6: Body Slam\nTurn 7: Logic\nTurn 8: Body Slam\nMurrey comes in\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nTurn 4: Wind-Up\nTurn 5: Wind-Up\n",
	},
	["Growing Ectoplasm 1"] = {
		{
			"BattlePet-0-000012B67566", -- [1]
			163, -- [2]
			743, -- [3]
			663, -- [4]
			627, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B6764A", -- [1]
			112, -- [2]
			916, -- [3]
			170, -- [4]
			1403, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B4C5B0", -- [1]
			360, -- [2]
			165, -- [3]
			163, -- [4]
			1427, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Creeping Fungus\nTurn 2-4: Stampede\nTurn 5: Corpse Explosion\n\nBring in your Mechanical Axebeak\nTurn 1: Peck\nRandom Enemy Pet comes in\n\nDeviate Flapper:\nPeck > Lift-Off > Haywire\n\nDeviate Smallclaw:\nHaywire > Peck+\n\nDeviate Chomper:\nLift-Off > Peck+\n",
		["minXP"] = 25,
	},
	[150917] = {
		{
			"BattlePet-0-000012B607A4", -- [1]
			921, -- [2]
			920, -- [3]
			305, -- [4]
			1212, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			364, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012BA9540", -- [1]
			110, -- [2]
			221, -- [3]
			350, -- [4]
			1571, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6566\n\nStrategy added by DavidG\nTurn 1: Exposed Wounds\nTurn 2: Black Claw\nTurn 3-4: Hunting Party\nTurn 5: By the time Hunting party finishes he'll be in his undead round, so just do whatever and let him die\n",
		["teamName"] = "Huncher",
		["minXP"] = 25,
		["minHP"] = 1303,
	},
	[142054] = {
		{
			"BattlePet-0-000012B6763C", -- [1]
			355, -- [2]
			490, -- [3]
			124, -- [4]
			514, -- [5]
		}, -- [1]
		{
			"random:8", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2048\n\nStrategy added by DragonsAfterDark\nScript thanks to Prudentius\n\nTurn 1: Deflection\nTurn 2-4: Rampage\nTurn 5+: Triple Snap until Beets dies\nRawly comes in\nTurn 1: Pass if you're slower than Rawly, Triple Snap if you're faster\nTurn 2: Deflection\nTurn 3: Triple Snap\nTurn 4+5: Rampage\nStinger comes in\nTurn 1: Rampage continues\nTurn 2+: Triple Snap until dead\nBring in your Beast pet\nAny standard Beast attack will finish the fight\n",
		["teamName"] = "Desert Survivors",
		["minXP"] = 25,
	},
	["Are They Not Beautiful? (Beast)"] = {
		{
			"BattlePet-0-00000D450504", -- [1]
			535, -- [2]
			1398, -- [3]
			586, -- [4]
			2622, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00001234372A", -- [1]
			2430, -- [2]
			536, -- [3]
			1536, -- [4]
			3110, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B528FE", -- [1]
			974, -- [2]
			595, -- [3]
			536, -- [4]
			1266, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).In all my testing I've only seen Fethres using Feign Death once, so please excuse me for completely ignoring the RNG that would add to the fights.\n\nTurn 1: Feathered Frenzy\nTurn 2: Gift of Winter's Veil\nTurns 3+: Pounce (until dead, meanwhile Fethres dies and Beeks comes in)\nBring in your Gizmo\nTurn 1: Prowl\nTurn 2: Arcane Dash (Beeks dies, Talons comes in)\nSwap to your Xu-Fu, Cub of Xuen\nTurn 1: Prowl\nTurn 2: Moonfire\n",
	},
	[141814] = {
		{
			"BattlePet-0-000012B4861E", -- [1]
			421, -- [2]
			277, -- [3]
			595, -- [4]
			557, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [3]
		["minHP"] = 241,
		["notes"] = "Strategy added by Lazey\n*** 9.0.2 approved ***Korval Darkbeard:4AFM:221AHD:ZL:122414D:P:240::3::::Aquatic level pets need more HP.\n\nTurn 1: Moonfire\nTurn 2+: Arcane Blast until Feathers is dead.\nSplat comes in\nTurn 1: Life Exchange\nTurn 2: Moonfire\nTurn 3+: Arcane Blast until Splat is dead. (Jump to level pet swap if your Nether Faerie Dragon is dead too.)\nBrite comes in\nTurn 1: Arcane Blast until your Nether Faerie Dragon dies. (Pass turns if you would kill Brite!)\nSwap to your Level Pet\nSwap to your Nexus Whelpling\nTurn 1: Arcane Storm\nTurn 2+: Mana Surge\n",
		["teamName"] = "Accidental Dread",
		["minXP"] = 4,
	},
	["wankah"] = {
		{
			"BattlePet-0-000012B589F6", -- [1]
			1958, -- [2]
			348, -- [3]
			780, -- [4]
			3119, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B58A19", -- [1]
			1958, -- [2]
			348, -- [3]
			780, -- [4]
			3119, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B58989", -- [1]
			1958, -- [2]
			348, -- [3]
			780, -- [4]
			3119, -- [5]
		}, -- [3]
		["tab"] = 11,
	},
	[150918] = {
		{
			"BattlePet-0-000012B3E786", -- [1]
			2067, -- [2]
			919, -- [3]
			706, -- [4]
			2648, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B6AE80", -- [1]
			359, -- [2]
			2361, -- [3]
			1049, -- [4]
			2866, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B6C84B", -- [1]
			359, -- [2]
			1954, -- [3]
			1049, -- [4]
			2866, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6035\n\nStrategy added by Shenk\nTurn 1: Black Claw\nTurn 2-4: Swarm\n",
		["teamName"] = "Tommy the Cruel",
		["minXP"] = 1,
	},
	[173274] = {
		{
			"BattlePet-0-000012BEEEA6", -- [1]
			270, -- [2]
			0, -- [3]
			282, -- [4]
			1539, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B673F3", -- [1]
			0, -- [2]
			208, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [3]
		["teamName"] = "Failed Experiment",
		["notes"] = "Strategy added by norng\n6 rounds.\n\nTurn 1: Glowing Toxin\nTurn 2: Explode\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Explode\nBring in your Microbot XD\nTurn 1: Supercharge\nTurns 2-3: Ion Cannon - Gorgemouth dies\n",
	},
	[161649] = {
		{
			"BattlePet-0-000012B99948", -- [1]
			515, -- [2]
			1087, -- [3]
			117, -- [4]
			2000, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CDB4", -- [1]
			1095, -- [2]
			377, -- [3]
			204, -- [4]
			4255, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000011CA3D76", -- [1]
			2402, -- [2]
			1105, -- [3]
			376, -- [4]
			2931, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7224\n\nStrategy added by Reilly\nTested with P/S and P/H Young Venomfang\n\nTurn 1: Toxic Skin\nTurn 2: Flyby\nTurn 3: Infected Claw\nTurn 4: Infected Claw\nTurn 5: Infected Claw\nTurn 6: Toxic Skin\nTurn 7: Flyby\nTurn 8: Infected Claw until Rampage dies\n",
		["teamName"] = "Rampage",
		["minXP"] = 1,
	},
	["To a Land Down Under (Dragon)"] = {
		{
			"BattlePet-0-000012B4861E", -- [1]
			421, -- [2]
			277, -- [3]
			595, -- [4]
			557, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CC", -- [1]
			110, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B4838C", -- [1]
			525, -- [2]
			597, -- [3]
			598, -- [4]
			1167, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Oakwarden\nNot my strat. Full credit goes to RezokDDW#1749wrote on 5/3/2023Nether Faerie Dragon 2,2,1Chrominius 1,1,2Emerald Proto-WhelpUsed these three, and almost solo'd with the Faerie dragonStarted with putting the moonlight up with the faerie dragon then just used Arcane Blast until the first pet died.Then once the 2nd came out I used moonlight again, then Life Exchange, then Arcane Blast killed it.Arcane blast until the Faerie dragon died, swap in Chrominius to Howl and then Surge of Power to kill Murrey. \n\nTurn 1: Moonfire\nTurn 2: Arcane Blast until Bassalt dies.\nTurn 3: Life Exchange\nTurn 4: Moonfire\nTurn 5: Arcane Blast until Clawz dies or your Nether Faerie Dragon dies.\nBring in your Chrominius\nTurn 1: Howl\nTurns 2-4: Surge of Power\n",
	},
	[68465] = {
		{
			"BattlePet-0-000011E9D229", -- [1]
			2375, -- [2]
			232, -- [3]
			568, -- [4]
			3038, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			2237, -- [3]
			0, -- [4]
			3100, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["notes"] = "Strategy added by Mutanis\nTurn 1: Needle Claw\nTurn 2: Needle Claw\nTurn 3: Needle Claw\nTurn 4: Swarm of Flies\nTurn 5: Needle Claw\nSludgy comes in\nTurn 6: Feign Death – your Timeless Mechanical Dragonling is brought in\nTurn 7: Flame Breath\nTurn 8: Razor Talons\nTurn 9: Swap to your Undying Deathroach (Sludgy dies)\nDarnak the Tunneler comes in\nTurn 10: Needle Claw\nTurn 11: Swarm of Flies\nTurn 12: Pass (Undying Deathroach dies)\nBring in your Timeless Mechanical Dragonling\nTurn 13: Razor Talons\nTurn 14: Flame Breath\nTurn 15: Pass (Timeless Mechanical Dragonling dies & Darnak the Tunneler dies)\n",
		["teamName"] = "Thundering Pandaren Spirit",
		["maxHP"] = 1440,
	},
	[140315] = {
		{
			"BattlePet-0-000006E4C77C", -- [1]
			477, -- [2]
			206, -- [3]
			481, -- [4]
			117, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nPriority 1: Call Blizzard on CD\nPriority 2: Deep Freeze on CD\nPriority 3: Snowball all else\nPriority 4: Standby when the 'Fixed' Remote Control Rocket Chicken comes in\nIf needed, bring in next pet to finish the fight. \n",
		["teamName"] = "Automated Chaos",
		["minXP"] = 25,
	},
	[116792] = {
		{
			"BattlePet-0-000006E4C7A6", -- [1]
			384, -- [2]
			278, -- [3]
			208, -- [4]
			1233, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012843ED8", -- [1]
			202, -- [2]
			524, -- [3]
			609, -- [4]
			3323, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C78A", -- [1]
			390, -- [2]
			386, -- [3]
			209, -- [4]
			1961, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6776\n\nStrategy added by Iggzy#2288\nScript thanks to Nikyou\n\nTurn 1: Supercharge\nTurn 2: Metal Fist\nTurns 3-5: Repair\nTurn 6: Metal Fist\nTurn 7: Supercharge\nTurn 8: Metal Fist\nTurn 9+: Metal Fist until dead\nBring in your other pets\nTurn 1+: Any standard attack will finish the fights\n",
		["teamName"] = "Phyxia",
		["minXP"] = 1,
	},
	[72009] = {
		{
			"BattlePet-0-000012B4AB86", -- [1]
			110, -- [2]
			362, -- [3]
			366, -- [4]
			724, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01ED3", -- [1]
			459, -- [2]
			640, -- [3]
			282, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [3]
		["tab"] = 4,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14131\n\nStrategy added by SunFlight#2765\nTurn 1: Dazzling Dance\nTurn 2: Howl\nTurn 3: Pass\nBring in your Iron Starlette\nTurn 1: Toxic Smoke\nTurn 2: Explode\nBring in your Ikky\nTurn 1: Black Claw\nTurns 2-4: Flock\n",
		["teamName"] = "Xu-Fu, Cub of Xuen",
	},
	[141529] = {
		{
			"BattlePet-0-000012B5C356", -- [1]
			1773, -- [2]
			165, -- [3]
			518, -- [4]
			1974, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B48707", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B6751A", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1721, -- [5]
		}, -- [3]
		["teamName"] = "Marshdwellers",
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7895\n\nStrategy added by Orpartlu\nTurn 1: Falcosaur Swarm!\nTurn 2: Falcosaur Swarm! Continues.\nTurn 3: Predatory Strike\nLilly Dies.\nTurn 4: Falcosaur Swarm!\nSnowfeather Hatchling gets swapped out for Nexus Whelpling by Molaze.\nTurn 5: Arcane Storm\nTurn 6: Mana Surge\nMolaze Dies.\nTurn 7: Mana Surge continues.\nTicker may die here. If not finish with anything.\n",
	},
	[161650] = {
		{
			"BattlePet-0-000012B99945", -- [1]
			116, -- [2]
			232, -- [3]
			204, -- [4]
			2417, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B6764A", -- [1]
			112, -- [2]
			916, -- [3]
			334, -- [4]
			1403, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012692A6E", -- [1]
			110, -- [2]
			165, -- [3]
			124, -- [4]
			3415, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15795\n\nStrategy added by GCSuns\nTurn 1: Call Lightning\nTurn 2: Swarm of Flies\nTurn 3: Zap\nTurn 4: Zap\nTurn 5: Ranishu Runt dies. Switch in Mechanical Axebeak\nTurn 6: Decoy. Haywire if needed.\n",
		["teamName"] = "Liz",
		["minXP"] = 1,
	},
	[161657] = {
		{
			"BattlePet-0-000008968258", -- [1]
			406, -- [2]
			453, -- [3]
			490, -- [4]
			1155, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4AB86", -- [1]
			110, -- [2]
			362, -- [3]
			366, -- [4]
			724, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000008A86E91", -- [1]
			535, -- [2]
			357, -- [3]
			595, -- [4]
			1927, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8239\n\nStrategy added by Silverleaf#1446\nPriority 1: Deflection when Whirlpool is at 1\nPriority 2: Sandstorm\nPriority 3: Crush\n",
		["teamName"] = "Ninn Jah",
		["minXP"] = 25,
	},
	[104970] = {
		{
			"BattlePet-0-000012B0D34C", -- [1]
			501, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012C82AA8", -- [1]
			178, -- [2]
			0, -- [3]
			606, -- [4]
			2756, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Dealing with Satyrs",
		["notes"] = "Strategy added by Mutanis\nTurn 1: Time Bomb\nTurn 2: Pass (Irradiated Elementaling comes in)\nTurn 3: Elementium Bolt\nTurn 4: Immolate\nGlobs comes in\nTurn 5: Immolate\nNightmare Sprout comes in\nTurns 6+: Immolate until Irradiated Elementaling dies (1-2x)\nBring in your Timeless Mechanical Dragonling\nQestion: Trixy is dead? -->YES go to Step B\nNo --> Priolist\nPrio 1: Flame Breath until Nightmare Sprout health < 397 (1-2x)\nPrio 2: Armageddon\n\nStep B (only if  Trixy is dead)\nTurn 1: Time Bomb\nTurn 2: Flame Breath\nTurn 3: Flame Breath\nTurn 4: Armageddon\n",
	},
	[200678] = {
		{
			"BattlePet-0-000012B6751A", -- [1]
			0, -- [2]
			489, -- [3]
			589, -- [4]
			1721, -- [5]
		}, -- [1]
		{
			"BattlePet-0-0000122BADD1", -- [1]
			473, -- [2]
			475, -- [3]
			489, -- [4]
			1160, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by Salkari\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\nWhelpling dies before getting off another attack\nTurns 1-3: Mana Surge\nTurn 4: Eyeblast\nTurn 6: Arcane eye should be able to finish him off. If not, then 1 attack from 3rd pet\n",
		["teamName"] = "Storm-Touched Slyvern",
		["minXP"] = 25,
	},
	[119342] = {
		{
			"BattlePet-0-000012B66C49", -- [1]
			509, -- [2]
			123, -- [3]
			513, -- [4]
			746, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B66DA8", -- [1]
			504, -- [2]
			574, -- [3]
			802, -- [4]
			1416, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 5,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1832\n\nStrategy added by NostrA#2338\nprops to Aranesh for his/her strategy, i just changed the TD Script and Strategy to make Teroclaw viable again\n\nTurn 1: use Whirlpool\nTurn 2: use Surge\nTurn 3: Pass\nTurn 4: use Surge\nTurn 5: use Whirlpool\nTurn 6: use Healing Wave\nTurn 7+: use Surge until Angry Geode dies\nan enemy pet comes in\nTurn 1+: Keep Whirlpool and Healing Wave on cooldown, otherwise use Surge until your Emperor Crab dies\nBring in your Teroclaw Hatchling\nenemy HP < 618: use Ravage\nif the enemy is a Flying Type, you want to use Ravage when the enemy HP is under 406 \nwhen not active: use Nature's Ward\nelse: use Alpha Strike",
		["teamName"] = "Angry Geode",
		["minXP"] = 25,
	},
	[66741] = {
		{
			"BattlePet-0-000008968258", -- [1]
			406, -- [2]
			453, -- [3]
			490, -- [4]
			1155, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B4838C", -- [1]
			525, -- [2]
			611, -- [3]
			612, -- [4]
			1167, -- [5]
		}, -- [3]
		["teamName"] = "Aki the Chosen",
		["notes"] = "Strategy added by unknown\nGood strategy but has some variations in it. If you don't use addons for pet battles or keep a close eye on the fight progress, I recommend not using this one.\n\nTurn 1: Sandstorm\nTurn 2: Swap to Level Pet\nTurn 3: Swap back to Anubisath Idol\nTurns 4+: Crush until Chirrup is dead - do not re-apply Sandstorm!\nStormlash comes in\nTurn 1: Deflection\nTurns 2+: Crush until Stormlash is dead as well\nSometimes your Idol will die before that. You can still finish the fight with the Emerald Proto-Whelp, just use Proto-Strike first thing when Whiskers comes in.\nWhiskers comes in\nTurn 1: Pass\nTurn 2: Deflection\nTurns 3+: Crush until your Idol dies.\nBring in your Emerald Proto-Whelp\nUse Emerald Bite whenever you can and if you have an addon showing you the enemies spells, use Proto-Strike as soon as Whiskers Dive comes off cooldown.\n",
	},
	[71930] = {
		{
			"BattlePet-0-000012B01E39", -- [1]
			422, -- [2]
			218, -- [3]
			772, -- [4]
			1628, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CB68", -- [1]
			113, -- [2]
			436, -- [3]
			569, -- [4]
			1150, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["tab"] = 3,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/18685\n\nStrategy added by ImpossiblGrl#1136\nTurn 1: Curse of Doom\nTurn 2: Shadow Shock Till Nairn dies (4-5 casts) Stormoen enters\nTurn 3: Lovestruck \nTurn 4: Curse of Doom Stormoen swaps, and the CoD hits Summer\nTurn 5: Swap to Level Pet\nTurn 6: Swap to Ashstone Core\nTurn 7: Crystal Prison\nTurn 8: Stoneskin Summer swaps and Stormoen is back\nTurn 9:  Burn till Stormoen dies (around 5 casts). Summer returns\nTurn 10: Stoneskin\nTurn 11: Pass\nTurn 12: Crystal Prison\nTurn 13: Burn\nTurn 14: Burn\nTurn 15: Swap to your Sister of Temptation\nTurn 16: Pass\nTurn 17: Shadow Shock\nTurn 18: Lovestruck\nTurn 19: Shadow Shock\n",
		["teamName"] = "Shademaster Kiryn",
		["minXP"] = 2,
	},
	[116787] = {
		{
			"BattlePet-0-000012B99CF2", -- [1]
			421, -- [2]
			906, -- [3]
			1754, -- [4]
			2078, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000007C1D04D", -- [1]
			409, -- [2]
			503, -- [3]
			176, -- [4]
			1624, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B99CFC", -- [1]
			184, -- [2]
			1963, -- [3]
			521, -- [4]
			2566, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6224\n\nStrategy added by Lowlander#2941\nTurn 1: Fire Shield\nTurn 2: Lightning Shield\nTurn 3+: Arcane Blast (Keep spamming this till all are dead)\n",
		["teamName"] = "Deviate Flapper",
		["minXP"] = 25,
	},
	[62621] = {
		{
			"BattlePet-0-000012B4C910", -- [1]
			1570, -- [2]
			230, -- [3]
			1231, -- [4]
			3217, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000008968258", -- [1]
			390, -- [2]
			453, -- [3]
			490, -- [4]
			1155, -- [5]
		}, -- [2]
		{
			"BattlePet-0-0000129535D3", -- [1]
			445, -- [2]
			1380, -- [3]
			644, -- [4]
			3536, -- [5]
		}, -- [3]
		["teamName"] = "Fel Flame",
	},
	["Are They Not Beautiful? (Critter)"] = {
		{
			"BattlePet-0-000012B90214", -- [1]
			119, -- [2]
			405, -- [3]
			2360, -- [4]
			2839, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B82344", -- [1]
			119, -- [2]
			405, -- [3]
			2360, -- [4]
			2839, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B82340", -- [1]
			119, -- [2]
			405, -- [3]
			2360, -- [4]
			2839, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).In all my testing I've only seen Fethres using Feign Death once, so please excuse me for completely ignoring the RNG that would add to the fights.Why make it complicated, when we got spilled with these pets in Battle for Azeroth? When you don't have 3x of them, I guess someone in your Guild, etc. can help out.**Can't easily script the optimal Early Advantage usage, because scripts can't foresee our pet's HP (unfortunately Early Advantage doesn't really deal \"double damage\", it just does a 2nd hit when your HP is still lower after the 1st hit), so I'm just firing it when our pet's HP is lower at the start of a round.\n\nInfo:: Never refresh existing Void Tremors! While facing Fethres or Beeks, you can apply Void Tremors for the next enemy, but make sure your next attack will kill the active enemy so it's not wasted.\n\nStick to these priorities on all your pets, bring next pet when one dies:\n!: Skip Prio 1-3 when Void Tremors is active! (didnt wanna add this to each line)\nPrio 1:: Enemy has 1102HP or more -> Void Tremors\nPrio 2:: Enemy is not Talons, enemy has 734HP or less, Early Advantage is usable or ready next turn, and your HP is lower**) -> Void Tremors\nPrio 3:: Enemy is not Talons, enemy has 367HP or less -> Void Tremors\nPrio 4:: Your pet has lower HP than the enemy -> Early Advantage**\nPrio 5:: Scratch\n",
	},
	[161651] = {
		{
			"BattlePet-0-000012B99946", -- [1]
			1085, -- [2]
			456, -- [3]
			752, -- [4]
			1601, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01ED3", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012949F80", -- [1]
			493, -- [2]
			307, -- [3]
			376, -- [4]
			3333, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10265\n\nStrategy added by Berendain\nTurn 1: Clean-Up\nTurn 2: Soulrush\nTurn 3: Swap to your Iron Starlette\nTurn 4: Wind-Up\nTurn 5: Supercharge\nTurn 6: Wind-Up\nTurn 7: Toxic Smoke until something dies\nTurn 8: If Iron Starlette dies before Ralf does, bring back your Servant of Demidos, and finish him off\n",
		["teamName"] = "Ralf",
		["minXP"] = 1,
	},
	[119345] = {
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			1773, -- [2]
			1758, -- [3]
			518, -- [4]
			1975, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 5,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2490\n\nStrategy added by Eekwibble\nTurns 1&2: Falcosaur Swarm!\nTurn 3: Ironskin\nTurn 4: Predatory Strike\nTurns 5&6: Falcosaur Swarm! - Krutz's Battle Monkey dies\nClean up with preferred pet/s",
		["teamName"] = "Klutz's Battle Monkey",
		["minXP"] = 25,
	},
	[200679] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"random:3", -- [1]
		}, -- [2]
		{
			"random:3", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by DragonsAfterDark\nIkky should be good to take out both, or almost both, Skitterers with no healing between the fights.Script thanks to Schlumpf\n\nTurn 1: Black Claw\nTurns 2-4: Flock\nTurn 5+: Quills until the fight is won\n",
		["teamName"] = "Storm-Touched Skitterer",
		["minXP"] = 25,
	},
	[146002] = {
		{
			"BattlePet-0-000012B17368", -- [1]
			447, -- [2]
			2349, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99CF2", -- [1]
			503, -- [2]
			906, -- [3]
			1954, -- [4]
			2078, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B01E78", -- [1]
			514, -- [2]
			1963, -- [3]
			453, -- [4]
			3348, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13135\n\nStrategy added by Pankracy#2378\nFast and simple ;). Enjoy.\n\n-------------------------\nFight time: 9 - 13 rounds\n-------------------------\n\nTD Script provided by Maybellene (https://www.wow-petguide.com/User/34133/Maybellene), THANK YOU!!!!!!!\n\nTurn 1: Toxic Fumes\nTurn 2: Poison Protocol\nTurn 3: Corrosion\nTurn 4: swap to Tinytron\nTurn 5: Flamethrower\nTurn 6: Poison Protocol\nTurn 7: Lightning Shield\nTurn 8: Flamethrower\nTurn 9: Flamethrower\nTurn 10: Flamethrower\nTurn 11: Flamethrower\nTurn 12: Lightning Shield\nTurn 13: Flamethrower. Done. In case Tinytron won't do it, just bring 3rd pet and finish ;]\n",
		["teamName"] = "Gnomeregan Guard Wolf",
		["minXP"] = 25,
	},
	[161656] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			422, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B67566", -- [1]
			163, -- [2]
			743, -- [3]
			663, -- [4]
			627, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012707902", -- [1]
			2346, -- [2]
			352, -- [3]
			762, -- [4]
			3381, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7094\n\nStrategy added by Shenk\nYou can use pretty much any pet with Stampede-like abilities instead of the Infected Squirrel.\n\nTurn 1: Pass\nTurn 2: Curse of Doom\nTurn 3: Haunt\nBring in your Infected Squirrel\nTurn 1: Creeping Fungus\nTurn 2-3: Stampede\n",
		["teamName"] = "Splint",
		["minXP"] = 1,
	},
	[105386] = {
		{
			"BattlePet-0-000012BEEEA6", -- [1]
			270, -- [2]
			0, -- [3]
			282, -- [4]
			1539, -- [5]
		}, -- [1]
		{
			"BattlePet-0-0000083A0A6A", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			1537, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Rydyr",
		["notes"] = "Strategy added by norng\n3 rounds.\n\nTurn 1: Glowing Toxin\nTurn 2: Explode\nBring in your Crimson Spore\nTurn 1: Explode - Baby Bjorn dies\n",
	},
	["Do You Even Train? (Mech)"] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			602, -- [3]
			334, -- [4]
			3100, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B673F3", -- [1]
			1585, -- [2]
			208, -- [3]
			209, -- [4]
			2717, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).I recommend using the P/S Iron Starlette because it only needs 1x Powerball to be faster than the enemy pets, usually lands 2x Wind-Up hits on Brul'dan and therefore adds more control.\n\nWith your Iron Starlette stick to these priorities until dead:\nvs. Lifft\nPrio 1:: When your pet is slower than the actual enemy pet -> Powerball\nPrio 2:: Wind-Up is active, Dive is not usable this and the next turn -> Supercharge\nPrio 3:: Wind-Up is active, Lifft is Underwater -> Powerball\nPrio 4:: Wind-Up\nvs. Brul'dan\nPrio 1:: When your pet is slower than the actual enemy pet -> Powerball\nPrio 2:: Wind-Up is active -> Wind-Up\nPrio 3:: Your pet's Failsafe has been triggered, Drain Power not usable -> Powerball \nPrio 4:: Wind-Up\n\nBring in your Timeless Mechanical Dragonling and stick to these priorities:\nPrio 1:: Enemy is Swole, Decoy exists -> Swap to your Microbot XD\nPrio 2:: Enemy is Swole, you've taken the Headbutt -> Swap to your Microbot XD\nPrio 3:: Enemy is Brul'dan with <1097HP -> Time Bomb\nPrio 4:: Enemy is Brul'dan with <549HP, no Flame Breath DoT active -> Decoy\nPrio 5:: Enemy is Brul'dan -> Flame Breath\nPrio 6:: Enemy is Swole -> Pass turn or Flame Breath\n\nWith your Microbot XD stick to these priorities:\nPrio 1:: Brul'dan is still alive or Swole has >1726HP -> Alert!\nPrio 2:: Supercharge\nPrio 3:: Ion Cannon\n",
	},
	[202440] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			0, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/18464\n\nStrategy added by DragonsAfterDark\nThe script will run for Ikky & the Zandalari Raptors\n\nVideo for Fight (https://youtu.be/NjYD3heC3Js)\n\nTurn 1: Curse of Doom\nTurn 2: Shadow Slash / Shadow Shock\nTurn 3: Haunt\nBring in your Ikky\nTurn 4: Black Claw\nTurns 5-6: Flock\n",
		["teamName"] = "Enok the Stinky",
		["minXP"] = 1,
	},
	[142234] = {
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			0, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [3]
		["teamName"] = "Small Beginnings",
		["notes"] = "Strategy added by Runisco\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up until Iron Starlette dies\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm\nTurn 2: Mana Surge\nTurn 3: Tail Sweep until Nexus Whelpling dies\nBring in your Ikky\nTurn 1: Black Claw\nTurn 2: Flock\n",
	},
	[162471] = {
		{
			"BattlePet-0-000012B0D34C", -- [1]
			0, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B146CC", -- [1]
			0, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [3]
		["minHP"] = 851,
		["notes"] = "Strategy added by Kalagren\nScript by Damiez\n\nTimeless Mechanical Dragonling comes in\nTurn 1: Time Bomb\nTurn 2: Armageddon\nBring in your Level Pet\nTurn 3: Swap to your Chrominius\nTurn 4: Howl (Time Bomb does NOT consume Howl at this time, yet gains the multiplier.)\nTurn 5: Surge of Power\n",
		["teamName"] = "Flight of the Vil'thik",
		["minXP"] = 15,
	},
	[116788] = {
		{
			"BattlePet-0-000012B67649", -- [1]
			184, -- [2]
			440, -- [3]
			1068, -- [4]
			1701, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99D43", -- [1]
			393, -- [2]
			347, -- [3]
			170, -- [4]
			1385, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012BA9540", -- [1]
			110, -- [2]
			221, -- [3]
			350, -- [4]
			1571, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4597\n\nStrategy added by DragonsAfterDark\nPriority 1: Evanescence\nPriority 2: Forboding Curse\nPriority 3: Quills all else\nBring in your next pet\nAny standard attack will finish the fight\n",
		["teamName"] = "Deviate Chomper",
		["minXP"] = 25,
	},
	[146003] = {
		{
			"BattlePet-0-000006E4C77C", -- [1]
			477, -- [2]
			206, -- [3]
			120, -- [4]
			117, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01EA8", -- [1]
			475, -- [2]
			488, -- [3]
			474, -- [4]
			1156, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B118AA", -- [1]
			1369, -- [2]
			1050, -- [3]
			919, -- [4]
			1565, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6332\n\nStrategy added by ddj88#1113\nThis strategy works if all enemy pets are mechanical, adjust other pets according to the enemy back line pets (beast if critter, elemental if mechanical). I've used tiny snowman twice now and he can take out all the pets.\n\nTurn 1: Call Blizzard\nTurn 2: Howling Blast\nTurn 3: Snowball\nTurn 4: Priority Call Blizzard>Howling Blast>Snowball. If enemy pet is near death cast snowball save the cd's of other two big spells for higher HP pet\n",
		["teamName"] = "Gnomeregan Guard Tiger",
		["minXP"] = 22,
	},
	[119407] = {
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			779, -- [3]
			334, -- [4]
			844, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B66DA8", -- [1]
			504, -- [2]
			312, -- [3]
			0, -- [4]
			1416, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 5,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1237\n\nStrategy added by Aranesh\nTurn 1: Decoy\nTurn 2: Thunderbolt\nTurns 3+: Now keep Thunderbolt and Decoy on cooldown and otherwise use Breath\nYour Mechanical Pandaren Dragonling will usually solo the fight.\nIf you are unlucky, bring in your Teroclaw Hatchling and use Dodge + Alpha Strike\n\nCongrats!",
		["teamName"] = "Cookie's Leftovers",
		["minXP"] = 1,
	},
	[204926] = {
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C76A", -- [1]
			115, -- [2]
			589, -- [3]
			624, -- [4]
			1720, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CC", -- [1]
			110, -- [2]
			362, -- [3]
			593, -- [4]
			1152, -- [5]
		}, -- [3]
		["teamName"] = "Delver Mardei",
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).\n\nTurn 1: Time Bomb\nTurn 2: Flame Breath\nTurn 3: Armageddon\nBring in your Emmigosa\nTurn 4: Ice Tomb\nTurn 5: Arcane Storm (Tempe comes in, Swoggy dies in the backline)\nTurns 6+: Arcane Storm or Breath (until dead)\nChrominius comes in\nCheck conditions each Round and continue based on these priorities:\nPrio 1:: Tempe still alive? -> Bite\nPrio 2:: Dragonkin Passive is up and Dustie has 1665HP or less? -> Surge of Power\nPrio 3:: Dustie has 1110HP or less? -> Surge of Power\nPrio 4:: Howl\nPrio 5:: Surge of Power\n",
	},
	[79179] = {
		{
			"BattlePet-0-000012C2DB32", -- [1]
			110, -- [2]
			753, -- [3]
			404, -- [4]
			3489, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			0, -- [2]
			0, -- [3]
			282, -- [4]
			844, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Deebs, Tyri and Puzzle",
		["notes"] = "Strategy added by nogulpfrog\nTurn 1: Sunlight\nTurn 2: Swap to your Mechanical Pandaren Dragonling\nTurn 3: Explode\nBring in your Level Pet\nTurn 4: Swap to your Sunglow Cobra\nTurn 5: Bite, Deebs died\nTurn 6: Solar Beam, Tyri died\nTurn 7: Pass\nTurn 8: Pass\nTurn 9: Solar Beam, Puzzle died\n",
	},
	[150858] = {
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			392, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99C7F", -- [1]
			360, -- [2]
			312, -- [3]
			163, -- [4]
			72, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Strategy added by Obi-Wahn\nStrategy by Buuloki on Wowheadany Hare/Rabbit should do\n\nTurn 1: Extra Plating\nTurn 2: Make it Rain\nTurn 3: Inflation\nTurn 4: Make it Rain\nBlackmane turns undead\nTurn 5: Inflation - Lil' Bling dies\nBring in your Tolai Hare\nTurn 6: Flurry\nTurn 7: Flurry\n",
		["teamName"] = "Blackmane",
	},
	[150922] = {
		{
			"BattlePet-0-000012B67566", -- [1]
			0, -- [2]
			0, -- [3]
			663, -- [4]
			627, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C793", -- [1]
			118, -- [2]
			1087, -- [3]
			0, -- [4]
			1623, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B5E5CA", -- [1]
			1060, -- [2]
			1087, -- [3]
			0, -- [4]
			2398, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5612\n\nStrategy added by Reilly\nAny pet with Toxic Skin and a direct damage abiliy will work in slots 2 and 3.\n\nTurn 1: Corpse Explosion\nBring in your Leviathan Hatchling\nTurn 1: Toxic Skin\nTurn 2: Water Jet\nTurn 3: Water Jet\nYour Boghopper is swapped in\nTurn 1: Toxic Skin\nTurn 2+: Steam Vent until Sludge Belcher dies\n",
		["teamName"] = "Sludge Belcher",
	},
	[72291] = {
		{
			"BattlePet-0-00000D5451F8", -- [1]
			792, -- [2]
			2223, -- [3]
			172, -- [4]
			2352, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00000D511EB1", -- [1]
			475, -- [2]
			2223, -- [3]
			1533, -- [4]
			3041, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B01E92", -- [1]
			771, -- [2]
			772, -- [3]
			773, -- [4]
			122, -- [5]
		}, -- [3]
		["tab"] = 4,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/17855\n\nStrategy added by WhyDaRumGone\nTurn 1: Murder the Innocent\nTurn 2: Swap to your Death Seeker\nTurn 3: Murder the Innocent\nTurn 4: Eyeblast\nTurn 5: Pass, Death Seeker dies.\nBring in your Level Pet\nTurn 6: Swap to your Baa'l\nTurn 7: Darkflame\nTurn 8: Murder the Innocent\n",
		["teamName"] = "Yu'la, Broodling of Yu'lon",
		["minXP"] = 1,
	},
	[200680] = {
		{
			0, -- [1]
		}, -- [1]
		{
			"BattlePet-0-000012B521D4", -- [1]
			0, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [3]
		["teamName"] = "Storm-Touched Ohuna",
		["notes"] = "Strategy added by Vanpelt#1866\nTurn 1: Pass\nTurn 2: Swap to your Unborn Val'kyr\nTurn 3: Curse of Doom\nTurn 4: Haunt - Unborn Val'kyr dies\nBring in your Ikky\nTurn 5: Black Claw\nTurns 6-8: Flock\n",
	},
	[105323] = {
		{
			"BattlePet-0-000012B146CA", -- [1]
			1002, -- [2]
			392, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			0, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [3]
		["teamName"] = "Clear the Catacombs",
		["notes"] = "Strategy added by Makaveli#22599\nTurn 1: Extra Plating\nTurn 2: Make it Rain\nTurn 3: Inflation\nTurn 4: Repeat until your lil'bling dies. Try to have him die while enemy still has damage debuff on them\nBring in your Ikky\nTurn 1+: Savage Talon to kill Ancient Catacomb Spider\nCatacomb Bat comes in\nTurn 1: Black Claw\nTurns 2-4: Flock\nCatacomb Snake comes in\nTurns 1-3: Flock\nBring in your Iron Starlette\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\n",
	},
	[119341] = {
		{
			"BattlePet-0-000012B146CA", -- [1]
			1002, -- [2]
			989, -- [3]
			293, -- [4]
			1320, -- [5]
		}, -- [1]
		{
			"random:10", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 5,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2492\n\nStrategy added by Eekwibble\nPreferably bring another mech with Launch Rocket\n\nTurn 1: Launch Rocket\nTurns 2-4: Inflation\nTurn 5: Launch Rocket - Mining Monkey dies\nClean up with preferred pet/s",
		["teamName"] = "Mining Monkey",
		["minXP"] = 25,
	},
	[139489] = {
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			1773, -- [2]
			0, -- [3]
			518, -- [4]
			1975, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000008A85848", -- [1]
			1370, -- [2]
			1773, -- [3]
			518, -- [4]
			1977, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B66D54", -- [1]
			1773, -- [2]
			0, -- [3]
			518, -- [4]
			1976, -- [5]
		}, -- [3]
		["teamName"] = "Crab People",
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2148\n\nStrategy added by DragonsAfterDark\nGreat flocking Falcosaurs! It's hard to go wrong with any order of attacks on this one, just try to keep the debuff from Falcosaur Swarm! up, and you should have no issues. \n\nTurn 1 + 2: Falcosaur Swarm!\nTurn 3: Predatory Strike\nTurn 4: Falcosaur Swarm! until Shelly is dead. \nSheldon comes in\nTurn 1: Falcosaur Swarm! until Direbeak Hatchling dies. \nBring in your Bloodgazer Hatchling\nTurn 1: Predatory Strike\nTurn 2: Savage Talon until Sheldon is dead. \nShelby comes in\nTurn 1: Falcosaur Swarm! until Predatory Strike is up. \nTurn 2: Predatory Strike\n",
	},
	[119344] = {
		{
			"BattlePet-0-000012B48707", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4838C", -- [1]
			525, -- [2]
			597, -- [3]
			598, -- [4]
			1167, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 5,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1236\n\nStrategy added by Aranesh\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge - Klutz's Battle Bird dies\nAn enemy pet comes in\nTurns 1+: Continue using Arcane Storm and Mana Surge when available, otherwise Tail Sweep until your Nexus Whelpling dies\n\nIf you need your Emerald Proto-Whelp, keep Emerald Presence active, use Emerald Dream if you drop low on health and otherwise use Emerald Bite",
		["teamName"] = "Klutz's Battle Bird",
	},
	[189376] = {
		{
			"BattlePet-0-000006E4C768", -- [1]
			753, -- [2]
			0, -- [3]
			404, -- [4]
			291, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00000D5451F8", -- [1]
			0, -- [2]
			2223, -- [3]
			0, -- [4]
			2352, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/17410\n\nStrategy added by WhyDaRumGone\nSinging Sunflower can only survive 1 crit.\nMOD: Have modified the script to account for losing Sunflower early. It will potentially save a normal run but you will need to the select the following abilities if you want it to work:\n* On Baa'l; select Darkflame, Scorched Earth\n* On Baa'lial; select Trample\n* On Death Seeker; select Eyeblast, Eye Beam\n\nAlternative pets #1 pets:\n* Golden Chirper S/S - This is a few seconds slower due to animations.\n* Soul of the Aspects (untested) - This is a the best (theoretical) for this strat BUT is a shop pet.\n\nTurn 1: Sunlight\nTurn 2: Swap to your Baa'l\nTurn 3: Murder the Innocent\nTurn 4: Swap to your Level Pet\nTurn 5: Swap to your Singing Sunflower/Soul of the Aspects/Golden Chirper\nNote:: If your Singing Sunflower dies after the swap see below alternative steps.\nTurn 6: Solar Beam or Skitter if using S/S Golden Chirper\nTurn 7: This turn will be skipped, or use Skitter if using S/S Golden Chirper\nBring in your Baa'l\nTurn 8: Murder the Innocent\n\n\nAlternative steps if #1 pet died round 5. (If you got double crit)\n----------------------------------\nBring in your Baa'l / Death Seeker\nTurn 6: Darkflame / Eyeblast\nTurn 7: Murder the Innocent\nTurn 8: Scorched Earth / Eye Beam",
		["teamName"] = "Swog the Elder",
		["minXP"] = 1,
	},
	[150923] = {
		{
			"BattlePet-0-000006E4C79F", -- [1]
			668, -- [2]
			640, -- [3]
			1051, -- [4]
			1965, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B99B2E", -- [1]
			122, -- [2]
			764, -- [3]
			1960, -- [4]
			2081, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B99CFC", -- [1]
			184, -- [2]
			1963, -- [3]
			521, -- [4]
			2566, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6045\n\nStrategy added by Shenk\nAny pet with a cleave attack in the 2nd slot should fine. Sometimes Blightbreath will solo the fight.\n\nTurn 1: Acid Rain\nTurn 2+: Dreadful Breath until either the fight is won or Blightbreath is dead\nTurn 3: If necessary bring in Twilight Clutch-Sister and finish with Twilight Meteorite\n",
		["teamName"] = "Belchling",
		["minXP"] = 1,
	},
	[155267] = {
		{
			"BattlePet-0-000012BA9563", -- [1]
			360, -- [2]
			1049, -- [3]
			152, -- [4]
			2190, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D1", -- [1]
			115, -- [2]
			779, -- [3]
			334, -- [4]
			844, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B01DE4", -- [1]
			422, -- [2]
			468, -- [3]
			652, -- [4]
			1968, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6023\n\nStrategy added by Shenk\nReads hard, but it's actually simple. Just using the abilities as you'd usually always do.\nGuardian Cobra Hatchling can solo it when there is no magic enemy pet. \n\nTurn 1: Blinding Poison\nTurn 2: Flurry until Risen Guard enters undead phase\n*: Risen Guard enters undead phase. Is the next pet a Lost Soul or Tormented Spirit?\nTurn 4:  Yes - Swap to your Mechanical Pandaren Dragonling, then skip to the \"Magic enemy\" at the bottom\nTurn 4: No - Pass\nAn enemy pet comes in\nTurn 1: Blinding Poison\nTurn 2: Flurry until the enemy enters undead phase\n The second pet enters undead phase. Is the next pet a Lost Soul or Tormented Spirit?\nTurn 3: Yes - Swap to your Mechanical Pandaren Dragonling, then skip to the \"Magic enemy\" at the bottom\nTurn 4: No - Pass\n\nMagic enemy\nTurn 1: Thunderbolt\nTurn 2: Decoy\nTurn 3: Breath until enemy pet dies\n",
		["teamName"] = "Risen Guard",
	},
	[116789] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B48707", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B5CE8E", -- [1]
			1407, -- [2]
			172, -- [3]
			870, -- [4]
			1545, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4600\n\nStrategy added by DragonsAfterDark\nS/S Foulfeather (2,2,1) is a good alternative to Ikky. I changed the Script so there won't be a conflict between Savage Talon and Peck :)\n\nPriority 1: Black Claw\nPriority 2: Flock\nPriority 3: Savage Talon to finish off an enemy if needed\nBring in your Nexus Whelpling\nTurn 1+: Mana Surge & Tail Sweep to finish fight\n",
		["teamName"] = "Son of Skum",
		["minXP"] = 25,
	},
	[146005] = {
		{
			"BattlePet-0-000012BA956E", -- [1]
			1570, -- [2]
			1087, -- [3]
			513, -- [4]
			2462, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01DBC", -- [1]
			118, -- [2]
			1087, -- [3]
			513, -- [4]
			1623, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Strategy added by Reilly\nPriority 1: Maintain Toxic Skin\nPriority 2: Whirlpool if debuff is not active\nPriority 3: Tentacle Slap\nBring in your Leviathan Hatchling\nPriority 1: Maintain Toxic Skin\nPriority 2: Whirlpool if debuff is not active\nPriority 3: Water Jet\nAny standard attack will finish the fight\n",
		["teamName"] = "Bloated Leper Rat",
		["minXP"] = 25,
	},
	[119408] = {
		{
			"BattlePet-0-000012B484E9", -- [1]
			422, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 5,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1233\n\nTurn 1: Pass\nTurn 2: Pass\nTurn 3: Haunt\nTurn 4: Bring in Ikky\nTurn 5: Black Claw\nTurns 6+: Flock",
		["teamName"] = "\"Captain\" Klutz",
	},
	[98489] = {
		{
			"BattlePet-0-000012B6764A", -- [1]
			504, -- [2]
			916, -- [3]
			334, -- [4]
			1403, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012BA94D5", -- [1]
			535, -- [2]
			0, -- [3]
			536, -- [4]
			846, -- [5]
		}, -- [3]
		["teamName"] = "Shipwrecked Captive",
		["notes"] = "Strategy added by norng\n14~15 rounds.PP, PS Iron Starlette recommend.\n\nTurn 1: Alpha Strike\nTurn 2: Decoy\nTurn 3: Alpha Strike\nTurn 4: Alpha Strike - Scuttles dies\nClamps comes in\nTurn 1: Swap to your Iron Starlette\nTurn 2: Wind-Up\nTurn 3: Supercharge\nTurn 4: Wind-Up\nTurn 5: Powerball - Clamps resurrects\nTurn 6: Swap to your Sapphire Cub - Clamps dies\nKiazor the Destroyer comes in\nTurn 1: Prowl\nTurn 2: Pounce\nTurn 3: Pounce\nTurn 4: Swap to your Mechanical Axebeak\nTurns 5: Haywire - Kiazor the Destroyer dies\n",
	},
	[146004] = {
		{
			"BattlePet-0-000012B67B94", -- [1]
			1056, -- [2]
			1055, -- [3]
			277, -- [4]
			2590, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B17369", -- [1]
			910, -- [2]
			453, -- [3]
			912, -- [4]
			1177, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C75E", -- [1]
			0, -- [2]
			178, -- [3]
			179, -- [4]
			270, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/16007\n\nStrategy added by Dassemps#1507\nTurn 1: Breath of Sorrow\nTurn 2: Seethe\nTurn 3: Seethe\nAn enemy pet comes in\nTurn 4: Life Exchange\nTurn 5: Seethe\nTurn 6: Breath of Sorrow\nTurn 7: Swap to your Living Sandling\nTurn 7: Sandstorm\nTurn 8: Quicksand\nTurn 9: Sand Bolt\n",
		["teamName"] = "Gnomeregan Guard Mechanostrider",
	},
	[154919] = {
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			0, -- [3]
			0, -- [4]
			1320, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5508\n\nStrategy added by DragonsAfterDark\nBe cautious, lest you give your enemies the tools to destroy you. *laughs*\n\nVideo for Fight (https://www.youtube.com/watch?v=zXxxLMjdfII)\n\nTurn 1+: Inflation\n",
		["teamName"] = "Voltgorger",
		["minXP"] = 25,
	},
	[141215] = {
		{
			"BattlePet-0-000012BC0A5A", -- [1]
			115, -- [2]
			779, -- [3]
			334, -- [4]
			844, -- [5]
		}, -- [1]
		{
			0, -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			1773, -- [2]
			1758, -- [3]
			518, -- [4]
			1975, -- [5]
		}, -- [3]
		["teamName"] = "Unbreakable",
		["notes"] = "Strategy added by Akyro\nTurn 1: Decoy\nTurn 2: Swap to your Level Pet\nTurn 3: Swap to your Direbeak Hatchling\nTurn 4: Ironskin on Cooldown\nTurn 5: Falcosaur Swarm! until Chitara has the Broken Shell debuff\nTurn 6: Predatory Strike\n",
	},
	[141077] = {
		{
			"BattlePet-0-000006E4C76E", -- [1]
			459, -- [2]
			208, -- [3]
			204, -- [4]
			1957, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01EBA", -- [1]
			184, -- [2]
			357, -- [3]
			1398, -- [4]
			1922, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B01ED3", -- [1]
			459, -- [2]
			640, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [3]
		["teamName"] = "Not So Bad Down Here",
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14342\n\nStrategy added by Druzil#2921\nPass if stunned.\n\n Iron Starlette backup pet\n\nTurn 1: Supercharge\nTurn 2: Call Lightning - Chum dies\nTurn 3: Bring in Lurking Owl Kitten\nTurn 4: Screech\nTurn 5: Quills\nTurn 6: Feathered Frenzy - Bruce should die\nTurn 7: Quills - Lurking Owl Kitten dies\nTurn 8: Bring in Runeforged Servitor\nTurn 9: Supercharge\nTurn 10: Call Lightning - Maws Jr. dies\n",
	},
	[116793] = {
		{
			"BattlePet-0-000012B146CA", -- [1]
			1002, -- [2]
			989, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B118A8", -- [1]
			112, -- [2]
			752, -- [3]
			595, -- [4]
			1567, -- [5]
		}, -- [2]
		{
			"BattlePet-0-0000128A10CB", -- [1]
			202, -- [2]
			524, -- [3]
			609, -- [4]
			3323, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5694\n\nStrategy added by DragonsAfterDark\nTurn 1: Extra Plating\nTurn 2: Make it Rain\nTurn 3-5: Inflation\nTurn 6: Make it Rain\nRandom Enemy comes in:\nTurn 1+: Inflation until dead\nBring in your Sentinel's Companion\nPriority 1: Moonfire & Soulrush on CD\nPriority 2: Peck as filler\n",
		["teamName"] = "Hiss",
		["minXP"] = 25,
	},
	[197336] = {
		{
			"BattlePet-0-000012B146CB", -- [1]
			1370, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "The Oldest Dragonfly",
		["notes"] = "Strategy added by jellyfish\nonly tested once, but it was such a quick and easy victory i thought i would share anyway. \n\nTurn 1: Black Claw\nTurn 2: Flock\nTurn 3: if needed, Savage Talon or Flock again.\n",
	},
	[68564] = {
		{
			0, -- [1]
		}, -- [1]
		{
			"BattlePet-0-000012B484E9", -- [1]
			210, -- [2]
			218, -- [3]
			321, -- [4]
			1238, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [3]
		["teamName"] = "Dos-Ryga",
		["notes"] = "Strategy added by Getafiks#1391\nTurn 1: Pass\nTurn 2: Swap to your Unborn Val'kyr\nTurn 3: Curse of Doom\nTurn 4: Unholy Ascension\nBring in your Ikky\nTurn 1: Black Claw\nTurns 2-4: Flock\n",
	},
	[119343] = {
		{
			"BattlePet-0-000012B5C607", -- [1]
			202, -- [2]
			314, -- [3]
			124, -- [4]
			1166, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B66DA8", -- [1]
			504, -- [2]
			574, -- [3]
			802, -- [4]
			1416, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 5,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1834\n\nStrategy added by NostrA#2338\nProps to Aranesh for his/her strategy, I just changed the TD Script and Strategy to make Teroclaw viable again\n\n\n\nTurn 1-3: use Rampage\nTurn 4+: use Thrash until Klutz's Battle Rat dies\nan enemy Pet comes in\nTurn 1+: use Rampage on cooldown otherwise use Thrash until your Kun-Lai Runt dies\nBring in your Teroclaw Hatchling\nenemy HP < 618: use Ravage\nif the enemy is a Flying Type, you want to use Ravage when the enemy HP is under 406 \nwhen not active: use Nature's Ward\nelse: use Alpha Strike",
		["teamName"] = "Klutz's Battle Rat",
		["minXP"] = 25,
	},
	[200693] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B482D2", -- [1]
			921, -- [2]
			920, -- [3]
			919, -- [4]
			1211, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Tremblor - Rare",
		["notes"] = "Strategy added by station384\nTurn 1: Blistering Cold\nTurn 2: Chop\nTurn 3: BONESTORM\nTurn 4: Repeat till Boneshard dead\nTurn 5: Primal Cry\nTurn 6: Black Claw\nTurn 7: Hunting Party\nTurn 8: Repeat 5-7 till target dead\n",
	},
	[202452] = {
		{
			"BattlePet-0-000012B521D4", -- [1]
			0, -- [2]
			218, -- [3]
			652, -- [4]
			1238, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			0, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Right Twice a Day",
		["notes"] = "Strategy added by Wonderpray\nStraight forward pet battle, very strong team very effective!Script made by: Calipso\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nTurn 3: Bring in Ikky\nTurn 4: Black Claw\nTurns 5-7: Flock\nTurn 8: If necessary finish off with 3rd pet or Ikky\n",
	},
	[150925] = {
		{
			"BattlePet-0-000012B0D34C", -- [1]
			501, -- [2]
			2237, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B1DC70", -- [1]
			608, -- [2]
			483, -- [3]
			440, -- [4]
			2550, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00000A3564FB", -- [1]
			1066, -- [2]
			483, -- [3]
			913, -- [4]
			2550, -- [5]
		}, -- [3]
		["tab"] = 9,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/19106\n\nStrategy added by Remte\nTurn 1: Flame Breath\nTurn 2: Razor Talons\nTurns 3-4: Flame Breath x2\nTurn 5: Armageddon or another Flame Breath\n",
		["teamName"] = "Liz the Tormentor",
		["minXP"] = 1,
	},
	[197102] = {
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146D0", -- [1]
			459, -- [2]
			566, -- [3]
			208, -- [4]
			1387, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "Two and Two Together",
		["notes"] = "Strategy added by Scratike#2323\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\nTurn 5: Tail Sweep until Nexus Whelpling dies\nTurn 6: Wind-Up\nTurn 7: Wind-Up\nTurn 6: WIN\n",
	},
	[116790] = {
		{
			"BattlePet-0-000012B5C2FF", -- [1]
			1773, -- [2]
			1758, -- [3]
			518, -- [4]
			1975, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B6763C", -- [1]
			355, -- [2]
			490, -- [3]
			124, -- [4]
			514, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B96E89", -- [1]
			355, -- [2]
			490, -- [3]
			124, -- [4]
			514, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5693\n\nStrategy added by DragonsAfterDark\nPriority 1: Ironskin on CD\nPriority 2: Predatory Strike on Shattered Defenses\nPriority 3: Falcosaur Swarm! as filler\n",
		["teamName"] = "Vilefang",
		["minXP"] = 25,
	},
	[200684] = {
		{
			"BattlePet-0-000012BB19D8", -- [1]
			0, -- [2]
			0, -- [3]
			460, -- [4]
			1700, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00000D5451F8", -- [1]
			0, -- [2]
			2223, -- [3]
			0, -- [4]
			2352, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00000D511EB1", -- [1]
			0, -- [2]
			2223, -- [3]
			0, -- [4]
			3041, -- [5]
		}, -- [3]
		["teamName"] = "Vortex - Legendary",
		["notes"] = "Strategy added by Lazey\nTurn 1: Illuminate\nTurn 2: Swap to your Baa'l\nTurn 3: Murder the Innocent\nTurn 4: Swap to your Death Seeker\nTurn 5: Murder the Innocent\n",
	},
	[119409] = {
		{
			"BattlePet-0-000012B485C2", -- [1]
			118, -- [2]
			564, -- [3]
			418, -- [4]
			868, -- [5]
		}, -- [1]
		{
			"random:0", -- [1]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["tab"] = 5,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1229\n\nTurn 1: Geyser\nTurn 2+3: Dive\nTurn 4: Water Jet\nTurn 5+: Keep Geyser and Dive on cooldown, otherwise use Water Jet\nIf your Pandaren Water Spirit dies too early, bring in your level 25 pet and use any damaging spell. The incoming Geyser will finish the fight anyway.",
		["teamName"] = "Foe Reaper 50",
		["minXP"] = 25,
	},
	[104553] = {
		{
			"BattlePet-0-000011F1418A", -- [1]
			1392, -- [2]
			800, -- [3]
			1966, -- [4]
			2921, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CB71", -- [1]
			0, -- [2]
			1063, -- [3]
			0, -- [4]
			2454, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Snail Fight!",
		["notes"] = "Strategy added by nogulpfrog\nAverage time ：57S\n\nTurn 1: Great Sting\nTurn 2: Swap to your Kunchong Hatchling\nTurn 3: Pheromones\nTurn 4: Swap to your Level Pet\nTurn 5: Swap to your Gorm Harrier\nTurn 6: Great Sting\nTurn 7: Enrage\nTurn 8: Impale, finish.\n",
	},
	["To a Land Down Under (Beast)"] = {
		{
			"BattlePet-0-000012B528FE", -- [1]
			974, -- [2]
			595, -- [3]
			536, -- [4]
			1266, -- [5]
		}, -- [1]
		{
			"BattlePet-0-00000D450504", -- [1]
			930, -- [2]
			1080, -- [3]
			586, -- [4]
			2622, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00001234372A", -- [1]
			2430, -- [2]
			536, -- [3]
			1536, -- [4]
			3110, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Lazey\nThis is based on the original 10.1 PTR tamer pets' stats/quality/etc. It might need adjustments on last-minute changes (potential nerfs).\n\n-------: XU-FU, CUB OF XUEN priorities: -------\nPrio 1:: In Round 5 swap to your Jingles (or earlier when your pet dies)\nPrio 2:: Enemy pet is not Clawz -> Prowl\nPrio 3:: Moonfire\nPrio 4:: Spirit Claws\n\n-------: JINGLES priorities: -------\nPrio 1:: Enemy is Clawz -> Booby-Trapped Presents\nPrio 2:: Huge Fang\nPrio 3:: Gift of Winter's Veil\nPrio 4:: Pass\nPrio 5:: When Jingles didn't kill Clawz, bring back your Xu-Fu, Cub of Xuen\n\n-------: GIZMO priorities: -------\nPrio 1:: When you're sure it will kill Murrey -> Arcane Dash\n(check Murrey's 50% damage reduce, Moonlight bonus damage, Beast Passive, etc.)\nPrio 2:: Prowl\nPrio 3:: Scrabble\n",
	},
	["Catch team"] = {
		{
			"BattlePet-0-000012B17368", -- [1]
			447, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012C2D394", -- [1]
			111, -- [2]
			307, -- [3]
			826, -- [4]
			1953, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [3]
		["tab"] = 10,
		["favorite"] = true,
	},
	[201004] = {
		{
			"BattlePet-0-000012B607A8", -- [1]
			447, -- [2]
			0, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B15603", -- [1]
			501, -- [2]
			602, -- [3]
			1025, -- [4]
			3100, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B866BC", -- [1]
			186, -- [2]
			308, -- [3]
			204, -- [4]
			1588, -- [5]
		}, -- [3]
		["teamName"] = "To a Land Down Under",
		["notes"] = "Strategy added by WhyDaRumGone\nHigher powered Moths are preferred\n\nTurn 1: Poison Protocol\nTurn 2: Corrosion\nTurn 3: Pass. Note: If Anomalus died round 2 before getting off Corrosion; use Flame Breath\nBring in your Timeless Mechanical Dragonling\nTurn 4: Time Bomb\nTurn 5: Armageddon\nBring in your Moth\nTurn 6: Reckless Strike. Note: Skip this step if Bassalt is already dead\nClawz comes in\nTurn 7: Counterspell\nNote:: If Murrey is still in; pass until Time Bomb hits\nMurrey comes in\nTurn 8: Call Lightning\n",
	},
	[146001] = {
		{
			"BattlePet-0-000012B118E8", -- [1]
			413, -- [2]
			624, -- [3]
			206, -- [4]
			1349, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000006E4C775", -- [1]
			413, -- [2]
			206, -- [3]
			624, -- [4]
			119, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B99B2C", -- [1]
			377, -- [2]
			165, -- [3]
			348, -- [4]
			2459, -- [5]
		}, -- [3]
		["tab"] = 7,
		["notes"] = "Strategy added by DragonsAfterDark\nWhatever pet you have in the third slot should only need to be there to soak backline damage, so make sure it's one you won't be using later on. \n\nTurn 1: Ice Tomb\nTurn 2: Pass\nTurn 3: Call Blizzard\nTurn 4: Ice Lance\nTurn 5: Ice Lance\nTurn 6: Pass\nTurn 7: Ice Tomb\nTurn 8: Pass – your Rotten Little Helper dies\nBring in your Father Winter's Helper\nTurn 1: Call Blizzard\nTurn 2: Ice Lance\nTurn 3: Ice Tomb\nTurn 4: Pass\nTurn 5: Call Blizzard\nTurn 6+: Ice Lance until Annoy-O-Tron dies\n",
		["teamName"] = "Prototype Annoy-O-Tron",
		["minXP"] = 25,
	},
	["Are They Not Beautiful? (Elemental)"] = {
		{
			"BattlePet-0-000011C9500C", -- [1]
			0, -- [2]
			471, -- [3]
			2381, -- [4]
			2898, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B544FE", -- [1]
			514, -- [2]
			0, -- [3]
			589, -- [4]
			3446, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B67B94", -- [1]
			0, -- [2]
			0, -- [3]
			593, -- [4]
			2590, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Cacobeitor\nTurn 1: Dark Bolt + Weakness until your pet dies\nTurn 2: Arcane Storm + Wild Winds until your pet dies\nTurns 3-5: Surge of Power it has to be one shot ability, if enemy HP are higher than the damage of your ability, do a random attack before to lower enemy HP more and then use the strong abliity to finish\nTurn 4: \nTurn 5: \nTurn 6: \nTurn 7: \nTurn 8: \n",
	},
	["Xu-Fu, Cub of Xuen"] = {
		{
			"BattlePet-0-000012B48958", -- [1]
			901, -- [2]
			392, -- [3]
			204, -- [4]
			1178, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			392, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012BAC92C", -- [1]
			777, -- [2]
			646, -- [3]
			209, -- [4]
			338, -- [5]
		}, -- [3]
		["tab"] = 2,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/228\n\nTurn 1: Call Lightning\nTurn 2: Swap to your Lil' Bling\nTurn 3: Make it Rain\nTurn 4+5: Inflation until Lil' Bling is dead\nBring in your Darkmoon Tonk\nTurn 1: Shock and Awe\nTurn 2: Ion Cannon\n",
	},
	["Do You Even Train? (Aquatic)"] = {
		{
			"BattlePet-0-000006E4C793", -- [1]
			0, -- [2]
			380, -- [3]
			920, -- [4]
			1623, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B01EB7", -- [1]
			0, -- [2]
			784, -- [3]
			0, -- [4]
			3303, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B67F31", -- [1]
			429, -- [2]
			0, -- [3]
			564, -- [4]
			1775, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Refreshe#1641\nThis script and strat worked way better than I expected for how simple brain it was...\n\nPriority 1: Primal Cry\nPriority 2: Poison Spit\nBring in your Mallard Duckling when Leviathan Hatchling dies.\nTurn 1+: Shriek\nBring in your Juvenile Scuttleback when Mallard Duckling dies.\nPriority 1: Dive dodge dive.\nPriority 2: Claw\n",
	},
	["healfuck"] = {
		{
			"BattlePet-0-000012B3995F", -- [1]
			360, -- [2]
			404, -- [3]
			366, -- [4]
			2867, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B4C910", -- [1]
			1570, -- [2]
			230, -- [3]
			1231, -- [4]
			3217, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B4838C", -- [1]
			525, -- [2]
			597, -- [3]
			598, -- [4]
			1167, -- [5]
		}, -- [3]
	},
	[201899] = {
		{
			"BattlePet-0-000012B4874E", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1165, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B6751A", -- [1]
			122, -- [2]
			489, -- [3]
			589, -- [4]
			1721, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B67C89", -- [1]
			1737, -- [2]
			934, -- [3]
			564, -- [4]
			2399, -- [5]
		}, -- [3]
		["teamName"] = "A New Vocation",
		["notes"] = "Strategy added by DragonsAfterDark\nThe enemies don't use their abilities in a particular order, hence the priority system.[url=https://youtu.be/qGCV-Bk7bLg]Video for Fight[/url]\n\n~: Priorities for pets 1 & 2\nPriority 1: Arcane Storm on CD\nPriority 2: Mana Surge on CD\nPriority 3: Tail Sweep\nBring in your Hermit Crab\nPriority 1: Bubble or Dive when Kazzquack is Lifted-Off\nPriority 2: Fish Slap\n",
	},
	[116786] = {
		{
			"BattlePet-0-000012B48958", -- [1]
			482, -- [2]
			916, -- [3]
			208, -- [4]
			1178, -- [5]
		}, -- [1]
		{
			"random:6", -- [1]
		}, -- [2]
		{
			"BattlePet-0-000012BA955E", -- [1]
			412, -- [2]
			802, -- [3]
			1050, -- [4]
			1577, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4596\n\nStrategy added by DragonsAfterDark\nTurn 1: Supercharge\nTurn 2: Haywire\nAn enemy pet comes in\nTurn 1: Haywire continues\n\nAfter Turn 1 against Enemy #2:\nBeasts:: Supercharge & Haywire on CD, Laser as filler\nFlying:: Supercharge on CD & Laser \nAquatic:: Supercharge & Haywire on CD, Laser as filler\n\nFlying enemies were the only ones I needed a second pet for, so having a pet with magic abilities on hand is best. Dragonkin with Magic abilities are better.\n",
		["teamName"] = "Deviate Smallclaw",
		["minXP"] = 25,
	},
	[161658] = {
		{
			"BattlePet-0-000012B5CC26", -- [1]
			503, -- [2]
			1754, -- [3]
			179, -- [4]
			3289, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CE9F", -- [1]
			113, -- [2]
			178, -- [3]
			179, -- [4]
			175, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000006E4C75E", -- [1]
			113, -- [2]
			178, -- [3]
			179, -- [4]
			270, -- [5]
		}, -- [3]
		["tab"] = 6,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8940\n\nStrategy added by Pankracy#2378\n11 rounds fast, using relatively easy to get pets. Enjoy ;)\n\nTD Script provided by Shadowball (https://www.wow-petguide.com/User/13817/Shadowball), Thank you!!!\n\nTurn 1: Flamethrower\nTurn 2: Conflagrate\nTurn 3: Flamethrower\nTurn 4: swap to Phoenix Hatchling\nTurn 5: Conflagrate\nTurn 6: Immolate\nTurn 7: Burn\nTurn 8: Burn, Phoenix Hatchling dies, bring Dark Phoenix Hatchling\nTurn 9: Conflagrate, Shred enters Failsafe mode\nTurn 10: Burn\nTurn 11: Burn\n",
		["teamName"] = "Shred",
	},
	["Do You Even Train? (Beast)"] = {
		{
			"BattlePet-0-00001234372A", -- [1]
			2346, -- [2]
			314, -- [3]
			998, -- [4]
			3110, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CB5D", -- [1]
			501, -- [2]
			172, -- [3]
			1966, -- [4]
			2089, -- [5]
		}, -- [2]
		{
			"random:8", -- [1]
		}, -- [3]
		["notes"] = "Strategy added by glowcloud\nEven with the worst luck possible, your third pet should only need to get in a hit or two, so preferably the first slot ability is a Beast ability (I use Dodger because I don't get to use them enough).With good luck, Gizmo almost solos the fight. It's just the classic \"hurt all three enemies at once with one pet\" strat.\n\nTurn 1: Mangle\nAfter this the fight becomes more variable\nPriority 1:: Ethereal when Lifft is Underwater\nPriority 2:: Refresh Mangle on enemy pet if it falls off\nPriority 3:: Swipe\nGizmo dies\nBring in your Infernal Pyreclaw\nTurn 1: Great Sting (if more than one enemy pet is alive)\nTurn 2: Scorched Earth\nTurn 3: Flame Breath\nUse Scorched Earth on CD and Flame Breath as filler\n\nIf Infernal Pyreclaw dies and one or two enemies are still alive, bring in 3rd pet and just hit them once or twice\n",
		["minXP"] = 25,
	},
	[116791] = {
		{
			"BattlePet-0-000012B01DC0", -- [1]
			1002, -- [2]
			392, -- [3]
			985, -- [4]
			1320, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B66DA8", -- [1]
			504, -- [2]
			574, -- [3]
			802, -- [4]
			1416, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00000D70BC6D", -- [1]
			499, -- [2]
			657, -- [3]
			1043, -- [4]
			1964, -- [5]
		}, -- [3]
		["tab"] = 8,
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1827\n\nStrategy added by NostrA#2338\nprops to Aranesh for his/her strategy, i just changed the TD Script and Strategy to make Teroclaw viable again\n\nTurn 1: use Extra Plating\nTurn 2: use Make it Rain\nTurn 3+: use Inflation until Dreadcoil is dead\nan enemy comes in\nTurn 1+: use Inflation until Lil' Bling dies\nBring in your Teroclaw Hatchling\nenemy HP < 618: use Ravage\nif the target enemy is a Flying enemy, you want to use Ravage when the enemy HP is under 406\nwhen not active: use Nature's Ward\nelse: use Alpha Strike\n",
		["teamName"] = "Dreadcoil",
		["minXP"] = 25,
	},
	["To a Land Down Under (Elemental)"] = {
		{
			"BattlePet-0-000012B67B94", -- [1]
			472, -- [2]
			1055, -- [3]
			593, -- [4]
			2590, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CDBD", -- [1]
			118, -- [2]
			1955, -- [3]
			418, -- [4]
			2465, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B67EA7", -- [1]
			514, -- [2]
			515, -- [3]
			204, -- [4]
			445, -- [5]
		}, -- [3]
		["notes"] = "Strategy added by Kalixa\nThis fight is tough with elementals, due to the nature of the opponent's abilities. Bassalt, Clawz, and Murrey do NOT follow a set move pattern, its randomized for every encounter. There are roughly 3-4 different ways this can play out (at least from what I've seen in my testing). If there is a crit or something cast by the opponent's out of order, you're better off reseting the battle.If you have any suggestions, or found a tweak to this strat that works better, let me know! There are probably other combinations - feel free to add them in the comments, and I'll adjust the strat :)\n\nTurn 1: Blast of Hatred\nTurns 2-4: Surge of Power\nClawz comes in\nTurn 1: Breath of Sorrow (If possible - your Ravenous Prideling is gonna die or be dead by this point)\nBring in your Playful Frostkin If Clawz casts Whirlpool before your Frostkin enters, reset - Frostkin will die in 2 turns if you don't.\nTurn 1: Flash Freeze\nTurn 3: Water Jet\nTurn 4: Water Jet (Frostkin either dies here, or on the next round)\nTurn 5: Geyser (If Frostkin is still alive)\nMurrey comes in ; Bring in Tiny Twister\nTurn 1: Flyby\nTurn 2: Call Lightning (If Murrey casts Tough 'N' Cuddly, reset the fight)\n",
	},
	[173267] = {
		{
			"BattlePet-0-000006E4C76E", -- [1]
			0, -- [2]
			208, -- [3]
			204, -- [4]
			1957, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B17368", -- [1]
			447, -- [2]
			2356, -- [3]
			1954, -- [4]
			2842, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B118ED", -- [1]
			0, -- [2]
			0, -- [3]
			209, -- [4]
			1450, -- [5]
		}, -- [3]
		["teamName"] = "Uncomfortably Undercover",
		["notes"] = "Strategy added by 하늘용#3273\n8\n\nTurn 1: Supercharge\nTurn 2: Call Lightning\nTurn 3: Swap to your Anomalus\nTurn 4: Corrosion\nTurn 5: Poison Protocol\nTurn 6: Void Nova\nBring in your Draenei Micro Defender\nTurn 7: Ion Cannon\n",
	},
	[175785] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10148\n\nStrategy added by Lazey\n*** Created on Beta, so maybe not final ***\n\nTurn 1: Blistering Cold\nTurn 2: BONESTORM\nTurn 3: Chop (Boneshard dies)\nBring in your Ikky\nTurn 4: Black Claw\nTurns 5-7: Flock\n",
		["teamName"] = "Kostos",
		["minXP"] = 1,
	},
	["nega"] = {
		{
			"BattlePet-0-000012B99CF2", -- [1]
			503, -- [2]
			906, -- [3]
			1754, -- [4]
			2078, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B589F6", -- [1]
			1958, -- [2]
			2352, -- [3]
			780, -- [4]
			3119, -- [5]
		}, -- [2]
		{
			"BattlePet-0-00001293FB22", -- [1]
			916, -- [2]
			1024, -- [3]
			459, -- [4]
			3243, -- [5]
		}, -- [3]
		["tab"] = 11,
	},
	[66824] = {
		{
			"BattlePet-0-000012B118ED", -- [1]
			384, -- [2]
			1105, -- [3]
			209, -- [4]
			1450, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000011D76CB1", -- [1]
			838, -- [2]
			800, -- [3]
			1559, -- [4]
			3117, -- [5]
		}, -- [2]
		{
			"BattlePet-0-000012B482D1", -- [1]
			921, -- [2]
			919, -- [3]
			364, -- [4]
			1180, -- [5]
		}, -- [3]
		["teamName"] = "Obalis",
		["notes"] = "Strategy added by LogicPoodle#1550\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up, Pyth dies.\nSpring comes in\nTurn 1+: Powerball until Iron Starlette dies, Pass if you get slept\nBring in your Ikky \nTurn 1: Black Claw\nTurn 2+: Flock, Spring dies. If  Ikky dies partway through, clean up with MPD.\nClatter comes in\nTurns 1+: Once Flock finishes, Black Claw then Flock until dead\nTurn 7: Decoy\nTurn 8: Breath until Clatter dies. Easy peasy.\n",
	},
	[173331] = {
		{
			"BattlePet-0-000012B146C7", -- [1]
			943, -- [2]
			786, -- [3]
			1762, -- [4]
			1963, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B146CB", -- [1]
			184, -- [2]
			919, -- [3]
			581, -- [4]
			1532, -- [5]
		}, -- [2]
		{
			"random:0", -- [1]
		}, -- [3]
		["teamName"] = "The Mind Games of Addius",
		["notes"] = "Strategy added by TrundleButt#2544\nTurn 1: Blistering Cold\nTurn 2: Choose option 1 for Mind games (damage to team)\nTurn 3: Chop\nTurn 4: Blistering Cold\nTurn 5: Chop\nTurn 6: Chop\nTurn 7: Bonestorm should die here, switch to Ikky\nTurn 8: Black Claw\nTurn 9: Flock Until it dies\n",
	},
	[99077] = {
		{
			"BattlePet-0-000012C47B1C", -- [1]
			0, -- [2]
			256, -- [3]
			536, -- [4]
			1521, -- [5]
		}, -- [1]
		{
			"BattlePet-0-000012B5CB5D", -- [1]
			501, -- [2]
			172, -- [3]
			1380, -- [4]
			2089, -- [5]
		}, -- [2]
		{
			0, -- [1]
		}, -- [3]
		["teamName"] = "Training with Bredda",
		["notes"] = "Strategy added by Rosqo\n~11 rounds (1:31mins)Follow the steps around when to use Call Darkness carefully as for the levelling pet to get XP this must be on the Cursed Birmans Immortal round.Your Pyreclaw can sometimes crit/get missed so you may need to pass to ensure that it doesn't mess up the end of the fight.Only the P/B breed will consistently winAt the end of the fight Scorched Earth ticks can crit twice and cause the last pet to heal which is super unlucky.\n\nTurn 1: Prowl\nTurn 2: Call Darkness\nSwap to Infernal Pyreclaw\nTurn 1: Shell Armor\nTurn 2: Scorched Earth\nTurn 3+: Flame Breath (If the Pyreclaw has above 500HP when Quillino 460 or less HP pass)\nQuillino dies, Fethyr comes in\nPrio: Pass until Infernal Pyreclaw dies when Fethry is active\nBring in Cursed Birman\nTurn 1: Prowl\nCheck: If Undead racial not active at the start of the turn Pass\nCheck: Call Darkness if Undead racial active (you need to be on the immortal round at the start of the turn you attack for levelling pet to get all XP)\n\n",
	},
}
Rematch4Settings = {
	["NotesFont"] = "GameFontHighlight",
	["JournalUsed"] = true,
	["DialogYPos"] = 819.9999389648438,
	["NotesHeight"] = 299.0000305175781,
	["ShowOnInjured"] = false,
	["QueueSanctuary"] = {
		["BattlePet-0-000012C8D119"] = "QQQ8JI",
		["BattlePet-0-000012CA15E8"] = "QQQ5346",
		["BattlePet-0-000012CA86B1"] = "QQQ32JI",
		["BattlePet-0-000012CA14E0"] = "QQQ6335",
		["BattlePet-0-000012CA865F"] = "QQQ32JJ",
		["BattlePet-0-000012CA82BB"] = "QQQ92J6",
		["BattlePet-0-000012CA160F"] = "QQQ5349",
		["BattlePet-0-000012CA8678"] = "QQQA2JG",
		["BattlePet-0-000012CA15BB"] = "QQQ3345",
		["BattlePet-0-000012C8BB03"] = "QQQ7E0",
		["BattlePet-0-000012C8A816"] = "QQQ3D2",
		["BattlePet-0-000012CA163D"] = "QQQC34C",
		["BattlePet-0-000012CA855A"] = "QQQ72JA",
		["BattlePet-0-000012CA14BF"] = "QQQ3348",
		["BattlePet-0-000012CA870E"] = "QQQ32JC",
		["BattlePet-0-000012CA14FE"] = "QQQ3342",
		["BattlePet-0-000012CA159C"] = "QQQB34D",
		["BattlePet-0-000012CA1520"] = "QQQ933N",
	},
	["Sort"] = {
		["Order"] = 50,
	},
	["JournalPanel"] = 1,
	["BackupCount"] = 175,
	["PetCardXPos"] = 749,
	["PreferredMode"] = 1,
	["NotesLeft"] = 1313,
	["Sanctuary"] = {
		["BattlePet-0-000006E4C767"] = {
			1, -- [1]
			true, -- [2]
			202, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-0000086053F1"] = {
			1, -- [1]
			true, -- [2]
			2118, -- [3]
			25, -- [4]
			1806, -- [5]
			260, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000011F1418A"] = {
			2, -- [1]
			true, -- [2]
			2921, -- [3]
			25, -- [4]
			1319, -- [5]
			337, -- [6]
			264, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA86B1"] = {
			1, -- [1]
			true, -- [2]
			2674, -- [3]
			23, -- [4]
			1445, -- [5]
			232, -- [6]
			262, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5E5CA"] = {
			1, -- [1]
			true, -- [2]
			2398, -- [3]
			25, -- [4]
			1339, -- [5]
			248, -- [6]
			349, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01EA8"] = {
			1, -- [1]
			true, -- [2]
			1156, -- [3]
			25, -- [4]
			1400, -- [5]
			289, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C7A0"] = {
			1, -- [1]
			true, -- [2]
			847, -- [3]
			25, -- [4]
			1546, -- [5]
			273, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67649"] = {
			1, -- [1]
			true, -- [2]
			1701, -- [3]
			25, -- [4]
			1465, -- [5]
			257, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B18C43"] = {
			2, -- [1]
			true, -- [2]
			383, -- [3]
			25, -- [4]
			1400, -- [5]
			273, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B6763C"] = {
			2, -- [1]
			true, -- [2]
			514, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B3995F"] = {
			1, -- [1]
			true, -- [2]
			2867, -- [3]
			25, -- [4]
			1197, -- [5]
			297, -- [6]
			329, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012692A6E"] = {
			1, -- [1]
			true, -- [2]
			3415, -- [3]
			25, -- [4]
			1725, -- [5]
			276, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01E0B"] = {
			2, -- [1]
			true, -- [2]
			3382, -- [3]
			25, -- [4]
			1546, -- [5]
			305, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B11883"] = {
			1, -- [1]
			true, -- [2]
			3020, -- [3]
			25, -- [4]
			1307, -- [5]
			254, -- [6]
			349, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B96E89"] = {
			3, -- [1]
			true, -- [2]
			514, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C2DB32"] = {
			1, -- [1]
			true, -- [2]
			3489, -- [3]
			25, -- [4]
			1319, -- [5]
			289, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99CCC"] = {
			1, -- [1]
			true, -- [2]
			1343, -- [3]
			25, -- [4]
			1400, -- [5]
			325, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B118A8"] = {
			4, -- [1]
			true, -- [2]
			1567, -- [3]
			25, -- [4]
			1319, -- [5]
			305, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C762"] = {
			1, -- [1]
			true, -- [2]
			243, -- [3]
			25, -- [4]
			1627, -- [5]
			322, -- [6]
			208, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01E47"] = {
			1, -- [1]
			true, -- [2]
			1754, -- [3]
			25, -- [4]
			1506, -- [5]
			276, -- [6]
			281, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67BBE"] = {
			1, -- [1]
			true, -- [2]
			2451, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B3E786"] = {
			3, -- [1]
			true, -- [2]
			2648, -- [3]
			25, -- [4]
			1343, -- [5]
			288, -- [6]
			299, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA160F"] = {
			1, -- [1]
			true, -- [2]
			3209, -- [3]
			23, -- [4]
			1049, -- [5]
			202, -- [6]
			266, -- [7]
			2, -- [8]
		},
		["BattlePet-0-000012C82AA8"] = {
			1, -- [1]
			true, -- [2]
			2756, -- [3]
			25, -- [4]
			1583, -- [5]
			309, -- [6]
			240, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B9027A"] = {
			3, -- [1]
			true, -- [2]
			743, -- [3]
			25, -- [4]
			1790, -- [5]
			289, -- [6]
			208, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01EB7"] = {
			1, -- [1]
			true, -- [2]
			3303, -- [3]
			25, -- [4]
			1420, -- [5]
			280, -- [6]
			284, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5C2FF"] = {
			10, -- [1]
			true, -- [2]
			1975, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B528FE"] = {
			6, -- [1]
			true, -- [2]
			1266, -- [3]
			25, -- [4]
			1400, -- [5]
			333, -- [6]
			252, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C754"] = {
			2, -- [1]
			true, -- [2]
			1931, -- [3]
			25, -- [4]
			1319, -- [5]
			305, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B17368"] = {
			10, -- [1]
			true, -- [2]
			2842, -- [3]
			25, -- [4]
			1034, -- [5]
			362, -- [6]
			297, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99C8C"] = {
			1, -- [1]
			true, -- [2]
			2466, -- [3]
			25, -- [4]
			1359, -- [5]
			329, -- [6]
			264, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CBA7"] = {
			3, -- [1]
			true, -- [2]
			1149, -- [3]
			25, -- [4]
			1400, -- [5]
			289, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-0000088F2EFD"] = {
			2, -- [1]
			true, -- [2]
			2119, -- [3]
			25, -- [4]
			1481, -- [5]
			325, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B82344"] = {
			1, -- [1]
			true, -- [2]
			2839, -- [3]
			25, -- [4]
			1274, -- [5]
			347, -- [6]
			257, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01DC0"] = {
			10, -- [1]
			true, -- [2]
			1320, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C47B1C"] = {
			1, -- [1]
			true, -- [2]
			1521, -- [3]
			25, -- [4]
			1400, -- [5]
			289, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B4838C"] = {
			9, -- [1]
			true, -- [2]
			1167, -- [3]
			25, -- [4]
			1400, -- [5]
			305, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B607A4"] = {
			2, -- [1]
			true, -- [2]
			1212, -- [3]
			25, -- [4]
			1302, -- [5]
			305, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B1731B"] = {
			1, -- [1]
			true, -- [2]
			513, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B118E8"] = {
			3, -- [1]
			true, -- [2]
			1349, -- [3]
			25, -- [4]
			1359, -- [5]
			333, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B6AE80"] = {
			1, -- [1]
			true, -- [2]
			2866, -- [3]
			25, -- [4]
			1197, -- [5]
			310, -- [6]
			310, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B484E9"] = {
			12, -- [1]
			true, -- [2]
			1238, -- [3]
			25, -- [4]
			1806, -- [5]
			276, -- [6]
			227, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B3956C"] = {
			1, -- [1]
			true, -- [2]
			2647, -- [3]
			25, -- [4]
			1692, -- [5]
			260, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67E7B"] = {
			1, -- [1]
			true, -- [2]
			1766, -- [3]
			25, -- [4]
			1339, -- [5]
			337, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99D14"] = {
			1, -- [1]
			true, -- [2]
			3376, -- [3]
			25, -- [4]
			1481, -- [5]
			292, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B81435"] = {
			2, -- [1]
			true, -- [2]
			2842, -- [3]
			25, -- [4]
			1034, -- [5]
			362, -- [6]
			297, -- [7]
			4, -- [8]
		},
		["random:3"] = {
			4, -- [1]
		},
		["BattlePet-0-000012CA159C"] = {
			1, -- [1]
			true, -- [2]
			3213, -- [3]
			23, -- [4]
			1235, -- [5]
			233, -- [6]
			249, -- [7]
			3, -- [8]
		},
		["BattlePet-0-000006E4C77C"] = {
			3, -- [1]
			true, -- [2]
			117, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CB74"] = {
			1, -- [1]
			true, -- [2]
			3355, -- [3]
			25, -- [4]
			1441, -- [5]
			273, -- [6]
			297, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00000A3564FB"] = {
			2, -- [1]
			true, -- [2]
			2550, -- [3]
			25, -- [4]
			1506, -- [5]
			244, -- [6]
			314, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B15603"] = {
			14, -- [1]
			true, -- [2]
			3100, -- [3]
			25, -- [4]
			1441, -- [5]
			346, -- [6]
			231, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CB71"] = {
			1, -- [1]
			true, -- [2]
			2454, -- [3]
			25, -- [4]
			1502, -- [5]
			345, -- [6]
			219, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000011D76CB1"] = {
			2, -- [1]
			true, -- [2]
			3117, -- [3]
			25, -- [4]
			1465, -- [5]
			301, -- [6]
			264, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00000D640E69"] = {
			1, -- [1]
			true, -- [2]
			1634, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01EEC"] = {
			3, -- [1]
			true, -- [2]
			1627, -- [3]
			25, -- [4]
			1546, -- [5]
			260, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01E72"] = {
			1, -- [1]
			true, -- [2]
			3306, -- [3]
			25, -- [4]
			1420, -- [5]
			288, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CBA5"] = {
			1, -- [1]
			true, -- [2]
			1687, -- [3]
			25, -- [4]
			1441, -- [5]
			292, -- [6]
			268, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C768"] = {
			1, -- [1]
			true, -- [2]
			291, -- [3]
			25, -- [4]
			1709, -- [5]
			257, -- [6]
			257, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B96E7D"] = {
			1, -- [1]
			true, -- [2]
			1226, -- [3]
			25, -- [4]
			1319, -- [5]
			305, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00001293FB22"] = {
			1, -- [1]
			true, -- [2]
			3243, -- [3]
			25, -- [4]
			1400, -- [5]
			341, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C8D119"] = {
			1, -- [1]
			true, -- [2]
			626, -- [3]
			13, -- [4]
			734, -- [5]
			150, -- [6]
			159, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BA94D5"] = {
			1, -- [1]
			true, -- [2]
			846, -- [3]
			25, -- [4]
			1075, -- [5]
			260, -- [6]
			390, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BC13BD"] = {
			1, -- [1]
			true, -- [2]
			3523, -- [3]
			25, -- [4]
			1583, -- [5]
			288, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA1520"] = {
			1, -- [1]
			true, -- [2]
			3191, -- [3]
			23, -- [4]
			1124, -- [5]
			161, -- [6]
			228, -- [7]
			1, -- [8]
		},
		["BattlePet-0-000012B01E78"] = {
			1, -- [1]
			true, -- [2]
			3348, -- [3]
			25, -- [4]
			1319, -- [5]
			289, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01EA5"] = {
			1, -- [1]
			true, -- [2]
			2467, -- [3]
			25, -- [4]
			1380, -- [5]
			256, -- [6]
			333, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000011CA3D76"] = {
			1, -- [1]
			true, -- [2]
			2931, -- [3]
			25, -- [4]
			1928, -- [5]
			252, -- [6]
			227, -- [7]
			4, -- [8]
		},
		["random:8"] = {
			3, -- [1]
		},
		["BattlePet-0-000008A86E91"] = {
			2, -- [1]
			true, -- [2]
			1927, -- [3]
			25, -- [4]
			1400, -- [5]
			305, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BA956E"] = {
			1, -- [1]
			true, -- [2]
			2462, -- [3]
			25, -- [4]
			1359, -- [5]
			272, -- [6]
			321, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C570D3"] = {
			1, -- [1]
			true, -- [2]
			1713, -- [3]
			25, -- [4]
			1481, -- [5]
			325, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01E66"] = {
			1, -- [1]
			true, -- [2]
			1804, -- [3]
			25, -- [4]
			1319, -- [5]
			292, -- [6]
			292, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B146C9"] = {
			3, -- [1]
			true, -- [2]
			200, -- [3]
			25, -- [4]
			1400, -- [5]
			227, -- [6]
			357, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B6751A"] = {
			4, -- [1]
			true, -- [2]
			1721, -- [3]
			25, -- [4]
			1400, -- [5]
			305, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CDB4"] = {
			1, -- [1]
			true, -- [2]
			4255, -- [3]
			25, -- [4]
			1627, -- [5]
			289, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000011C8C36A"] = {
			1, -- [1]
			true, -- [2]
			3131, -- [3]
			25, -- [4]
			1603, -- [5]
			284, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BAC92C"] = {
			2, -- [1]
			true, -- [2]
			338, -- [3]
			25, -- [4]
			1627, -- [5]
			273, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01EED"] = {
			3, -- [1]
			true, -- [2]
			1625, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B48958"] = {
			4, -- [1]
			true, -- [2]
			1178, -- [3]
			25, -- [4]
			1400, -- [5]
			325, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B146D0"] = {
			22, -- [1]
			true, -- [2]
			1387, -- [3]
			25, -- [4]
			1400, -- [5]
			305, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B66DA8"] = {
			9, -- [1]
			true, -- [2]
			1416, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C76E"] = {
			5, -- [1]
			true, -- [2]
			1957, -- [3]
			25, -- [4]
			1644, -- [5]
			276, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5C356"] = {
			3, -- [1]
			true, -- [2]
			1974, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-0000128A10CB"] = {
			1, -- [1]
			true, -- [2]
			3323, -- [3]
			25, -- [4]
			1465, -- [5]
			305, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99945"] = {
			3, -- [1]
			true, -- [2]
			2417, -- [3]
			25, -- [4]
			1278, -- [5]
			349, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CB5D"] = {
			3, -- [1]
			true, -- [2]
			2089, -- [3]
			25, -- [4]
			1465, -- [5]
			289, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00000D5451F8"] = {
			8, -- [1]
			true, -- [2]
			2352, -- [3]
			25, -- [4]
			1522, -- [5]
			284, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00001234372A"] = {
			3, -- [1]
			true, -- [2]
			3110, -- [3]
			25, -- [4]
			1339, -- [5]
			289, -- [6]
			301, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BC0A5A"] = {
			4, -- [1]
			true, -- [2]
			844, -- [3]
			25, -- [4]
			1400, -- [5]
			276, -- [6]
			309, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C22319"] = {
			1, -- [1]
			true, -- [2]
			1351, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01E39"] = {
			2, -- [1]
			true, -- [2]
			1628, -- [3]
			25, -- [4]
			1546, -- [5]
			273, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-0000122BADD1"] = {
			2, -- [1]
			true, -- [2]
			1160, -- [3]
			25, -- [4]
			1481, -- [5]
			289, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C782"] = {
			8, -- [1]
			true, -- [2]
			1152, -- [3]
			25, -- [4]
			1644, -- [5]
			276, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99946"] = {
			2, -- [1]
			true, -- [2]
			1601, -- [3]
			25, -- [4]
			1197, -- [5]
			366, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B4C5B0"] = {
			2, -- [1]
			true, -- [2]
			1427, -- [3]
			25, -- [4]
			1420, -- [5]
			272, -- [6]
			292, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BA9540"] = {
			2, -- [1]
			true, -- [2]
			1571, -- [3]
			25, -- [4]
			1546, -- [5]
			260, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B4861E"] = {
			2, -- [1]
			true, -- [2]
			557, -- [3]
			25, -- [4]
			1319, -- [5]
			276, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01DE4"] = {
			1, -- [1]
			true, -- [2]
			1968, -- [3]
			25, -- [4]
			1339, -- [5]
			289, -- [6]
			301, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00000D70BC6D"] = {
			1, -- [1]
			true, -- [2]
			1964, -- [3]
			25, -- [4]
			1400, -- [5]
			325, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99CF2"] = {
			5, -- [1]
			true, -- [2]
			2078, -- [3]
			25, -- [4]
			1887, -- [5]
			260, -- [6]
			227, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B482D1"] = {
			5, -- [1]
			true, -- [2]
			1180, -- [3]
			25, -- [4]
			1237, -- [5]
			276, -- [6]
			341, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA14BF"] = {
			1, -- [1]
			true, -- [2]
			3208, -- [3]
			23, -- [4]
			1204, -- [5]
			235, -- [6]
			248, -- [7]
			3, -- [8]
		},
		["BattlePet-0-000012B6AE3C"] = {
			3, -- [1]
			true, -- [2]
			2865, -- [3]
			25, -- [4]
			1197, -- [5]
			310, -- [6]
			310, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B4AB86"] = {
			2, -- [1]
			true, -- [2]
			724, -- [3]
			25, -- [4]
			1465, -- [5]
			289, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000007C1D04D"] = {
			1, -- [1]
			true, -- [2]
			1624, -- [3]
			25, -- [4]
			1400, -- [5]
			325, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B82340"] = {
			1, -- [1]
			true, -- [2]
			2839, -- [3]
			25, -- [4]
			1274, -- [5]
			347, -- [6]
			257, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BEEEA6"] = {
			2, -- [1]
			true, -- [2]
			1539, -- [3]
			25, -- [4]
			1400, -- [5]
			325, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B0D34C"] = {
			8, -- [1]
			true, -- [2]
			3100, -- [3]
			25, -- [4]
			1441, -- [5]
			346, -- [6]
			231, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BA950B"] = {
			1, -- [1]
			true, -- [2]
			1541, -- [3]
			25, -- [4]
			1465, -- [5]
			289, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C5B130"] = {
			1, -- [1]
			true, -- [2]
			1385, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B58989"] = {
			1, -- [1]
			true, -- [2]
			3119, -- [3]
			25, -- [4]
			1343, -- [5]
			297, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67B94"] = {
			4, -- [1]
			true, -- [2]
			2590, -- [3]
			25, -- [4]
			1262, -- [5]
			310, -- [6]
			293, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CC26"] = {
			2, -- [1]
			true, -- [2]
			3289, -- [3]
			25, -- [4]
			1441, -- [5]
			273, -- [6]
			297, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B6C84B"] = {
			1, -- [1]
			true, -- [2]
			2866, -- [3]
			25, -- [4]
			1197, -- [5]
			310, -- [6]
			310, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00001299F70E"] = {
			1, -- [1]
			true, -- [2]
			3511, -- [3]
			25, -- [4]
			1522, -- [5]
			277, -- [6]
			277, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BAFD31"] = {
			1, -- [1]
			true, -- [2]
			2001, -- [3]
			25, -- [4]
			1562, -- [5]
			284, -- [6]
			252, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B98D26"] = {
			1, -- [1]
			true, -- [2]
			1778, -- [3]
			25, -- [4]
			1400, -- [5]
			257, -- [6]
			322, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01ED3"] = {
			9, -- [1]
			true, -- [2]
			1387, -- [3]
			25, -- [4]
			1546, -- [5]
			305, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99D43"] = {
			1, -- [1]
			true, -- [2]
			1385, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99C7F"] = {
			1, -- [1]
			true, -- [2]
			72, -- [3]
			25, -- [4]
			1400, -- [5]
			227, -- [6]
			357, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67566"] = {
			5, -- [1]
			true, -- [2]
			627, -- [3]
			25, -- [4]
			1546, -- [5]
			305, -- [6]
			240, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B146CA"] = {
			7, -- [1]
			true, -- [2]
			1320, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99948"] = {
			1, -- [1]
			true, -- [2]
			2000, -- [3]
			25, -- [4]
			1400, -- [5]
			289, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C7AB"] = {
			1, -- [1]
			true, -- [2]
			1964, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67A9C"] = {
			1, -- [1]
			true, -- [2]
			3449, -- [3]
			25, -- [4]
			1806, -- [5]
			268, -- [6]
			236, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B90213"] = {
			2, -- [1]
			true, -- [2]
			2765, -- [3]
			25, -- [4]
			1506, -- [5]
			293, -- [6]
			261, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C8BB03"] = {
			1, -- [1]
			true, -- [2]
			448, -- [3]
			18, -- [4]
			1061, -- [5]
			171, -- [6]
			194, -- [7]
			3, -- [8]
		},
		["BattlePet-0-000012B146D1"] = {
			18, -- [1]
			true, -- [2]
			844, -- [3]
			25, -- [4]
			1400, -- [5]
			276, -- [6]
			309, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CB59"] = {
			1, -- [1]
			true, -- [2]
			1146, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C78A"] = {
			1, -- [1]
			true, -- [2]
			1961, -- [3]
			25, -- [4]
			1847, -- [5]
			252, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA14E0"] = {
			1, -- [1]
			true, -- [2]
			3173, -- [3]
			23, -- [4]
			1492, -- [5]
			190, -- [6]
			190, -- [7]
			2, -- [8]
		},
		["BattlePet-0-000006E4C761"] = {
			1, -- [1]
			true, -- [2]
			225, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000011F7F5D4"] = {
			1, -- [1]
			true, -- [2]
			378, -- [3]
			25, -- [4]
			1465, -- [5]
			240, -- [6]
			322, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B6760E"] = {
			2, -- [1]
			true, -- [2]
			1935, -- [3]
			25, -- [4]
			1441, -- [5]
			268, -- [6]
			292, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B822C1"] = {
			1, -- [1]
			true, -- [2]
			2836, -- [3]
			25, -- [4]
			1278, -- [5]
			319, -- [6]
			284, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99962"] = {
			1, -- [1]
			true, -- [2]
			429, -- [3]
			25, -- [4]
			1644, -- [5]
			276, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B17369"] = {
			2, -- [1]
			true, -- [2]
			1177, -- [3]
			25, -- [4]
			1627, -- [5]
			289, -- [6]
			240, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99943"] = {
			1, -- [1]
			true, -- [2]
			1180, -- [3]
			25, -- [4]
			1237, -- [5]
			341, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B675D0"] = {
			1, -- [1]
			true, -- [2]
			538, -- [3]
			25, -- [4]
			1481, -- [5]
			305, -- [6]
			257, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B589F6"] = {
			2, -- [1]
			true, -- [2]
			3119, -- [3]
			25, -- [4]
			1278, -- [5]
			268, -- [6]
			341, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B118AA"] = {
			1, -- [1]
			true, -- [2]
			1565, -- [3]
			25, -- [4]
			1465, -- [5]
			273, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012843ED8"] = {
			1, -- [1]
			true, -- [2]
			3323, -- [3]
			25, -- [4]
			1465, -- [5]
			305, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012949F80"] = {
			1, -- [1]
			true, -- [2]
			3333, -- [3]
			25, -- [4]
			1465, -- [5]
			264, -- [6]
			301, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B146CF"] = {
			1, -- [1]
			true, -- [2]
			1885, -- [3]
			25, -- [4]
			1465, -- [5]
			273, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["random:7"] = {
			1, -- [1]
		},
		["BattlePet-0-000012B58B24"] = {
			4, -- [1]
			true, -- [2]
			339, -- [3]
			25, -- [4]
			1546, -- [5]
			273, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B118ED"] = {
			3, -- [1]
			true, -- [2]
			1450, -- [3]
			25, -- [4]
			1400, -- [5]
			289, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CBAA"] = {
			1, -- [1]
			true, -- [2]
			2084, -- [3]
			25, -- [4]
			1319, -- [5]
			297, -- [6]
			297, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B96E94"] = {
			1, -- [1]
			true, -- [2]
			1518, -- [3]
			25, -- [4]
			1400, -- [5]
			341, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA8678"] = {
			1, -- [1]
			true, -- [2]
			2672, -- [3]
			23, -- [4]
			1020, -- [5]
			214, -- [6]
			193, -- [7]
			1, -- [8]
		},
		["BattlePet-0-000012CA163D"] = {
			1, -- [1]
			true, -- [2]
			3212, -- [3]
			23, -- [4]
			1431, -- [5]
			251, -- [6]
			251, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C79F"] = {
			3, -- [1]
			true, -- [2]
			1965, -- [3]
			25, -- [4]
			1587, -- [5]
			297, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000011F771E8"] = {
			1, -- [1]
			true, -- [2]
			1151, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C7B7"] = {
			1, -- [1]
			true, -- [2]
			1962, -- [3]
			25, -- [4]
			1400, -- [5]
			289, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67F31"] = {
			1, -- [1]
			true, -- [2]
			1775, -- [3]
			25, -- [4]
			1319, -- [5]
			305, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01E0C"] = {
			1, -- [1]
			true, -- [2]
			1632, -- [3]
			25, -- [4]
			1725, -- [5]
			260, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-0000129D3A43"] = {
			1, -- [1]
			true, -- [2]
			3580, -- [3]
			25, -- [4]
			1627, -- [5]
			305, -- [6]
			227, -- [7]
			4, -- [8]
		},
		["BattlePet-0-0000083A0A6A"] = {
			4, -- [1]
			true, -- [2]
			1537, -- [3]
			25, -- [4]
			1725, -- [5]
			260, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B90214"] = {
			1, -- [1]
			true, -- [2]
			2839, -- [3]
			25, -- [4]
			1274, -- [5]
			347, -- [6]
			257, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B1DC70"] = {
			1, -- [1]
			true, -- [2]
			2550, -- [3]
			25, -- [4]
			1506, -- [5]
			244, -- [6]
			314, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C76A"] = {
			1, -- [1]
			true, -- [2]
			1720, -- [3]
			25, -- [4]
			1400, -- [5]
			273, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C1A7C1"] = {
			1, -- [1]
			true, -- [2]
			2865, -- [3]
			25, -- [4]
			1197, -- [5]
			345, -- [6]
			280, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C788"] = {
			1, -- [1]
			true, -- [2]
			203, -- [3]
			25, -- [4]
			1546, -- [5]
			240, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C4A5C4"] = {
			1, -- [1]
			true, -- [2]
			2380, -- [3]
			25, -- [4]
			1546, -- [5]
			273, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA82BB"] = {
			1, -- [1]
			true, -- [2]
			2662, -- [3]
			23, -- [4]
			1412, -- [5]
			239, -- [6]
			270, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B608F8"] = {
			2, -- [1]
			true, -- [2]
			519, -- [3]
			25, -- [4]
			1806, -- [5]
			260, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B96E95"] = {
			1, -- [1]
			true, -- [2]
			186, -- [3]
			25, -- [4]
			1319, -- [5]
			341, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B96D57"] = {
			1, -- [1]
			true, -- [2]
			2667, -- [3]
			25, -- [4]
			1530, -- [5]
			291, -- [6]
			262, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C7A1"] = {
			3, -- [1]
			true, -- [2]
			320, -- [3]
			25, -- [4]
			1627, -- [5]
			273, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B521D4"] = {
			14, -- [1]
			true, -- [2]
			1238, -- [3]
			25, -- [4]
			1562, -- [5]
			292, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01EBA"] = {
			1, -- [1]
			true, -- [2]
			1922, -- [3]
			25, -- [4]
			1359, -- [5]
			289, -- [6]
			297, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99A03"] = {
			1, -- [1]
			true, -- [2]
			291, -- [3]
			25, -- [4]
			1709, -- [5]
			257, -- [6]
			257, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CB68"] = {
			1, -- [1]
			true, -- [2]
			1150, -- [3]
			25, -- [4]
			1546, -- [5]
			260, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B146CC"] = {
			10, -- [1]
			true, -- [2]
			1152, -- [3]
			25, -- [4]
			1644, -- [5]
			276, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BC0A28"] = {
			1, -- [1]
			true, -- [2]
			2041, -- [3]
			25, -- [4]
			1709, -- [5]
			289, -- [6]
			227, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B822C0"] = {
			2, -- [1]
			true, -- [2]
			2833, -- [3]
			25, -- [4]
			1705, -- [5]
			282, -- [6]
			242, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B66D54"] = {
			2, -- [1]
			true, -- [2]
			1976, -- [3]
			25, -- [4]
			1400, -- [5]
			325, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67EA7"] = {
			1, -- [1]
			true, -- [2]
			445, -- [3]
			25, -- [4]
			1725, -- [5]
			260, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99C74"] = {
			1, -- [1]
			true, -- [2]
			1329, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA15E8"] = {
			1, -- [1]
			true, -- [2]
			3206, -- [3]
			23, -- [4]
			963, -- [5]
			196, -- [6]
			230, -- [7]
			1, -- [8]
		},
		["BattlePet-0-000012B5C607"] = {
			1, -- [1]
			true, -- [2]
			1166, -- [3]
			25, -- [4]
			1400, -- [5]
			305, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B485C2"] = {
			3, -- [1]
			true, -- [2]
			868, -- [3]
			25, -- [4]
			1546, -- [5]
			260, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["random:4"] = {
			3, -- [1]
		},
		["BattlePet-0-000012B6764A"] = {
			6, -- [1]
			true, -- [2]
			1403, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CE8E"] = {
			1, -- [1]
			true, -- [2]
			1545, -- [3]
			25, -- [4]
			1465, -- [5]
			273, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B751E1"] = {
			1, -- [1]
			true, -- [2]
			3319, -- [3]
			25, -- [4]
			1465, -- [5]
			293, -- [6]
			272, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B58A19"] = {
			1, -- [1]
			true, -- [2]
			3119, -- [3]
			25, -- [4]
			1343, -- [5]
			281, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CB60"] = {
			1, -- [1]
			true, -- [2]
			2843, -- [3]
			25, -- [4]
			1481, -- [5]
			292, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-0000080D00C4"] = {
			1, -- [1]
			true, -- [2]
			2116, -- [3]
			25, -- [4]
			1465, -- [5]
			260, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C2D394"] = {
			1, -- [1]
			true, -- [2]
			1953, -- [3]
			25, -- [4]
			1465, -- [5]
			265, -- [6]
			297, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01DE0"] = {
			1, -- [1]
			true, -- [2]
			120, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000011E9D229"] = {
			1, -- [1]
			true, -- [2]
			3038, -- [3]
			25, -- [4]
			1709, -- [5]
			281, -- [6]
			236, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99B2D"] = {
			1, -- [1]
			true, -- [2]
			2586, -- [3]
			25, -- [4]
			1664, -- [5]
			248, -- [6]
			284, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CDBD"] = {
			1, -- [1]
			true, -- [2]
			2465, -- [3]
			25, -- [4]
			1526, -- [5]
			297, -- [6]
			256, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B3E06C"] = {
			2, -- [1]
			true, -- [2]
			1229, -- [3]
			25, -- [4]
			1359, -- [5]
			260, -- [6]
			333, -- [7]
			4, -- [8]
		},
		["random:10"] = {
			3, -- [1]
		},
		["BattlePet-0-000012B90271"] = {
			1, -- [1]
			true, -- [2]
			743, -- [3]
			25, -- [4]
			1790, -- [5]
			289, -- [6]
			208, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B11899"] = {
			1, -- [1]
			true, -- [2]
			2954, -- [3]
			25, -- [4]
			1485, -- [5]
			272, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C7B4"] = {
			2, -- [1]
			true, -- [2]
			1532, -- [3]
			25, -- [4]
			1319, -- [5]
			322, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA15BB"] = {
			1, -- [1]
			true, -- [2]
			3205, -- [3]
			23, -- [4]
			1296, -- [5]
			269, -- [6]
			254, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BA955E"] = {
			1, -- [1]
			true, -- [2]
			1577, -- [3]
			25, -- [4]
			1465, -- [5]
			273, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000011C9500C"] = {
			1, -- [1]
			true, -- [2]
			2898, -- [3]
			25, -- [4]
			1465, -- [5]
			300, -- [6]
			262, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99CF8"] = {
			2, -- [1]
			true, -- [2]
			85, -- [3]
			25, -- [4]
			1627, -- [5]
			244, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C756"] = {
			1, -- [1]
			true, -- [2]
			162, -- [3]
			25, -- [4]
			1465, -- [5]
			305, -- [6]
			257, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B482D2"] = {
			11, -- [1]
			true, -- [2]
			1211, -- [3]
			25, -- [4]
			1302, -- [5]
			305, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C7A6"] = {
			1, -- [1]
			true, -- [2]
			1233, -- [3]
			25, -- [4]
			1441, -- [5]
			305, -- [6]
			265, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01E16"] = {
			1, -- [1]
			true, -- [2]
			1629, -- [3]
			25, -- [4]
			1465, -- [5]
			289, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BA9563"] = {
			1, -- [1]
			true, -- [2]
			2190, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B673F3"] = {
			12, -- [1]
			true, -- [2]
			2717, -- [3]
			25, -- [4]
			1619, -- [5]
			287, -- [6]
			248, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00001275D175"] = {
			1, -- [1]
			true, -- [2]
			3319, -- [3]
			25, -- [4]
			1465, -- [5]
			293, -- [6]
			272, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01E92"] = {
			1, -- [1]
			true, -- [2]
			122, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CC18"] = {
			1, -- [1]
			true, -- [2]
			2092, -- [3]
			25, -- [4]
			1627, -- [5]
			289, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BEE376"] = {
			1, -- [1]
			true, -- [2]
			2710, -- [3]
			25, -- [4]
			1197, -- [5]
			289, -- [6]
			330, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B4874E"] = {
			12, -- [1]
			true, -- [2]
			1165, -- [3]
			25, -- [4]
			1400, -- [5]
			341, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C793"] = {
			2, -- [1]
			true, -- [2]
			1623, -- [3]
			25, -- [4]
			1465, -- [5]
			289, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B0D34B"] = {
			1, -- [1]
			true, -- [2]
			309, -- [3]
			25, -- [4]
			1156, -- [5]
			322, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00000D450504"] = {
			3, -- [1]
			true, -- [2]
			2622, -- [3]
			25, -- [4]
			1319, -- [5]
			256, -- [6]
			345, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B66C49"] = {
			3, -- [1]
			true, -- [2]
			746, -- [3]
			25, -- [4]
			1481, -- [5]
			357, -- [6]
			211, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B4C910"] = {
			2, -- [1]
			true, -- [2]
			3217, -- [3]
			25, -- [4]
			1359, -- [5]
			341, -- [6]
			252, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00001274E208"] = {
			1, -- [1]
			true, -- [2]
			3378, -- [3]
			25, -- [4]
			1607, -- [5]
			269, -- [6]
			265, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B2E223"] = {
			2, -- [1]
			true, -- [2]
			1934, -- [3]
			25, -- [4]
			1627, -- [5]
			289, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67A9B"] = {
			1, -- [1]
			true, -- [2]
			2692, -- [3]
			25, -- [4]
			1412, -- [5]
			271, -- [6]
			312, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C775"] = {
			3, -- [1]
			true, -- [2]
			119, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012707902"] = {
			1, -- [1]
			true, -- [2]
			3381, -- [3]
			25, -- [4]
			1489, -- [5]
			259, -- [6]
			298, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C770"] = {
			1, -- [1]
			true, -- [2]
			1451, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B866BC"] = {
			1, -- [1]
			true, -- [2]
			1588, -- [3]
			25, -- [4]
			1546, -- [5]
			260, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BB19D8"] = {
			2, -- [1]
			true, -- [2]
			1700, -- [3]
			25, -- [4]
			1384, -- [5]
			305, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CDB5"] = {
			1, -- [1]
			true, -- [2]
			4261, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99CFC"] = {
			2, -- [1]
			true, -- [2]
			2566, -- [3]
			25, -- [4]
			1522, -- [5]
			252, -- [6]
			292, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B48707"] = {
			4, -- [1]
			true, -- [2]
			1165, -- [3]
			25, -- [4]
			1400, -- [5]
			305, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99B2E"] = {
			3, -- [1]
			true, -- [2]
			2081, -- [3]
			25, -- [4]
			1465, -- [5]
			273, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C8A816"] = {
			1, -- [1]
			true, -- [2]
			418, -- [3]
			1, -- [4]
			140, -- [5]
			9, -- [6]
			9, -- [7]
			1, -- [8]
		},
		["BattlePet-0-000012B99CB5"] = {
			1, -- [1]
			true, -- [2]
			1524, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA14FE"] = {
			1, -- [1]
			true, -- [2]
			3202, -- [3]
			23, -- [4]
			1135, -- [5]
			248, -- [6]
			248, -- [7]
			3, -- [8]
		},
		["BattlePet-0-000012BA9541"] = {
			1, -- [1]
			true, -- [2]
			261, -- [3]
			25, -- [4]
			1481, -- [5]
			309, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B61DE8"] = {
			1, -- [1]
			true, -- [2]
			856, -- [3]
			25, -- [4]
			1546, -- [5]
			260, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA855A"] = {
			1, -- [1]
			true, -- [2]
			2666, -- [3]
			23, -- [4]
			1468, -- [5]
			266, -- [6]
			232, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012C4A66F"] = {
			1, -- [1]
			true, -- [2]
			2386, -- [3]
			25, -- [4]
			1668, -- [5]
			261, -- [6]
			261, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B67C89"] = {
			2, -- [1]
			true, -- [2]
			2399, -- [3]
			25, -- [4]
			1278, -- [5]
			272, -- [6]
			337, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01DBC"] = {
			1, -- [1]
			true, -- [2]
			1623, -- [3]
			25, -- [4]
			1546, -- [5]
			289, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B6047C"] = {
			1, -- [1]
			true, -- [2]
			4257, -- [3]
			25, -- [4]
			1441, -- [5]
			317, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C75E"] = {
			3, -- [1]
			true, -- [2]
			270, -- [3]
			25, -- [4]
			1627, -- [5]
			276, -- [6]
			257, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B0D34E"] = {
			1, -- [1]
			true, -- [2]
			1887, -- [3]
			25, -- [4]
			1465, -- [5]
			289, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["random:0"] = {
			79, -- [1]
		},
		["BattlePet-0-000008968258"] = {
			7, -- [1]
			true, -- [2]
			1155, -- [3]
			25, -- [4]
			1725, -- [5]
			276, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C757"] = {
			1, -- [1]
			true, -- [2]
			1706, -- [3]
			25, -- [4]
			1806, -- [5]
			260, -- [6]
			244, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA870E"] = {
			1, -- [1]
			true, -- [2]
			2668, -- [3]
			23, -- [4]
			1348, -- [5]
			250, -- [6]
			263, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B4C1CA"] = {
			4, -- [1]
			true, -- [2]
			650, -- [3]
			25, -- [4]
			1481, -- [5]
			289, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BA9570"] = {
			1, -- [1]
			true, -- [2]
			2157, -- [3]
			25, -- [4]
			1481, -- [5]
			292, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BEEECA"] = {
			1, -- [1]
			true, -- [2]
			3099, -- [3]
			25, -- [4]
			1319, -- [5]
			336, -- [6]
			266, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B146CB"] = {
			42, -- [1]
			true, -- [2]
			1532, -- [3]
			25, -- [4]
			1319, -- [5]
			322, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B14EFA"] = {
			1, -- [1]
			true, -- [2]
			2050, -- [3]
			25, -- [4]
			1400, -- [5]
			260, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CB67"] = {
			1, -- [1]
			true, -- [2]
			2089, -- [3]
			25, -- [4]
			1546, -- [5]
			273, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B01E1E"] = {
			1, -- [1]
			true, -- [2]
			2441, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99CE5"] = {
			2, -- [1]
			true, -- [2]
			2567, -- [3]
			25, -- [4]
			1278, -- [5]
			297, -- [6]
			305, -- [7]
			4, -- [8]
		},
		["BattlePet-0-0000129535D3"] = {
			1, -- [1]
			true, -- [2]
			3536, -- [3]
			25, -- [4]
			1562, -- [5]
			309, -- [6]
			227, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000008A85848"] = {
			3, -- [1]
			true, -- [2]
			1977, -- [3]
			25, -- [4]
			1400, -- [5]
			289, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B5CE9F"] = {
			1, -- [1]
			true, -- [2]
			175, -- [3]
			25, -- [4]
			1319, -- [5]
			276, -- [6]
			325, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B607A8"] = {
			7, -- [1]
			true, -- [2]
			2842, -- [3]
			25, -- [4]
			1034, -- [5]
			362, -- [6]
			297, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C780"] = {
			1, -- [1]
			true, -- [2]
			244, -- [3]
			25, -- [4]
			1627, -- [5]
			322, -- [6]
			211, -- [7]
			4, -- [8]
		},
		["random:6"] = {
			3, -- [1]
		},
		["BattlePet-0-000012B96DD7"] = {
			2, -- [1]
			true, -- [2]
			2664, -- [3]
			25, -- [4]
			1887, -- [5]
			260, -- [6]
			227, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012BAC9E8"] = {
			2, -- [1]
			true, -- [2]
			116, -- [3]
			25, -- [4]
			1546, -- [5]
			273, -- [6]
			273, -- [7]
			4, -- [8]
		},
		["BattlePet-0-0000080DA4CD"] = {
			2, -- [1]
			true, -- [2]
			323, -- [3]
			25, -- [4]
			1400, -- [5]
			289, -- [6]
			289, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B6C313"] = {
			1, -- [1]
			true, -- [2]
			3448, -- [3]
			25, -- [4]
			1562, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C753"] = {
			1, -- [1]
			true, -- [2]
			1828, -- [3]
			25, -- [4]
			1506, -- [5]
			297, -- [6]
			260, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B544FE"] = {
			1, -- [1]
			true, -- [2]
			3446, -- [3]
			25, -- [4]
			1400, -- [5]
			292, -- [6]
			292, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B146C7"] = {
			18, -- [1]
			true, -- [2]
			1963, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B99B2C"] = {
			2, -- [1]
			true, -- [2]
			2459, -- [3]
			25, -- [4]
			1786, -- [5]
			260, -- [6]
			248, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000006E4C794"] = {
			2, -- [1]
			true, -- [2]
			1964, -- [3]
			25, -- [4]
			1481, -- [5]
			276, -- [6]
			276, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012B607A5"] = {
			1, -- [1]
			true, -- [2]
			2794, -- [3]
			25, -- [4]
			1278, -- [5]
			292, -- [6]
			317, -- [7]
			4, -- [8]
		},
		["BattlePet-0-00000D511EB1"] = {
			5, -- [1]
			true, -- [2]
			3041, -- [3]
			25, -- [4]
			1905, -- [5]
			278, -- [6]
			206, -- [7]
			4, -- [8]
		},
		["BattlePet-0-000012CA865F"] = {
			1, -- [1]
			true, -- [2]
			2675, -- [3]
			23, -- [4]
			1404, -- [5]
			245, -- [6]
			256, -- [7]
			4, -- [8]
		},
	},
	["QueueSortRaresFirst"] = true,
	["YPos"] = 237.9999389648438,
	["SelectedTab"] = 1,
	["ScriptFilters"] = {
		{
			"Unnamed Pets", -- [1]
			"-- Collected pets that still have their original name.\n\nreturn owned and not customName", -- [2]
		}, -- [1]
		{
			"Partially Leveled", -- [1]
			"-- Pets that have earned some xp in battle.\n\nreturn xp and xp>0", -- [2]
		}, -- [2]
		{
			"Unique Abilities", -- [1]
			"-- Pets with abilities not shared by other pets.\n\nif not count then\n  -- create count of each ability per species\n  count = {}\n  for speciesID in AllSpeciesIDs() do\n    for abilityID in AllAbilities(speciesID) do\n      if not count[abilityID] then\n        count[abilityID] = 0\n      end\n      count[abilityID] = count[abilityID] + 1\n    end\n  end\nend\n\nfor _,abilityID in ipairs(abilityList) do\n  if count[abilityID]==1 then\n    return true\n  end\nend", -- [2]
		}, -- [3]
		{
			"Pets Without Rares", -- [1]
			"-- Collected battle pets that have no rare version.\n\nif not rares then\n  rares = {}\n  for petID in AllPetIDs() do\n    if select(5,C_PetJournal.GetPetStats(petID))==4 then\n      rares[C_PetJournal.GetPetInfoByPetID(petID)]=true\n    end\n  end\nend\n\nif canBattle and owned and not rares[speciesID] then\n  return true\nend", -- [2]
		}, -- [4]
		{
			"Hybrid Counters", -- [1]
			"-- Pets with three or more attack types different than their pet type.\n\nlocal count = 0\nfor _,abilityID in ipairs(abilityList) do\n  local abilityType,noHints = select(7, C_PetBattles.GetAbilityInfoByID(abilityID) )\n  if not noHints and abilityType~=petType then\n    count = count + 1\n  end\nend\n\nreturn count>=3\n", -- [2]
		}, -- [5]
	},
	["QueueSortOrder"] = 2,
	["ConflictOverwrite"] = true,
	["CollectionChartType"] = 3,
	["AutoLoad"] = true,
	["PetCardYPos"] = 871.9999389648438,
	["ActivePanel"] = 1,
	["NotesWidth"] = 344.0000915527344,
	["CollectionChartSources"] = true,
	["QueueNoPreferences"] = false,
	["PrioritizeBreedOnImport"] = false,
	["TeamGroups"] = {
		{
			"General", -- [1]
			"Interface\\Icons\\PetJournalPortrait", -- [2]
		}, -- [1]
		{
			"celestial week 1", -- [1]
			1519351, -- [2]
		}, -- [2]
		{
			"cerlestial week 2", -- [1]
			132123, -- [2]
		}, -- [3]
		{
			"Celestial week 3", -- [1]
			645203, -- [2]
		}, -- [4]
		{
			"deadmines", -- [1]
			132796, -- [2]
		}, -- [5]
		{
			"BRD", -- [1]
			134337, -- [2]
		}, -- [6]
		{
			"Gnomera", -- [1]
			4548874, -- [2]
		}, -- [7]
		{
			"WC HC", -- [1]
			132253, -- [2]
		}, -- [8]
		{
			"Stratholme HC", -- [1]
			135983, -- [2]
		}, -- [9]
		{
			"Catchers", -- [1]
			132149, -- [2]
		}, -- [10]
		{
			"pvp", -- [1]
			132485, -- [2]
		}, -- [11]
	},
	["DialogXPos"] = 352.9999084472656,
	["Filters"] = {
		["Other"] = {
		},
		["Expansion"] = {
		},
		["Script"] = {
		},
		["Types"] = {
		},
		["Favorite"] = {
		},
		["Collected"] = {
		},
		["Sources"] = {
		},
		["Similar"] = {
		},
		["Breed"] = {
		},
		["Rarity"] = {
		},
		["Strong"] = {
		},
		["Level"] = {
		},
		["Tough"] = {
		},
		["Moveset"] = {
		},
	},
	["ExpandedOptHeaders"] = {
	},
	["FavoriteFilters"] = {
	},
	["NotesBottom"] = 233.0003814697266,
	["XPos"] = 675,
	["AllowHiddenPetsDefaulted"] = true,
	["ExpandedTargetHeaders"] = {
	},
	["LevelingQueue"] = {
		"BattlePet-0-000012C8BB03", -- [1]
		"BattlePet-0-000012C8A816", -- [2]
		"BattlePet-0-000012C8D119", -- [3]
		"BattlePet-0-000012CA855A", -- [4]
		"BattlePet-0-000012CA15BB", -- [5]
		"BattlePet-0-000012CA160F", -- [6]
		"BattlePet-0-000012CA14BF", -- [7]
		"BattlePet-0-000012CA1520", -- [8]
		"BattlePet-0-000012CA14FE", -- [9]
		"BattlePet-0-000012CA159C", -- [10]
		"BattlePet-0-000012CA86B1", -- [11]
		"BattlePet-0-000012CA15E8", -- [12]
		"BattlePet-0-000012CA870E", -- [13]
		"BattlePet-0-000012CA82BB", -- [14]
		"BattlePet-0-000012CA8678", -- [15]
		"BattlePet-0-000012CA14E0", -- [16]
		"BattlePet-0-000012CA163D", -- [17]
		"BattlePet-0-000012CA865F", -- [18]
	},
	["LockNotesPosition"] = false,
	["SpecialSlots"] = {
	},
	["DontWarnMissing"] = true,
	["CornerPos"] = "BOTTOMLEFT",
	["NoBackupReminder"] = true,
	["QueueActiveSort"] = false,
	["UseTypeBar"] = true,
	["CustomScaleValue"] = 100,
	["PetNotes"] = {
	},
}
RematchSaved = nil
RematchSettings = nil
