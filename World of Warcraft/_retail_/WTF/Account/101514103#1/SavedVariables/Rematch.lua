
Rematch5Settings = {
	["UseMinimapButton"] = false,
	["HideLevelBubbles"] = false,
	["LastOpenLayout"] = "3-options",
	["CurrentLayout"] = "3-options",
	["ColorPetNames"] = true,
	["InteractOnlyWhenInjured"] = false,
	["AutoWinRecord"] = false,
	["JournalLayout"] = "3-options",
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
	["EchoTeamDrag"] = false,
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
	["InteractAlways"] = false,
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
	["LastSelectedGroup"] = "group:12",
	["HideWinRecord"] = false,
	["ToolbarDismiss"] = false,
	["DefaultPreferences"] = {
	},
	["PetCardMinimized"] = false,
	["QueueAutoImport"] = true,
	["PetCardInBattle"] = false,
	["ColorTeamNames"] = true,
	["StickyNewPets"] = false,
	["InteractShowAfterLoad"] = false,
	["DontConfirmCaging"] = false,
	["AllowHiddenPets"] = false,
	["ShowAfterBattle"] = false,
	["PetCardNoMouseoverFlip"] = false,
	["WarnWhenRandomNot25"] = false,
	["Anchor"] = "BOTTOMRIGHT",
	["ShowFillQueueMore"] = false,
	["LoadHealthiest"] = false,
	["currentTeamID"] = "team:197",
	["CompactQueueList"] = false,
	["DontConfirmDeleteTeams"] = false,
	["ColorTargetNames"] = true,
	["PetNotes"] = {
	},
	["PetCardBackground"] = "Expansion",
	["DontConfirmRemoveQueue"] = false,
	["InteractPreferUninjured"] = false,
	["ClickToDrag"] = false,
	["HideNonBattlePets"] = false,
	["NotesWidth"] = 258.0000915527344,
	["ShowNewGroupTab"] = true,
	["NotesFont"] = "GameFontHighlight",
	["KeepCompanion"] = false,
	["HidePreferenceBadges"] = false,
	["StrongVsLevel"] = false,
	["HideNotesBadges"] = false,
	["PreferencesPaused"] = false,
	["EnableDrag"] = true,
	["NotesHeight"] = 258,
	["HidePetToast"] = false,
	["ShowAbilityID"] = false,
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
		[66739] = "team:138",
		[104553] = "team:164",
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
		["To a Land Down Under (Dragon)"] = "team:267",
		[161649] = "team:155",
		[68465] = "team:153",
		["Do You Even Train? (Aquatic)"] = "team:258",
		[71934] = "team:77",
		["nega"] = "team:253",
		[141529] = "team:157",
		[142054] = "team:213",
		[161657] = "team:211",
		[161650] = "team:209",
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
		[116788] = "team:156",
		[119343] = "team:174",
		[146003] = "team:175",
		[119407] = "team:176",
		[71930] = "team:208",
		["Do You Even Train? (Magic)"] = "team:229",
		[150858] = "team:179",
		[150922] = "team:180",
		[72009] = "team:160",
		[204926] = "team:199",
		[105323] = "team:183",
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
		[146004] = "team:189",
		[79179] = "team:198",
		["To a Land Down Under (Elemental)"] = "team:255",
		[68564] = "team:200",
		[200680] = "team:186",
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
		[104970] = "team:159",
		["Are They Not Beautiful? (Elemental)"] = "team:265",
		[155145] = "team:5",
		[140315] = "team:154",
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
	["QueueSortInTeamsFirst"] = false,
	["BackupCount"] = 269,
	["HideToolbarTooltips"] = false,
	["QueueRandomWhenEmpty"] = false,
	["GroupOrder"] = {
		"group:favorites", -- [1]
		"group:none", -- [2]
		"group:11", -- [3]
		"group:1", -- [4]
		"group:2", -- [5]
		"group:3", -- [6]
		"group:4", -- [7]
		"group:5", -- [8]
		"group:6", -- [9]
		"group:7", -- [10]
		"group:8", -- [11]
		"group:9", -- [12]
		"group:10", -- [13]
		"group:12", -- [14]
	},
	["AlwaysUsePetSatchel"] = false,
	["HideOptionTooltips"] = false,
	["MinimizePetSummary"] = true,
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
		["RawSearchText"] = "yak",
		["Similar"] = {
		},
		["Search"] = {
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
	["ResetSortWithFilters"] = false,
	["HideNotesButtonInBattle"] = false,
	["AlwaysTeamTabs"] = false,
	["NotesLeft"] = 907.999755859375,
	["NoSummonOnDblClick"] = false,
	["LevelingQueue"] = {
	},
	["LastToastedPetID"] = "BattlePet-0-000012F7230E",
	["FavoriteFilters"] = {
	},
	["MinimapButtonPosition"] = -162,
	["BarChartCategory"] = 1,
	["HideLevelingBadges"] = false,
	["ImportConflictOverwrite"] = false,
	["LockWindow"] = false,
	["QueueSortOrder"] = 2,
	["CardBehavior"] = "Normal",
	["CompactPetList"] = false,
	["PetCardCanPin"] = false,
	["InteractOnTarget"] = 0,
	["UseTypeBar"] = true,
	["BreedFormat"] = 1,
	["CombineGroupKey"] = "None",
	["ExpandedGroups"] = {
	},
	["DontWarnMissing"] = true,
	["HideMarkerBadges"] = false,
	["AbilityBackground"] = "Icon",
	["HideTooltips"] = false,
	["KeepNotesOnScreen"] = false,
	["NeverTeamTabs"] = false,
	["SortByNickname"] = false,
	["ResetExceptSearch"] = false,
	["NotesBottom"] = 456.0000305175781,
	["WasShownOnLogout"] = false,
	["SafariHatShine"] = false,
	["PetCardFlipKey"] = "Alt",
	["QueueSkipDead"] = false,
	["LockNotesPosition"] = false,
	["PetMarkers"] = {
		[216] = 7,
		[850] = 7,
		[331] = 7,
		[849] = 7,
	},
	["PetCardCompactCollected"] = false,
	["RankWinsByPercent"] = false,
	["NoBackupReminder"] = true,
	["PetCardShowExpansionStat"] = false,
	["PrioritizeBreedOnImport"] = true,
	["ReverseToolbar"] = false,
	["ExpandedOptionsHeaders"] = {
		true, -- [1]
	},
}
Rematch5SavedTeams = {
	["team:46"] = {
		["pets"] = {
			"BattlePet-0-000012B67B94", -- [1]
			"BattlePet-0-000006E4C77C", -- [2]
			"BattlePet-0-000012B5CE9F", -- [3]
		},
		["notes"] = "Strategy added by ghostpets\nFight time:  2:15-2:20 on 17-18 rounds\n\nTurn 1: Disruption\nTurn 2: Life Exchange\nTurn 3: Swap to your Tiny Snowman\nTurn 4: Call Blizzard\nTurn 5: Howling Blast\nTurn 6: Snowball\nTurn 7: Snowball\nTurn 8: Call Blizzard\nTurn 9: Howling Blast to finish off Logic if your Tiny Snowman is still alive.  Otherwise, bring in your Phoenix Hatchling and use Conflagrate to finish off Logic.\nLogic dies.  Math comes in.\n\nTurn 1: Snowball until dead (if your Tiny Snowman is still alive)\nBring in your Phoenix Hatchling (if not already active)\nTurn 2: Immolate until...\nYour Ravenous Prideling is forcefully swapped in from Math's Whirling Gears.\nTurn 3: Life Exchange\nTurn 4+: Seethe until Ravenous Prideling dies\nBring in your Phoenix Hatchling to finish off Math\nTurn 1: Immolate\nTurn 2: Conflagrate (if necessary)\nTurn 3+: Burn until Math dies (if necessary)\n",
		["name"] = "Therin Skysong",
		["tags"] = {
			"122A2GU", -- [1]
			"11133L", -- [2]
			"12255F", -- [3]
		},
		["teamID"] = "team:46",
		["targets"] = {
			160207, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			161656, -- [1]
		},
		["groupID"] = "group:5",
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
	["team:286"] = {
		["pets"] = {
			"BattlePet-0-000012C3D8DA", -- [1]
			"BattlePet-0-000012C4A66F", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5450\n\nStrategy added by DragonsAfterDark\nTurn 1: Whirlpool\nTurn 2: Stampede\nTurn 3: Coastal Scuttler is swapped in\nTurn 4: Frost Spit\nTurn 5: Frost Spit\nTurn 6: Bubble\n\nStitch comes in\nTurn 1-3: Stampede\nTurn 4+5: Frost Spit \n~~Note~~: If the first Frost Spit kills Stitch, skip the second one and go straight into Stampede\nTurn 6+: Stampede until Stitch dies both times\n\nMort comes in\nTurn 1+: Stampede continues\n~~: Frost Spit on Shattered Defenses\n~~: Stampede until Mort or Coastal Scuttler dies\n\nIf needed:: Bring in your Elusive Skimmer\nTurn 1+: Scratch\n",
		["name"] = "Nearly Headless Jacob",
		["tags"] = {
			"121C2AL", -- [1]
			"211C2AI", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:286",
		["groupID"] = "group:11",
		["targets"] = {
			66636, -- [1]
		},
	},
	["team:423"] = {
		["pets"] = {
			"BattlePet-0-000006E4C79F", -- [1]
			"BattlePet-0-000012B675D0", -- [2]
			"BattlePet-0-000012E38F5E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4476\n\nStrategy added by DragonsAfterDark\nTurn 1: Acid Rain\nTurn 2+: Dreadful Breath until Blightbreath dies\nBring in your Scourged Whelpling\nTurn 1+: Dreadful Breath until Scourged Whelpling dies\nBring in your Lost of Lordaeron\nTurn 1+: Arcane Explosion until fight is won\nIf Sir Murkeston comes back in:\nTurn 1+: Shadow Slash\n",
		["name"] = "Fight Night: Sir Galveston (Undead)",
		["tags"] = {
			"10171TD", -- [1]
			"0028GQ", -- [2]
			"1206EA", -- [3]
		},
		["teamID"] = "team:423",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
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
		["targets"] = {
			161657, -- [1]
		},
		["groupID"] = "group:5",
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
		["targets"] = {
			175783, -- [1]
		},
		["groupID"] = "group:none",
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
	["team:440"] = {
		["pets"] = {
			"BattlePet-0-000012B118E8", -- [1]
			"BattlePet-0-000006E4C775", -- [2]
			"BattlePet-0-000012B01DE0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3546\n\nStrategy added by DragonsAfterDark\nTurn 1: Booby-Trapped Presents\nTurn 2: Greench's Gift\nTurn 3+: Ice Lance until Foof dies\nStumpers comes in\nTurn 1: Booby-Trapped Presents\nTurn 2: Greench's Gift\nTurn 3+: Ice Lance until Stumpers dies\nLil' Sizzle comes in\nTurn 1+: Ice Lance until Lil' Sizzle uses Puppies of the Flame, then Pass through it\nBring in your Father Winter's Helper\nTurn 1: Call Blizzard\nSizzel swaps in your Winter's Little Helper\nTurn 1: Gift of Winter's Veil\nTurn 2+: Ice Lance until Sizzle dies\n",
		["name"] = "Fight Night: Amalia (Humanoid)",
		["tags"] = {
			"21141A5", -- [1]
			"21233N", -- [2]
			"21233O", -- [3]
		},
		["teamID"] = "team:440",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
		},
	},
	["team:298"] = {
		["pets"] = {
			"BattlePet-0-000012BACD72", -- [1]
			"BattlePet-0-000012E38E23", -- [2]
			"BattlePet-0-000012B99C7B", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3910\n\nStrategy added by DragonsAfterDark\nThank you to Claire for the suggestion in the comments to use Drafty ^^\n\nTurn 1: Fire Shield\nTurn 2: Flame Jet\nTurn 3: Immolate\nRemy comes in\nTurn 1+: Immolate until Amalgam of Destruction dies\nBring in your Tiny Bog Beast\nTurn 1-3: Rampage\nTurn 4: Leap\nDinner comes in\nTurn 1: Clobber\nTurn 2+: Leap until Tiny Bog Beast dies\nBring in your Drafty\nTurn 1: Sandstorm\nTurn 2+: Wild Winds until Dinner dies\n",
		["name"] = "Chopped (Elemental)",
		["tags"] = {
			"111421D", -- [1]
			"2227FT", -- [2]
			"1025215", -- [3]
		},
		["teamID"] = "team:298",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
		},
	},
	["team:290"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012BA1A7F", -- [2]
			"random:0", -- [3]
		},
		["name"] = "Courageous Yon",
		["tags"] = {
			"1116143", -- [1]
			"11261CI", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:290",
		["groupID"] = "group:11",
		["targets"] = {
			66738, -- [1]
		},
	},
	["team:354"] = {
		["pets"] = {
			"BattlePet-0-000012B66C49", -- [1]
			"BattlePet-0-000012D930C5", -- [2]
			"random:9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/485\n\npbScript thanks to PruShendralar\n\nTurn 1: Snap\nTurn 2: Snap\nTurn 3: Snap\nTurn 4: Whirlpool\nTurn 5: Renewing Mists\nTurns 6+: Snap until Rocklick is dead\nSlow Moe comes in\nTurn 1: Renewing Mists\nTurns 2+: Snap until Slow Moe dies (pass if you get stunned)\nSnot comes in\nTurn 1: Snap\nTurn 2: Snap\nTurn 3: Whirlpool\nTurns 4+: Snap until your Crab dies\nBring in your Strider\nTurn 1: Pump\nTurn 2: Cleansing Rain\nTurn 3: Pump\nTurns 4+: Water Jet until Snot is dead\n",
		["name"] = "Snail Fight! (Aquatic)",
		["tags"] = {
			"1124NA", -- [1]
			"1223HM", -- [2]
			"ZR9", -- [3]
		},
		["teamID"] = "team:354",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
	},
	["team:189"] = {
		["pets"] = {
			"BattlePet-0-000012EA9C83", -- [1]
			"BattlePet-0-000012EB3FA8", -- [2]
			"BattlePet-0-000012C8BC73", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3612\n\nStrategy added by DragonsAfterDark\nIf a cockroach comes in I'd suggest switching to one of the Shale Hatchlings. Since he casts Apocalypse followed by Shell Shield, you have a round to get your hatchling in, a round to get Stoneskin up, and then just Poison Spit from that point on.\n\nPriority 1: Keep Thorns up, refresh with 1 round left\nPriority 2: Keep Photosynthesis up, refresh with 1 round left\nPriority 3: Ironbark all else\n\nRandom Enemy Pet Comes In\n\nNote 1:: Keep in mind, if you can't see the enemy attacks with an addon, Automated Drilling Machine's ability, Smoke Cloud, is on a 4 round CD, so you may need to adjust your pet's attacks\n\nNote 2:: There are a few different pets that will come in with this fight, so the turn orders won't be exact.\n\nNote 3:: Pass / Photosynthesis / Stoneskin / during any Undead/Dodge rounds\n\nBring in a Shale Hatchling\nPriority 1: Keep Stoneskin up\nIf: Pets are Undead/Mech: Burn +\nIf: Pets are Critter: Poison Spit +\n",
		["name"] = "Gnomeregan Guard Mechanostrider",
		["tags"] = {
			"2116EC", -- [1]
			"1225Q5", -- [2]
			"1226Q6", -- [3]
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
		["targets"] = {
			173303, -- [1]
		},
		["groupID"] = "group:none",
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
			"BattlePet-0-000012B48958", -- [1]
			"BattlePet-0-000012B146CA", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/368\n\nScript thanks to Castorr\n\nTurn 1: Extra Plating\nTurn 2: Call Lightning\nTurn 3: Fel Immolate\nTurn 4: Swap to Lil' Bling - Trike swaps in during the same turn\nTurns 5+: Inflation\nIf you get interrupted, use Make it Rain\nThen:: Inflation until Trike is dead\nScreamer comes back in during Inflation\nTurn 1: Blingtron Gift Package\nTurn 2: Make it Rain to kill Screamer if necessary\nChaos comes in\nTurns 1+: Inflation until Lil' Bling is down\nBring back your Sunreaver Micro-Sentry\nTurn 1: Call Lightning\nTurns 2+: Fel Immolate until Chaos is dead\n\nIf the Micro-Sentry dies too early, bring in your Elekk Plushie for a few rounds. The debuff from Fel Immolation should still finish the fight.\n",
		["name"] = "Dr. Ion Goldbloom",
		["tags"] = {
			"211414Q", -- [1]
			"2115198", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:77",
		["targets"] = {
			71934, -- [1]
		},
		["groupID"] = "group:11",
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
		["targets"] = {
			200678, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			162468, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			142151, -- [1]
		},
		["groupID"] = "group:none",
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
	["team:398"] = {
		["pets"] = {
			"BattlePet-0-000006E4C77C", -- [1]
			"random:7", -- [2]
			"BattlePet-0-000012B5CDBD", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5532\n\nStrategy added by Threewolves\nElemental Leveling pet needs 162+ Health. Pass if Sleeping.\n\nScript thanks to AramilGaeda\n\nTurn 1: Magic Hat\nTurn 2: Call Blizzard\nTurn 3: Deep Freeze\nTurn 4: Magic Hat\nTurn 5: Magic Hat\nSwap to your Playful Frostkin\nTurn 1: Deep Freeze\nTurn 2: Geyser\nSwap to your Tiny Snowman\nTurn 1: Deep Freeze\nTurn 2: Magic Hat\nTurn 3: Call Blizzard\nTurn 4: Magic Hat\nTurn 5: Magic Hat\nTurn 6: Deep Freeze til Tiny Snowman dies.\nBring in your Elemental leveling pet\nSwap to your Playful Frostkin\nTurn 1: Deep Freeze\nTurns 2+: Water Jet til done.\n",
		["name"] = "Training with the Nightwatchers (Elemental)",
		["tags"] = {
			"21233L", -- [1]
			"ZR7", -- [2]
			"12272D1", -- [3]
		},
		["teamID"] = "team:398",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
		["preferences"] = {
			["minHP"] = 163,
			["minXP"] = 2,
		},
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
	["team:328"] = {
		["pets"] = {
			"BattlePet-0-000012BEE3D5", -- [1]
			"BattlePet-0-000006E4C77C", -- [2]
			"random:7", -- [3]
		},
		["name"] = "Jarrun's Ladder (Elemental)",
		["tags"] = {
			"122314R", -- [1]
			"11233L", -- [2]
			"ZR7", -- [3]
		},
		["teamID"] = "team:328",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
	},
	["team:363"] = {
		["pets"] = {
			"BattlePet-0-000006E4C79F", -- [1]
			"BattlePet-0-000012B675D0", -- [2]
			"BattlePet-0-000012C47B1C", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2544\n\nStrategy added by DragonsAfterDark\nPriority 1: Acid Rain on CD\nPriority 2: Dreadful Breath\nBring in your Scourged Whelpling\nTurn 1+: Dreadful Breath until Scourged Whelpling dies\nBring in your Cursed Birman\nTurn 1: Prowl\nTurn 2+: Pounce until all enemies die",
		["name"] = "Snail Fight! (Undead)",
		["tags"] = {
			"10171TD", -- [1]
			"0028GQ", -- [2]
			"10281FH", -- [3]
		},
		["teamID"] = "team:363",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
	},
	["team:414"] = {
		["pets"] = {
			"BattlePet-0-000012BAF760", -- [1]
			"BattlePet-0-000012C56B66", -- [2]
			"BattlePet-0-000012B68075", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15870\n\nStrategy added by Rat#2960\nWorks in 9.2. \nOnly RNG aspect is that first pet needs to survive Turn 7, if it does, then rest will work :)\nRecommend Benax but Mud Jumper works often too as first pet!\n\nTurn 1: Mudslide\nTurn 2: Water Jet (Sir Murkeston switches with Coach)\nTurn 3: Bubble\nTurn 4-5: Water Jet x2\nTurn 6: Mudslide  (If Coach dies, go to Turn 8 )\n(RNG: If Benax dies here, restart fight)\nTurn 7: Water Jet.  (Coach dies, Sir Murkeston comes in)\nTurn 8: Pass (Benax dies, bring in Magical Crawdad)\nTurn 9: Whirlpool\nTurn 10: Renewing Mists\nTurn 11-12: Surge x2\nTurn 13: Whirlpool\nTurn 14: Surge (Magical Crawdad dies). \nTurn 15: Sunlight. Greatest Foe is switched in\nTurn 16: Nature's Ward\nTurn 17+: Punch until Greatest Foe dies. Sir Murkeston comes in, finish him with a final Punch\n",
		["name"] = "Fight Night: Sir Galveston (Aquatic)",
		["tags"] = {
			"11171SE", -- [1]
			"211644", -- [2]
			"21181H0", -- [3]
		},
		["teamID"] = "team:414",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
		},
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
			"BattlePet-0-000012B146CB", -- [1]
			"BattlePet-0-000012B673F3", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Shenk\nTurn 1: Black Claw\nTurn 2+: Flock until Ikky dies\nBring in your Microbot XD\nTurn 1: Ion Cannon\n",
		["name"] = "Ralf",
		["tags"] = {
			"01181FS", -- [1]
			"00272KT", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:165",
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
		["targets"] = {
			142096, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:80"] = {
		["pets"] = {
			"BattlePet-0-000012B15603", -- [1]
			0, -- [2]
			"BattlePet-0-000012C2D9B9", -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\nBest breeds: P/B>>B/B>H/B>S/B.Thanks to nogulpfrog for the suggestion!\n\nTurn 1: Flame Breath\nTurn 2: Time Bomb\nTurn 3: Armageddon\nBring in your Level Pet\nTurn 4: Swap to your Vibrant Glimmerfly\nTurn 5: Sweep\nTurns 6-8: Mana Surge\nTurn 9+: Feedback, if needed to finish the battle.\n",
		["name"] = "Fight Night: Tiffany Nelson",
		["tags"] = {
			"122430S", -- [1]
			"ZL", -- [2]
			"122B2RH", -- [3]
		},
		["teamID"] = "team:80",
		["targets"] = {
			97804, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:299"] = {
		["pets"] = {
			"BattlePet-0-000012B5C2FF", -- [1]
			"BattlePet-0-000012F20B9E", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1956\n\nStrategy added by Deadlybanana\nScript thanks to Kowh\n\nTurn 1: Ironskin\nTurns 2+3: Falcosaur Swarm!\nTurn 4: Predatory Strike\nContinue using Ironskin on cooldown and Predatory Strike when your enemy is vulnerable to it until your Direbeak Hatchling dies\nBring in your Ikky\nTurn 1: Black Claw\nTurns 2+: Flock\nIf needed, clean up with your third pet\n",
		["name"] = "Chopped (Flyer)",
		["tags"] = {
			"12171TN", -- [1]
			"21181FS", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:299",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:443"] = {
		["pets"] = {
			"BattlePet-0-000012B01EEF", -- [1]
			"random:4", -- [2]
			"random:4", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/522\n\ntdScript thanks to Goldberggdn\n\nTurn 1: BONESTORM\nTurn 2: Ancient Blessing\nTurn 3: Pass\nTurn 4: Pass\n\nNow:: Start from the top and repeat this rotation until Lil’Sizzle and Stumpers in the back row are dead.\n\nOnce they are, keep Ancient Blessing on cooldown and use Claw to kill Foof.\n",
		["name"] = "Fight Night: Amalia (Undead)",
		["tags"] = {
			"11288A", -- [1]
			"ZR4", -- [2]
			"ZR4", -- [3]
		},
		["teamID"] = "team:443",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
		["targets"] = {
			140315, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:380"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"random:1", -- [2]
			"random:1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/704\n\nScript thanks to Aesetha\n\nTurn 1: Sandstorm\nTurn 2: Crush\nTurn 3: Deflection\nTurn 4: Crush\nTurn 5: Crush\nTurn 6: Crush\nTurn 7: Crush\nTurn 8: Crush\nTurn 9: Sandstorm\nTurns 10+: Crush until Sunny is dead\nRoots comes in\nTurn 1: Deflection\nTurn 2: Crush or Sandstorm if available\nTurn 3: Crush or Sandstorm if available\nTurn 4: Crush or Sandstorm if available\nTurn 5: Crush or Sandstorm if available\nTurn 6: Deflection\nTurn 7: Crush until Roots is dead (pass if you get rooted)\nBeaky comes in\nTurn 1: Pass or Sandstorm if available\nTurn 2: Deflection\nTurns 3+: Crush or Sandstorm if available until Beaky is dead\n\nIf your Anubisath Idol dies, bring in your second Humanoid and finish Beaky off. Standard attacks should suffice.\n",
		["name"] = "Training with Durian (Humanoid)",
		["tags"] = {
			"1116143", -- [1]
			"ZR1", -- [2]
			"ZR1", -- [3]
		},
		["teamID"] = "team:380",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:342"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-000012BAC92C", -- [2]
			"random:10", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/469\n\nScript thanks to Isthevao\n\nTurn 1: Decoy\nTurn 2: Bombing Run\nTurn 3: Breath\nTurn 4: Breath\nTurn 5: Breath\nTurn 6: Bombing Run - Thrugtusk dies\nWumpas comes in\nTurn 1: Breath\nTurn 2: Breath - your Dragonling dies\nBring in your Darkmoon Tonk\nTurns 1+: Missile until Wumpas dies\nBaeloth comes in\nTurn 1: Pass\nTurn 2: Shock and Awe\nTurn 3: Ion Cannon\n",
		["name"] = "My Beast's Bidding (Mech)",
		["tags"] = {
			"1125QC", -- [1]
			"1127AI", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:342",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
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
	["team:403"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000006E4C79F", -- [2]
			"BattlePet-0-000012B675D0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9542\n\nStrategy added by Hewarne#2308\nWorked at 1st try for me! \n\nTurn 1: Curse of Doom\nTurn 2: Shadow Shock until Unborn Val'kyr come back from death\nTurn 3: Unholy Ascension\nTurn 4: Swap to your Blightbreath\nTurn 5: Acid Rain\nTurns 6-8: Dreadful Breath\nTurns 9-11: Dreadful Breath\nTurns 12-14: Dreadful Breath\nTurns 15-17: Dreadful Breath\n",
		["name"] = "Training with the Nightwatchers (Undead)",
		["tags"] = {
			"222616M", -- [1]
			"12171TD", -- [2]
			"2128GQ", -- [3]
		},
		["teamID"] = "team:403",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
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
		["targets"] = {
			155145, -- [1]
		},
		["groupID"] = "group:8",
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
	["team:387"] = {
		["pets"] = {
			"BattlePet-0-000012B4838C", -- [1]
			"BattlePet-0-000012B48707", -- [2]
			"BattlePet-0-000012B146CC", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/650\n\nScript thanks to TURBOKillex\n\nTurns 1+2: Proto-Strike\nTurns 3+: Breath until Trixy is dead\nGlobs comes in\nTurn 1: Ancient Blessing - if your Emerald Proto-Whelp dies here, that's no problem!\nTurns 2+: Breath until your Proto-Whelp dies\nBring in your Nexus Whelpling\nTurns 1+: Frost Breath until Globs is dead\nNightmare Sprout comes in\nTurn 1: Arcane Storm - if your Nexus Whelpling dies here, no problem, just keep going.\nTurns 2+: Mana Surge - your Nexus Whelpling will die somewhere during it (or even before)\nBring in Chrominius\nTurns 1+: How much health does Nightmare Sprout have left?\nMore than 1400: Bite, Howl, Surge of Power\nLess than 1400: Howl, Surge of Power\n",
		["name"] = "Dealing with Satyrs (Dragon)",
		["tags"] = {
			"111814F", -- [1]
			"222814D", -- [2]
			"1126140", -- [3]
		},
		["teamID"] = "team:387",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
		},
	},
	["team:336"] = {
		["pets"] = {
			"BattlePet-0-000012C57000", -- [1]
			"BattlePet-0-000012B4C5B0", -- [2]
			"BattlePet-0-000012C8A9E9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13636\n\nStrategy added by Amrôth#2849\nRNG: No RNG-tag because the strategy works very reliably with the pets I used, but it may occur that you have to adapt it a bit based on what's happening. Potential dangers are bad luck with Flurry hits (low dmg output) and the 10% chance to miss abilities because of blinded from Call Darkness. None of this makes you instantly lose the match though. The most important thing is to dodge enemy abilities.\n\nThe strategy probably also works with many other breeds. I did it with Mountain Cottontail B/B, Frostfur Rat P/S and Alpine Hare S/S. Let me know which other breeds work in the comments. Minimum speed as specified above is required.\n\nScript thanks to Offshore\n\n\nTurn 1: Dodge (Dodge enemy Horn Attack and Smash)\nTurn 2-3: 2x Flurry (Get hit by enemy Stampede 1)\nTurn 4-5: Burrow (Dodge enemy Stampede 2 / Get hit by enemy Stampede 3)\nTurn 6: Dodge (Dodge enemy Horn Attack and Smash)\nTurn 7-8: 2x Flurry\nThrugtusk dies / Wumpas comes in\nTurn 9: Flurry\nMountain Cottontail dies / Bring in your Frostfur Rat\nTurn 10: Call Darkness\nTurn 11-13: 3x Sneak Attack\nTurn 14: Refuge (Dodge enemy Headbutt)\nTurn 15-16: 2x Sneak Attack\nWumpas dies / Baeloth comes in\nTurn 17: Call Darkness\nTurn 18-19: 2x Sneak Attack\nFrostfur Rat dies / Bring in your Alpine Hare\nTurn 20: Dodge (Dodge enemy Thrash and Roar)\nTurn 21: Flurry\nTurn 22-23: Burrow (Dodge enemy Thrash)\nTurn 24: Flurry\nTurn 25: Flurry\nTurn 26: Dodge (Dodge enemy Thrash and Roar)\nTurn 27: Flurry\nBaeloth dies\n",
		["name"] = "My Beast's Bidding (Critter)",
		["tags"] = {
			"2215C7", -- [1]
			"12231CJ", -- [2]
			"2217DP", -- [3]
		},
		["teamID"] = "team:336",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
		},
	},
	["team:44"] = {
		["pets"] = {
			"BattlePet-0-000012B6764A", -- [1]
			"BattlePet-0-000012BA1A7F", -- [2]
			"BattlePet-0-000012B66DA8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2485\n\nStrategy added by Eekwibble\nAn up-to-date reworking of Rikade's Teroclaw strat from Wowhead\n\nTurn 1: Decoy\nTurns 2&3: Haywire\nTurns 4+: Alpha Strike until Tonsa dies\nChirps comes in\nTurn 1: Swap to your Elekk Plushie\nTurn 2: Swap to your Teroclaw Hatchling\nTurn 3: Dodge\nTurns 4+: Claw until Chirps hp<927\nThen:: Ravage - Chirps dies\nBrewly comes in\nPrio 1: Dodge when Brewly has the Barrel Toss buff\nPrio 2: Ravage when Brewly's hp<619\nPrio 3: Claw until Brewly dies\nIf you have the world's worst RNG, bring back your Mech Axe to finish the job\n",
		["name"] = "Chen Stormstout",
		["tags"] = {
			"12171BR", -- [1]
			"00061CI", -- [2]
			"11271C8", -- [3]
		},
		["teamID"] = "team:44",
		["groupID"] = "group:11",
		["targets"] = {
			71927, -- [1]
		},
	},
	["team:253"] = {
		["pets"] = {
			"BattlePet-0-000012B1731B", -- [1]
			"BattlePet-0-000012B589F6", -- [2]
			"BattlePet-0-00001293FB22", -- [3]
		},
		["name"] = "nega",
		["tags"] = {
			"2225G1", -- [1]
			"111531F", -- [2]
			"211435B", -- [3]
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
		["targets"] = {
			154919, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:382"] = {
		["pets"] = {
			"BattlePet-0-000012BAC9E8", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"BattlePet-0-000012B01ED3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/876\n\nScript thanks to NabuArat & Wobblit\n\nTurn 1: Supercharge\nTurn 2: Call Blizzard\nTurns 3+: Thrash until Sunny is dead\nRoots comes in\nTurn 1: Supercharge\nTurn 2: Call Blizzard\nTurns 3+: Thrash until Tranquil Mechanical Yeti dies\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Decoy\nTurns 2+: Breath until Roots is dead\nBeaky comes in\nTurn 1: Pass\nTurn 2: Thunderbolt\nTurns 3+: Breath until Mechanical Pandaren Dragonling dies\nBring in your Iron Starlette\nTurns 1+: Powerball until Beaky is dead\nIf you can time Wind-Up to avoid hitting during Beakys Lift-Off, go ahead and do so, it's faster, but requires an addon to show the enemy cooldowns.\n",
		["name"] = "Training with Durian (Mech)",
		["tags"] = {
			"221C3K", -- [1]
			"1225QC", -- [2]
			"11071BB", -- [3]
		},
		["teamID"] = "team:382",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
		},
	},
	["team:291"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-000012BA1A7F", -- [2]
			"random:0", -- [3]
		},
		["name"] = "Ashlei",
		["tags"] = {
			"1125QC", -- [1]
			"11261CI", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:291",
		["groupID"] = "group:11",
		["targets"] = {
			87124, -- [1]
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
		["targets"] = {
			154917, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			162469, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			140880, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			141588, -- [1]
		},
		["groupID"] = "group:none",
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
			"BattlePet-0-000012BEEEA6", -- [1]
			"BattlePet-0-000012BAC9E5", -- [2]
			"BattlePet-0-00000D5451F8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8045\n\nStrategy added by F1NCH#2182\nmaybe any pet with sunlight work. my fozling was a H/H breed.\n\nTurn 1: Glowing Toxin\nTurn 2: Explode\nBring in your Fozling\nTurn 1: Sunlight\nTurn 2: Swap to your Baa'l\nTurn 3: Murder the Innocent\nTurn 4: Pass\n",
		["name"] = "Bloated Leper Rat",
		["tags"] = {
			"20241G3", -- [1]
			"00292C8", -- [2]
			"020329G", -- [3]
		},
		["teamID"] = "team:191",
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
	["team:370"] = {
		["pets"] = {
			"BattlePet-0-000012B99D44", -- [1]
			"BattlePet-0-000011C8C36A", -- [2]
			"BattlePet-0-000012B822C0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15830\n\nStrategy added by DragonsAfterDark\nTurn 1: Frost Shock\nTurn 2: Deep Freeze\nTurn 3: Swap to your Mawsworn Minion\nThen follow this rotation until Quillino dies:\nTurn 1: Dark Fate - NOTE! Once Quillino gets to less than 30% hp or 505, switch to just Soul Steal\nTurn 2: Deflection\nTurn 3: Soul Steal\nTurn 4: Soul Steal\n\nLil' Spirit Guide comes in\nTurn 1: Dark Fate\nTurn 2: Deflection\nTurn 3+: Soul Steal until Mawsworn Minion dies\nBring in your Grumpling\nTurn 1: Frost Shock\nTurn 2: Deep Freeze\nTurn 3: Swap to your Void-Scarred Anubisath\nTurn 4: Pass\nThen:\nPriority 1: Deflection when Fethyr is Lifted-Off\nPriority 2: Soulrush on CD\nPriority 3: Spiritfire Bolt\n",
		["name"] = "Training with Bredda (Humanoid)",
		["tags"] = {
			"22241LT", -- [1]
			"111331R", -- [2]
			"22162OH", -- [3]
		},
		["teamID"] = "team:370",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
	},
	["team:281"] = {
		["pets"] = {
			"BattlePet-0-000012B66DA8", -- [1]
			"BattlePet-0-000008968258", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/407\n\nTurn 1: Alpha Strike\nTurn 2: Alpha Strike\nTurn 3: Dodge\nTurns 4+5: Ravage - Chomps dies\nGnasher comes in\nTurns 1+: Alpha Strike until Gnasher dies\nCragmaw comes in\nTurn 1: Dodge\nTurns 2+: Alpha Strike until Cragmaw is dead\n\nIf your Teroclaw Hatchling dies too early, bring in your Anubisath Idol and use Sandstorm and Crush.\n",
		["name"] = "Morulu the Elder",
		["tags"] = {
			"21271C8", -- [1]
			"1116143", -- [2]
			"00261CI", -- [3]
		},
		["teamID"] = "team:281",
		["groupID"] = "group:11",
		["targets"] = {
			66553, -- [1]
		},
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
	["team:416"] = {
		["pets"] = {
			"BattlePet-0-000012BF63D8", -- [1]
			"BattlePet-0-000012B4C5B0", -- [2]
			"BattlePet-0-000012DEFD57", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/682\n\nScript thanks to Malhado\n\nTurn 1: Ooze Touch\nTurn 2: Acidic Goo\nTurns 3+4: Dive \nTurns 5: Ooze Touch until your Snail dies\nBring in your Frostfur Rat\nTurns 1+: If Coach is not dead, yet, finish him with Sneak Attack\nSir Murkeston comes in\nTurn 1: Crouch\nTurn 2: Call Darkness - hits Greatest Foe\nTurns 3+: Sneak Attack and Call Darkness when available until Greatest Foe dies\nSir Murkeston comes back\nTurn 1: Crouch\nTurn 2: Call Darkness\nTurns 3+: Sneak Attack until Frostfur Rat dies\nBring in your last snail\nTurn 1: Dive\nTurns 2+: Absorb until Sir Murkeston is dead\n",
		["name"] = "Fight Night: Sir Galveston (Critter)",
		["tags"] = {
			"1119HO", -- [1]
			"11231CJ", -- [2]
			"2117FD", -- [3]
		},
		["teamID"] = "team:416",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
		},
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
			"BattlePet-0-000012BC0A5A", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/332\n\nScript thanks to Tiggles\n\nTurn 1: Arcane Explosion\nTurn 2: Arcane Explosion\nTurn 3: Ancient Blessing\nTurns 4+: Keep using Arcane Explosion and use Ancient Blessing whenever it is available until Chrominius dies.\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Thunderbolt\nTurns 2+: Breath until the fight is done.\n",
		["name"] = "Vesharr",
		["tags"] = {
			"2226140", -- [1]
			"1225QC", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:15",
		["targets"] = {
			87123, -- [1]
		},
		["groupID"] = "group:11",
	},
	["team:54"] = {
		["pets"] = {
			"BattlePet-0-000012B99B2D", -- [1]
			"BattlePet-0-000012C4A538", -- [2]
			"BattlePet-0-000012BA9509", -- [3]
		},
		["notes"] = "Strategy added by Mutanis\nTime: ~3:20 (~34 rounds)Alternative strategy if you don't have Chitterspine Skitterling or Lil' Bling or they were already used.I recommend using TD Script!Tested 26. May 2022\n\nTurn 1: Amber Prison \nTurn 2: Pass --> Fury comes in\nTurn 3: Pass\nTurn 4: Cocoon Strike\nTurn 5: Swap to your Inland Croaker\nTurn 6: Ice Tomb\nTurn 7: Swap to your Amberglow Stinger\nTurn 8: Cocoon Strike\nTurn 9: Glowing Toxin  --> Presto comes in\nTurn 10: Amber Prison\nTurn 11: Glowing Toxin  --> Fury comes in\nTurn 12: Glowing Toxin\nTurn 13: Cocoon Strike\nTurn 14: Swap to your Inland Croaker\nTurn 15: Ice Tomb\nTurn 16: Swap to your Amberglow Stinger\nTurn 17: Cocoon Strike \nTurn 18: Glowing Toxin --> Presto comes in\nTurn 19: Amber Prison\nTurn 20: Glowing Toxin  --> Fury comes in\nTurn 21: Glowing Toxin\nTurn 22: Cocoon Strike\nTurn 23: Swap to your Inland Croaker\nTurn 24: Ice Lance until Fury dies (~1x)\nPresto comes in\nTurn 1: Call Blizzard\nTurn 2+: Ice Lance until Presto is in undead Phase\nUndead Phase: Ice Tomb\nGlitzy pet comes in\nTurn 1: Call Blizzard\nTurn 2: Ice Lance until Inland Croaker dies\nBring in your Barnaby\nTurn 1: Roar of the Dead\nTurn 2: Tornado Punch\nTurn 3: Jab until Glitzy dies\n",
		["name"] = "Tasha Riley",
		["tags"] = {
			"21162GQ", -- [1]
			"21142AE", -- [2]
			"112B2CO", -- [3]
		},
		["teamID"] = "team:54",
		["targets"] = {
			160210, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:372"] = {
		["pets"] = {
			"BattlePet-0-000012B01ED3", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"BattlePet-0-000012BAC9E8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/676\n\nScript thanks to Ilyssa\n\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up - Lil' Spirit Guide resurrects\nTurn 4: Wind-Up - Lil' Spirit Guide dies\nQuillino comes in\nTurns 1+: Wind-Up until your Iron Starlette dies (it's okay if you don't hit Quillino a single time!)\nBring in your Pandaren Dragonling\nTurns 1+: Breath until Quillino is dead\nFethyr comes in\nTurn 1: Decoy\nTurn 2: Bombing Run\nTurns 3+: Breath until your Dragonling is dead\nBring in your Tranquil Mechanical Yeti\nTurn 1: Call Blizzard\nTurns 2+: Metal Fist until Fethyr dies\n",
		["name"] = "Training with Bredda (Mech)",
		["tags"] = {
			"11171BB", -- [1]
			"1125QC", -- [2]
			"122C3K", -- [3]
		},
		["teamID"] = "team:372",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
	},
	["team:13"] = {
		["pets"] = {
			"BattlePet-0-000012B607A8", -- [1]
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
			"BattlePet-0-000012B58B24", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/430\n\nScript thanks to Hyp\n\nTurn 1: Missile\nTurn 2: Decoy\nTurns 3+: Missile until Woodcarver is dead\nLightstalker comes in\nTurn 1: Swap to Chrominius\nTurn 2: Arcane Explosion (pass instead if you get stunned)\nTurn 3: Howl\nTurn 4: Surge of Power - Lightstalker dies\nNeedleback comes in and kills Chrominius\nBring back in your Darkmoon Zeppelin\nTurn 1: Missile\nTurn 2: Missile\nTurn 3: Decoy\nTurns 4+: Missile until Needleback is below 618 health\nThen:: Explode\n",
		["name"] = "Mo'ruk",
		["tags"] = {
			"122CAJ", -- [1]
			"2126140", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:101",
		["targets"] = {
			66733, -- [1]
		},
		["groupID"] = "group:11",
	},
	["team:50"] = {
		["pets"] = {
			"BattlePet-0-000012B99CC6", -- [1]
			"BattlePet-0-000012B99C82", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nMind Warper hurts something fierce, so I kept a level pet out of this particular strat. \n\nTurn 1: Rain Dance\nTurn 2: Squeeze\nTurn 3: Tentacle Slap\nLesser Twisted Current comes in\nTurn 1+: Tentacle Slap until Rain Dance is off CD\n~~: Rain Dance\n~~: Squeeze\n~~: Tentacle Slap until Lesser Twisted Current is dead. \nMind Warper comes in\nTurn 1+2: Pass\nBring in your Ironbound Proto-Whelp\nTurn 1: Ironskin\nTurn 2: Ancient Blessing\nTurn 3+: Tail Sweep until Mind Warper is dead, or Ironbound Proto-Whelp is. \nBring in your Dragonkin pet\nAny standard Dragonkin attack will finish the fight\n",
		["name"] = "Captured Evil",
		["tags"] = {
			"11281MP", -- [1]
			"211C1T4", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:50",
		["preferences"] = {
			["minXP"] = 25,
		},
		["groupID"] = "group:11",
		["targets"] = {
			141046, -- [1]
		},
	},
	["team:40"] = {
		["pets"] = {
			"BattlePet-0-000012B4861E", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/374\n\nTurn 1: Moonfire\nTurns 2+: Arcane Blast until Wisdom dies\nPatience comes in\nTurn 1: Life Exchange\nTurns 2+: Arcane Blast until Nether Faerie Dragon dies\nBring in your Mechanical Pandaren Dragonling\nTurns 1+: Breath until Patience is dead\nKnowledge comes in\nTurn 1: Decoy\nTurn 2: Thunderbolt\nTurns 3+: Breath until Knowledge is dead\n",
		["name"] = "Lorewalker Cho",
		["tags"] = {
			"2215HD", -- [1]
			"1225QC", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:40",
		["groupID"] = "group:11",
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
	["team:272"] = {
		["pets"] = {
			"BattlePet-0-000012B99CF2", -- [1]
			"BattlePet-0-000012B6763C", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4959\n\nStrategy added by DragonsAfterDark\nThe script is set for a level pet to come in. When choosing a level pet, make sure it can stand a couple rounds of Arcane Explosion. \n\nTurn 1: Fire Shield\nTurn 2: Lightning Shield\nTurn 3+: Arcane Blast until Kali dies\nAshtail comes in\nTurn 1+: Arcane Blast until the Shields come off CD\n~~: Fire Shield\n~~: Lightning Shield\n~~: Arcane Blast until Ashtail or Tinytron dies\nIncinderous comes in\nIf:: Tinytron is still alive: Arcane Blast until dead\nBring in your Flayer Youngling\nTurn 1-3: Rampage\nTurn 4+: Triple Snap until Incinderous dies\n",
		["name"] = "Brok",
		["tags"] = {
			"112620U", -- [1]
			"2027G2", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:272",
		["groupID"] = "group:11",
		["targets"] = {
			66819, -- [1]
		},
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
		["targets"] = {
			116789, -- [1]
		},
		["groupID"] = "group:7",
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
		["targets"] = {
			162471, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:163"] = {
		["pets"] = {
			"BattlePet-0-000012B146C7", -- [1]
			"BattlePet-0-000012B482D2", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5764\n\nStrategy added by Misspecks#2657\nTurn 1: Pass\nTurn 2: Blistering Cold\nTurn 3: Ice Spike\nTurn 4: Chop\nTurn 5: Ice Spike\nTurn 6: Blistering Cold\nTurn 7: Ice Spike\nTurn 8: Chop\nBring in your Zandalari Anklerender\nTurn 9: Black Claw\nTurn 10+: Hunting Party\n",
		["name"] = "Prototype Annoy-O-Tron",
		["tags"] = {
			"11131TB", -- [1]
			"202A15R", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:163",
		["preferences"] = {
			["minXP"] = 1,
		},
		["targets"] = {
			146001, -- [1]
		},
		["groupID"] = "group:6",
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
		["targets"] = {
			173315, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:288"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-000006E4C770", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Strategy added by Blackspectre\nCredit to Incandio from wowhead. Fast, reliable 2-pet strategy seeing as the Dragonling/Tonk strat is proving unpredictable. This one depends on allowing Dragonling to use Decoy against Judgement, allowing it to retire and then come back and use the decoy against Fezwick later. The second pet (if you have it.) also has an immune.\n\nTurn 1: Decoy\nTurn 2: Thunderbolt\nTurn 3: Breath til Judgement dies\nTurn 4: Honky-Tonk come in\nTurn 5: Bring in Molten Corgi\nTurn 6: Puppies of the Flame\nTurn 7: Flamethrower\nTurn 8: Cauterize if Honky-Tonk hit u with laser then use this\nTurn 9: Flamethrower Honky-Tonk dies.\nTurn 10: Fezwick enter and swap Elekk Plushie for stun hit\nTurn 11: Bring Mechanical Pandaren Dragonling\nTurn 12: Decoy\nTurn 13: Thunderbolt\nTurn 14: Breath til Mechanical Pandaren Dragonling dies.\nTurn 15: Bring in Molten Corgi\nTurn 16: Puppies of the Flame\nturn 17: Flamethrower til Fezwick dies.\n\n\n",
		["name"] = "Jeremy Feasel",
		["tags"] = {
			"1225QC", -- [1]
			"22151DB", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:288",
		["groupID"] = "group:12",
		["targets"] = {
			67370, -- [1]
		},
	},
	["team:399"] = {
		["pets"] = {
			"BattlePet-0-000012B99C7E", -- [1]
			"BattlePet-0-000012B118A8", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/914\n\ntdScript thanks to Tiggles\n\nTurn 1: Scorched Earth\nTurns 2+: Deep Burn until Blazing Firehawk dies\nBring in your Sentinel's Companion\nTurn 1: Ethereal\nTurn 2: Soulrush\nTurns 3+: Dark Talon until the fight is won\n",
		["name"] = "Training with the Nightwatchers (Flyer)",
		["tags"] = {
			"12041KT", -- [1]
			"22281GV", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:399",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
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
		["targets"] = {
			99035, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:395"] = {
		["pets"] = {
			"BattlePet-0-000012B5CB5D", -- [1]
			"BattlePet-0-000006E4C77F", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8944\n\nStrategy added by TerkyAndSquirky\nThanks for the script Ophilla#1123!\n\nTurn 1: Great Sting\nTurns 2+: Flame Breath until Breezy Book dies\nHelpful Spirit enters\nPriority 1: Great Sting on cooldown\nPriority 2: Flame Breath once to apply DoT\nPriority 3: Cleave to fill \nOnce your Infernal Pyreclaw dies, bring in your Worg Pup or fox\nTurns 1+: Flurry until Helpful Spirit enters undead round\nWhen Helpful Spirit enters undead round, use Crouch\nDelicate Moth enters\nTurn 1: Leap\nTurn 2: Flurry\nRepeat turns 1-2 until Delicate Moth is defeated\nOr if you're faster after Delicate Moth loses Flying racial, just use Flurry until the fight is won \n",
		["name"] = "Training with the Nightwatchers (Beast)",
		["tags"] = {
			"211A219", -- [1]
			"21162P", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:395",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:397"] = {
		["pets"] = {
			"BattlePet-0-000012B48707", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/858\n\nStrategy added by Aranesh\ntdScript thanks to KyooShoo\n\nTurns 1+: Tail Sweep until Breezy Book is dead\nHelpful Spirit comes in\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\nTurn 5: Arcane Storm - Helpful Spirit and your Nexus Whelpling both die\nDelicate Moth comes in - bring in Chrominius\nTurn 1: Howl (Skip if Surge of Power will kill Delicate Moth)\nTurn 2: Surge of Power\n",
		["name"] = "Training with the Nightwatchers (Dragon)",
		["tags"] = {
			"122814D", -- [1]
			"0126140", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:397",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
	},
	["team:441"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"random:6", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10474\n\nStrategy added by Randy#3106\nI just wanted fast strat for this battle.\nAnomalus is super strong!\n\nUntil Stumpers & Lil' Sizzle are dead\nPriority 1: Poison Protocol\nPriority 2: Void Nova\nPriority 3: Standby\nWhen only Foof alive\nTurn 1+: Ooze Touch until Anomalus dies\nIf Anomalus couldn't finish, use #1 of next pet\n",
		["name"] = "Fight Night: Amalia (Magic)",
		["tags"] = {
			"12142OQ", -- [1]
			"ZR6", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:441",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
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
		["targets"] = {
			116791, -- [1]
		},
		["groupID"] = "group:7",
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
		["targets"] = {
			72291, -- [1]
		},
		["groupID"] = "group:3",
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
		["targets"] = {
			72285, -- [1]
		},
		["groupID"] = "group:none",
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
	["team:393"] = {
		["pets"] = {
			"BattlePet-0-000012B484E9", -- [1]
			"BattlePet-0-000012B01EEF", -- [2]
			"random:4", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2969\n\nStrategy added by TURBOKillex\nFor a third pet here, I recommend Scraps 212. Superbark is fairly good, and Consume Corpse will probably keep in him the fight if he doesn't easily finish the job for some reason.\n\nTurn 1: Curse of Doom\nTurn 2: Pass - Trixy swaps in your Fossilized Hatchling\nTurn 3: BONESTORM\nTurn 4: Death and Decay\nTurn 5: Bone Bite - Curse of Doom lands and Trixy dies.\nIt is possible Trixy kills Fossilized Hatchling a turn early. Just do the single Bone Bite he has left in him and continue as normal.\nGlobs comes in\nTurn 1: Bone Bite - Globs puts Fossilized Hatchling into Undead state.\nTurn 2: BONESTORM - Fossilized Hatchling dies :(\nBring in your Unborn Val'kyr\nTurn 2/3+: Shadow Shock until Globs dies.\nNightmare Sprout comes in\nTurn 1: Curse of Doom\nTurn 2: Shadow Shock\nTurn 3: Unholy Ascension - Do this instead of Shadow Shock if you got put into Undead early.\nBring in your Undead pet\nTurn X+: Clean up with your third pet. Almost anything should do the job, but the script will only use the first ability (so you might need to do some clicking).\n",
		["name"] = "Dealing with Satyrs (Undead)",
		["tags"] = {
			"222616M", -- [1]
			"22288A", -- [2]
			"ZR4", -- [3]
		},
		["teamID"] = "team:393",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:65"] = {
		["pets"] = {
			"BattlePet-0-000012B96E7D", -- [1]
			"BattlePet-0-000012C2230F", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4663\n\nStrategy added by raiolk\nThis is my first guide feel free to give me tips of how to improve the guide\n\nTurn 1: Dodge\nTurn 2: Howl\nTurn 3-6: Claw\n\n1st backline pet\nTurn 1: Howl\nTurn 2-3: Claw Lil' Bad Wolf dies\n\nLumpy\nTurn 1: Rupture\nTurn 2: Stone Shot\n\n2nd backline pet\nTurn 1: Rock Barrage\nTurn 2-3: Stone Shot\nTurn 4: Rupture\nTurn 5: Rock Barrage\nTurn 6: Stone Shot\n\nif you are unlucky u can just finish it with any lvl 25 pet\n",
		["name"] = "Cockroach",
		["tags"] = {
			"121816A", -- [1]
			"121CAH", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:65",
		["preferences"] = {
			["minXP"] = 25,
		},
		["targets"] = {
			145971, -- [1]
		},
		["groupID"] = "group:6",
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
	["team:310"] = {
		["pets"] = {
			"BattlePet-0-000012B01E39", -- [1]
			"BattlePet-0-000012C41F41", -- [2]
			"BattlePet-0-000012B118E8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13468\n\nStrategy added by Rolfson#1694\nUpdated for Shadowlands, strategy really isn't RNG unless Flummox gets some lucky crits off. The middle pet can be any with Stampede, only needs to get a single turn off before bringing in the helper. Easy does it.\n\nScript thanks to Aesetha\n\nTurn 1: Lovestruck\nTurn 2: Curse of Doom\nTurn 3: Swap to Terky\nTurn 4: Stampede, you'll only get one turn out of it and then die.\nTurn 5: Greench's Gift\nTurn 6: Ice Tomb\nTurn 7: Swap to Sister of Temptation\nTurn 8: Shadow Shock\nTurn 9: Shadow Shock, Flummox dies.\n",
		["name"] = "Flummoxed (Humanoid)",
		["tags"] = {
			"111C1IS", -- [1]
			"002C11H", -- [2]
			"02141A5", -- [3]
		},
		["teamID"] = "team:310",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
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
			"BattlePet-0-000012B17368", -- [2]
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
	["team:279"] = {
		["pets"] = {
			"BattlePet-0-000012B48707", -- [1]
			"random:4", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5448\n\nStrategy added by DragonsAfterDark\nIf you want to use this as a level strat, after you use Tail Sweep on Fungor pass until the Nexus Whelpling dies. Bring in your level pet, and then swap to your backup pet. \n\nTurn 1: Arcane Storm\nTurn 2+3: Mana Surge\nTripod comes in\nTurn 1: Mana Surge continues\nTurn 2+: Tail Sweep\nFungor comes in\nTurn 1: Arcane Storm\nTurn 2: Tail Sweep\nTurn 3: Mana Surge\n",
		["name"] = "Ras'an",
		["tags"] = {
			"122814D", -- [1]
			"ZR4", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:279",
		["groupID"] = "group:11",
		["targets"] = {
			66551, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
			"BattlePet-0-000012B90271", -- [1]
			"BattlePet-0-000012DEFD57", -- [2]
			"BattlePet-0-000012C56FF0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3608\n\nStrategy added by DragonsAfterDark\nI'm putting the warning here, since quite a few people have experienced this:\n\nDO NOT GO AFK after this battle. If you do, the door will close, and re-doing the fight will not open it again. You'll have to drop out of the dungeon and start over. If you need to go AFK, go inside the door at least, or head to the next pet and AFK there.  \n\nTurn 1: Acidic Goo\nTurn 2+3: Dive\nTurn 4+: Ooze Touch until Ultra Safe Napalm Carrier dies, or Rapana Whelk does\nIf:: Rapana Whelk dies before Napalm, bring in your Shimmershell Snail and Ooze Touch\nIf:: Rapana Whelk survives to fight Freeze Ray, then: Acidic Goo > Ooze Touch until dead\nBring in your Shimmershell Snail / Mudshell Conch \nPriority 1: : Dive to avoid Ice Tomb / Sewer Eruption\nPriority 2: : Apply Acidic Goo once\nPriority 3:: Ooze Touch all else\n",
		["name"] = "Door Control Console",
		["tags"] = {
			"111CN7", -- [1]
			"1117FD", -- [2]
			"11171NG", -- [3]
		},
		["teamID"] = "team:72",
		["targets"] = {
			146932, -- [1]
		},
		["groupID"] = "group:6",
	},
	["team:442"] = {
		["pets"] = {
			"BattlePet-0-000012BA9541", -- [1]
			"random:10", -- [2]
			"random:10", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/519\n\nScript thanks to Ilyssa\n\nTurns 1-3: Quake\nTurns 4-6: Repair\nTurns 7-9: Quake\nTurn 10: Pass\nTurn 11: Pass\nTurns 12-14: Quake\nTurns 15-17: Repair\nTurns 18+: Quake - all enemy pets should be dead by now (sometimes even way before)\n",
		["name"] = "Fight Night: Amalia (Mech)",
		["tags"] = {
			"012485", -- [1]
			"ZRA", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:442",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
		["targets"] = {
			197417, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			141002, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:437"] = {
		["pets"] = {
			"BattlePet-0-000012B4838C", -- [1]
			"random:2", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/809\n\nStrategy added by Jeack\nScript thanks to Karl\n\nTurn 1: Emerald Presence\nTurns 2+: Keep Emerald Presence and use Emerald Bite until Foof is dead\nStumpers comes in\nTurns 1+: Continue like above, but use Emerald Dream if you drop below ~800 health\nLil' Sizzle comes in\nTurn 1: Emerald Presence\nTurns 2-4: Emerald Dream\nTurn 5: Emerald Bite\nTurn 6: Emerald Bite\nTurn 7: Emerald Presence\nTurns 8+: When your Emerald Proto-Whelp is swapped out, either continue with one of your other Dragons or swap back and continue with Emerald Bite until the fight is won.\n",
		["name"] = "Fight Night: Amalia (Dragon)",
		["tags"] = {
			"222814F", -- [1]
			"ZR2", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:437",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
		},
	},
	["team:426"] = {
		["pets"] = {
			"BattlePet-0-000012B607A1", -- [1]
			"BattlePet-0-000012B90271", -- [2]
			"random:5", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8921\n\nStrategy added by TerkyAndSquirky\nThanks for the script Sunshine529!\n\nTurn 1-3: Flock\nTurns 4+: Trample until Itchy dies. \nSalty Bird enters\nTurn 1+: Flock. Darkmoon Hatchling dies. \nBring in snail (If whirlpool crits, your snail will come in a bit earlier. In that case, start with Shell Shield)\nTurns 1+: Ooze Touch until Salty Bird dies.\nGrommet enters\nTurns 1-2: Dive\nTurn 3: Shell Shield\nTurns 4+: Ooze Touch until Grommet dies\nCleanup with 3rd pet using standard attacks if needed\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Critter)",
		["tags"] = {
			"2015115", -- [1]
			"121CN7", -- [2]
			"ZR5", -- [3]
		},
		["teamID"] = "team:426",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
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
		["targets"] = {
			119345, -- [1]
		},
		["groupID"] = "group:4",
	},
	["team:4"] = {
		["pets"] = {
			"BattlePet-0-000012B146CA", -- [1]
			"BattlePet-0-000012B58B24", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7641\n\nStrategy added by t1ar\nTurn 1: Make it Rain\nTurn 2: Extra Plating\nTurn 3: Make it Rain\nTurns 4-6: Inflation\nTurn 7: Extra Plating\nTurn 8: Make it Rain\nTurns 9-11: Inflation\nBring in your Darkmoon Zeppelin\nPriority 1: Explode on Wolfgar when he gets to 618 hp or less\nPriority 2: Decoy when Howl is at 1 duration on its CD\nPriority 3: Missile\n",
		["name"] = "Gargra",
		["tags"] = {
			"2215198", -- [1]
			"122CAJ", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:4",
		["targets"] = {
			87122, -- [1]
		},
		["groupID"] = "group:11",
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
	["team:35"] = {
		["pets"] = {
			"BattlePet-0-000011CA344B", -- [1]
			"random:0", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\n[url=https://www.youtube.com/watch?v=sxR04DaaG04]Video of Fight[/url]\n\nTurn 1: Deflection\nThen:\nPriority 1: Deflection on CD\nPriority 2: Cleave\n~*~: Note: Once Idol of Decay gets under 300 hp, they'll use Dark Rebirth.\nSometimes you'll hit the 300 threshold just as Rot is coming off CD. You'll want to Cleave instead of Deflection, because Idol of Decay will prioritize Rebirth over Rot \n\nGyrexle, the Eternal Mechanic comes in\nTurn 1: Cleave\n",
		["name"] = "Cymre Brightblade",
		["tags"] = {
			"210C31Q", -- [1]
			"ZR0", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:35",
		["groupID"] = "group:11",
		["targets"] = {
			83837, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:402"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-000012BAC92C", -- [2]
			"random:10", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/551\n\nScript thanks to Tiggles\n\nTurn 1: Decoy\nTurn 2: Thunderbolt\nTurn 3: Breath until Breezy Book is dead\nHelpful Spirit comes in\nTurn 1: Swap to your Darkmoon Tonk\nTurns 2+: Missile until the Spirit is below 732 health points\nThen:: Minefield\nThen:: Ion Cannon\nDelicate Moth comes in\nTurns 1+: Missile until your Tonk dies (pass if you got stunned)\nBring back your Mechanical Pandaren Dragon\nTurn 1: Decoy\nTurn 2: Thunderbolt\nTurns 3+: Breath until the fight is won\n",
		["name"] = "Training with the Nightwatchers (Mech)",
		["tags"] = {
			"1225QC", -- [1]
			"1227AI", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:402",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
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
	["team:368"] = {
		["pets"] = {
			"BattlePet-0-000012B485C2", -- [1]
			"BattlePet-0-000012B5CC18", -- [2]
			"BattlePet-0-000012B5CB68", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4830\n\nStrategy added by DragonsAfterDark\n30 July 22: tdScript added\n\nTurn 1: Geyser\nTurn 2+3: Dive\nTurn 4: Water Jet\nTurn 5: Water Jet (Hits Quillino)\nTurn 6: Water Jet (Water Spirit dies here)\nBring in your Unstable Tendril\nTurn 1: Scorched Earth\nTurn 3+: Deep Burn until Quillino & Lil' Spirit Guide die\nIf: Ashstone Core has to come in on the Undead round, Crystal Prison to keep from being damaged\nFethyr comes in\nIf : Unstable Tendril is still alive: Elementium Bolt \nBring in your Ashstone Core\nTurn 1: Stoneskin\nTurn 2+: Feedback until Fethyr dies\n",
		["name"] = "Training with Bredda (Elemental)",
		["tags"] = {
			"1229R4", -- [1]
			"221721C", -- [2]
			"121913U", -- [3]
		},
		["teamID"] = "team:368",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
	},
	["team:317"] = {
		["pets"] = {
			"BattlePet-0-000012B48707", -- [1]
			"BattlePet-0-000012B99B2E", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2581\n\nStrategy added by DragonsAfterDark\nTurn 1: Arcane Storm\nTurns 2+3: Mana Surge\nConviction comes in\nTurn 1: Mana Surge finishes\nTurn 2+: Tail Sweep until Conviction gets to below 26% hp or less than 397 hp\nTurn 3: Pass\nTurn 4: Pass\nTurn 5: Tail Sweep - doesn't matter, you'll probably die\nBring in your Twilight Clutch-Sister\nTurn 1+: Tail Sweep until Conviction dies\nDignity comes in\nTurn 1: Twilight Meteorite\nTurn 2+: Tail Sweep until Dignity dies\n",
		["name"] = "The Master of Pets (Dragon)",
		["tags"] = {
			"122814D", -- [1]
			"112B211", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:317",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:334"] = {
		["pets"] = {
			"BattlePet-0-000012BA950B", -- [1]
			"BattlePet-0-000012B99D12", -- [2]
			"BattlePet-0-000012C633E8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/935\n\nStrategy added by Swyftlyght\nScript thanks to Isthevao\n\nTurn 1: Deep Bite\nTurn 2: Call Lightning\nTurn 3: Shell Armor\nTurn 4: Deep Bite\nTurn 5: Deep Bite\nTurn 6: Deep Bite - Thrugtusk dies\nWumpas comes in\nTurn 1: Deep Bite\nTurn 2: Call Lightning\nTurn 3+: Deep Bite until Hydraling dies\nBring in Snarly\nTurn 1: Rip\nTurn 2: Blood in the Water - Wumpas dies\nBaeloth comes in \nTurn 1: Surge\nTurn 2: Swap to your Crab\nTurn 3: Whirlpool\nTurn 4+: Surge until Baeloth is dead\n",
		["name"] = "My Beast's Bidding (Aquatic)",
		["tags"] = {
			"111A1G5", -- [1]
			"11275D", -- [2]
			"2026CH", -- [3]
		},
		["teamID"] = "team:334",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
		},
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
		["targets"] = {
			119407, -- [1]
		},
		["groupID"] = "group:4",
	},
	["team:429"] = {
		["pets"] = {
			"BattlePet-0-000012B5C2FF", -- [1]
			"BattlePet-0-000012F20B9E", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1960\n\nRepeat the following until your Direbeak Hatchling dies\nPriority 1: Ironskin\nPriority 2: Warning Squawk\nPriority 3: Falcosaur Swarm!\nBring in your Ikky\nRepeat the following until Ikky dies\nTurn 1: Black Claw\nTurns 2-4: Flock\nClean up with your third Flyer\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Flyer)",
		["tags"] = {
			"12271TN", -- [1]
			"01181FS", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:429",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
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
		["targets"] = {
			116792, -- [1]
		},
		["groupID"] = "group:7",
	},
	["team:422"] = {
		["pets"] = {
			"BattlePet-0-000012B99CF2", -- [1]
			"BattlePet-0-000012BAC92C", -- [2]
			"BattlePet-0-000012BC0A5A", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10336\n\nStrategy added by DragonsAfterDark\nTurn 1: Supercharge\nTurn 2: Arcane Blast\nTurn 3: Fire Shield\nTurn 4: Arcane Blast\nTurn 5: Arcane Blast\nSir Murkeston comes in\nTurn 1: Supercharge\nTurn 2: Arcane Blast\nTurn 3: Pass\n\nBring in your Darkmoon Tonk\nTurn 1: Charge\nTurn 2: Minefield\nTurn 3+: Charge until Greatest Foe dies\nSir Murkeston comes in\nTurns 1+: Ion Cannon & Charge if you can\n\nBring in your Mechanical Pandaren Dragonling\nDid Sir Murkeston kill Darkmoon Tonk with Falling Murloc?\nTurn 1: Thunderbolt (While Sir Murkeston is stunned)\nTurn 2: Decoy\nTurn 3+: Breath\n\nOtherwise:\nTurn 1: Decoy\nTurn 2: Thunderbolt\nTurn 3+: Breath\n",
		["name"] = "Fight Night: Sir Galveston (Mech)",
		["tags"] = {
			"122620U", -- [1]
			"2227AI", -- [2]
			"1225QC", -- [3]
		},
		["teamID"] = "team:422",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
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
		["targets"] = {
			154914, -- [1]
		},
		["groupID"] = "group:none",
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
	["team:421"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"BattlePet-0-000011D3098B", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8849\n\nStrategy added by DragonsAfterDark\nTurn 1: Void Nova\nTurn 2: Poison Protocol\nTurn 3: Pass\nTurn 4: Corrosion\nTurn 5: Void Nova\nSir Murkeston comes in\nTurn 1: Corrosion\nBring in your Creeping Tentacle\nTurn 1: Crush\nTurn 2: Crush\nTurn 3: Crush\nSir Murkeston comes in\nTurn 1+: Crush\n",
		["name"] = "Fight Night: Sir Galveston (Magic)",
		["tags"] = {
			"22142OQ", -- [1]
			"20081TA", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:421",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
		["targets"] = {
			175785, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			154911, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:418"] = {
		["pets"] = {
			"BattlePet-0-000012B607A6", -- [1]
			"BattlePet-0-000012B17369", -- [2]
			"BattlePet-0-000006E4C77C", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1246\n\nScript thanks to KyooShoo\n\nTurn 1: Geyser\nTurn 2: Rain Dance\nTurn 3: Pass\nTurns 4+: Jade Claw until Jademist Dancer dies\nBring in your Living Sandling\nTurns 1+: Keep Quicksand on cooldown and use Punch until your Living Sandling dies\nBring in your Tiny Snowman\nTurn 1: Call Blizzard\nTurn 2: Deep Freeze\nTurn 3: Snowball\n",
		["name"] = "Fight Night: Sir Galveston (Elemental)",
		["tags"] = {
			"222319L", -- [1]
			"122A14P", -- [2]
			"11233L", -- [3]
		},
		["teamID"] = "team:418",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
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
	["team:339"] = {
		["pets"] = {
			"BattlePet-0-000012B6764A", -- [1]
			"BattlePet-0-000012BA9542", -- [2]
			"BattlePet-0-000012EA974D", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/886\n\nStrategy added by Belkelel#2195\nScript thanks to AramilGaeda\n\nTurn 1: Decoy\nTurns 2+3: Haywire\nTurns 4+: Alpha Strike until Thrugtusk is dead\nWumpas comes in\nTurns 1+: Haywire or Alpha Strike until your Mechanical Axebeak dies\nBring in Stormwing\nTurn 1: Call Lightning\nTurns 2-4: Flock\nTurns 5+: Alpha Strike until Wumpas dies\nBaeloth comes in\nTurn 1: Alpha Strike\nTurn 2: Pass\nTurn 3: Call Lightning\nTurns 4+: Flock - Stormwing dies\nBring in your Cerulean Moth\nTurn 1: Call Lightning\nTurns 2+: Slicing Wind until the fight is done\n",
		["name"] = "My Beast's Bidding (Flyer)",
		["tags"] = {
			"12171BR", -- [1]
			"112A1GA", -- [2]
			"10281HI", -- [3]
		},
		["teamID"] = "team:339",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
		},
	},
	["team:348"] = {
		["pets"] = {
			"BattlePet-0-000012BEE3D5", -- [1]
			"BattlePet-0-000012B485C2", -- [2]
			"BattlePet-0-000006E4C77C", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/800\n\nScript thanks to Ilyssa\n\nTurn 1: Rip\nTurn 2: Lightning Shield\nTurn 3: Blood in the Water\nTurns 4+: Rip until Gulp dies\nEgcellent comes in\nTurns 1+: Rip until Electrified Razortooth is dead\nBring in your Pandaren Water Spirit\nTurn 1: Whirlpool\nTurns 2+3: Dive\nTurn 4: Pass - Red Wire swaps in\nTurn 5: Whirlpool\nTurns 6+: Water Jet until Pandaren Water Spirit dies\nBring in your Tiny Snowman\nTurn 1: Frost Nova\nTurn 2: Deep Freeze\nTurns 3+: Magic Hat until all enemy pets are dead\n",
		["name"] = "Tiny Poacher, Tiny Animals (Elemental)",
		["tags"] = {
			"122314R", -- [1]
			"1219R4", -- [2]
			"22233L", -- [3]
		},
		["teamID"] = "team:348",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
		},
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
		["targets"] = {
			150925, -- [1]
		},
		["groupID"] = "group:8",
	},
	["team:412"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-000012B01ED3", -- [2]
			"random:10", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/861\n\nStrategy added by Aranesh\nTurn 1: Decoy\nTurns 2+: Breath until Jinx is dead\nRocket comes in\nTurn 1: Swap to your Iron Starlette\nTurn 2: Wind-Up\nTurn 3: Supercharge\nTurn 4: Wind-Up\nTurns 5+: Powerball until Rocket is dead\nMarshmallow comes in\nTurn 1: Wind-Up\nTurn 2: Wind-Up\nTurns 3+: Powerball until Iron Starlette is dead\nBring back your Mechanical Pandaren Dragonling\nTurn 1: Thunderbolt\nTurns 2+: Breath \n",
		["name"] = "Fight Night: Tiffany Nelson (Mech)",
		["tags"] = {
			"1225QC", -- [1]
			"11171BB", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:412",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:287"] = {
		["pets"] = {
			"BattlePet-0-000012B0D34C", -- [1]
			"BattlePet-0-000012B99CF8", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\n[url=https://www.youtube.com/watch?v=60I0HeBsPfo]Video for Fight[/url]\n\nTurn 1: Time Bomb\nTurn 2: Flame Breath\nTurn 3: Flame Breath\nTurn 4: Flame Breath\nTurn 5: Armageddon\nBring in your Pet Bombling\nMr. Pointy comes in\nTurn 6: Zap\nTurn 7: Minefield\nTurn 8: Zap\nTurn 9: Zap\nTurn 10: Zap\nOtto comes in\nTurn 11: Explode\n",
		["name"] = "Christoph VonFeasel",
		["tags"] = {
			"122430S", -- [1]
			"11292L", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:287",
		["groupID"] = "group:12",
		["targets"] = {
			85519, -- [1]
		},
	},
	["team:353"] = {
		["pets"] = {
			"BattlePet-0-000012C8BACD", -- [1]
			"BattlePet-0-000012C56AF4", -- [2]
			"BattlePet-0-000012B01EED", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3013\n\nStrategy added by DragonsAfterDark\nTurn 1: Pounce\nTurn 2: Call Darkness\nTurn 3: Spectral Strike\nTurn 4+: Pounce until dead. If Gulp doesn't get any crazy crits, Widget and Gulp die the same round. If not, just bring in your Bigglesworth and finish him off with Claw\nBring in your Mr. Bigglesworth\nEgcellent comes in\nTurn 1+: Claw until Egcellent gets under half health\nTurn ~: Ice Tomb - Egcellent Feigns Death & Red Wire is swapped in\nTurn 1: Frost Nova\nTurn 2+: Claw\nBring in your Fragment of Anger\nTurn 1+: Seethe until Red Wire dies\nEgcellent comes in\nTurn 1: Soulrush\nTurn 2+: Seethe until Egcellent dies\n",
		["name"] = "Tiny Poacher, Tiny Animals (Undead)",
		["tags"] = {
			"12151FJ", -- [1]
			"121513P", -- [2]
			"20171IP", -- [3]
		},
		["teamID"] = "team:353",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
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
	["team:66"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/345\n\nScript thanks to Aidos\n\nTurn 1: Sandstorm\nTurn 2: Deflection\nTurns 3+: Keep Sandstorm and Deflection on cooldown and use Crush in between until Carpe Diem is dead\nSpirus comes in\nTurn 1: Swap to Mechanical Pandaren Dragonling\nTurn 2: Decoy\nTurn 3: Thunderbolt\nTurns 4+: Breath and Thunderbolt when available until Spirus is dead\nRiver comes in\nTurn 1: Swap to Anubisath Idol\nTurn 2: Sandstorm\nTurn 3: Deflection\nTurns 4+: As before, keep Sandstorm and Deflection on cooldown and use Crush in between until the fight is won.\n",
		["name"] = "Wise Mari",
		["tags"] = {
			"1116143", -- [1]
			"1225QC", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:66",
		["targets"] = {
			71932, -- [1]
		},
		["groupID"] = "group:11",
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
	["team:389"] = {
		["pets"] = {
			"BattlePet-0-000012C634C7", -- [1]
			"BattlePet-0-000011F1418A", -- [2]
			"BattlePet-0-000012C4FA16", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/18543\n\nStrategy added by DragonsAfterDark\nTurn 1: Toxic Fumes\nTurn 2: Sludge Belch\nYour Gorm Harrier is swapped in\nTurn 1: Great Sting\nTurn 2: Enrage\nTurn 3: Impale if you can\nTurn 4: Pass if you're still alive\nBring in your Crawbat\nTurn 1: Toxic Fumes\nTurn 2: Sludge Belch\nTurn 3: Furious Flapping\nBring in your Wader Chick\nTurn 1: Peck if Globs is still alive\nNightmare Sprout comes in\nPrio 1: Peck if it will kill Nightmare Sprout\nPrio 2: Pump\n",
		["name"] = "Dealing with Satyrs (Flyer)",
		["tags"] = {
			"111330B", -- [1]
			"22142R9", -- [2]
			"102B2RR", -- [3]
		},
		["teamID"] = "team:389",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
		},
	},
	["team:371"] = {
		["pets"] = {
			"BattlePet-0-000012B1DC70", -- [1]
			"BattlePet-0-00000D58DFB6", -- [2]
			"BattlePet-0-000012BAC9E1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15911\n\nStrategy added by DragonsAfterDark\nThe variance in rounds will come from 3 factors: whether or not Quillino hits the slime with Spectral Strike, whether or not Lil' Spirit Guide dies on the backline when you Phase Punch for Fethyr, and whether Fethyr hits you with 3 Thrashes or just 2.\n\nIt's solid, as far as I can tell, no matter what, those are just the reason for the round variance\n\nTurn 1: Evanescence\nTurn 2: Nether Blast\nTurn 3: Nether Blast\nTurn 4: Nether Blast\nTurn 5: Phase Punch\nQuillino comes in\nTurn 1: Evanescence\nTurn 2: Nether Blast\nTurn 3: Swap to your Plagueborn Slime\nTurn 4: Toxic Fumes\nTurn 5: Consume Magic\nTurn 6: Plague Breath\nTurn 7: Plague Breath\nLil' Spirit Guide comes back in\nTurn 1+: Any standard attack until Plagueborn Slime dies\nBring in your Zur'aj the Depleted\nTurn 1: Evanescence\nTurn 2: Nether Blast\nTurn 3: Phase Punch\nFethyr comes in\nTurn 1: Swap to your Spectral Porcupette\nTurn 2: Spirit Spikes\nTurn 3: Spectral Spine\nTurn 4+: Powerball until Fethyr dies or Spectral Spine comes off CD\nTurn 5: Spectral Spine\nLil' Spirit Guide comes in\nTurn 1+: Powerball until Spectral Porcupette or Lil' Spirit Guide dies\nBring in your Zur'aj the Depleted\nTurn 1: Evanescence\nTurn 2+: Nether Blast until Lil' Spirit Guide's undead round\nUndead: Pass\n",
		["name"] = "Training with Bredda (Magic)",
		["tags"] = {
			"12192FM", -- [1]
			"12172NE", -- [2]
			"2229151", -- [3]
		},
		["teamID"] = "team:371",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
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
	["team:413"] = {
		["pets"] = {
			"BattlePet-0-000012BAFD2D", -- [1]
			"BattlePet-0-000012B96D70", -- [2]
			"random:4", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2696\n\nStrategy added by DragonsAfterDark\nTurn 1: Touch of the Animus\nTurn 2+3: Lift-Off\nTurn 4+: Plagued Blood until Jinx dies\nRocket comes in\nPriority 1: Touch of the Animus & Lift-Off on CD\nPriority 2: Plagued Blood all else\nBring in your Spirit Crab\nTurn 1+: Surge until Rocket dies\nMarshmallow comes in\nTurn 1: Shell Shield and then refresh with 1 round left\nTurn 2+: Snap until Marshmallow dies\n",
		["name"] = "Fight Night: Tiffany Nelson (Undead)",
		["tags"] = {
			"22281H6", -- [1]
			"1119EF", -- [2]
			"ZR4", -- [3]
		},
		["teamID"] = "team:413",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
	["team:326"] = {
		["pets"] = {
			"BattlePet-0-000011F7F5D4", -- [1]
			"BattlePet-0-000012B90271", -- [2]
			"random:5", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/637\n\nDragonsAfterDark: Updated 3 June 22 for some efficiency changes. Happy battling!\n\nScript thanks to Ratsch\n\nTurn 1: Flurry\nTurn 2: Flurry\nTurns 3-5: Stampede\nUndead: Pass\nCrawdead comes in\nTurn 1: Flurry\nTurn 2: Flurry\nTurn 3: Dodge\nTurn 4+: Flurry until Rabbit dies\nBring in your Snail\nTurn 1: Shell Shield\nTurns 2+: Ooze Touch until Crawdead resurrects\nUndead: Shell Shield\nGnaw comes in\nTurns 1+2: Dive\nTurns 2+: Ooze Touch until your Snail dies\nBring in your third pet\nTurn 1: Any standard attack will finish the fight\n",
		["name"] = "Jarrun's Ladder (Critter)",
		["tags"] = {
			"222BBQ", -- [1]
			"121CN7", -- [2]
			"ZR5", -- [3]
		},
		["teamID"] = "team:326",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
		["targets"] = {
			200689, -- [1]
		},
		["groupID"] = "group:none",
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
	["team:396"] = {
		["pets"] = {
			"BattlePet-0-000012C4F6DE", -- [1]
			"BattlePet-0-000012C4AA56", -- [2]
			"BattlePet-0-000012DEFD57", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/621\n\ntdScript thanks to AramilGaeda\n\nTurns 1-3: Swarm\nTurn 4: Flank\nTurn 5: Flank - Breezy Book dies\nHelpful Spirit comes in\nIs your Roach still alive?\nYes:: Jump to Scenario 1\nNo:: Jump to Scenario 2\n\nScenario 1\nTurn 1: Swarm - your Roach dies\nBring in your Rabbit\nTurn 1: Flurry\nTurn 2: Flurry - Helpful Spirit resurrects\n\nScenario 2\nBring in your Rabbit\nTurn 1: Dodge\nTurns 2-4: Stampede\nTurns 5+: Flurry until the Helpful Spirit resurrrects\n\nThen:: Dodge\nDelicate Moth comes in\nTurns 1+: Stampede until your Rabbit dies\nBring in your snail\nTurns 1+: Ooze Touch until the Moth is dead",
		["name"] = "Training with the Nightwatchers (Critter)",
		["tags"] = {
			"221BD8", -- [1]
			"222BMP", -- [2]
			"1217FD", -- [3]
		},
		["teamID"] = "team:396",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
	},
	["team:119"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"BattlePet-0-000012E7A769", -- [3]
		},
		["notes"] = "Strategy added by F1NCH#2182\nBooth Val'kyr work, but with H/H Breed the fight is 1 round longer\n\nTurn 1: Siphon Life\nTurn 2: Haunt\nBring in your Ikky\nTurn 1: Black Claw\nTurn 2: Flock\n",
		["name"] = "Living Statues Are Tough",
		["tags"] = {
			"111316M", -- [1]
			"21181FS", -- [2]
			"11152PO", -- [3]
		},
		["teamID"] = "team:119",
		["targets"] = {
			162470, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:384"] = {
		["pets"] = {
			"BattlePet-0-000012B0D350", -- [1]
			"BattlePet-0-000012B90222", -- [2]
			"BattlePet-0-000012D930C5", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/706\n\nScript thanks to TURBOKillex\n\nTurns 1+2: Dive\nTurn 3: Jolt\nTurn 4: Paralyzing Shock\nTurn 5: Jolt - Trixy dies\nGlobs comes in\nTurn 1: Pass - your Spawn of G'nathus dies\nBring in your Ghostshell Crab\nTurn 1: Spirit Claws\nTurn 2: Spirit Spikes\nTurn 3: Bubble\nTurns 4+: Spirit Claws until Globs is dead - this can fail in rare cases because of the 80% hit chance of Spirit Claws. You might have to restart the fight at this point.\nNightmare Sprout comes in\nTurn 1: Spirit Spikes\nTurns 2+: Spirit Claws until your Crab is dead\nBring in your Strider\nTurn 1: Pump\nTurn 2: Water Jet\nTurn 3: Water Jet\nTurn 4: Pump - Nightmare Sprout dies\n",
		["name"] = "Dealing with Satyrs (Aquatic)",
		["tags"] = {
			"212A15H", -- [1]
			"12191K1", -- [2]
			"1123HM", -- [3]
		},
		["teamID"] = "team:384",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
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
		["targets"] = {
			202440, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:407"] = {
		["pets"] = {
			"BattlePet-0-000012B4838C", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/606\n\nScript thanks to KyooShoo\n\nTurns 1+2: Proto-Strike\nTurns 3+: Breath until Jinx is dead\nRocket comes in\nTurn 1: Emerald Presence\nTurns 2+3: Proto-Strike\nTurns 4+: Breath until Rocket is dead as well\nMarshmallow comes in\nTurns 1+: Breath until your Proto-Whelp dies\nBring in Chrominius\nTurn 1: Howl\nTurn 2: Surge of Power\n",
		["name"] = "Fight Night: Tiffany Nelson (Dragon)",
		["tags"] = {
			"121814F", -- [1]
			"1126140", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:407",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
		},
	},
	["team:366"] = {
		["pets"] = {
			"BattlePet-0-000011F7F5D4", -- [1]
			"BattlePet-0-000012C4AA56", -- [2]
			"BattlePet-0-000012DEFD57", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/678\n\nScript thanks to Aesetha\n\nTurn 1: Dodge\nTurn 2: Scratch\nTurn 3: Scratch\nTurn 4: Scratch\nTurns 5+6: Burrow\nTurns 7+: If necessary, Scratch until Lil' Spirit Guide enters his undead round\nThen:: Dodge\nQuillino comes in\nTurns 1+: Scratch until your Rabbit dies\nBring in your second Rabbit\nTurns 1+: Use Burrow when available and Scratch otherwise until your Rabbit is dead\nBring in your Snail\nTurns 1+: Ooze Touch until Quillino dies\nFethyr comes in\nTurns 1+2: Dive\nTurn 3: Shell Shield\nTurn 4: Ooze Touch\nTurn 5: Ooze Touch\nTurn 6: Ooze Touch\nTurns 7+8: Burrow - Fethyr dies\n",
		["name"] = "Training with Bredda (Critter)",
		["tags"] = {
			"121BBQ", -- [1]
			"121BMP", -- [2]
			"1217FD", -- [3]
		},
		["teamID"] = "team:366",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
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
	["team:434"] = {
		["pets"] = {
			"BattlePet-0-000012B5CBA5", -- [1]
			"random:9", -- [2]
			"random:9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3552\n\nStrategy added by DragonsAfterDark\nTurn 1: Rain Dance\nTurn 2-5: Tidal Wave\nRepeat 1-5 until enemy backline pets die\nAfter that:\nPriority 1: Rain Dance\nPriority 2: Water Jet\n",
		["name"] = "Fight Night: Amalia (Aquatic)",
		["tags"] = {
			"11231KN", -- [1]
			"ZR9", -- [2]
			"ZR9", -- [3]
		},
		["teamID"] = "team:434",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:419"] = {
		["pets"] = {
			"BattlePet-0-000012B118A8", -- [1]
			"BattlePet-0-000012B99CCD", -- [2]
			"BattlePet-0-000012EA971F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13847\n\nStrategy added by Anesthetize\nScript thanks to Malhado\n\nTurn 1: Soulrush\nTurn 2: Dark Talon\nTurn 3: Pass\nTurn 4: Ethereal\nTurn 5: Dark Talon\nTurn 6: Soulrush - Coach should be dead\nTurn 7: Dark Talon - Sentinel will probably die here. If not, Talon until Sentinel die.\nBring Nightwreathed Watcher in.\nTurn 1: Call Darkness - (assuming Sir Murkeston is stunned, the ability should hit Greatest Foe)\nTurn 2: Warning Squawk\nTurn 3: Dark Talon - Until Nightwreathed Watcher is dead.\nIf you are lucky, Sir Murkeston is dead by now, if not:\nTurn 1: Shadow Slash\n\n",
		["name"] = "Fight Night: Sir Galveston (Flyer)",
		["tags"] = {
			"22281GV", -- [1]
			"22272G3", -- [2]
			"20061HV", -- [3]
		},
		["teamID"] = "team:419",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
		},
	},
	["team:433"] = {
		["pets"] = {
			"BattlePet-0-000012EB3764", -- [1]
			"BattlePet-0-000012C4ECBA", -- [2]
			"random:4", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3513\n\nStrategy added by DragonsAfterDark\nTurn 1: Plagued Blood\nTurn 2: Phase Shift\nTurn 3-6: Arcane Blast\nTurn 7: Phase Shift\nTurn 8+: Arcane Blast until Itchy dies\nSalty Bird comes in\nTurn 1+: Arcane Blast until Salty Bird dies\nGrommet comes in\nTurn 1+: Plagued Blood until Restless Shadeling dies completely\nBring in your Spectral Spinner\nTurn 1: Blinding Poison\nTurn 2: Spectral Strike\nTurn 3+: Bone Bite until Grommet dies\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Undead)",
		["tags"] = {
			"2129DN", -- [1]
			"12281M2", -- [2]
			"ZR4", -- [3]
		},
		["teamID"] = "team:433",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
	["team:289"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012B4838C", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/384\n\nScript thanks to aidos\n\nTurn 1: Sandstorm\nTurn 2: Deflection\nTurns 3+: From here on, cast Deflection on cooldown, Sandstorm when you can and Crush in between until Diamond is no more.\nMollus comes in\nTurn 1: Crush\nTurn 2: Crush\nTurn 3: Deflection\nTurn 4: Swap to your Emerald Proto-Whelp\nTurn 5: Emerald Presence\nTurn 6: Emerald Bite\nTurn 7: Emerald Bite\nTurns 8-9: Proto-Strike\nTurn 10: Emerald Presence\nTurns 11+: Emerald Bite until Mollus dies.\nSkimmer comes in\nTurns 1+: Emerald Bite until your Emerald Proto-Whelp dies. Pass if you get stunned.\nBring in your Anubisath Idol\nTurns 1+: Cast Deflection when Skimmer is Pumped up (if possible), Sandstorm on cooldown and Crush as a filler.\n",
		["name"] = "Seeker Zusshi",
		["tags"] = {
			"1116143", -- [1]
			"221814F", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:289",
		["groupID"] = "group:11",
		["targets"] = {
			66918, -- [1]
		},
	},
	["team:285"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000011F7F5D4", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3785\n\nStrategy added by Dpaul\nThanks to Rikade (https://www.wowhead.com/user=Rikade) for this strategy (https://www.wowhead.com/npc=66638/okrut-dragonwaste#comments ).\n\nPriority 1: Deflection if Drogar is Flying or 1 turn left on Sleet's Ice Tomb\nPriority 2: Keep Stoneskin up\nPriority 3: Crush\nSwap to your Level Pet when Anubisath Idol dies\nBring in your Rabbit\nTurn 1: Dodge\nTurn 2+: Flurry\n",
		["name"] = "Okrut Dragonwaste",
		["tags"] = {
			"1216143", -- [1]
			"222BBQ", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:285",
		["groupID"] = "group:11",
		["targets"] = {
			66638, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
	},
	["team:357"] = {
		["pets"] = {
			"BattlePet-0-000012B146CC", -- [1]
			"BattlePet-0-000012B4861E", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/489\n\npbScript thanks to Logic\n\nTurn 1: Bite\nTurn 2: Pass\nTurn 3: Pass\nTurn 4: Howl\nTurn 5: Bite\nTurn 6: Bite\nTurn 7: Ravage\nSlow Moe comes in\nTurn 1: Ravage continues or Bite\nTurn 2: Howl\nTurn 3: Bite or Pass\nTurn 4 / 1: If you passed: Bite\nTurn 4 / 2: If you didn't pass: Ravage\nTurn 5+6: Ravage / Ravage continues\nSnot comes in\nTurn 1: Bite\nTurn 2: Bite\nTurn 3: Pass\nTurn 4+: Bite until Chrominius dies\nBring in your Nether Faerie Dragon\nTurn 1+: Arcane Blast until Snot dies\n",
		["name"] = "Snail Fight! (Dragon)",
		["tags"] = {
			"1116140", -- [1]
			"2115HD", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:357",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
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
	["team:400"] = {
		["pets"] = {
			"BattlePet-0-000012B96E7D", -- [1]
			"random:1", -- [2]
			"random:1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3458\n\nStrategy added by DragonsAfterDark\nCredit to Nyxilis from the comments on the other strat. \n\nYou want Humanoids with enough health to survive the backline damage, and to come in just in case the Wolf doesn't quite make it. \n\nTurn 1: Dodge\nTurn 2+: Pounce until Breezy Book is dead\nHelpful Spirit comes in\nTurn 1: Dodge\nTurn 2+: Pounce until Helpful Spirit Undead round\nUndead: Dodge (This should time with avoiding Curse of Doom)\nDelicate Moth comes in\nTurn 1: Counterstrike\nTurn 2+3: Pounce\nTurn 4: Counterstrike\nTurn 5: Dodge\nTurn 6: Pounce\nTurn 7: Counterstrike\n",
		["name"] = "Training with the Nightwatchers (Humanoid)",
		["tags"] = {
			"222816A", -- [1]
			"ZR1", -- [2]
			"ZR1", -- [3]
		},
		["teamID"] = "team:400",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
		["preferences"] = {
			["minHP"] = 1501,
			["minXP"] = 25,
		},
	},
	["team:208"] = {
		["pets"] = {
			"BattlePet-0-000012B01E39", -- [1]
			"BattlePet-0-000012B5CB68", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/6512\n\nStrategy added by Runisco\nI do NOT have the skill to write a TD script for this. If someone is able to, PLEASE share :)\n\nUpdate 21st of August 2019 - Added a TD script that worked for me, one time. Let's see if it's good.\n\nVs  Nairn\nTurn 1: Curse of Doom\nTurn 2->: Shadow Shock till Nairn dies\nStormoen comes in\nTurn 1: Lovestruck\nTurn 2: Curse of Doom  This should hit Summer\nSummer comes in\nTurn 1: Bring in your Third Pet\nTurn 2: Bring in your Ashstone Core\nTurn 3: Crystal Prison\nTurn 4: Stoneskin\nStormoen comes in\nTurn 1: Burn till Stormoen Dies\nSummer comes in\nTurn 1: Stoneskin\nTurn 2: Pass\nTurn 3: Crystal Prison\nTurn 4: Burn\nTurn 5: Burn\nBring in your Sister of Temptation\nTurn 1: Pass\nTurn 2: Shadow Shock\nTurn 3: Lovestruck\nTurn 4: Shadow Shock\n",
		["name"] = "Shademaster Kiryn",
		["tags"] = {
			"111C1IS", -- [1]
			"221913U", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:208",
		["groupID"] = "group:11",
		["targets"] = {
			71930, -- [1]
		},
	},
	["team:134"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012BA1A7F", -- [2]
			"random:0", -- [3]
		},
		["name"] = "Burning Pandaren Spirit",
		["tags"] = {
			"1116143", -- [1]
			"11261CI", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:134",
		["groupID"] = "group:11",
		["targets"] = {
			68463, -- [1]
		},
	},
	["team:212"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/392\n\nScript thanks to aidos & Vanfreyr\n\nTurn 1: Stoneskin\nTurn 2: Crush\nTurn 3: Crush\nTurn 4: Crush\nTurn 5: Crush\nTurn 6: Stoneskin\nTurns 7+: Crush until Chirrup is dead\nStormlash comes in\nTurn 1: Deflection\nTurns 2+: Refresh Stoneskin when it has only 1 turn left, otherwise use Crush until Stormlash is dead\nWhiskers comes in\nTurn 1: Stoneskin\nTurn 2: Deflection\nTurns 3+: Crush until Anubisath Idol dies\nBring in your Teroclaw Hatchling\nFollow this Priority list:\n\nPrio 1: Dodge when Whiskers is underground\nPrio 2: Alpha Strike\n",
		["name"] = "Aki the Chosen",
		["tags"] = {
			"1216143", -- [1]
			"21271C8", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:212",
		["targets"] = {
			66741, -- [1]
		},
		["groupID"] = "group:11",
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
			0, -- [2]
			"BattlePet-0-000012B90271", -- [3]
		},
		["notes"] = "Strategy added by Nipsy\nThis Strategy can still fail when you are very unlucky with crits. If you want to level a flying pet, it should be level 19+\n\nTurn 1: use Whirlpool\nTurn 2: use Dive\nTurn 3: use Water Jet\nenemy Azerite Slime dies\nTurn 1: use Whirlpool\nTurn 2+: use Water Jet until your Pandaren Water Spirit dies\nbring in your Level Pet\nbring in your Rapana Whelk\nPriority 1: use Shell Shield when the duration is at 1\nPriority 2: use Dive when available\nPriority 3: use Absorb\n",
		["name"] = "Rogue Azerite",
		["tags"] = {
			"1219R4", -- [1]
			"ZL", -- [2]
			"221CN7", -- [3]
		},
		["teamID"] = "team:110",
		["preferences"] = {
			["minXP"] = 12,
		},
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
	["team:385"] = {
		["pets"] = {
			"BattlePet-0-000008A86E8A", -- [1]
			"BattlePet-0-00000839A881", -- [2]
			"BattlePet-0-000012B399CF", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/644\n\nScript thanks to Zaphod\n\nTurn 1: Immolation\nTurn 2: Pass - your Fel Pup is swapped in\nTurn 3: Crouch\nTurns 4+: Diseased Bite until Trixy dies\nGlobs comes in\nTurns 1+: Diseased Bite until Fel Pup dies\nBring back your Cinder Pup\nTurns 1+: Flame Breath until Globs is dead\nNightmare Sprout comes in\nTurn 1: Swap to your Summit Kid\nTurn 2: Chew\nTurns 3-5: Stampede\nTurns 6+: Comeback\n",
		["name"] = "Dealing with Satyrs (Beast)",
		["tags"] = {
			"21141JU", -- [1]
			"21151JS", -- [2]
			"2125L7", -- [3]
		},
		["teamID"] = "team:385",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
		},
	},
	["team:333"] = {
		["pets"] = {
			"BattlePet-0-000012B01EEF", -- [1]
			"BattlePet-0-000012B146C7", -- [2]
			"BattlePet-0-000012B675D0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8108\n\nStrategy added by CoJo\nThis strategy was made by Wulfeagle over on WoWHead.\n\n 100% success rate after several attempts to be sure it was worthy of posting.  \n\nI didn't have some of the pets used in other undead strategies but this one was very easy to do.\n\nTurn 1: BONESTORM\nTurn 2: Ancient Blessing\nTurn 3: Claw\nTurn 4: Claw\nTurn 5: BONESTORM\nTurn 6: Ancient Blessing\nTurn 7: Claw\nTurn 8: Pass\nTurn 9: BONESTORM\nTurn 10: Ancient Blessing\nTurn 11: Claw\nTurn 12: Claw\nTurn 13: BONESTORM\nBring in your Boneshard\nTurn 1: BONESTORM\nTurn 2: BONESTORM\nTurn 3: BONESTORM\nTurn 4: Pass\nBring in your Scourged Whelpling\nTurn 1+: Dreadful Breath to clean up.\n\n",
		["name"] = "Jarrun's Ladder (Undead)",
		["tags"] = {
			"11288A", -- [1]
			"22231TB", -- [2]
			"0028GQ", -- [3]
		},
		["teamID"] = "team:333",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
	},
	["team:394"] = {
		["pets"] = {
			"BattlePet-0-000012B0D350", -- [1]
			"BattlePet-0-000012B66C49", -- [2]
			"BattlePet-0-000012C633E8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/856\n\nStrategy added by Aranesh\nScript thanks to Zaphod\n\nTurns 1+2: Dive\nTurn 3: Thunderbolt\nTurn 4: Jolt\nTurn 5: Pass\nTurn 6: Jolt\nTurns 7+8: Dive - Breezy Book dies\nHelpful Spirit comes in\nTurn 1: Jolt\nTurn 2: Thunderbolt\nTurn 3: Jolt\nTurn 4: Pass\nTurns 5+6: Dive\nTurn 7: Jolt\nTurn 8: Thunderbolt - Helpful Spirit dies\nDelicate Moth comes in\nTurn 1: Jolt - your Spawn of G'nathus dies\nBring in your next pet\nTurns 1+: From here on just use Surge. Depending on how well Spawn of G'nathus did, you might not even need the third pet.\n",
		["name"] = "Training with the Nightwatchers (Aquatic)",
		["tags"] = {
			"211A15H", -- [1]
			"2004NA", -- [2]
			"2006CH", -- [3]
		},
		["teamID"] = "team:394",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
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
		["targets"] = {
			116795, -- [1]
		},
		["groupID"] = "group:7",
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
	["team:391"] = {
		["pets"] = {
			"BattlePet-0-000012D0B39C", -- [1]
			"BattlePet-0-000012B01ECA", -- [2]
			"BattlePet-0-000012B99CB5", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/847\n\nScript thanks to wist\n\nTurn 1: Sandstorm\nTurn 2: Pass - your Lesser Voidcaller is swapped in\nTurns 3+: Shadow Shock until Trixy dies\nGlobs comes in\nTurn 1: Curse of Doom\nTurns 2+: Shadow Shock until Lesser Voidcaller dies\nBring back your Enchanted Broom\nTurn 1: Wind-Up\nTurn 2: Wind-Up\nTurn 3: Batter until Globs is dead\nNightmare Sprout comes in\nTurns 1+: Batter until Enchanted Broom dies\nBring in your Netherspawn, Spawn of Netherspawn\nTurn 1: Creeping Ooze\nTurn 2: Expunge\nTurns 3+: Creeping Ooze until Nightmare Sprout is dead\n",
		["name"] = "Dealing with Satyrs (Magic)",
		["tags"] = {
			"21256L", -- [1]
			"101616I", -- [2]
			"02271FK", -- [3]
		},
		["teamID"] = "team:391",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
		},
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
		["targets"] = {
			200679, -- [1]
		},
		["groupID"] = "group:none",
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
	["team:120"] = {
		["pets"] = {
			"BattlePet-0-000012B67C89", -- [1]
			"BattlePet-0-000012BCCE52", -- [2]
			"BattlePet-0-000012C3D996", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3605\n\nStrategy added by DragonsAfterDark\n13 January 24:\n\n1. Updated the Hermit Crab's moves to help it last longer.\n2. Updated instructions for which pet to bring in versus the different backline pets.\n3. Script has been updated accordingly - and again. Was missing a few lines ^^'\n\nTurn 1: Pinch\nTurn 2: Pinch\nTurns 3-4: Dive\nTurn 5+: Pinch until Living Sludge is dead\n\nRandom Enemy Pet Comes In\n\nNote 1:: There are a few different pets that will come in with Living Sludge, so the turn orders won't be exact.\n\nNote 2:: Keep in mind, if you can't see the enemy attacks with an addon, Automated Drilling Machine's ability, Smoke Cloud, is on a 4 round CD, so you may need to adjust your pet's attacks\n\nNote 3:: Pass during the Undead / Dodge Rounds\n\nTurn 1: Shell Armor - Unless the enemy is the Cockroach, then Pinch\nTurn 2: Pinch\nTurn 3: Pinch - Unless the enemy is the Cockroach, then Shell Armor\nNot Cockroach:\nTurns 4-5: Dive\nTurn 6+: Pinch until dead\nCockroach:\nTurn 4: Pinch\nTurn 5: Pinch\nTurns 6-7: Dive\nTurn 8+: Pinch until dead\n\n~: If the active enemy is Mech/Undead, bring in the Autumnal Sproutling, if it's a Cockroach then go to the Blazing Cindercrawler\n\nBring in your Autumnal Sproutling\nPriority 1: Use Leech Seed on CD\nPriority 2: Use Fist of the Forest on CD\nPriority 3: Lash as filler\nBring in your Blazing Cindercrawler\nPriority 1: Cauterize as needed\nIf: Mech/Undead pet is up: Burn+\nIf : Critter is up: Brittle Webbing +\n",
		["name"] = "Living Sludge",
		["tags"] = {
			"11152AV", -- [1]
			"12291CL", -- [2]
			"11241FD", -- [3]
		},
		["teamID"] = "team:120",
		["targets"] = {
			146182, -- [1]
		},
		["groupID"] = "group:6",
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
	["team:424"] = {
		["pets"] = {
			"BattlePet-0-000012B0D350", -- [1]
			"BattlePet-0-000012B66C49", -- [2]
			"random:9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/501\n\nScript thanks to Sunshine\n\nTurn 1: Paralyzing Shock\nTurn 2: Swallow You Whole\nTurns 3+4: Dive\nTurns 5+: Swallow You Whole until Itchy is dead\nSalty Bird comes in\nTurn 1: Paralyzing Shock\nTurns 2+3: Dive\nTurns 4+: Swallow You Whole until Spawn of G'nathus is dead\nBring in your Emperor Crab\nTurn 1: Shell Shield\nTurns 2+: Surge until the Salty Bird is dead\nGrommet comes in\nTurn 1: Healing Wave\nTurn 2: Shell Shield\nThen:\nPriority 1: Healing Wave on CD as long as you have at least 2 duration on Shell Shield\nPriority 2: Refresh Shell Shield when it has 1 turn left \nPriority 3: Surge\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Aquatic)",
		["tags"] = {
			"112A15H", -- [1]
			"2214NA", -- [2]
			"ZR9", -- [3]
		},
		["teamID"] = "team:424",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:417"] = {
		["pets"] = {
			"BattlePet-0-000012B4861E", -- [1]
			"BattlePet-0-000012B48707", -- [2]
			"BattlePet-0-000012B146CC", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/780\n\nScript thanks to Malhado\n\nTurn 1: Moonfire\nTurn 2: Arcane Blast (hits Coach)\nTurn 3: Evanescence\nTurn 4: Arcane Blast\nTurn 5: Arcane Blast - Coach dies\nSir Murkeston comes back in\nTurn 1: Pass - your Nether Faerie Dragon dies\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm (hits Greatest Foe)\nTurns 2-4: Mana Surge - Greatest Foe dies\nSir Murkeston comes in once more\nTurns 1+: Tail Sweep until your Nexus Whelpling dies (mostly after the first one already)\nBring in Chrominius\nTurns 1+: If Sir Murkeston has more than 740 life left: Howl + Surge of Power\nOtherwise directly Surge of Power\n",
		["name"] = "Fight Night: Sir Galveston (Dragon)",
		["tags"] = {
			"2115HD", -- [1]
			"122814D", -- [2]
			"0126140", -- [3]
		},
		["teamID"] = "team:417",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
		},
	},
	["team:347"] = {
		["pets"] = {
			"BattlePet-0-000006E4C782", -- [1]
			"BattlePet-0-00001256BF3F", -- [2]
			"BattlePet-0-000012B4874E", -- [3]
		},
		["notes"] = "Strategy added by unknown\nUpdated with new pet order and speed restriction for pet #2.\n\nTurn 1: Bite\nTurn 2: Howl\nTurns 3-5: Surge of Power\nEgcellent comes in\nTurn 1+: Pass until you die\nBring in your Lubbins\nTurns 1+: Breath until Egcellent drops below 797 health points.\nThen:: Ancient Blessing\nRed Wire comes in\nTurns 1+2: Proto-Strike\nTurns 3+: Breath until Red Wire is below 300 health, or your Lubbins dies\nThen:: Ancient Blessing\nEgcellent comes back in\nTurns 1+: Breath until Emerald Proto-Whelp dies\nBring in your Nexus Whelpling\nPriority 1: If Red Wire is below 300hp / in Mech round use Tail Sweep\nPriority 2: If you have your Dragonkin buff & Egcellent has < 610 hp use Tail Sweep\nPriority 3: Arcane Storm > Mana Surge\n",
		["name"] = "Tiny Poacher, Tiny Animals (Dragon)",
		["tags"] = {
			"1126140", -- [1]
			"221C37K", -- [2]
			"122414D", -- [3]
		},
		["teamID"] = "team:347",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
		},
	},
	["team:294"] = {
		["pets"] = {
			"BattlePet-0-000012C4A520", -- [1]
			"BattlePet-0-000012D92DE5", -- [2]
			"BattlePet-0-000012C3D8DA", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3894\n\nStrategy added by Berendain\nUpdate:  still works in 9.0\n\nI tested the opening turns eighteen times before Gusteu stunned my Inland Croaker on turn 2, so that I could test what to do if he does.\n\nTurn 1: Ice Tomb\nTurn 2: Frost Nova\n(If you get stunned before you're able to use Frost Nova, skip ahead to Remy coming in and swap to your Mongoose.)\nTurn 3: Ice Lance until Gusteau dies\nRemy comes in\nTurn 1: Swap to your Mongoose\nIs your second pet faster than Remy?\nIF YES: Gnaw until Remy dies\nIF NO: Screech, then Gnaw until Remy dies  \n(If Gusteau comes back in now, swap back to your Inland Croaker and resume instructions from the top.)\nDinner comes in\nTurn 1: Swap to your Elusive Skimmer\nTurn 1: Whirlpool\nTurn 2: Stampede\nTurn 3: Water Jet until Dinner dies\n",
		["name"] = "Chopped (Aquatic)",
		["tags"] = {
			"22172AE", -- [1]
			"2105N1", -- [2]
			"221C2AL", -- [3]
		},
		["teamID"] = "team:294",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
		},
	},
	["team:386"] = {
		["pets"] = {
			"BattlePet-0-000012BF63D8", -- [1]
			"BattlePet-0-000012C4AA56", -- [2]
			"random:5", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/514\n\nTurns 1+2: Dive\nTurns 3+: Use Dive on cooldown and otherwise Absorb until Trixy is dead\nGlobs comes in\nTurn 1: Swap to your Rabbit\nTurn 2: Dodge\nTurn 3: Flurry\nTurn 4: Flurry\nTurns 5+6: Burrow\nTurn 7: Dodge\nTurn 8: Flurry\nTurn 9: Flurry - Globs dies\nNightmare Sprout comes in\nTurns 1+: Flurry until your Rabbit dies\nBring back your snail\nTurn 1: Shell Shield\nTurn 2: Absorb\nTurn 3: Absorb\nTurns 4+5: Dive\n\nIf the Nightmare Sprout is not dead, yet, keep Shell Shield active and use Dive or Absorb when ready.\n",
		["name"] = "Dealing with Satyrs (Critter)",
		["tags"] = {
			"2219HO", -- [1]
			"221BMP", -- [2]
			"ZR5", -- [3]
		},
		["teamID"] = "team:386",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
		},
	},
	["team:383"] = {
		["pets"] = {
			"BattlePet-0-000006E4C79F", -- [1]
			"BattlePet-0-000012B675D0", -- [2]
			"random:4", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10906\n\nStrategy added by Berendain\nTurn 1: If your Blightbreath is faster than Sunny, use Toxic Smoke first\nTurn 2: Acid Rain\nTurns 3-5: Dreadful Breath\nTurn 6+: Continue using Acid Rain and Dreadful Breath until your Blightbreath dies\nBring in your Scourged Whelpling\nTurns 1-3: Dreadful Breath if Roots or Beaky are still alive on the backline\nTurn 4: Call Darkness when Sunny is the last pet alive\n",
		["name"] = "Training with Durian (Undead)",
		["tags"] = {
			"12171TD", -- [1]
			"0128GQ", -- [2]
			"ZR4", -- [3]
		},
		["teamID"] = "team:383",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
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
		["targets"] = {
			154927, -- [1]
		},
		["groupID"] = "group:none",
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
	["team:53"] = {
		["pets"] = {
			"BattlePet-0-000012C56AF4", -- [1]
			"BattlePet-0-000012B5CE8E", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/352\n\nTurn 1: Ice Tomb\nTurn 2: Ice Barrier\nTurn 3: Pass\nTurn 4: Pounce - Monte comes in\nTurn 5: Pounce\nTurn 6: Swap to your Elekk Plushie - it will take the damage from Burrow\nTurn 7: Pass\nTurn 8: Pass\nTurn 9: Itchin' for a Stitchin'\nTurn 10: Pounce\nTurn 11: Pounce - Monte dies\nSocks comes back in<\nTurn 1: Ice Tomb\nTurn 2: Ice Barrier - Mr. Bigglesworth dies\nBring in your Firewing\nTurn 1: Pass - Socks gets stunned\nTurn 2: Sunlight - Sully swaps to Rikki\nTurn 3: Healing Flame\nTurns 4+: Alpha Strike until Rikki dies\nSocks comes in one last time\nTurn 1: Healing Flame\nTurn 2: Sunlight\nTurns 3+: Alpha Strike and Healing Flame on cooldown until Socks is dead\n",
		["name"] = "Sully \"The Pickle\" McLeary",
		["tags"] = {
			"211513P", -- [1]
			"121B1G9", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:53",
		["targets"] = {
			71929, -- [1]
		},
		["groupID"] = "group:11",
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
	["team:282"] = {
		["pets"] = {
			"BattlePet-0-000012B146CA", -- [1]
			"BattlePet-0-000012BA1A7F", -- [2]
			"BattlePet-0-000012B66C49", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1670\n\nStrategy added by sistercoyote\nAnother where I'm not sure about the origin of the strat. Probably Wowhead.\n\nThis strat can also be used to level pets >L7 instead of the Plushie with noted mod.\n\nAny time your pet gets stunned just pass and keep to the sequence and you'll be fine.\n\nScript thanks to Oakwarden\n\nBring in your Lil' Bling\nTurn 1: Extra Plating\nTurn 2: Make it Rain\nTurn 3+: SMCKTHAT.EXE until Grizzle dies\nBeakmaster X-225 comes in\nTurn 1: Extra Plating\nTurn 2: Make it Rain\nTurn 3+: SMCKTHAT.EXE until Lil' Bling dies.\nIf leveling instead of Plushie, bring in your Level Pet\nBring in your Emperor Crab\nBloom comes in\nTurn 1: Shell Shield\nTurn 2: Surge until Bloom dies\n\n",
		["name"] = "Major Payne",
		["tags"] = {
			"1215198", -- [1]
			"00061CI", -- [2]
			"2114NA", -- [3]
		},
		["teamID"] = "team:282",
		["groupID"] = "group:11",
		["targets"] = {
			66675, -- [1]
		},
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
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B3E786", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Shenk\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Chitterspine Skitterling\nTurn 1: Black Claw\nTurn 2-4: Swarm\n",
		["name"] = "Char",
		["tags"] = {
			"021316M", -- [1]
			"022B2IO", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:14",
		["groupID"] = "group:5",
		["targets"] = {
			161662, -- [1]
		},
	},
	["team:331"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"BattlePet-0-000012B81435", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9105\n\nStrategy added by DragonsAfterDark\nI'm sure once Anomalus gets the nerf it needs, this won't work quite as well, but you might as well use it before you lose it. :D\n\nTwo years, still no nerf - hah! xD\n\nTurn 1: Poison Protocol\nTurn 2: Void Nova\nTurn 3: Swap to your Anomalus that isn't in\n^: Repeat until all the pets are dead. Pass for Mist Wraith's undead round. Clean up with third pet as needed.\n",
		["name"] = "Jarrun's Ladder (Magic)",
		["tags"] = {
			"22142OQ", -- [1]
			"22142OQ", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:331",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
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
	["team:362"] = {
		["pets"] = {
			"BattlePet-0-000012B01ED3", -- [1]
			"BattlePet-0-000012B146D0", -- [2]
			"random:10", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2922\n\nStrategy added by TURBOKillex\nFrom Jangeoffry's comment. Prefer a PP Starlette in the first slot.\n\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up\nSlow Moe comes in\nTurn 1: Powerball\nTurn 2: Wind-Up\nTurn 3: Supercharge\nTurn 4: Wind-Up\nSnot comes in\nTurn 1: Wind-Up\nTurn 2: Powerball\nTurn 3: Supercharge\nTurn 4: Wind-Up\n",
		["name"] = "Snail Fight! (Mech)",
		["tags"] = {
			"11171BB", -- [1]
			"11181BB", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:362",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
		["preferences"] = {
			["minXP"] = 20,
		},
	},
	["team:314"] = {
		["pets"] = {
			"BattlePet-0-000012C2DA6C", -- [1]
			"BattlePet-0-000012C56B66", -- [2]
			"random:9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/16110\n\nStrategy added by Connxo\n100% Success rate I've tried it 4 times not even close to failing never had to use a third aquatic pet. Y'all are welcome.\n\nScript thanks to Alayea\n\nTurn 1: Expunge\nTurn 2: Phase Shift\nTurn 3: Ooze Touch\nTurn 4: Ooze Touch\nTurn 5: Expunge\nBeauty Dies. Conviction comes in\nTurn 6: Ooze Touch\nTurn 7: Phase Shift it is okay if your pet dies here :)\nTurn 8: Ooze Touch if your Slimy Otter died bring in Magical Crawdad and use Wish\nPriority 1: Wish on CD.\nPriority 2: Renewing Mists at 1 round left on previous Renewing Mist buff.\nPriority 3: Snap as filler. GG\n",
		["name"] = "The Master of Pets (Aquatic)",
		["tags"] = {
			"11272M5", -- [1]
			"112644", -- [2]
			"ZR9", -- [3]
		},
		["teamID"] = "team:314",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
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
	["team:276"] = {
		["pets"] = {
			"BattlePet-0-000012B48707", -- [1]
			0, -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1666\n\nStrategy added by sistercoyote\nBased on Jackobs' (http://www.wowhead.com/npc=66466/stone-cold-trixxy#comments) Nexus Whelpling strat from Wowhead. She makes an absolute mess of this trio of pets.\n\nIf Tinygos uses Surge of Power before Round 3, there is a slender chance Nexus Whelpling may die, so another Dragonkin with Magic abilities (e.g., Emerald Proto-Whelp) can also be useful for backup (replace Elekk or Leveling Pet depending on what you're doing). Normally, though, Nexus Whelpling is sufficient.\n\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm\nTurn 2: Frost Breath\nTurn 3+: Frost Breath until Tinygos does Surge of Power\nIf you're leveling as well as Adventuring, make sure you don't kill Tinygos before his Surge of Power\nBring in your Level Pet\nBring in your Nexus Whelpling\nTurn 1: Mana Surge\nTurn 7: Clean up with Frost Breath if there's anything left\n",
		["name"] = "Stone Cold Trixxy",
		["tags"] = {
			"222814D", -- [1]
			"ZL", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:276",
		["groupID"] = "group:11",
		["targets"] = {
			66466, -- [1]
		},
		["preferences"] = {
			["minXP"] = 5,
		},
	},
	["team:408"] = {
		["pets"] = {
			"BattlePet-0-000012BEE3D5", -- [1]
			"BattlePet-0-000012B485C2", -- [2]
			"random:7", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/604\n\nScript thanks to Wist\n\nTurn 1: Rip\nTurn 2: Lightning Shield\nTurn 3: Blood in the Water - both active pets die\nBring in your Pandaren Water Spirit - Rocket comes in\nTurns 1+: Water Jet until Rocket is dead\nMarshmallow comes in\nTurn 1: Geyser\nTurns 2+: Water Jet until your Water Spirit dies\nBring in your third Elemental\nTurns 1+: Use standard attacks to kill Marshmallow, he should be almost dead anyway.\n",
		["name"] = "Fight Night: Tiffany Nelson (Elemental)",
		["tags"] = {
			"122314R", -- [1]
			"1129R4", -- [2]
			"ZR7", -- [3]
		},
		["teamID"] = "team:408",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
	["team:303"] = {
		["pets"] = {
			"BattlePet-0-000012B01EED", -- [1]
			"BattlePet-0-000012B01EEF", -- [2]
			"BattlePet-0-000012B675D0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3904\n\nStrategy added by Aravaslac#1688\nStrategy based on a comment from Felina with an adjustment by  Nolapete#1326 here (http://www.wow-petguide.com/index.php?Strategy=853). This fight is very RNG dependent due to the stuns, so good luck!\n\nScript thanks to isthevao\n\nTurns 1+: Seethe until Gusteau dies\nRemy comes in. From this point on, it's OK if your Fragment of Anger dies\nTurns 1+: Soulrush and Spiritfire Beam on CD, otherwise Seethe until your Fragment of Anger dies\nBring in your Fossilized Hatchling\nTurns 1+: If you feel Remy is about to use Survival, Ancient Blessing and BONESTORM. Otherwise, Claw until Remy dies\nDinner comes in\nTurn 1: Claw until Fossilized Hatchling dies\nBring in your Scourged Whelpling\nTurn 1: Call Darkness\nTurn 2+: Tail Sweep\n",
		["name"] = "Chopped (Undead)",
		["tags"] = {
			"21171IP", -- [1]
			"11288A", -- [2]
			"2108GQ", -- [3]
		},
		["teamID"] = "team:303",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
		},
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
		["targets"] = {
			116787, -- [1]
		},
		["groupID"] = "group:7",
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
		["targets"] = {
			119342, -- [1]
		},
		["groupID"] = "group:4",
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
	["team:415"] = {
		["pets"] = {
			"BattlePet-0-000012B528FE", -- [1]
			"BattlePet-0-000012C222D9", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/782\n\nScript thanks to Lochru\n\nTurn 1: Prowl\nTurn 2: Moonfire - Coach dies\nSir Murkeston comes back in\nTurns 1+: Spirit Claws until Xu-Fu dies (-.-)\nBring in your Feline Familiar - Greatest Foe should be in at this point\nTurn 1: Prowl\nTurn 2: Call Darkness - Greatest Foe dies\nSir Murkeston comes back in\nTurns 1+: Pounce until Sir Murkeston is dead\n",
		["name"] = "Fight Night: Sir Galveston (Beast)",
		["tags"] = {
			"122417I", -- [1]
			"222A9V", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:415",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:364"] = {
		["pets"] = {
			"BattlePet-0-000012B66C49", -- [1]
			"BattlePet-0-000012C56B66", -- [2]
			"BattlePet-0-000012B0D350", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4823\n\nStrategy added by Rellyk\nPutting Vert's strategy from the comments up cause it was the only one that worked for me.\n\nScript thanks to Sunshine\n\nEmperor Crab Priority List:\nPriority 1: Keep Shell Shield up\nPriority 2: Healing Wave on CD\nPriority 3: Snap\n\nMagical Crawdad Priority List:\nPriority 1: Use Wish after Quillino uses his blinding ability and then on CD.\nPriority 2: Keep Renewing Mists up\nPriority 3: Snap\n\nSpawn of G'nathus Priority List:\nTurn 1: Lightning Shield\nTurn 2: Paralyzing Shock\nTurn 3: Swallow You Whole until Fethyr dies\n",
		["name"] = "Training with Bredda (Aquatic)",
		["tags"] = {
			"1214NA", -- [1]
			"112644", -- [2]
			"122A15H", -- [3]
		},
		["teamID"] = "team:364",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
	},
	["team:365"] = {
		["pets"] = {
			"BattlePet-0-000012B399CF", -- [1]
			"BattlePet-0-000008A86E8A", -- [2]
			"BattlePet-0-000012C222D9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/601\n\nScript thanks to Zaphod\n\nTurn 1: Chew\nTurns 2-4: Stampede - Lil’ Spirit Guide dies along with your Summit Kid\nBring in your Cinder Pup\nTurn 1: Crouch\nTurns 2+: Flame Breath until Quillino is dead\nFethyr comes in\nTurn 1: Crouch\nTurns 2+: Flame Breath until your Pup dies\nBring in your Feline Familiar\nTurn 1: Stoneskin\nTurn 2: Prowl\nTurns 3+: Onyx Bite until Fethyr is dead\n",
		["name"] = "Training with Bredda (Beast)",
		["tags"] = {
			"2025L7", -- [1]
			"22041JU", -- [2]
			"112A9V", -- [3]
		},
		["teamID"] = "team:365",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
	},
	["team:361"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"BattlePet-0-000006E4C796", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9541\n\nStrategy added by Naina\nScript thanks to Rinoe\n\nTurn 1: Void Nova\nTurn 2: Poison Protocol\nTurn 3: Ooze Touch\nTurn 4: Ooze Touch\nTurn 5: Void Nova\nTurn 6: Ooze Touch\nTurn 7: Ooze Touch\nTurn 8: Poison Protocol\nTurn 9: Void Nova\nTurn 10: Ooze Touch\nBring in your Sanctum Cub\nTurn 11+: Pounce should finish off all three remaing snails",
		["name"] = "Snail Fight! (Magic)",
		["tags"] = {
			"12142OQ", -- [1]
			"12171T6", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:361",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:360"] = {
		["pets"] = {
			"BattlePet-0-000012B5C607", -- [1]
			"BattlePet-0-000012B6763C", -- [2]
			"random:1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/497\n\nTurn 1: Thrash\nTurn 2: Pass\nTurn 3: Pass\nTurn 4: Mangle\nTurns 5-7: Rampage - Rocklick dies\nSlow Moe comes in\nTurn 1: Mangle\nTurn 2: Thrash\nTurn 3: Thrash (or pass if you got stunned)\nTurns 4+: Rampage - your Runt dies\nBring in your Flayer Youngling\nTurns 1+: Rampage - Slow Moe dies\nSnot comes in\nTurn 1: Rampage continues or Triple Snap\nTurn 2: Rampage continues or Triple Snap\nTurn 3: Deflection\nTurns 4+: Triple Snap until Snot is dead",
		["name"] = "Snail Fight! (Humanoid)",
		["tags"] = {
			"111814E", -- [1]
			"2227G2", -- [2]
			"ZR1", -- [3]
		},
		["teamID"] = "team:360",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
		["targets"] = {
			154912, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:146"] = {
		["pets"] = {
			"BattlePet-0-000012C3D996", -- [1]
			"BattlePet-0-000012B99C8C", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by DragonsAfterDark\nTurn 1: Brittle Webbing\nTurn 2: Burn\nTurn 3: Cauterize\nTurn 4: Brittle Webbing\nTurn 5: Burn\nTurn 6: Brittle Webbing\nTurn 7: Cauterize\nTurn 8+: Burn\nBring in your Giggling Flame\nTurn 1: Conflagrate\nTurn 2: Flame Jet\nTurn 3+: Burn\n",
		["name"] = "Shred",
		["tags"] = {
			"11241FD", -- [1]
			"11242D2", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:146",
		["targets"] = {
			161658, -- [1]
		},
		["groupID"] = "group:5",
		["preferences"] = {
			["minXP"] = 25,
		},
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
		["targets"] = {
			161649, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:358"] = {
		["pets"] = {
			"BattlePet-0-000006E4C780", -- [1]
			"BattlePet-0-000012B96E94", -- [2]
			"random:7", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7036\n\nStrategy added by Beornwulf#2324\nScript thanks to wist\n\nPriority 1: Howl when Burrow is about to come off cooldown\nPriority 2: Burrow\nPriority 3: Thrash\nBring in your Stout Alemental\nPriority 1: Bubble if Snot is underwater\nPriority 2: Barrel Toss",
		["name"] = "Snail Fight! (Elemental)",
		["tags"] = {
			"21277K", -- [1]
			"20241FE", -- [2]
			"ZR7", -- [3]
		},
		["teamID"] = "team:358",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:153"] = {
		["pets"] = {
			"BattlePet-0-000012BF63D8", -- [1]
			"BattlePet-0-000012B58B24", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/443\n\nScript thanks to aidos\n\nTurns 1+2: Dive\nTurn 3: Acidic Goo\nTurns 4+: Ooze Touch until Pandaren Earth Spirit dies.\nSludgy comes in\nTurn 1: Acidic Goo\nTurns 2+: Ooze Touch until your Snail dies.\nBring in your Darkmoon Zeppelin\nTurns 1+: Missile until Sludgy dies\nDarnak comes in\nTurn 1: Missile\nTurn 2: Decoy\nTurns 3+: Missile until Darnak is below 618 health\nThen:: Explode\n",
		["name"] = "Thundering Pandaren Spirit",
		["tags"] = {
			"1119HO", -- [1]
			"122CAJ", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:153",
		["groupID"] = "group:11",
		["targets"] = {
			68465, -- [1]
		},
	},
	["team:313"] = {
		["pets"] = {
			"BattlePet-0-000012B5CB63", -- [1]
			"BattlePet-0-000012B67566", -- [2]
			"BattlePet-0-000012C22319", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15921\n\nStrategy added by DragonsAfterDark\nTurn 1: Curse of Doom\nTurn 2: Fade\nYour Infected Squirrel swaps in\nTurn 3: Rabid Strike\nTurn 4: Corpse Explosion\nBring in your Macabre Marionette\nTurns 5-6: Dead Man's Party\n",
		["name"] = "Flummoxed (Undead)",
		["tags"] = {
			"02242GK", -- [1]
			"012AJJ", -- [2]
			"20171A7", -- [3]
		},
		["teamID"] = "team:313",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
	},
	["team:23"] = {
		["pets"] = {
			"BattlePet-0-000012B67566", -- [1]
			"BattlePet-0-000012B6764A", -- [2]
			"BattlePet-0-000012B67A9C", -- [3]
		},
		["notes"] = "Strategy added by Aranesh\nTurn 1: Black Claw\nTurns 2+3: Hunting Party\nTurn 4: Leap until Growing Ectoplasm is dead\nAn enemy pet comes in\nTurns 1+: Black Claw and Hunting Party until your Zandalari Anklerender dies\nBring in your Emerald Proto-Whelp\nTurn 1: Emerald Presence\nTurns 2+: Keep Emerald Presence active, use Emerald Dream when you drop below 1000 health and use Emerald Bite to finish the enemy pets.\n",
		["name"] = "Growing Ectoplasm 2",
		["tags"] = {
			"222AJJ", -- [1]
			"22271BR", -- [2]
			"11163BP", -- [3]
		},
		["teamID"] = "team:23",
		["targets"] = {
			116794, -- [1]
		},
		["groupID"] = "group:7",
	},
	["team:113"] = {
		["pets"] = {
			"BattlePet-0-000012C60028", -- [1]
			"BattlePet-0-000012B99C98", -- [2]
			"BattlePet-0-000012B608F8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4203\n\nStrategy added by Trog\nhttps://www.youtube.com/watch?v=eij4P0pAIb8&t=1787s\n\nTurn 1: Celestial Blessing\nTurn 2: Fire Shield\nTurn 3: Volcano\nTurn 4: Flamethrower, repeat until dead\nTurn 5: Swap to your Fel Flame (enemy is likely dead by now)\nTurn 6: Immolate\nTurn 7: Conflagrate\nTurn 8: Burn\n",
		["name"] = "Pulverizer Bot Mk 6001",
		["tags"] = {
			"020818O", -- [1]
			"12141T3", -- [2]
			"1116G7", -- [3]
		},
		["teamID"] = "team:113",
		["targets"] = {
			145988, -- [1]
		},
		["groupID"] = "group:6",
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
	["team:351"] = {
		["pets"] = {
			"BattlePet-0-000012D0B39C", -- [1]
			"BattlePet-0-000012B17368", -- [2]
			"BattlePet-0-000007C1D04D", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14194\n\nStrategy added by Phoenixen#1410\nMaking strats and taking names. One shot for me, but RNG likely.\n\nScript thanks to Malhado\n\nTurn 1: Enchanted Broom - Wind-Up\nTurn 2: Sandstorm\nTurn 3: Wind-Up\nTurn 4: Batter til Gulp dies\nTurn 5: Wind-Up\nTurn 6: Wind-Up, Enchanted Broom dies\nTurn 7: Anomalus - Poison Protocol\nTurn 8: Corrosion - Egcellent feigns, Red Wire comes out\nToxic Fumes\nCorrosion, Anomalus dies\nAbyssius - Flamethrower, Red Wire dies and Egcellent comes in\nI used Immolation, but Flamethrower might be better here.\nMeteor Strike\nEgcellent Should die here, but if not, spam Flamethrower til it dies\n",
		["name"] = "Tiny Poacher, Tiny Animals (Magic)",
		["tags"] = {
			"21256L", -- [1]
			"21142OQ", -- [2]
			"11241IO", -- [3]
		},
		["teamID"] = "team:351",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
		},
	},
	["team:350"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012B5C607", -- [2]
			"random:1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/579\n\nTurn 1: Deflection\nTurn 2: Sandstorm\nTurn 3: Crush\nTurn 4: Crush\nTurn 5: Crush\nTurn 6: Deflection\nTurns 7+: Crush until Gulp is dead\nEgcellent comes in\nTurn 1: Sandstorm\nTurns 2+: Crush until Egcellent feigns death\nRed Wire comes in\nTurn 1: Deflection\nTurns 2+: Crush until your Idol dies\nBring in your Kun-Lai Runt\nTurn 1: Frost Shock\nTurn 2: Deep Freeze\nTurn 3: Frost Shock - Egcellent comes back and is hit by this\nTurns 4+: Thrash until Egcellent is dead (or feigns death again)\nRed Wire comes back in\nTurn 1: Frost Shock\nTurn 2: Deep Freeze\nTurns 3+: Thrash if necessary until you're done\n",
		["name"] = "Tiny Poacher, Tiny Animals (Humanoid)",
		["tags"] = {
			"1116143", -- [1]
			"122814E", -- [2]
			"ZR1", -- [3]
		},
		["teamID"] = "team:350",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:338"] = {
		["pets"] = {
			"BattlePet-0-000012B67EA7", -- [1]
			"BattlePet-0-000012C649B3", -- [2]
			"BattlePet-0-000012B01E78", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/18024\n\nStrategy added by Ophilla#1123\nTurn 1: Flyby\nTurn 2: Call Lightning\nTurn 3-7: Slicing Wind until Tiny Twister is dead.\nBring in your Withering Creeper\nTurn 8-11: Toxic Smoke until Wumpas dies.\nBaeloth comes in\nTurn 12: Smoke Bomb\nTurn 13-14: Toxic Smoke until Withering Creeper dies\nBring in your Primal Stormling\nTurn 15: Call Lightning\nTurn 16: If Baeloth is still alive, Slicing Wind until it dies\n\n",
		["name"] = "My Beast's Bidding (Elemental)",
		["tags"] = {
			"1126DT", -- [1]
			"01232U7", -- [2]
			"202838K", -- [3]
		},
		["teamID"] = "team:338",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
		},
	},
	["team:307"] = {
		["pets"] = {
			"BattlePet-0-000006E4C76A", -- [1]
			"BattlePet-0-000012B4861E", -- [2]
			"BattlePet-0-000012B146CC", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/971\n\nScript thanks to Aesetha\n\nTurn 1: Ice Tomb\nTurn 2: Wild Magic\nTurn 3: Pass. Emmigosa dies\nBring in your Nether Faerie Dragon\nTurn 1: Moonfire\nTurn 2: Arcane Blast\nTurn 3: Life Exchange\nTurn 4+: Arcane Blast until Nether Faerie Dragon dies\nBring in your Chrominius\nTurn 1: Howl\nTurn 2: Surge of Power\n",
		["name"] = "Flummoxed (Dragon)",
		["tags"] = {
			"02281LO", -- [1]
			"2215HD", -- [2]
			"1126140", -- [3]
		},
		["teamID"] = "team:307",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
	},
	["team:292"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000006E4C7B4", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by unknown\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in Ikky\nTurn 1: Black Claw\nTurns 2+: Flock\n",
		["name"] = "Fight Night: Heliosus",
		["tags"] = {
			"021316M", -- [1]
			"01181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:292",
		["groupID"] = "group:none",
		["targets"] = {
			99742, -- [1]
		},
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
			"BattlePet-0-000012BEEEA6", -- [1]
			"BattlePet-0-0000083A0A6A", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by norng\n3 rounds.\n\nTurn 1: Glowing Toxin\nTurn 2: Explode\nBring in your Crimson Spore\nTurn 1: Explode - Baby Bjorn dies\n",
		["name"] = "Rydyr",
		["tags"] = {
			"20241G3", -- [1]
			"00261G1", -- [2]
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
		["targets"] = {
			85685, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:103"] = {
		["pets"] = {
			"BattlePet-0-000012B48958", -- [1]
			"BattlePet-0-000012F20B9E", -- [2]
			"BattlePet-0-000012B673F3", -- [3]
		},
		["notes"] = "Strategy added by Freakzoid#11736\nTurn 1: Call Lightning\nTurn 2: Haywire, Boneclaw dies\nTurn 3: Fel Immolate, bring in ikky when Sunreaver dies\nTurn 4: Black Claw\nTurn 5: Quills, Spindler Dies\nTurn 6: Black Claw\nTurn 7: Flock, bring in Microbot XD when Ikky dies\nTurno 8: Supercharge\nTurno 9: Ion Cannon you win \n\n",
		["name"] = "Eyegor's Special Friends",
		["tags"] = {
			"221414Q", -- [1]
			"21181FS", -- [2]
			"02272KT", -- [3]
		},
		["teamID"] = "team:103",
		["targets"] = {
			173324, -- [1]
		},
		["groupID"] = "group:6",
	},
	["team:410"] = {
		["pets"] = {
			"BattlePet-0-000012B118E8", -- [1]
			"BattlePet-0-000006E4C775", -- [2]
			"BattlePet-0-000012B01DE0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9234\n\nStrategy added by DragonsAfterDark\nVideo for Fight (https://youtu.be/0LRww-Juuiw?t=35)\n\nTurn 1: Booby-Trapped Presents\nTurn 2: Greench's Gift\nTurn 3: Swap to your Father Winter's Helper\nTurn 4: Call Blizzard\nTurn 5: Ice Lance\nRocket comes in\nTurn 1: Gift of Winter's Veil\nTurn 2: Ice Lance\nMarshmallow comes in\nTurn 1: Swap to your Rotten Little Helper\nTurn 2: Greench's Gift\nTurn 3: Ice Lance\nIf needed:\nBring in one of the other Helpers to clean up.\n",
		["name"] = "Fight Night: Tiffany Nelson (Humanoid)",
		["tags"] = {
			"21141A5", -- [1]
			"21233N", -- [2]
			"21233O", -- [3]
		},
		["teamID"] = "team:410",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
		},
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
	["team:274"] = {
		["pets"] = {
			"BattlePet-0-000006E4C7B4", -- [1]
			"BattlePet-0-000012B146D1", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Mnrogar\nTurn 1: Black Claw\nTurns 2-4: Flock\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Breath\nTurn 2: Thunderbolt\nTurn 3: Explode\n",
		["name"] = "Gnomefeaster",
		["tags"] = {
			"01181FS", -- [1]
			"1215QC", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:274",
		["groupID"] = "group:none",
		["targets"] = {
			154922, -- [1]
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
		["targets"] = {
			116790, -- [1]
		},
		["groupID"] = "group:7",
	},
	["team:324"] = {
		["pets"] = {
			"BattlePet-0-000012B66C49", -- [1]
			"random:9", -- [2]
			"random:9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/578\n\nScript thanks to BioNIk\n\nTurn 1: Snap\nTurn 2: Renewing Mists\nTurn 3: Shell Shield\nTurn 4: Snap\nTurn 5: Snap\nTurn 6: Snap\nTurn 7: Snap\nTurn 8: Renewing Mists\nTurn 9: Shell Shield\nTurns 10+: Snap until the Mist Wraith is resurrecting\nThen:: Renewing Mists\nCrawdead comes in\nPrio 1: Refresh Renewing Mists after it runs out\nPrio 2: Refresh Shell Shield when it has 1 turn left\nPrio 3: Use Snap in between until Crawdead resurrects\nThen:: Shell Shield\nGnaw comes in\nTurns 1+: Snap until Gnaw is dead\n\nSometimes your Emperor Crab might not manage. If that happens bring in your next Aquatic and kill Gnaw off, he should be almost dead at this point.\n",
		["name"] = "Jarrun's Ladder (Aquatic)",
		["tags"] = {
			"1114NA", -- [1]
			"ZR9", -- [2]
			"ZR9", -- [3]
		},
		["teamID"] = "team:324",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:344"] = {
		["pets"] = {
			"BattlePet-0-000012B3E786", -- [1]
			"BattlePet-0-000012B18C43", -- [2]
			"random:9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13856\n\nStrategy added by gdrop\nSometimes RNG will change the script up a bit. \nChitterpsine will survive through Gulp, but I've noticed the script can change after here based on RNG dmg.\nUse Healing Wave either when Egcellent is on feign death round (below half health), or when you need that 400 hp boost if you go off script. \nPump down Red Wire best you can and finish the fight off with any other 25+ Aqua pet.\n\nI have yet to loose a fight with this lineup.\n\nScript thanks to Aesetha\n\nTurn 1: Dive\nTurn 2: Shell Armor\nTurn 3, 4, 5: Pinch x3\nTurn 6: Dive \nTurn 7: Egcellent comes in, Shell Armor\nTurn 8+: Pinch until Chitterspine Skitterling dies\n\nTurn 1: Bring in Eternal Strider and Pump\nTurn 2: Poison Spit\nTurn 3: Healing Wave Should be Egcellent Feign Death round\nRed Wire Comes in\nTurn 4+: Pump until Eternal Strider dies\n\nTurn 1+: Standard attack until you win!\n\n",
		["name"] = "Tiny Poacher, Tiny Animals (Aquatic)",
		["tags"] = {
			"111B2IO", -- [1]
			"2128BV", -- [2]
			"ZR9", -- [3]
		},
		["teamID"] = "team:344",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
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
		["targets"] = {
			116793, -- [1]
		},
		["groupID"] = "group:7",
	},
	["team:330"] = {
		["pets"] = {
			"BattlePet-0-000006E4C775", -- [1]
			"BattlePet-0-000012B01DE0", -- [2]
			"random:1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9103\n\nStrategy added by DragonsAfterDark\nTurn 1: Call Blizzard -- // -- Mist Wraith uses Arcane Blast\nTurn 2: Ice Tomb -- // -- Mist Wraith uses Phase Shift\nTurn 3: Pass -- // -- Mist Wraith uses Plagued Blood\nTurn 4: Ice Lance -- // -- Mist Wraith uses Plagued Blood & is Stunned\nTurn 5: Call Blizzard -- // -- Mist Wraith is stun swapped with Crawdead\nTurn 6+: Ice Lance until Crawdead is dead\nUndead: Pass -- // -- Father Winter's Helper should die here\n\nBring in your Winter's Little Helper\nMist Wraith comes in\nTurn 1: Call Blizzard -- // -- Mist Wraith uses Arcane Blast & dies\nUndead: Ice Tomb -- // -- Mist Wraith uses Phase Shift and dies completely \nGnaw comes in\nTurn 1: Snowball -- // -- Gnaw uses Breath of Sorrow\nTurn 2: Snowball -- // -- Gnaw uses Fel Immolate & is stunned\nTurn 3: Call Blizzard -- // -- Gnaw dies\n\nIf needed:\nBring in your Humanoid pet\nTurn 1: Any standard attack will finish the fight\n",
		["name"] = "Jarrun's Ladder (Humanoid)",
		["tags"] = {
			"21133N", -- [1]
			"11133O", -- [2]
			"ZR1", -- [3]
		},
		["teamID"] = "team:330",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:322"] = {
		["pets"] = {
			"BattlePet-0-000012B01ED3", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"random:10", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/816\n\nScript thanks to TURBOKillex\n\nTurn 1: Toxic Smoke\nTurn 2: Wind-Up\nTurn 3: Wind-Up\nTurn 4: Toxic Smoke\nTurn 5: Explode\nBring in your Mechanical Pandaren Dragonling - Aulier swaps in Conviction\nTurn 1: Decoy\nTurns 2+: Breath until Conviction casts Dark Rebirth\nThen:: Pass\nThen:: Breath until Conviction is dead\nDignity comes in\nTurns 1+: Use Decoy and Thunderbolt whenever they are ready. Otherwise Breath until your Mechanical Pandaren Dragonling dies\nBring in your third Mech\nTurns 1+: Use standard spells to finish the fight.\n",
		["name"] = "The Master of Pets (Mech)",
		["tags"] = {
			"12271BB", -- [1]
			"1225QC", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:322",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:406"] = {
		["pets"] = {
			"BattlePet-0-000011F7F5D4", -- [1]
			"BattlePet-0-000012B90271", -- [2]
			"BattlePet-0-000012C8CD9E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/664\n\nScript thanks to Mafo\n\nTurn 1: Adrenaline Rush\nTurn 2: Flurry\nTurns 3+4: Burrow\nTurn 5: Adrenaline Rush\nTurns 6+: Flurry until Jinx is dead\nRocket comes in\nTurn 1: Swap to your Snail\nTurn 2: Acidic Goo\nTurn 3: Ooze Touch\nTurns 4+5: Dive\nTurns 6+: Ooze Touch until Rocket is dead\nMarshmallow comes in\nTurn 1: Acidic Goo\nTurn 2: Ooze Touch until your Snail is dead\nBring in your Fawn\nTurn 1: Nature's Ward\nTurn 2: Headbutt\nTurns 3+: Hoof until Marshmallow is dead\n",
		["name"] = "Fight Night: Tiffany Nelson (Critter)",
		["tags"] = {
			"211BBQ", -- [1]
			"111CN7", -- [2]
			"1229DV", -- [3]
		},
		["teamID"] = "team:406",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
		},
	},
	["team:352"] = {
		["pets"] = {
			"BattlePet-0-000012BAC92C", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"random:10", -- [3]
		},
		["name"] = "Tiny Poacher, Tiny Animals (Mech)",
		["tags"] = {
			"1217AI", -- [1]
			"1225QC", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:352",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
		},
	},
	["team:340"] = {
		["pets"] = {
			"BattlePet-0-000006E4C775", -- [1]
			"BattlePet-0-000012B118E8", -- [2]
			"BattlePet-0-000012B01DE0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9215\n\nStrategy added by DragonsAfterDark\nI'm beginning to think most of the Humanoid fights in Legion on the Broken Isles can be taken care of with this team, heh. Especially now with the buff to Blizzard's weather.\n\nThe fight won't always go as indicated, unfortunately, because of the varying damage for some of the abilities and all the stuns. The script will get you through most of it. These factors vary so widely, that sometimes you won't even need pet #3, and sometimes pet #3 will have <400 hp. It's just how this fight tends to be.\n\nTurn 1: Ice Tomb\nTurn 2: Call Blizzard\nTurn 3: Ice Lance\nTurn 4: Ice Lance -- // -- This will hit Wumpas\nTurn 5: Ice Lance\nBring in OR Swap to your Rotten Little Helper\nTurn 1: Greench's Gift\nTurn 2: Ice Lance\nThrugtusk comes back in\nTurn 1: Booby-Trapped Presents\nTurn 2: Ice Lance\nBaeloth comes in\nTurn 1+2: Pass\nTurn 3: Greench's Gift\nTurn 4+: Ice Lance until Rotten Little Helper or Baeloth dies\nIf needed:\nBring in your Winter's Little Helper\nTurn 1: Gift of Winter's Veil\nTurn 2: Call Blizzard\nTurn 3+: Ice Lance\n",
		["name"] = "My Beast's Bidding (Humanoid)",
		["tags"] = {
			"21133N", -- [1]
			"21141A5", -- [2]
			"21233O", -- [3]
		},
		["teamID"] = "team:340",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
		},
	},
	["team:58"] = {
		["pets"] = {
			"BattlePet-0-000012C4A66F", -- [1]
			"BattlePet-0-000012B5CB6C", -- [2]
			"BattlePet-0-000012B118E5", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3610\n\nStrategy added by DragonsAfterDark\nTurn 1: Bubble\nTurn 2-4: Stampede\nTurn 5+: Pinch until Undead Round\nUndead: Pass\n\nRandom Enemy Pet Comes In\n\nNote 1:: There are a few different pets that will come in with Leper Rat, so the turn orders won't be exact.\n\nNote 2:: Keep in mind, if you can't see the enemy attacks with an addon, Automated Drilling Machine's ability, Smoke Cloud, is on a 4 round CD, so you may need to adjust your pet's attacks\n\nNote 3:: Pass during any Undead/Dodge rounds\n\nTurn 1+: Stampede until you die, unless one of the random enemies is a Cockroach, then use Pinch instead\n\nFor the Dragonhawk Hatchlings:\nIf:: Mech pets are up: Flamethrower > Conflagrate > Use Conflagrate on CD and Flamethrower Between\nIf:: Critter/Undead pets are up: Flamethrower > Conflagrate > Claw +\n",
		["name"] = "Leper Rat",
		["tags"] = {
			"111C2AI", -- [1]
			"12284H", -- [2]
			"12234F", -- [3]
		},
		["teamID"] = "team:58",
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
			"BattlePet-0-000012B99C8C", -- [1]
			"BattlePet-0-000012BA9500", -- [2]
			"BattlePet-0-000008968258", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/5030\n\nStrategy added by dintho\nI am still testing this myself but it worked in a pinch \n\nPriority 1: Fire Shield\nPriority 2: Flame Jet\nPriority 3: Burn until Giggling Flame dies\nBring in your Enchanted Cauldron\nPriority 1: Extra Plating\nPriority 2: Heat Up\nPriority 3: Burn\nBring in your Anubisath Idol\nPriority 1: Stoneskin\nPriority 2: Rupture\nPriority 3: Crush\n",
		["name"] = "Gnomeregan Guard Tiger",
		["tags"] = {
			"11142D2", -- [1]
			"222C1L3", -- [2]
			"1226143", -- [3]
		},
		["teamID"] = "team:175",
		["groupID"] = "group:6",
		["targets"] = {
			146003, -- [1]
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
	["team:327"] = {
		["pets"] = {
			"BattlePet-0-000012B4838C", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/634\n\nIf your Emerald Proto-Whelp has 244 speed, bring another level 25 Dragonkin. Once your Whelp dies (during Crawdead), bring in that third Dragon and kill Crawdead with it.\n\ntdScript thanks to Thordros\n\nTurn 1: Emerald Bite\nTurn 2: Emerald Presence\nTurn 3: Pass\nTurn 4: Emerald Bite\nTurn 5: Emerald Bite\nTurn 6: Emerald Bite\nTurns 7-9: Emerald Dream\nTurns 10+: Emerald Bite until Mist Wraith resurrects\nThen:: Emerald Presence\nCrawdead comes in\nTurns 1-3: Emerald Dream\nTurn 4: Emerald Bite\nTurn 5: Emerald Presence\nTurn 6: Emerald Bite\nTurns 7-9: Emerald Dream\nTurns 10+: Emerald Bite until Crawdead enters the Undead round\nThen:: Emerald Presence\nGnaw comes in\nTurns 1+: Emerald Bite until your Proto-Whelp dies\nBring in Chrominius\nHow many health points does Gnaw have left?\nMore than 1400: Bite, Howl, Surge of Power\nLess than 1400: Howl, Surge of Power\n",
		["name"] = "Jarrun's Ladder (Dragon)",
		["tags"] = {
			"222814F", -- [1]
			"1126140", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:327",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
	},
	["team:143"] = {
		["pets"] = {
			"BattlePet-0-000012B146CC", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/426\n\nScript thanks to aidos\n\nTurn 1: Arcane Explosion\nTurn 2: Arcane Explosion\nTurn 3: Ancient Blessing\nTurns 4+: Use Arcane Explosion and Ancient Blessing every time it is available.\n\nOften Chrominius finishes the fight on its own. If he dies too early, bring in your Pandaren Dragonling and mop up with Thunderbolt followed by Breath.\n",
		["name"] = "Whispering Pandaren Spirit",
		["tags"] = {
			"2226140", -- [1]
			"1215QC", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:143",
		["targets"] = {
			68464, -- [1]
		},
		["groupID"] = "group:11",
	},
	["team:323"] = {
		["pets"] = {
			"BattlePet-0-000012BAFD2D", -- [1]
			"random:4", -- [2]
			"random:4", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/990\n\nScript thanks to Wavering\n\nTurn 1: Touch of the Animus\nTurn 2+: Now use Touch of the Animus on cooldown, Drain Blood when you drop below ~60% health, and otherwise Plagued Blood\nThis takes a while, but the Son of Sethe is usually able to solo the fight\n",
		["name"] = "The Master of Pets (Undead)",
		["tags"] = {
			"22181H6", -- [1]
			"ZR4", -- [2]
			"ZR4", -- [3]
		},
		["teamID"] = "team:323",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
	},
	["team:311"] = {
		["pets"] = {
			"BattlePet-0-000012B01ECA", -- [1]
			"BattlePet-0-000012B01EA8", -- [2]
			"BattlePet-0-000012BEE423", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/742\n\nStrategy added by Nyari\nTurn 1: Curse of Doom\nTurn 2: Swap to your Mini Mindslayer\nTurn 3: Pass\nTurn 4: Pass\nTurn 5: Life Exchange\nTurn 6: Inner Vision\nTurns 7+: Mana Surge until Mini Mindslayer dies\nBring in your Minfernal\nTurn 1: Explode\nBring in your Lesser Voidcaller\nTurns 1+: Shadow Shock until Flummox is dead\n",
		["name"] = "Flummoxed (Magic)",
		["tags"] = {
			"101616I", -- [1]
			"2228144", -- [2]
			"0026FK", -- [3]
		},
		["teamID"] = "team:311",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
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
	["team:221"] = {
		["pets"] = {
			"BattlePet-0-000006E4C754", -- [1]
			"BattlePet-0-000012BAF77C", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15372\n\nStrategy added by DragonsAfterDark\nVideo for Fight (https://www.youtube.com/watch?v=VBQl8Mo_g7Y)\n\nTurn 1: Arcane Storm\nTurn 2: Consume Magic\nTurn 3: Swap to your Singing Sunflower\nTurn 4: Sunlight\nTurn 5: Photosynthesis\nTurn 6: Swap to your Court Scribe\nRepeat from Turn 1 until Cindy & Dah'da die\n~*~: At that point Alex should be the only one left, so leave your Singing Sunflower in, then:\nTurn 1: Solar Beam until Alex is dead \n",
		["name"] = "Wrathion",
		["tags"] = {
			"01181SB", -- [1]
			"212C93", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:221",
		["targets"] = {
			71924, -- [1]
		},
		["groupID"] = "group:11",
	},
	["team:404"] = {
		["pets"] = {
			"BattlePet-0-000012B3E786", -- [1]
			"BattlePet-0-000012B99CC6", -- [2]
			"BattlePet-0-000012B99D62", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14201\n\nStrategy added by Morell#1795\nDefinitely some RNG here.  Only tested it about 5 or six times.  Win rate is currently 50%.\n\nPriority 1: Black Claw\nPriority 2: Dive\nPriority 3: Skitter\nRocket comes in\nBring in your Bleakwater Jelly\nTurn 1: Tidal Wave\nTurn 2: Whirlpool\nTurn 3+: Tentacle Slap until Bleakwater Jelly dies\nBring in your Chitterspine Skitterling and repeat the first set of priorities until your Skitterling dies.\nChuck comes in.\nPriority 1: Rip\nPriority 2: Blood in the Water\nPriority 3: Surge\n",
		["name"] = "Fight Night: Tiffany Nelson (Aquatic)",
		["tags"] = {
			"221B2IO", -- [1]
			"12181MP", -- [2]
			"11235E", -- [3]
		},
		["teamID"] = "team:404",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
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
	["team:337"] = {
		["pets"] = {
			"BattlePet-0-000012B146CC", -- [1]
			"BattlePet-0-000012B48707", -- [2]
			"BattlePet-0-000012B4838C", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/932\n\nScript thanks to Kowh\n\nTurn 1: Bite\nTurn 2: Howl\nTurn 3: Surge of Power - Thrugtusk dies\nWumpas comes in and kills your Chrominius\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm\nTurn 2+: Mana Surge - Wumpas dies\nBaeloth comes in\nTurn 1+: Tail Sweep until Nexus Whelpling dies\nBring in your Emerald Proto-Whelp\nTurn 1: Emerald Presence\nTurn 2+: Emerald Bite until Baeloth is dead\n",
		["name"] = "My Beast's Bidding (Dragon)",
		["tags"] = {
			"1126140", -- [1]
			"122814D", -- [2]
			"220814F", -- [3]
		},
		["teamID"] = "team:337",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
		},
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
	["team:381"] = {
		["pets"] = {
			"BattlePet-0-000012BA9502", -- [1]
			"random:6", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/909\n\nStrategy added by andrewtabs\nScript thanks to wist\n\nTurn 1: Arcane Blast\nTurn 2: Arcane Blast\nTurn 3: Evanescence\nTurn 4: Wish\nTurns 5+: Keep Wish on cooldown and otherwise use Arcane Blast until Sunny is dead\nRoots comes in\nTurn 1: Arcane Blast\nTurn 2: Arcane Blast\nTurn 3: Evanescence\nTurn 4: Wish\nTurns 5+: Arcane Blast until Roots is dead\nBeaky comes in\nTurn 1: Evanescence\nTurns 2+: Arcane Blast until Beaky is dead\nIf your Hyjal Wisp dies too early, bring in your second Magic pet and clean up.\n",
		["name"] = "Training with Durian (Magic)",
		["tags"] = {
			"21151IV", -- [1]
			"ZR6", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:381",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:43"] = {
		["pets"] = {
			"BattlePet-0-0000129D3A43", -- [1]
			"BattlePet-0-00000D5451F8", -- [2]
			"BattlePet-0-00000D511EB1", -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\nWork in progress;I am 4/4 so far, but small sample.\n\nPriority 1: Murder the Innocent\nPriority 2: Trample / Darkflame / Eye Beam\nPriority 3: Change next when dead / Standby\n",
		["name"] = "Pixy Wizzle",
		["tags"] = {
			"10273FS", -- [1]
			"220329G", -- [2]
			"02162V1", -- [3]
		},
		["teamID"] = "team:43",
		["groupID"] = "group:5",
		["targets"] = {
			160205, -- [1]
		},
	},
	["team:280"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012BA1A7F", -- [2]
			"random:0", -- [3]
		},
		["name"] = "Narrok",
		["tags"] = {
			"1116143", -- [1]
			"11261CI", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:280",
		["groupID"] = "group:11",
		["targets"] = {
			66552, -- [1]
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
	["team:139"] = {
		["pets"] = {
			"BattlePet-0-000012BAF760", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7097\n\nStrategy added by Blujay00#1918\nThanks to Krigath on Wowhead for this strategy. I used Benax but Mud Jumper was the original beginning pet, both work great. \n\nhttps://www.wowhead.com/npc=66822/goz-banefury#comments\n\nThank you to Malhado below for the TDScript!\n\nBring in your Benax\nTurn 1: Bubble\nTurn 2+: Water Jet\nTurn 1: Swap to your Elekk Plushie after Twilight has resurrected from Dark Rebirth\nTurn 2+: Pass until Twilight has died from Dark Rebirth\nAmythel comes in\nTurn 3+: Continue passing turns until your Elekk Plushie dies\nBring in your Mechanical Pandaren Dragonling\nTurn 1: Decoy\nTurn 2+: Breath\nAmythel dies\nHelios comes in\nTurn 3: Breath\nTurn 4: Bombing Run\nTurn 5: Breath\nMechanical Pandaren Dragonling dies\nBring in your Benax\nTurn 1: Bubble\nTurn 2: Mudslide\nTurn 3: Water Jet \nHelios dies\n",
		["name"] = "Goz Banefury",
		["tags"] = {
			"11171SE", -- [1]
			"1125QC", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:139",
		["groupID"] = "group:11",
		["targets"] = {
			66822, -- [1]
		},
	},
	["team:309"] = {
		["pets"] = {
			"BattlePet-0-000012BACD70", -- [1]
			"BattlePet-0-0000088F2EFD", -- [2]
			"BattlePet-0-000012F20B9E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10788\n\nStrategy added by Berendain\nUsually wins in 8 rounds.  This strat has a chance to fail from unlucky crits, but this should easily get you the win if you don't  own a Seaborne Spore, necessary for Mutanis's double-spore strat.\n\nTurn 1: Glowing Toxin\nTurn 2: Creeping Fungus until your  Glowing Sporebat dies\nBring in your Fel-Afflicted Skyfin\nTurn 1: Wild Magic\nTurn 2: Fel Immolate\nTurn 3: Swap to your Ikky\nTurn 4: Black Claw\nTurn 5: Flock\nBring in your Fel-Afflicted Skyfin if Ikky dies before Flummox\nTurn 1: Predatory Strike, Master Tamer Flummox dies\n",
		["name"] = "Flummoxed (Flyer)",
		["tags"] = {
			"01231HU", -- [1]
			"2214227", -- [2]
			"01181FS", -- [3]
		},
		["teamID"] = "team:309",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
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
	["team:28"] = {
		["pets"] = {
			"BattlePet-0-000012BA1A7F", -- [1]
			"BattlePet-0-000012B146CA", -- [2]
			"BattlePet-0-000006E4C7A1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/336\n\nScript thanks to Oakwarden\n\nTurn 1: Pass\nTurn 2: Itchin' for a Stitchin'\nTurn 3: Extra Plating\nTurn 4: Pass\nTurns 5-7: Inflation\nTurn 8: Launch Rocket\nTurn 9: Launch Rocket - Serendipity dies",
		["name"] = "Taralune",
		["tags"] = {
			"11261CI", -- [1]
			"2225198", -- [2]
			"2117A0", -- [3]
		},
		["teamID"] = "team:28",
		["targets"] = {
			87125, -- [1]
		},
		["groupID"] = "group:11",
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
	["team:275"] = {
		["pets"] = {
			"BattlePet-0-000012B58B24", -- [1]
			"BattlePet-0-000012BA1A7F", -- [2]
			"BattlePet-0-000012B528FE", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1816\n\nStrategy added by Ivanella#1279\nFrom Wowhead user roeevv.\n\nTurn 1+: Missile till Pyth is below 618 hp (2 will usually do).\nTurn 3: Decoy\nTurn 4: Explode\nSpring comes in\nTurn 1: Swap to your Level Pet\nTurn 2: Swap to your Xu-Fu, Cub of Xuen\nTurn 3: Prowl\nTurn 4: Moonfire (one-shot)\nClatter comes in\nTurn 1+: Spirit Claws x2\n",
		["name"] = "Obalis",
		["tags"] = {
			"122CAJ", -- [1]
			"11261CI", -- [2]
			"122417I", -- [3]
		},
		["teamID"] = "team:275",
		["groupID"] = "group:11",
		["targets"] = {
			66824, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
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
		["targets"] = {
			72290, -- [1]
		},
		["groupID"] = "group:3",
	},
	["team:304"] = {
		["pets"] = {
			"BattlePet-0-000012BAF760", -- [1]
			"BattlePet-0-000012B3E786", -- [2]
			"BattlePet-0-000012B01E47", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9568\n\nStrategy added by Orgulas\nedit: TD script added, thx Wist!\n\nTurn 1: Bubble\nTurn 2: Water Jet\nTurn 3: Water Jet If your HP seems like Benax will die next hit use Swarm of Flies\nTurn 4: Swarm of Flies if not previous Benax dies\nTurn 5:  get in your Chitterspine Skitterling\nTurn 6: Black Claw\nTurn 7: Swarm Chitterspine Skitterling might die during Swarm\nTurn 8: get in Sewer-Pipe Jelly\nSqueeze\nTentacle Slap you shold be done by now, if not, use Tentacle Slap again\n",
		["name"] = "Flummoxed (Aquatic)",
		["tags"] = {
			"12171SE", -- [1]
			"022B2IO", -- [2]
			"10291MQ", -- [3]
		},
		["teamID"] = "team:304",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
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
		["targets"] = {
			150918, -- [1]
		},
		["groupID"] = "group:8",
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
	["team:373"] = {
		["pets"] = {
			"BattlePet-0-000012B99D22", -- [1]
			"BattlePet-0-000012B675D0", -- [2]
			"BattlePet-0-000012B118B3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/677\n\nScript thanks to Rinoe\n\nTurn 1: Ethereal\nTurn 2: Hoof\nTurn 3: Hoof\nTurn 4: Hoof\nTurn 5: Ethereal\nTurns 6+: Hoof until the Lil’ Spirit Guide is dead\nQuillino comes in\nTurn 1: Ghostly Bite - unless your Kid is already dead, then bring in your Scourged Whelpling\nTurns 2+: Tail Sweep until Quillino is dead\nFethyr comes in\nTurn 1: Pass\nTurns 2+: Tail Sweep until you enter your undead round\nThen:: Call Darkness\nBring in your Ghostly Skull\nTurn 1: Spectral Strike\nTurns 2+: Shadow Slash until Fethyr is dead\n",
		["name"] = "Training with Bredda (Undead)",
		["tags"] = {
			"12161D2", -- [1]
			"2128GQ", -- [2]
			"12175U", -- [3]
		},
		["teamID"] = "team:373",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
	},
	["team:302"] = {
		["pets"] = {
			"BattlePet-0-000012B15603", -- [1]
			"BattlePet-0-000012BCCD57", -- [2]
			"BattlePet-0-000012B146CA", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/16996\n\nStrategy added by DragonsAfterDark\nTurn 1: Decoy\nTurn 2: Razor Talons\nTurn 3-5: Flame Breath (3 hits) ~ Pass when stunned\nTurn 6: Razor Talons\nTurn 7+: Flame Breath until Gusteau dies\nRemy comes in\n~: If your Timeless Mechanical Dragonling is still alive\nTurn 1: Razor Talons\nTurn 2+: Flame Breath until Timeless Mechanical Dragonling dies\nBring in your De-Weaponized Mechanical Companion\nTurn 1: Overtune\nTurn 2+3: Thrash\nDinner comes in\nTurn 1: Swap to your Lil' Bling\nTurn 2: Extra Plating\nTurns 3-5: Inflation\nPriority 1: Launch Rocket if Dinner has Shattered Defenses up\nPriority 2: Inflation otherwise and if Bubble is up\n",
		["name"] = "Chopped (Mech)",
		["tags"] = {
			"111430S", -- [1]
			"210586", -- [2]
			"2225198", -- [3]
		},
		["teamID"] = "team:302",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
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
	["team:439"] = {
		["pets"] = {
			"BattlePet-0-000012B01E1E", -- [1]
			"BattlePet-0-000008A64479", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3549\n\nStrategy added by DragonsAfterDark\nTurn 1: Amplify Magic\nTurn 2-4: Arcane Explosion\nRepeat steps 1-4 until backline pets die\nAfter that:\nArcane Blast until dead\nBring in your Docile Skyfin\nTurn 1: Predatory Strike\nTurn 2+: Wild Winds\n",
		["name"] = "Fight Night: Amalia (Flyer)",
		["tags"] = {
			"21232C9", -- [1]
			"2016226", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:439",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:405"] = {
		["pets"] = {
			"BattlePet-0-000012C6347A", -- [1]
			"BattlePet-0-000012B528FE", -- [2]
			"BattlePet-0-000012B399CF", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/864\n\nStrategy added by Ssparkles\nScript thanks to isthevao\n\nTurns 1+2: Burrow\nTurn 3: Sticky Goo\nTurn 4: Consume\nTurn 5: Sticky Goo\nTurn 6: Consume\nTurns 7+8: Burrow - Jinx dies\nRocket comes in\nTurns 1+: Continue like above, keep Burrow on cooldown and alternate between Consume and Sticky Goo until your Maggot dies\nBring in Xu-Fu, Cub of Xuen\nTurn 1: Prowl\nTurn 2: Moonfire\nTurns 3+: Spirit Claws until Xu-Fu, Cub of Xuen dies\nBring in your Summit Kid\nTurn 1: Chew\nTurns 2+: Stampede\n",
		["name"] = "Fight Night: Tiffany Nelson (Beast)",
		["tags"] = {
			"2223E2", -- [1]
			"122417I", -- [2]
			"2025L7", -- [3]
		},
		["teamID"] = "team:405",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
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
	["team:319"] = {
		["pets"] = {
			"BattlePet-0-000012B3E06D", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"BattlePet-0-000012B67E78", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14676\n\nStrategy added by vanfreyr\nHighly recommend just using Fledgling Warden Owl. Hits like a truck and reduces RNG from Quils due to killing Beauty much quicker, possible chance of straight chunking Conviction as well.\n\nOwl Priority 1: Call Darkness\nOwl Priority 2: Nocturnal Strike\nOwl Priority 3: Savage Talon\nTero Priority 1: Nature's Ward, if Nature's Ward duration = 1, use Nature's Ward. If Conviction is killable (Health below 309) regardless of Dark Rebirth, do not use Nature's Ward and simply Ravage\nTero Priority 2: Alpha Strike\nKorthik Prio 1: Amber Prison\nKorthik Prio 2: Takedown on Dignity is Stunned. Do not Takedown Conviction, use Slicing Wind instead.\nKorthik Prio 3: Slicing Wind\n",
		["name"] = "The Master of Pets (Flyer)",
		["tags"] = {
			"11141LK", -- [1]
			"22271C8", -- [2]
			"11142GP", -- [3]
		},
		["teamID"] = "team:319",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
	},
	["team:277"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-000012BF63D8", -- [2]
			0, -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14652\n\nStrategy added by GoldenBolger\nThis strategy is Hazelnuttygames 2 pet strategy, I have only tried to make the TD script for this.\nThe strategy is shown in the video link. All credit to Hazelnuttygames for this excellent strategy.\n\nhttps://www.youtube.com/watch?v=iBqPDkNTaMY\n\nFor this you can use the Snail you want, as long it has the same abilities\n\nAbilities:\nMechanical Pandaren Dragonling (MPD): 1 1 2 (Breath, Bombing Run, Decoy)\nSnail*: Absorb, Shell Shield, Dive\n\n\nTurn 1: Decoy and Breth until Arcanus is dead\nTurn 2: Change to Snail* \nTurn 3: Dive if not on cooldown\nTurn 4: Shell shiled if not on cooldown\nTurn 5: Absorb until Jadefire is dead\nTurn 6: Change in your leveling pet for one round\nTurn 7: Change back to MPD.\nTurn 8: Use Decoy , bombing run when possible.\nelse use Breath until Netherbite is dead\nIf MPD dies before Netherbite, the Snail* will be active to do the rest of the job.\n",
		["name"] = "Bloodknight Antari",
		["tags"] = {
			"1125QC", -- [1]
			"2219HO", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:277",
		["groupID"] = "group:11",
		["targets"] = {
			66557, -- [1]
		},
		["preferences"] = {
			["minXP"] = 5,
		},
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
	["team:284"] = {
		["pets"] = {
			"BattlePet-0-000012B48707", -- [1]
			"BattlePet-0-000008968258", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/424\n\nScript thanks to Jimmo\n\nTurn 1: Arcane Storm\nTurns 2-4: Mana Surge\nTurn 5: Arcane Storm\nTurn 6: Tail Sweep \nTurn 7: Tail Sweep \nTurns 8-10: Mana Surge\n\nIf your Nexus Whelpling dies before the enemy pets, bring in your Anubisath and finish up with Crush\n",
		["name"] = "Beegle Blastfuse",
		["tags"] = {
			"122814D", -- [1]
			"1116143", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:284",
		["groupID"] = "group:11",
		["targets"] = {
			66635, -- [1]
		},
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
		["targets"] = {
			119343, -- [1]
		},
		["groupID"] = "group:4",
	},
	["team:315"] = {
		["pets"] = {
			"BattlePet-0-000012C222D9", -- [1]
			"BattlePet-0-000012B399CF", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/817\n\nScript thanks to Ilyssa\n\nTurn 1: Prowl\nTurn 2: Stoneskin\nTurns 3+: Onyx Bite until Beauty is dead\nConviction comes in\nTurns 1+: Onyx Bite until Feline Familiar dies\nBring in your Summit Kid\nTurn 1: Chew\nTurn 2: Stampede until Conviction is dead\nDignity comes in\nTurn 1: Comeback until Summit Kid dies\nBring in your third Beast\nTurn 1: Use standard attacks to finish Dignity\n",
		["name"] = "The Master of Pets (Beast)",
		["tags"] = {
			"112A9V", -- [1]
			"2125L7", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:315",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:149"] = {
		["pets"] = {
			"BattlePet-0-000012BB19D8", -- [1]
			"BattlePet-0-000012E3820B", -- [2]
			"BattlePet-0-000012B5CB69", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3614\n\nStrategy added by DragonsAfterDark\nTurn 1: Heat Up\nTurn 2: Immolation\nTurn 3+: Burn until the Guard Wolf dies\nRandom Enemy Pet Comes In\n\nNote:: Pass whenever there's an Undead round or Dodge\n\nTurn 1: Burn\nTurn 2: Heat Up\nTurn 3+: Burn until the Torch dies\nBring in your Azure Whelpling\nTurn 1+: Claw to finish off enemy #2\nEnemy Pet #3 Comes In\nTurn 1: Ice Tomb (Skip this if the Random Enemy is a Critter)\nTurn 2+: Claw until the Azure Whelpling or the enemy dies\nBring in your Blazehound\nTurn 1: Frenzy\nTurn 2+: Blazing Yip to finish them off\n",
		["name"] = "Gnomeregan Guard Wolf",
		["tags"] = {
			"111A1L4", -- [1]
			"10241P", -- [2]
			"120B216", -- [3]
		},
		["teamID"] = "team:149",
		["groupID"] = "group:6",
		["targets"] = {
			146002, -- [1]
		},
	},
	["team:346"] = {
		["pets"] = {
			"BattlePet-0-000012B99C7D", -- [1]
			"BattlePet-0-000012B67A3C", -- [2]
			"BattlePet-0-000006E4C795", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9506\n\nStrategy added by DragonsAfterDark\nTurn 1+: Alpha Strike until Gulp dies\nEgcellent comes in\nTurn 1+: Alpha Strike until Lovebird Hatchling dies\nBring in your Crispin\nTurn 1+: Woodchipper until Egcellent has <800 hp\n~~: Crouch once Egcellent has <800 hp\nRed Wire comes in\nTurn 1+: Flamethrower until Red Wire dies\nEgcellent comes in\nTurn 1+: Woodchipper\nIf needed:\nBring in your Wolpertinger\nTurn 1+: Horn Attack & Rampage\n",
		["name"] = "Tiny Poacher, Tiny Animals (Critter)",
		["tags"] = {
			"22051F7", -- [1]
			"22281MO", -- [2]
			"21274P", -- [3]
		},
		["teamID"] = "team:346",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
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
		["targets"] = {
			116788, -- [1]
		},
		["groupID"] = "group:7",
	},
	["team:355"] = {
		["pets"] = {
			"BattlePet-0-000012BB19E0", -- [1]
			"BattlePet-0-00000839A881", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/488\n\nScript and streamlined updates thanks to Ophilla!\n\nTurn 1: Howl\nTurn 2: Maul\nTurn 3: Bite\nSlow Moe comes in\nTurn 1: Bite\nTurn 2: Howl\nTurn 3: Maul - Pass if you got stunned, then Maul\nSnot comes in\nTurn 1: Bite\nTurn 2: Bite\nTurn 3: Pass - your Netherpup dies\nBring in your Fel Pup\nTurns 1+: Bite until Snot is dead\n",
		["name"] = "Snail Fight! (Beast)",
		["tags"] = {
			"12181JT", -- [1]
			"11151JS", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:355",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
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
	["team:293"] = {
		["pets"] = {
			"BattlePet-0-000012EB3FDF", -- [1]
			"BattlePet-0-000012F20B9E", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Strategy added by Shin\nI've tested this on 10 characters and it has worked every time.Pet battle script included.\n\nTurn 1: Metal Fist\nTurn 2: Build Turret\nTurn 3: Swap to your Ikky\nTurn 4: Black Claw\nTurns 5-7: Flock\n~: Ikky should kill thistle or the turret will finish it off\nBring in your Clockwork Gnome\nTurn 1+: Any standard attack will finish the fight\n",
		["name"] = "Stand Up to Bullies",
		["tags"] = {
			"111B8L", -- [1]
			"11181FS", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:293",
		["groupID"] = "group:none",
		["targets"] = {
			105009, -- [1]
		},
	},
	["team:428"] = {
		["pets"] = {
			"BattlePet-0-000006E4C77C", -- [1]
			"BattlePet-0-000012B485C2", -- [2]
			"random:7", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/868\n\nScript thanks to Zaphod\n\nTurn 1: Call Blizzard\nTurn 2: Deep Freeze\nTurns 3+: Magic Hat until Salty Bird dies\nItchy comes back in\nTurn 1: Deep Freeze\nTurn 2: Call Blizzard - this hits Grommet\nTurns 3+: Magic Hat until Tiny Snowman dies\nBring in your Pandaren Water Spirit\nTurn 1: Whirlpool\nTurn 2: Dive\nTurns 3+: Water Jet until Grommet dies\nItchy comes in a last time\nTurns 1+: Water Jet until Itchy is dead\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Elemental)",
		["tags"] = {
			"21233L", -- [1]
			"1219R4", -- [2]
			"ZR7", -- [3]
		},
		["teamID"] = "team:428",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
		["targets"] = {
			150923, -- [1]
		},
		["groupID"] = "group:8",
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
		["targets"] = {
			119341, -- [1]
		},
		["groupID"] = "group:4",
	},
	["team:69"] = {
		["pets"] = {
			"BattlePet-0-000012BA94CE", -- [1]
			"BattlePet-0-000012EB3F8C", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14960\n\nStrategy added by tubedogg#1334\nThis strategy comes from Giltine on Wowhead (https://www.wowhead.com/npc=71933/blingtron-4000#comments:id=5175757). After trying two strategies here and failing 19 out of 20 times combined, I looked over there and this worked perfectly. There's no reason why it can't work 100% of the time due to the healing component. It is slow, but worthwhile.\n\nTurn 1: Bubble\nTurn 2: Whirlpool\nTurn 3: Water Jet\nTurn 4: Continue Water Jet until Au dies.\nBanks comes in\nTurn 1: Use Whirlpool when available.\nTurn 2: Water Jet until Syd the Squid dies.\nBring in your Crimson Shale Hatchling\nTurn 1: Stoneskin and refresh when one stack is left.\nTurn 2: Sticky Web\nTurn 3: Leech Life\nRepeat Turns 2 and 3, refreshing Stoneskin when one stack is left, until Banks dies.\nLil' B comes in\nTurn 1: Stoneskin and refresh when one stack is left.\nTurn 2: Sticky Web\nTurn 3: Leech Life\nRepeat Turns 2 and 3, refreshing Stoneskin when one stack is left, until Lil' B dies.\n",
		["name"] = "Blingtron 4000",
		["tags"] = {
			"11171E6", -- [1]
			"2123HA", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:69",
		["targets"] = {
			71933, -- [1]
		},
		["groupID"] = "group:11",
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
		["targets"] = {
			201858, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:283"] = {
		["pets"] = {
			"BattlePet-0-000012B01ED3", -- [1]
			"BattlePet-0-000012B6763C", -- [2]
			0, -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/4274\n\nStrategy added by Shenk\nGood alternatives for #2 would be Kun-Lai Runt 1*1 and Lil' Bad Wolf 122.\n\nUse the secound half of the guide if you are using a P/S Iron Starlette.\n\nTurn 1: Wind-Up\nTurn 2: Supercharge\nTurn 3: Wind-Up. Cadavus dies\nFleshrender comes in\nTurn 1: Wind-Up\nTurn 2: Toxic Smoke\nTurn 3: Wind-Up. Fleshrender dies. (Sometimes your Iron Starlette dies here. In that case just skip the next turn and send in your Level Pet)\nBlight comes in\nTurn 4: Toxic Smoke. Iron Starlette dies\nSend in Level Pet\nTurn 1: Switch to Flayer Youngling\nTurn 2: Focus (Note: if your Flayer Youngling has a S/S breed you can skip this Turn)\nTurn 3-5: Rampage\nTurn 6: Triple Snap\n\nUse this guide if you are using a P/S Iron Starlette\nTurn 1: Wind-Up\nTurn 2: Pass\nTurn 3: Supercharge\nTurn 4: Wind-Up. Cadavus dies\nFleshrender comes in\nTurn 1: Wind-Up\nTurn 2: Toxic Smoke\nTurn 3: Wind-Up. Iron Starlette usually dies now. If it is still alive just use any ability in the next round, it will die then.\nBring in your Level Pet\nTurn 1: Swap to your Flayer Youngling\nTurn 2: Focus (Note: if your Flayer Youngling has a S/S breed you can skip this Turn)\nTurn 3-5: Rampage\nTurn 6: Triple Snap\n",
		["name"] = "Gutretch",
		["tags"] = {
			"12171BB", -- [1]
			"2127G2", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:283",
		["groupID"] = "group:11",
		["targets"] = {
			66639, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
	},
	["team:388"] = {
		["pets"] = {
			"BattlePet-0-000012B608F8", -- [1]
			"BattlePet-0-000012BEE3D5", -- [2]
			"BattlePet-0-000012B485C2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/689\n\nScript thanks to wist\n\nTurn 1: Flame Breath\nTurn 2: Pass - your Electrified Razortooth is swapped in\nTurn 3: Rip\nTurn 4: Blood in the Water\nTurn 5: Devour - Trixy dies\nGlobs comes in\nTurn 1: Devour continues\nTurn 2: Rip\nTurn 3: Pass - your Electrified Razortooth dies\nBring back your Fel Flame\nTurn 1: Scorched Earth\nTurn 2: Flame Breath - Globs dies\nNightmare Sproutling comes in\nTurn 1: Conflagrate\nTurns 2+: Flame Breath until Fel Flame dies\nBring in your Pandaren Water Spirit\nUse your spells in this priority list until the Sproutling is done with:\nPrio 1:: Whirlpool\nPrio 2:: Dive\nPrio 3:: Water Jet\n",
		["name"] = "Dealing with Satyrs (Elemental)",
		["tags"] = {
			"2216G7", -- [1]
			"121314R", -- [2]
			"1219R4", -- [3]
		},
		["teamID"] = "team:388",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
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
		["targets"] = {
			142054, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:379"] = {
		["pets"] = {
			"BattlePet-0-000012F20B9E", -- [1]
			"BattlePet-0-000012B118A8", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1957\n\nScript thanks to Kowh\n\nTurn 1: Black Claw\nTurn 2: Flock\nUse those two spells to kill both Sunny and Roots\nThen:: Flock until Ikky dies\nBring in your Sentinel's Companion\nPrio 1: Ethereal after Beaky lifts off\nPrio 2: Soulrush\nPrio 3: Dark Talon\n",
		["name"] = "Training with Durian (Flyer)",
		["tags"] = {
			"21181FS", -- [1]
			"22281GV", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:379",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
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
		["targets"] = {
			175782, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			154915, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:411"] = {
		["pets"] = {
			"BattlePet-0-000012BA9502", -- [1]
			"random:6", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/966\n\nScript thanks to Alauraa#2331 \n\nTurn 1: Evanescence\nTurn 2: Wish\nTurn 3: Arcane Blast\nTurn 4: Arcane Blast\nTurn 5: Arcane Blast\nTurn 6: Evanescence\nTurn 7: Arcane Blast\nTurn 8: Wish\nTurn 9: Arcane Blast until Jinx is dead\nRocket comes in\nTurn 1: Arcane Blast\nTurn 2: Evanescence\nTurn 3: Arcane Blast\nTurn 4: Arcane Blast\nTurn 5: Wish\nTurn 6: Arcane Blast\nTurn 7: Evanescence\nTurn 8+: Arcane Blast until Rocket is dead\nMarshmallow comes in\nTurn 1: Wish\nTurn 2: Evanescence\nTurn 3+: Arcane Blast until the fight is won\n",
		["name"] = "Fight Night: Tiffany Nelson (Magic)",
		["tags"] = {
			"21151IV", -- [1]
			"ZR6", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:411",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
		},
	},
	["team:138"] = {
		["pets"] = {
			"BattlePet-0-000012BA94CE", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10554\n\nStrategy added by n4cr\nThis is a carry pet strategy swapping in the elekk plushie, posted originally on wowhead by Kalyn007. I added it here to benefit the site.\n\nScript thanks to Sarahnia\n\nTurn 1-3: Tidal Wave  3 Times\nTurn 4: Bubble\nTurn 5-13: Tidal Wave 8 Times\nSyd will die here.\nBring in your Chrominius\nTurn 1-3: Arcane Explosion 3 Times\nBackline pets should be dead by now.\nTurn 4: Howl\nTurn 5: Surge of Power\n",
		["name"] = "Wastewalker Shu",
		["tags"] = {
			"21071E6", -- [1]
			"2126140", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:138",
		["targets"] = {
			66739, -- [1]
		},
		["groupID"] = "group:11",
	},
	["team:359"] = {
		["pets"] = {
			"BattlePet-0-000012BA9508", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/490\n\nPriority 1: Call Darkness on CD\nPriority 2: Nocturnal Strike on CD & if Call Darkness is active\nPriority 3: Peck \nBring in your Teroclaw Hatchling\nPriority 1: Dodge if Slow Moe's Headbutt is off CD & when Snot is Underwater with Dive\nPriority 2: Ravage when it will kill Slow Moe <500 hp\nPriority 3: Claw all else\n\nIf needed:\nBring in your Flying pet\nTurn 1+: Any standard attack will finish the fight",
		["name"] = "Snail Fight! (Flyer)",
		["tags"] = {
			"1213JM", -- [1]
			"11271C8", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:359",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
	},
	["team:401"] = {
		["pets"] = {
			"BattlePet-0-000012B17368", -- [1]
			"random:6", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/12727\n\nStrategy added by Kingofvaarst#2227\nI did this with 3x Anomalus, but the first one soloed alle of them dying in the proces. if you were to be unlucky im sure whatever magic pet would do the job :D\n\nScript thanks to Rinoe\n\nPrio 1: Void Nova\nPrio 2: Poison Protocol\nPrio 3: Corrosion\nFollow the priorities and you should be golden :D\n",
		["name"] = "Training with the Nightwatchers (Magic)",
		["tags"] = {
			"22142OQ", -- [1]
			"ZR6", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:401",
		["groupID"] = "group:12",
		["targets"] = {
			106552, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
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
	["team:117"] = {
		["pets"] = {
			"BattlePet-0-000012C2D868", -- [1]
			"BattlePet-0-000012B14EAE", -- [2]
			"random:0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3607\n\nStrategy added by DragonsAfterDark\n13 January 24\n\n1. Updated Toxic Skin instructions.\n2. Updated script. I've added a section for the Shiverweb Broodling as the third pet, or you can slot another Dragonhawk. with similar abilities\n\nPriority 1: Toxic Skin:\n1: At 1 round remaining if you're slower\n2: When it falls off if you're faster\nPriority 2: Scratch all else\nPriority 3: If the Cockroach is up while your Glutted Bleeder is still alive, use Burrow\n\nBring in your Golden Dragonhawk Hatchling\nPriority 1: Pass during any Undead rounds / Dodges\nRoach:: Claw until they die\nMech & : \nUndead:: Flamethrower > Conflagrate > Flamethrower until they die\n",
		["name"] = "Living Permafrost",
		["tags"] = {
			"11172AR", -- [1]
			"12234E", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:117",
		["preferences"] = {
			["minXP"] = 25,
		},
		["targets"] = {
			146181, -- [1]
		},
		["groupID"] = "group:6",
	},
	["team:325"] = {
		["pets"] = {
			"BattlePet-0-000012B399CF", -- [1]
			"BattlePet-0-00000839A881", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/696\n\nScript thanks to AramilGaeda\n\nTurn 1: Comeback\nTurns 2-4: Stampede\nTurn 5: Hoof - Mist Wraith resurrects\nTurns 6+: Stampede\nCrawdead comes in and gets hit in the face\nThen:: Comeback - your Summid Kid dies\nBring in your Fel Pup\nTurn 1: Diseased Bite - Crawdead resurrects\nTurn 2: Crouch - Crawdead dies\nGnaw comes in\nTurns 1+: Diseased Bite until Gnaw dies\n\nIf your Fel Pup doesn’t manage, bring in your third pet and clean up with standard attacks.\n",
		["name"] = "Jarrun's Ladder (Beast)",
		["tags"] = {
			"1125L7", -- [1]
			"21151JS", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:325",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:83"] = {
		["pets"] = {
			"BattlePet-0-000012B99946", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Shenk\nTurn 1: Soulrush.\nTurn 2+: Magic Sword until Itchy dies \nNote that there is a chance that Itchy got stunned in the first round. When that happens use Magic Sword in round 2 as usual and then Clean-Up. This will remove the Cyclone of Salty Bird as intended.\nSalty Bird comes in\nTurn A: Clean-Up\nTurn 2: Magic Sword until Salty Bird has 868 or less health\nTurn 3: Soulrush. Salty Bird dies (If Servant of Demidos dies too soon send in Mechanical Pandaren Dragonling and use Breath)\n*: Should Itchy come back in finish it with Magic Sword and Soulrush\nGrommet comes in\nTurn 1+: Magic Sword until either Servant of Demidos dies or Grommet has 492 or less health\nTurn 2: Pass when Servant of Demidos is active and Grommet is at <=492 health\nBring in your Mechanical Pandaren Dragonling\nFollow this priority list:\nPrio 1: Explode when Grommet has 560 or less health\nPrio 2: Thunderbolt when Grommet has 799 or more health\nPrio 3: Breath\n",
		["name"] = "Fight Night: Bodhi Sunwayver",
		["tags"] = {
			"11241I1", -- [1]
			"1215QC", -- [2]
			"ZL", -- [3]
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
	["team:295"] = {
		["pets"] = {
			"BattlePet-0-000012C42069", -- [1]
			"BattlePet-0-000012BA94D7", -- [2]
			"BattlePet-0-000012C2231A", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3912\n\nStrategy added by DragonsAfterDark\nI haven't had Gusteau stun me in my beast fights against him, but if he stuns, you may want to restart\nTurn 1: Crouch\nTurn 2: Call Blizzard\nTurn 3-5: Snowball\nRepeat 1-5 until Gusteau is dead\nBring in your Young Talbuk\nTurn 1: Tough n' Cuddly\nTurn 2-4: Rampage\nTurn 5+: Stampede\nDinner comes in\nTurn 1+: Stampede until Young Talbuk dies\nBring in your Ragepeep\nTurn 1+2: Peck\n",
		["name"] = "Chopped (Beast)",
		["tags"] = {
			"221715D", -- [1]
			"22251JO", -- [2]
			"11152C5", -- [3]
		},
		["teamID"] = "team:295",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
		},
	},
	["team:271"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-000012B58B24", -- [2]
			0, -- [3]
		},
		["notes"] = "Strategy added by Eekwibble\nTurn 1+: Breath until Eye of Inquisition and Eye of Interrogation are dead\nEye of Impetration comes in\nTurn 1: Breath/pass/whatever, you'll get interrupted anyway\nTurn 2: Breath\nTurn 3: Explode - Mechanical Pandaren Dragonling dies\nBring in your Darkmoon Zeppelin\nTurn 4+: Does Eye of Impetration have over 555hp?\nYes - Thunderbolt > Explode\nNo - Explode\nDarkmoon Zeppelin and Eye of Impetration both die, your carry pet gets the xp\n",
		["name"] = "Threads of Fate",
		["tags"] = {
			"1015QC", -- [1]
			"021CAJ", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:271",
		["groupID"] = "group:none",
		["targets"] = {
			105779, -- [1]
		},
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
			"BattlePet-0-00000D6253F5", -- [1]
			"BattlePet-0-000006E4C75E", -- [2]
			"BattlePet-0-000006E4C78C", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3601\n\nStrategy added by DragonsAfterDark\n13 January 24:\n\n1. Pet 1 changed from Scooter to the Hungry Burrower, which cuts time against enemy 1 to 4 rounds.\n2. Updated instructions for pets 1 & 2 versus the backline enemies\n3. Updated script.\n\nTurn 1: Acidic Goo\nTurn 2: Corrosion\nTurn 3: Gnash\nTurn 4: Gnash\nRandom Enemy Pet Comes In\n\nNote 1:: There are a few different pets that will come in with Living Napalm, so the turn orders won't be exact.\n\nNote 2:: Keep in mind, if you can't see the enemy attacks with an addon, Automated Drilling Machine's ability, Smoke Cloud, is on a 4 round CD, so you may need to adjust the Dark Phoenix's attacks\n\nNote 3:: Pass during any Undead / Dodge Rounds\n\nTurn 1: Acidic Goo\nTurn 2: Corrosion\nTurn 3: Gnash\nTurn 4: Gnash\n^^^: Repeat from Turn 1 until your Hungry Burrower dies\n\n~: If the enemy is Mech/Undead bring in Dark Phoenix Hatchling. If it's a Cockroach, bring in your Fetid Waveling\n\nBring in your Dark Phoenix Hatchling\nPrio 1: Immolate for the DoT\nPrio 2: Conflagrate on CD\nPrio 3: Burn as filler\n\nBring in your Fetid Waveling\nTurn 1: Creeping Ooze\nTurn 2: Corrosion\nTurn 3: Poison Spit\nTurn 4: Poison Spit\n^^^: Repeat from Turn 1\n",
		["name"] = "Living Napalm",
		["tags"] = {
			"21292R4", -- [1]
			"12198E", -- [2]
			"222C1OA", -- [3]
		},
		["teamID"] = "team:123",
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
	["team:321"] = {
		["pets"] = {
			"BattlePet-0-000012BA9502", -- [1]
			"random:6", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/992\n\nStrategy added by Aranesh\nScript thanks to Malhado\n\nTurn 1: Arcane Blast\nTurn 2: Wish\nTurn 3+: Arcane Blast until Beauty is dead\nConviction comes in\nTurn 1: Evanescence\nTurn 2: Arcane Blast\nTurn 3: Arcane Blast\nTurn 4+: Wish on cooldown, otherwise Arcane Blast until Conviction is dead\nDignity comes in\nTurn 1: Wish if it is available, otherwise Arcane Blast\nTurn 2: Wish if it is available, otherwise Arcane Blast\nTurn 3: Evanescence\nTurn 4+: Arcane Blast until Dignity is dead\n",
		["name"] = "The Master of Pets (Magic)",
		["tags"] = {
			"21151IV", -- [1]
			"ZR6", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:321",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
	},
	["team:318"] = {
		["pets"] = {
			"BattlePet-0-000012B67B94", -- [1]
			"BattlePet-0-000012B99C7B", -- [2]
			"BattlePet-0-000012B5CC18", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/16234\n\nStrategy added by DragonsAfterDark\nTook me a while, but I really like how this one came out ^^\n\nTurn 1: Breath of Sorrow\nTurn 2: Blast of Hatred\nTurn 3: Surge of Power\nConviction comes in\nTurn 1+: Recovering from Surge of Power & Pass if needed\nBring in your Drafty\nTurn 1: Wind Buffet // Dignity is forced in\nTurn 2: Wild Winds\nTurn 3: Sandstorm\nTurn 4: Wild Winds\nConviction comes in\nTurn 1: Wild Winds if your Drafty is still alive\nBring in your Unstable Tendril\nTurn 1: Elementium Bolt\nTurn 2: Deep Burn\nTurn 3: Scorched Earth\nTurn 4: Deep Burn if needed\n",
		["name"] = "The Master of Pets (Elemental)",
		["tags"] = {
			"211A2GU", -- [1]
			"1125215", -- [2]
			"221721C", -- [3]
		},
		["teamID"] = "team:318",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
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
	["team:392"] = {
		["pets"] = {
			"BattlePet-0-000012BAC92C", -- [1]
			"BattlePet-0-000012B01ED3", -- [2]
			"BattlePet-0-000012BC0A5A", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/14906\n\nStrategy added by Simion\nScript thanks to isthevao\n\nTurn 1: Ion Cannon\nTurn 2: Darkmoon Tonk will get swept out for Iron Starlette\nTurn 3: Wind-Up\nTurn 4: Wind-Up, Trixy dies\nGlobs comes in\nTurn 1: Powerball until Iron Starlette dies\nTurn 7: Bring in Mechanical Pandaren Dragonling, Breath until Globs dies\nTurn 8: Thunderbolt\nTurn 9: Decoy\nTurn 10: Breath\nTurn 11: Breath\nTurn 12: Breath\nTurn 13: Thunderbolt\nTurn 14: Breath\nBring in Darkmoon Tonk to clean up with Charge or Ion Cannon if necessary\n",
		["name"] = "Dealing with Satyrs (Mech)",
		["tags"] = {
			"2027AI", -- [1]
			"11071BB", -- [2]
			"1225QC", -- [3]
		},
		["teamID"] = "team:392",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
		},
	},
	["team:427"] = {
		["pets"] = {
			"BattlePet-0-000012B99B2E", -- [1]
			"random:2", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3509\n\nStrategy added by DragonsAfterDark\nVideo for Fight (https://youtu.be/ppIiTwudh1c?t=163)\n\nTurn 1: Twilight Meteorite\nTurn 2: Phase Shift\nTurn 3-6: Tail Sweep\nTurn 7: Phase Shift\nTurn 8: Tail Sweep\nTurn 9: Twilight Meteorite\nSalty Bird comes in\nTurn 1+: Tail Sweep until Salty Bird dies\nGrommet comes in\nTurn 1: Phase Shift\nTurn 2: Tail Sweep\nTurn 3: Twilight Meteorite\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Dragon)",
		["tags"] = {
			"112B211", -- [1]
			"ZR2", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:427",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:109"] = {
		["pets"] = {
			"BattlePet-0-000012BA9562", -- [1]
			"BattlePet-0-000012B118ED", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/15344\n\nStrategy added by DragonsAfterDark\nVideo for Fight (https://www.youtube.com/watch?v=H6uGK8SiHUQ)\n\nTurn 1: Empowering Strikes\nTurn 2: Great Cleave\nTurns 3+4: Reanimate\nTurn 5: Pass\nTurn 6: Great Cleave\nTurn 7: Empowering Strikes\nTurn 8: Empowering Strikes\nGladiator Murkalot comes in\nTurn 1: Empowering Strikes\nTurn 2: Great Cleave\nTurn 3: Empowering Strikes\nBring in your Draenei Micro Defender\nTurn 1: Batter\nTurn 2: Batter\nTurn 3: Shield Block\nTurn 4+: Batter until Gladiator Murkimus is dead\nGladiator Murkalot comes in\nTurn 1: Explode\n",
		["name"] = "Tarr the Terrible",
		["tags"] = {
			"1213210", -- [1]
			"22181DA", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:109",
		["targets"] = {
			87110, -- [1]
		},
		["groupID"] = "group:11",
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
	["team:431"] = {
		["pets"] = {
			"BattlePet-0-000012BA9502", -- [1]
			"random:6", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/920\n\nStrategy added by Aranesh\nTurn 1: Arcane Blast\nPriority 1: Use Evanescence on CD\nPriority 2: Arcane Blast until Itchy dies\nSalty Bird comes in\nTurn 1: Wish\nTurn 2+: Arcane Blast until Salty Bird is dead\nGrommet comes in\nTurn 1: Arcane Blast\nTurn 2: Evanescence\nTurn 3: Wish\nTurn 4+: Arcane Blast until Grommet dies\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Magic)",
		["tags"] = {
			"21151IV", -- [1]
			"ZR6", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:431",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:273"] = {
		["pets"] = {
			"BattlePet-0-000012C56FF7", -- [1]
			"BattlePet-0-000008968258", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/404\n\nScript thanks to Camlas\n\nTurn 1: Bubble\nTurns 2+: Water Jet until Ruby is dead - your Mud Jumper should survive with 200-500 health\nCrystallus comes in\nTurn 1: Swap to your Anubisath Idol\nTurn 2: Stoneskin\nTurns 3+: Crush until Crystallus is dead\nFracture comes in\nTurn 1: Stoneskin\nTurn 2: Crush\nTurn 3: Crush\nTurn 4: Deflection\nTurns 5+: Crush until your Idol goes down - often it manages to finish the fight!\nBring back your Mud Jumper\nTurn 1: Bubble\nTurns 2+: Water Jet until Fracture is dead\n",
		["name"] = "Bordin Steadyfist",
		["tags"] = {
			"121C1D1", -- [1]
			"1216143", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:273",
		["groupID"] = "group:11",
		["targets"] = {
			66815, -- [1]
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
	["team:343"] = {
		["pets"] = {
			"BattlePet-0-000012F0D9B3", -- [1]
			"BattlePet-0-000006E4C7B9", -- [2]
			"BattlePet-0-000006E4C79F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/20065\n\nStrategy added by Kalagren\nBest breeds are B/B in first slot and H/P in 3rd slot.\n\nSharpclaw comes in\nTurn 1: Void Slap\nTurn 2: Unholy Ascension\nBring in your Soulbroken Whelpling\nPrio 1: Amplify Magic when Whelpling is in Undead phase\nPrio 2: Arcane Storm\nPrio 3: Shadow Talon (chosen for its higher low end than its slot 1 counterpart)\nBring in your Blightbreath\nSpam: Toxic Smoke\n",
		["name"] = "My Beast's Bidding (Undead)",
		["tags"] = {
			"02232V0", -- [1]
			"222B1TE", -- [2]
			"02271TD", -- [3]
		},
		["teamID"] = "team:343",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
		},
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
		["targets"] = {
			154918, -- [1]
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
	["team:345"] = {
		["pets"] = {
			"BattlePet-0-000012B01EBA", -- [1]
			"BattlePet-0-000012B99CE3", -- [2]
			"BattlePet-0-000012B902D0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9503\n\nStrategy added by DragonsAfterDark\nTurn 1: Rake\nTurn 2: Feathered Frenzy\nTurn 3+: Quills until Gulp dies\nEgcellent comes in\nTurn 1: Rake\nPriority 1: Feathered Frenzy on CD\nPriority 2: Quills all else\n**~~**: If your Lurking Owl Kitten dies on Egcellent, skip below for alternate moves.\nRed Wire comes in\nTurn 1: Quills\nBring in your Dreadmaw\nTurn 1: Flame Breath\nTurn 2: Deep Burn\nTurn 3: Burrow\nEgcellent comes in\nTurn 1: Burrow hits\nTurn 2: Flame Breath\nBring in your Spiketail Beaver\nTurn 1: Gnaw\n\n**~~**: Lurking Owl Kitten dies on Egcellent:\nBring in your Dreadmaw\nTurn 1: Flame Breath\nRed Wire comes in\nTurn 1: Flame Breath\nTurn 2+: Deep Burn until Dreadmaw dies (you may only get one hit)\nBring in your Spiketail Beaver\nTurn 1: Beaver Dam\nTurn 2: Chew\nTurn 3: Gnaw\nEgcellent comes in\nTurn 1: Gnaw\n",
		["name"] = "Tiny Poacher, Tiny Animals (Beast)",
		["tags"] = {
			"21181S2", -- [1]
			"22231T0", -- [2]
			"22271N3", -- [3]
		},
		["teamID"] = "team:345",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
		},
	},
	["team:128"] = {
		["pets"] = {
			"BattlePet-0-000012B66DA8", -- [1]
			"BattlePet-0-000012BA1A7F", -- [2]
			"random:0", -- [3]
		},
		["name"] = "Flowing Pandaren Spirit",
		["tags"] = {
			"21071C8", -- [1]
			"11261CI", -- [2]
			"ZR0", -- [3]
		},
		["teamID"] = "team:128",
		["groupID"] = "group:11",
		["targets"] = {
			68462, -- [1]
		},
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
	["team:301"] = {
		["pets"] = {
			"BattlePet-0-000007C1D04D", -- [1]
			"BattlePet-0-000012C8B182", -- [2]
			"BattlePet-0-000012B67649", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3892\n\nStrategy added by Berendain\nMinfernal and Netherspace Abyssal can be substituted in place of Abyssius.  Apply Immolation and Immolate, then use Meteor Strike, before using Immolate until your pet dies.\n\nIf you don't have an S/S Nordrassil Wisp, you can substitute it with other pets.  The best alternatives:  \n\nHyjal Wisp:  Use wish to heal up when you drop below 900 HP, use Sear Magic to cleanse poison, and kill Remy with Arcane Blast.\n\nSapphire Cub:  Screech, then Prowl, then Pounce until Remy dies.\n\nTurn 1: Immolation\nTurn 2: Volcano - if you are stunned, just pass and then use Volcano next turn, proceeding as written.\nTurn 3: Flamethrower until Abyssius dies.  Gusteau should die around the same time.\nRemy comes in\nBring in your Nordrassil Wisp\nTurn 1: Flash\nTurn 2: Light\nTurn 3: Pass\nTurn 4: Soul Ward\nTurns 5+: Repeat the previous four turns until Remy dies.\nDinner comes in\nTurn 1: Swap to your Enchanted Pen\nTurn 2: Quills\nTurn 3: Evanescence\nTurn 4: Quills\nTurn 5: Nevermore\nTurn 6: Pass if you were polymorphed, but otherwise, Quills until Dinner dies.  He is unable to use Frog Kiss again.\n",
		["name"] = "Chopped (Magic)",
		["tags"] = {
			"11141IO", -- [1]
			"2115H3", -- [2]
			"112B1L5", -- [3]
		},
		["teamID"] = "team:301",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
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
		["targets"] = {
			175784, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:376"] = {
		["pets"] = {
			"BattlePet-0-000012BF63D8", -- [1]
			"random:5", -- [2]
			"random:5", -- [3]
		},
		["name"] = "Training with Durian (Critter)",
		["tags"] = {
			"2119HO", -- [1]
			"ZR5", -- [2]
			"ZR5", -- [3]
		},
		["teamID"] = "team:376",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
		},
	},
	["team:87"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012EB3FDF", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/435\n\nScript thanks to aidos & Suddenimpact04\n\nTurn 1: Sandstorm\nTurns 2+: Crush until Skyshaper is dead\nFangor comes in\nTurn 1: Swap to your Clockwork Gnome\nTurn 2: Build Turret\nTurn 3: Metal Fist\nTurn 4: Metal Fist\nTurn 5: Build Turret\nTurns 6+: Metal Fist until Fangor is dead\nDor the Wall comes in\nTurns 1+: Metal Fist until Clockwork Gnome dies\nBring back in your Anubisath Idol\nTurn 1: Sandstorm\nTurns 2+: Crush & Sandstorm until Dor is dead. There is no need to use Deflection at this point.\n",
		["name"] = "Hyuna of the Shrines",
		["tags"] = {
			"1116143", -- [1]
			"111B8L", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:87",
		["targets"] = {
			66730, -- [1]
		},
		["groupID"] = "group:11",
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
	["team:312"] = {
		["pets"] = {
			"BattlePet-0-000012B58B24", -- [1]
			"BattlePet-0-000012B01ED3", -- [2]
			"BattlePet-0-000012B146CA", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/7412\n\nStrategy added by Begija\nThis fight is quite hard, but works 100% of the time. Part of strategy used from other guide here.\n\nTurn 1: Decoy\nTurn 2-6: Flyby until Zeppelin dies\nTurn 7 / Mech: Explode when ressurected\nBring in your Iron Starlette\nTurn 1: Wind-Up\nTurn 2: Swap to your Lil' Bling\nTurns 3-5: Inflation\nBring in your Iron Starlette\nTurn 1: Supercharge\nTurn 2: Wind-Up\n",
		["name"] = "Flummoxed (Mech)",
		["tags"] = {
			"222CAJ", -- [1]
			"12171BB", -- [2]
			"2115198", -- [3]
		},
		["teamID"] = "team:312",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
	},
	["team:316"] = {
		["pets"] = {
			"BattlePet-0-000012C56B2C", -- [1]
			"BattlePet-0-000012C3D91A", -- [2]
			"BattlePet-0-000012B99C7D", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10197\n\nStrategy added by DragonsAfterDark\nTurn 1: Acidic Goo\nTurn 2: Creeping Ooze\nTurn 3: Ooze Touch\nTurn 4: Ooze Touch\nTurn 5: Ooze Touch\nConviction comes in\nTurn 1: Acidic Goo\nTurn 2+: Ooze Touch until Bloodfeaster Larva is dead\n\nBring in your Void-Scarred Locust\nTurn 1: Toxic Fumes\nPriority 1: If Conviction is below 400 hp: Pass twice\nPriority 2: Contagion Strike until Conviction is dead\nDignity comes in\nTurn 1: Contagion Strike\nTurn 2: Psychic Blast\nTurn 3+: Alternate between Contagion Strike & Psychic Blast until Void-Scarred Locust dies\n\nBring in your Lovebird Hatchling\nClean up with Peck & Predatory Strike\n",
		["name"] = "The Master of Pets (Critter)",
		["tags"] = {
			"22282BE", -- [1]
			"22162PG", -- [2]
			"10251F7", -- [3]
		},
		["teamID"] = "team:316",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
	},
	["team:179"] = {
		["pets"] = {
			"BattlePet-0-000012B521D4", -- [1]
			"BattlePet-0-000012B146CB", -- [2]
			"BattlePet-0-000012B822BF", -- [3]
		},
		["notes"] = "Strategy added by WhyDaRumGone\nLevel pet is not needed, just to fill in time.\n\nTurn 1: Curse of Doom\nTurn 2: Haunt\nBring in your Ikky\nTurn 3: Black Claw\nTurns 4-6: Flock\nTurn 7: Savage Talon\nNote:: If Ikky dies now, bring in your Level Pet (or Unborn Val'kyr if you don't care about xp)\nTurn 8: Swap to your Level Pet / Unborn Val'kyr (level pets in) OR Pass if you don't care about xp\n",
		["name"] = "Blackmane",
		["tags"] = {
			"121316M", -- [1]
			"11181FS", -- [2]
			"11172OI", -- [3]
		},
		["teamID"] = "team:179",
		["targets"] = {
			150858, -- [1]
		},
		["groupID"] = "group:none",
		["preferences"] = {
			["minHP"] = 790,
			["minXP"] = 7,
		},
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
		["targets"] = {
			161650, -- [1]
		},
		["groupID"] = "group:5",
	},
	["team:374"] = {
		["pets"] = {
			"BattlePet-0-000012C56FF7", -- [1]
			"BattlePet-0-000012C570E8", -- [2]
			"random:9", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/516\n\nScript thanks to wist\n\nTurn 1: Water Jet\nTurn 2: Mudslide\nTurn 3: Bubble\nTurns 4+: Water Jet until Sunny is dead\nRoots comes in\nTurns 1+: Water Jet until Roots is dead as well\nBeaky comes in\nTurn 1: Bubble\nTurn 2: Mudslide\nTurns 3+: Water Jet until Mud Jumper dies\nBring in your Frog\nTurns 1+: Water Jet until Beaky is dead\n",
		["name"] = "Training with Durian (Aquatic)",
		["tags"] = {
			"111C1D1", -- [1]
			"111CHP", -- [2]
			"ZR9", -- [3]
		},
		["teamID"] = "team:374",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
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
	["team:432"] = {
		["pets"] = {
			"BattlePet-0-000012BC0A5A", -- [1]
			"BattlePet-0-000012EB3FDF", -- [2]
			"random:10", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/654\n\nScript thanks to Sunshine\n\nTurn 1: Bombing Run\nTurn 2: Breath\nTurn 3: Decoy\nTurn 4: Breath\nTurn 5: Breath\nTurn 6: Bombing Run\nTurns 7+: Breath until Itchy is dead\nSalty Bird comes in\nTurns 1+: Breath until your Dragonling dies\nBring in your Clockwork Gnome\nTurn 1: Build Turret\nTurns 2+: Railgun until Salty Bird is dead\nGrommet comes in\nTurns 1+: Build Turret when available, otherwise Blitz until your Gnome dies\nBring in your third Mech\nTurns 1+: Use any standard attacks to kill Grommet\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Mech)",
		["tags"] = {
			"1125QC", -- [1]
			"221B8L", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:432",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
		["targets"] = {
			175778, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:320"] = {
		["pets"] = {
			"BattlePet-0-000012B822C0", -- [1]
			"BattlePet-0-000012B99945", -- [2]
			"BattlePet-0-000008968258", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/16112\n\nStrategy added by DragonsAfterDark\nIf things go well, you won't need the Idol, but Conviction can get a bit tricky so it's there just in case.\n\nTurn 1: Creeping Insanity\nTurn 2: Spiritfire Bolt\nTurn 3: Spiritfire Bolt\nTurn 4: Soulrush\nConviction comes in\nTurn 1+: Spiritfire Bolt until Void-Scarred Anubisath dies, Pass if Conviction has Dark Rebirth on\nBring in your Ranishu Runt\nTurn 1: Focus\nTurn 2+: Zap until Conviction dies, Pass if Dark Rebirth is up\nDignity comes in\n~: Priorities for Ranishu Runt & Anubisath Idol\nPriority 1: Sandstorm when Dignity is up\nPriority 2: Zap or Crush until Dignity dies\n",
		["name"] = "The Master of Pets (Humanoid)",
		["tags"] = {
			"22262OH", -- [1]
			"11142BH", -- [2]
			"1116143", -- [3]
		},
		["teamID"] = "team:320",
		["groupID"] = "group:12",
		["targets"] = {
			105250, -- [1]
		},
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
		["targets"] = {
			162461, -- [1]
		},
		["groupID"] = "group:none",
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
		["targets"] = {
			141814, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:308"] = {
		["pets"] = {
			"BattlePet-0-000012C2230D", -- [1]
			"BattlePet-0-000012C2DA73", -- [2]
			"BattlePet-0-000012B5CB69", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/10793\n\nStrategy added by Berendain\nYour third pet can be any elemental with one of the following abilities:\n\nPuppies of the Flame\nSons of the Flame\nSons of the Root\n\nTurn 1: Blistering Cold whenever available\nTurn 2: Ironbark until you die or can use Blistering Cold again\nBring in your Ominous Flame\nTurn 1: Forboding Curse\nTurn 2: Scorched Earth\nTurn 3: Spiritfire Bolt until your  Ominous Flame dies\nBring in your Blazehound\nTurns 1-3: Puppies of the Flame\nTurn 4: Any standard attack will finish the fight\n",
		["name"] = "Flummoxed (Elemental)",
		["tags"] = {
			"20181BK", -- [1]
			"222819N", -- [2]
			"001B216", -- [3]
		},
		["teamID"] = "team:308",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
	},
	["team:111"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012BAC92C", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/419\n\nScript thanks to aidos\n\nTurn 1: Sandstorm\nTurn 2: Crush\nTurn 3: Deflection\nTurn 4: Crush\nTurn 5: Crush\nTurn 6: Crush\nTurn 7: Deflection\nTurn 8: Crush\nTurn 9: Crush\nThen:: Start from beginning and continue until Siren is dead\nToothbreaker comes in\nTurn 1: Pass\nTurn 2: Pass\nTurn 3: Pass\nTurn 4: Deflection \nTurn 5: Crush\nTurn 6: Crush\nTurn 7: Crush\nTurn 8: Crush\nTurn 9: Deflection\nTurn 10: Sandstorm\nTurn 11: Pass\nTurn 12: Pass\nTurn 13: Crush\nTurn 14: Deflection\nTurn 15: Crush until Toothbreaker dies\nBrood of Mothallus comes in\nTurn 1: Crush\nTurn 2: Pass\nTurn 3: Deflection\nTurn 4: Swap to your Darkmoon Tonk\nTurn 5: Shock and Awe\nTurn 6: Missile\nTurn 7: Missile\nTurn 8: Pass\nTurn 9: Ion Cannon\n",
		["name"] = "Farmer Nishi",
		["tags"] = {
			"1116143", -- [1]
			"1127AI", -- [2]
			"11261CI", -- [3]
		},
		["teamID"] = "team:111",
		["targets"] = {
			66734, -- [1]
		},
		["groupID"] = "group:11",
	},
	["team:329"] = {
		["pets"] = {
			"BattlePet-0-000012B99CF7", -- [1]
			"BattlePet-0-000012B5C2FF", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9107\n\nStrategy added by DragonsAfterDark\nTurn 1: Slow and Steady\nTurn 2: Slow and Steady hits\nTurn 3: Preen\nTurn 4: Scratch\nUndead: Pass\nCrawdead comes in\nTurn 1: Scratch\nTurn 2: Preen\nTurn 3: Slow and Steady\nTurn 4: Slow and Steady hits\nUndead: Pass\nGnaw comes in\nTurn 1+: Scratch until Poro dies\n\nBring in your Direbeak Hatchling\nTurn 1: Ironskin\nTurn 2+3: Falcosaur Swarm!\nTurn 4: Predatory Strike\nTurn 5+: Falcosaur Swarm!\n",
		["name"] = "Jarrun's Ladder (Flyer)",
		["tags"] = {
			"21272CK", -- [1]
			"12171TN", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:329",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:435"] = {
		["pets"] = {
			"BattlePet-0-000012B5CB5D", -- [1]
			"random:8", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3550\n\nStrategy added by DragonsAfterDark\nTurn 1: Great Sting\nTurn 2-5: Cleave\nRepeat 1-5 until Backline Enemy Pets die\nTurn 1+: Flame Breath until Foof dies\n",
		["name"] = "Fight Night: Amalia (Beast)",
		["tags"] = {
			"211A219", -- [1]
			"ZR8", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:435",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:420"] = {
		["pets"] = {
			"BattlePet-0-000006E4C775", -- [1]
			"BattlePet-0-000012B118E8", -- [2]
			"BattlePet-0-000012B01DE0", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3277\n\nStrategy added by DragonsAfterDark\nTurn 1: Call Blizzard -- Sir Murkeston uses Falling Murloc & is stunned\nTurn 2: Ice Lance -- This will hit Coach as it comes in from the stun swap\nTurn 3: Ice Tomb -- Coach uses Lift-Off\nTurn 4: Ice Lance -- Lift-Off comes down \nTurn 5: Ice Lance -- Ice Tomb hits & Coach dies\nTurn 6: Ice Lance -- Sir Murkeston uses Falling Murloc & Father Winter's Helper dies\n\nBring in your Rotten Little Helper\nTurn 1: Ice Tomb -- Applies to Greatest Foe\nTurn 2: Ice Lance -- Greatest Foe uses Darkflame\nTurn 3: Ice Lance -- Greatest Foe uses Healing Flame & Ice Tomb drops\nTurn 4: Call Blizzard -- This will hit Sir Murkeston as he comes in from the stun swap\nTurn 5: Ice Lance -- Greatest Foe is swapped in from Righteous Inspiration and dies\nTurn 6: Ice Lance -- Sir Murkeston dies\n\nBring in your Winter's Little Helper\nIf someone dies early from a crit, you may need the Winter's Little Helper to continue the steps wherever it left off in the strat\n",
		["name"] = "Fight Night: Sir Galveston (Humanoid)",
		["tags"] = {
			"21133N", -- [1]
			"22241A5", -- [2]
			"21133O", -- [3]
		},
		["teamID"] = "team:420",
		["groupID"] = "group:12",
		["targets"] = {
			99182, -- [1]
		},
	},
	["team:341"] = {
		["pets"] = {
			"BattlePet-0-000012B822C1", -- [1]
			"BattlePet-0-000012B67649", -- [2]
			"random:6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/2765\n\nStrategy added by DragonsAfterDark\nUpdated 11/17/20 with a new pet in slot #1\n\nTurn 1: Chaos Beam\nTurn 2: Chaos Beam\nTurn 3: Chaos Beam\nTurn 4: Chaos Beam\nWumpas comes in\nTurn 5: Life Exchange\nTurn 6: Nightmare or Pass if Stunned\nTurn 7: Chaos Beam or Nightmare\nTurn 8: Chaos Beam\nTurn 9: Chaos Beam\nTurn 10: Chaos Beam\nBaeloth comes in\nTurn 1+2: Pass \nTurn 3: Chaos Beam (Doesn't matter if it hits, but you might as well try)\nBring in your Enchanted Pen\nPriority 1: Evanescence when Baeloth's CD on Crystal Prison is up\nPriority 2: Apply Forboding Curse and reapply when there is 1 round left\nPriority 3: Quills all else\n",
		["name"] = "My Beast's Bidding (Magic)",
		["tags"] = {
			"11282OK", -- [1]
			"111B1L5", -- [2]
			"ZR6", -- [3]
		},
		["teamID"] = "team:341",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:436"] = {
		["pets"] = {
			"BattlePet-0-000012C8CD9E", -- [1]
			"BattlePet-0-000006E4C788", -- [2]
			"BattlePet-0-000012C8C924", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/841\n\nScript thanks to Beornwulf\n\nRepeat the following rotation until your first Fawn dies:\n\nTurn 1: Nature's Ward\nTurns 2-4: Stampede\nTurn 5: Headbutt\n\nWhen you bring in your next Fawn, check if the \"Shattered Defenses\" debuff is still on the enemy pet. if so, start with Headbutt, then start the rotation from top.\nThis should take care of all enemy pets.\n",
		["name"] = "Fight Night: Amalia (Critter)",
		["tags"] = {
			"2229DV", -- [1]
			"222C6B", -- [2]
			"2223ET", -- [3]
		},
		["teamID"] = "team:436",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
		},
	},
	["team:222"] = {
		["pets"] = {
			"BattlePet-0-00000D450505", -- [1]
			0, -- [2]
			0, -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13226\n\nStrategy added by WildCard\nThe same team can be used for all < 21 trainers.\nFull TD Script for them is in this comment (https://wow-petguide.com/Comment/95382).\n\nTurn 1: Swap to your Level Pet #2\nTurn 2: Swap to your Level Pet #3\nTurn 3: Swap to your Celestial Dragon\nPriority 1: Ancient Blessing if health < 70%\nPriority 2: Moonfire\nPriority 3: Flamethrower\n",
		["name"] = "Lydia Accoste",
		["tags"] = {
			"11167V", -- [1]
			"ZL", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:222",
		["groupID"] = "group:11",
		["targets"] = {
			66522, -- [1]
		},
		["preferences"] = {
			["minHP"] = 388,
			["minXP"] = 1,
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
		["targets"] = {
			175780, -- [1]
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
		["targets"] = {
			141215, -- [1]
		},
		["groupID"] = "group:none",
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:305"] = {
		["pets"] = {
			"BattlePet-0-000012C63412", -- [1]
			"BattlePet-0-000012B482D1", -- [2]
			"BattlePet-0-000012B482D2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13090\n\nStrategy added by Enzzo#1146\nGot this one from an anonymous comment on another strat. It worked really well and I didn't even need the third pet. \nTD Script by AramilGaeda\n\nTurn 1: Brittle Webbing\nTurn 2: Leech Life\nRepeat turns 1 and 2 until your spider dies.\nBring in your Zandalari Kneebiter\nTurn 1: Black Claw\nTurn 2+: Hunting Party\nBy now, Flummox may be dead\nIf your Zandalari Kneebiter dies, bring in your Zandalari Anklerender\nTurn 1: Black Claw\nTurn 2+: Hunting Party\n",
		["name"] = "Flummoxed (Beast)",
		["tags"] = {
			"221BCS", -- [1]
			"220514S", -- [2]
			"202A15R", -- [3]
		},
		["teamID"] = "team:305",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
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
		["targets"] = {
			197350, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:375"] = {
		["pets"] = {
			"BattlePet-0-000012C222D9", -- [1]
			"BattlePet-0-000012BA9540", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/703\n\nScript thanks to wist and Taizun\n\nTurn 1: Prowl\nTurn 2: Call Darkness\nTurn 3: Swap to your River Calf\nTurns 4+: Water Jet until Sunny is dead\nRoots comes in\nTurn 1: Stoneskin\nTurns 2+: Water Jet until River Calf dies\nBring back your Feline Familiar\nTurns 1+: Onyx Bite until Roots is dead\nBeaky comes in\nTurn 1: Prowl\nTurns 2+: Onyx Bite until Beaky is dead\n",
		["name"] = "Training with Durian (Beast)",
		["tags"] = {
			"122A9V", -- [1]
			"22191H3", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:375",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
		},
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
		["targets"] = {
			119409, -- [1]
		},
		["groupID"] = "group:4",
	},
	["team:430"] = {
		["pets"] = {
			"BattlePet-0-000012C8BB48", -- [1]
			"BattlePet-0-000008968258", -- [2]
			"random:1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/502\n\nTurn 1: Flyby\nTurn 2: Quills\nTurns 3+4: Lift-Off\nTurns 5+: Quills until Itchy is dead\nSalty Bird comes in\nTurn 1: Swap to your Anubisath Idol\nTurn 2: Sandstorm\nTurns 3+: Crush until the Salty Bird is dead\nGrommet comes in\nTurns 1+: Keep Sandstorm active and use Crush in between. Your Idol will manage easily.\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Humanoid)",
		["tags"] = {
			"1123145", -- [1]
			"1106143", -- [2]
			"ZR1", -- [3]
		},
		["teamID"] = "team:430",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:409"] = {
		["pets"] = {
			"BattlePet-0-000012B66DA8", -- [1]
			"BattlePet-0-000012BA9508", -- [2]
			"BattlePet-0-000012D92DF6", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/509\n\nScript thanks to Wist\n\nTurn 1: Dodge\nTurns 2+: Alpha Strike until Jinx drops below 400 health\nThen:: Ravage\nRocket comes in\nTurn 1: Swap to your Gilnean Raven\nTurn 2: Call Darkness\nTurn 3: Nocturnal Strike\nTurn 4: Alpha Strike\nTurn 5: Alpha Strike\nTurn 6: Alpha Strike\nTurn 7: Nocturnal Strike - Rocket dies\nIf your Gilnean Raven died too early, bring back your Teroclaw Hatchling and finish Rocket with Alpha Strike - then on Marshmallow use Alpha Strike on the first turn and continue with the turns below.\nMarshmallow comes in\nTurn 1: Swap back to your Teroclaw Hatchling\nTurn 2: Dodge\nTurns 3+: Alpha Strike until Teroclaw Hatchling dies\nBring in your Moth\nTurn 1: Moth Dust\nTurn 2: Cocoon Strike\nTurns 3+: Slicing Wind until Marshmallow is dead\n",
		["name"] = "Fight Night: Tiffany Nelson (Flyer)",
		["tags"] = {
			"21271C8", -- [1]
			"2213JM", -- [2]
			"1128MS", -- [3]
		},
		["teamID"] = "team:409",
		["groupID"] = "group:12",
		["targets"] = {
			97804, -- [1]
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
		["targets"] = {
			175781, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:369"] = {
		["pets"] = {
			"BattlePet-0-000012B99CF7", -- [1]
			"BattlePet-0-000012B66DA8", -- [2]
			"BattlePet-0-000012B118A8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/8741\n\nStrategy added by Mampii#2342\nThe only way this strategy can fail is due to missing with Alpha Strike too many times. Enjoy Folks ;)\n\nScript thanks to wist\n\n\nTurns 1-2: Slow and Steady\nTurn 3: Scratch\nLil' Spirit Guide Dies\nUndead: Nature's Touch\nQuillino comes in\nTurn 5+6: Scratch until Poro dies\nBring in your Teroclaw Hatchling\nTurn 7: Nature's Ward\nTurn 8+9: Alpha Strike until Quillino HP <618\nTurns 10-11: Ravage\nNote: If Quillino kills Teroclaw Hatchling finish off with Sentinel's Companion using Dark Talon\nFethyr comes in\nTurn 12: Nature's Ward\nTurn 13: Alpha Strike until Teroclaw Hatchling dies\nBring in your Sentinel's Companion\nTurn 14: Soulrush\nTurn 15/17: Dark Talon\nNote: If Fethyr casts Lift off use Ethereal\nYOU WIN !!!\n",
		["name"] = "Training with Bredda (Flyer)",
		["tags"] = {
			"22272CK", -- [1]
			"22271C8", -- [2]
			"22281GV", -- [3]
		},
		["teamID"] = "team:369",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
	},
	["team:297"] = {
		["pets"] = {
			"BattlePet-0-000012B4838C", -- [1]
			"BattlePet-0-000012B146CC", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/751\n\nScript thanks to KyooShoo\n\nTurn 1: Emerald Presence\nFrom this point always refresh Emerald Presence when it runs out\nUse Emerald Dream when you drop below half health\nUse Breath in between.\n\nOften your Emerald Proto-Whelp can solo the fight, but if he dies to Dinner in the end, bring in Chrominius and finish with Howl + Surge of Power.\n",
		["name"] = "Chopped (Dragon)",
		["tags"] = {
			"122814F", -- [1]
			"0126140", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:297",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
		},
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
	["team:377"] = {
		["pets"] = {
			"BattlePet-0-000012B48707", -- [1]
			"BattlePet-0-000012B4861E", -- [2]
			"random:2", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/725\n\nScript thanks to wist\n\nTurn 1: Frost Breath\nTurn 2: Arcane Storm\nTurns 3+: Mana Surge - Sunny dies\nRoots comes in and ideally gets hit in the face\nTurns 1+: Frost Breath until Nexus Whelpling dies\nBring in your Nether Faerie Dragon\nTurn 7: Arcane Blast until Roots dies - if he's still alive\nBeaky comes in \nTurn 1: Moonfire\nTurn 2: Life Exchange\nTurns 3+: Arcane Blast until Beaky dies\n",
		["name"] = "Training with Durian (Dragon)",
		["tags"] = {
			"222814D", -- [1]
			"2215HD", -- [2]
			"ZR2", -- [3]
		},
		["teamID"] = "team:377",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
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
		["targets"] = {
			154910, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:378"] = {
		["pets"] = {
			"BattlePet-0-000012B485C2", -- [1]
			"random:7", -- [2]
			"random:7", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/642\n\nScript thanks to Taizun\n\nTurn 1: Whirlpool\nTurn 2: Water Jet\nTurns 3+4: Dive\nTurns 5+: Water Jet until Sunny dies\nRoots comes in\nTurn 1: Whirlpool\nTurn 2: Water Jet\nTurns 3+4: Dive\nTurns 5+: Water Jet until Roots dies\nBeaky comes in\nTurn 1: Whirlpool\nTurns 2+: Water Jet until your Water Spirit dies\n\nBring in your other level 25 Elemental and kill Beaky with standard attacks.\n",
		["name"] = "Training with Durian (Elemental)",
		["tags"] = {
			"1219R4", -- [1]
			"ZR7", -- [2]
			"ZR7", -- [3]
		},
		["teamID"] = "team:378",
		["groupID"] = "group:12",
		["targets"] = {
			99035, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:335"] = {
		["pets"] = {
			"BattlePet-0-000012B482D2", -- [1]
			"BattlePet-0-0000081FC5DE", -- [2]
			"random:8", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1216\n\nStrategy added by Zane#6890\nTurn 1: Black Claw\nTurns 2+3: Hunting Party\nTurn 3: Leap - Thrugtusk dies\nWumpas comes in\nTurn 1: Black Claw\nTurn 2: Swap to your Direhorn Runt\nTurns 3-5: Stampede - Wumpas dies\nBaeloth comes in\nTurn 1: Pass\nTurn 2: Trihorn Shield\nTurns 3-5: Stampede\nTurn 6: Trihorn Charge - Baeloth dies\n",
		["name"] = "My Beast's Bidding (Beast)",
		["tags"] = {
			"212A15R", -- [1]
			"122915L", -- [2]
			"ZR8", -- [3]
		},
		["teamID"] = "team:335",
		["groupID"] = "group:12",
		["targets"] = {
			98270, -- [1]
		},
		["preferences"] = {
			["minXP"] = 1,
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
		["targets"] = {
			161663, -- [1]
		},
		["groupID"] = "group:5",
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
	["team:296"] = {
		["pets"] = {
			"BattlePet-0-000012B67A3C", -- [1]
			"BattlePet-0-000012B99C95", -- [2]
			"BattlePet-0-000012B99C7D", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/16990\n\nStrategy added by DragonsAfterDark\nTurn 1: Adrenaline Rush\nTurn 2: Flamethrower\nTurn 3: Burn\nTurn 4: Burn - Gusteau dies and resurrects & kills your Crispin\nBring in your Void-Scarred Rat\nTurn 1: Creepy Chomp - to kill Gusteau\nRemy comes in\nTurn 1: Feed\nTurn 2: Creepy Chomp\nTurn 3: Bloodfang\nDinner comes in\nTurn 1: Creepy Chomp - Blocked by Bubble\nTurn 2: Creepy Chomp - Blocked by Bubble\nTurn 3+: If you survive use Feed & Bloodfang on CD & Creepy Chomp otherwise\nBring in your Lovebird Hatchling\n> 630 hp: Alpha Strike\n< 631 hp: Predatory Strike\n",
		["name"] = "Chopped (Critter)",
		["tags"] = {
			"11281MO", -- [1]
			"12242OP", -- [2]
			"21251F7", -- [3]
		},
		["teamID"] = "team:296",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
		},
	},
	["team:390"] = {
		["pets"] = {
			"BattlePet-0-000008968258", -- [1]
			"BattlePet-0-000012B5C607", -- [2]
			"random:1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/845\n\nStrategy added by Aranesh\nTurn 1: Sandstorm\nTurn 2: Deflection\nTurn 3: Crush\nTurn 4: Crush\nTurn 5: Crush\nTurn 6: Crush\nTurn 7: Sandstorm - Trixy should die here. If not, it can work out but is a little risky. If your third pet is level 25 it's worth giving it a shot.\nTurn 8: Deflection\nTurns 9+: Crush until Trixy is dead (if that didn't happen earlier)\nGlobs comes in\nUse your spells in this priority list until Anubisath Idol dies\nPrio 1: Deflection\nPrio 2: Sandstorm\nPrio 3: Crush\n\nBring in your Kun-Lai Runt\nTurns 1+: Takedown until Globs is dead\nNightmare Sprout comes in\nTurn 1: Frost Shock\nTurn 2: Deep Freeze\nTurn 3: Takedown\nTurn 4: Frost Shock\nTurn 5: Takedown\nTurn 6: Frost Shock\nTurn 7: Deep Freeze\nTurns 8+: Takedown until Nightmare Sprout is dead\n",
		["name"] = "Dealing with Satyrs (Humanoid)",
		["tags"] = {
			"1116143", -- [1]
			"222814E", -- [2]
			"ZR1", -- [3]
		},
		["teamID"] = "team:390",
		["groupID"] = "group:12",
		["targets"] = {
			104970, -- [1]
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
		["targets"] = {
			150917, -- [1]
		},
		["groupID"] = "group:8",
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
		["targets"] = {
			189376, -- [1]
		},
		["groupID"] = "group:none",
	},
	["team:332"] = {
		["pets"] = {
			"BattlePet-0-000012B01ED3", -- [1]
			"BattlePet-0-000012BC0A5A", -- [2]
			"random:10", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/976\n\nDragonsAfterDark: I've updated the strat for a couple of efficiency changes, and added a script. Happy battling!\n\nTurn 1: Powerball\nTurn 2: Powerball\nTurn 3: Wind-Up\nTurn 4+: Powerball until Mist Wraith dies\nThen:: Supercharge - Mist Wraith dies the second time\nCrawdead comes in\nTurn 1: Wind-Up - Crawdead resurrects\nTurn 2: Swap to your Mechanical Pandaren Dragonling\nGnaw comes in\nTurn 1: Thunderbolt\nTurns 2+: Breath until Gnaw has below 560 health\nThen:: Explode\n",
		["name"] = "Jarrun's Ladder (Mech)",
		["tags"] = {
			"11171BB", -- [1]
			"1215QC", -- [2]
			"ZRA", -- [3]
		},
		["teamID"] = "team:332",
		["groupID"] = "group:12",
		["targets"] = {
			105455, -- [1]
		},
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
	["team:367"] = {
		["pets"] = {
			"BattlePet-0-000012B146CC", -- [1]
			"BattlePet-0-000012B48707", -- [2]
			"BattlePet-0-000012B4861E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/602\n\nScript thanks to wist\n\nTurn 1: Arcane Explosion\nTurn 2: Howl\nTurns 3-5: Surge of Power\nQuillino comes in and your Chrominius dies\nBring in your Nexus Whelpling\nTurn 1: Arcane Storm\nTurns 2+: Mana Surge until Quillino dies\nIf your Nexus Whelpling dies first, no problem. Bring in your Nether Faerie Dragon and finish off Quillino with Arcane Blast, then jump down to the last 2 steps.\nFethyr comes in\nTurn 1: Pass\nTurn 2: Arcane Storm\nTurns 3+: Tail Sweep until Nexus Whelpling dies\nBring in your Nether Faerie Dragon\nTurn 1: Moonfire\nTurns 2+: Arcane Blast until Fethyr is dead\n",
		["name"] = "Training with Bredda (Dragon)",
		["tags"] = {
			"2126140", -- [1]
			"122814D", -- [2]
			"2215HD", -- [3]
		},
		["teamID"] = "team:367",
		["groupID"] = "group:12",
		["targets"] = {
			99077, -- [1]
		},
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
		["targets"] = {
			141292, -- [1]
		},
		["groupID"] = "group:none",
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
	["team:300"] = {
		["pets"] = {
			"BattlePet-0-000012B5C607", -- [1]
			"BattlePet-0-000008968258", -- [2]
			"random:1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/9028\n\nStrategy added by DragonsAfterDark\nAbility variation for this strat here (https://www.wow-petguide.com/?Strategy=748)\n\nTurn 1: Frost Shock\nTurn 2: Deep Freeze\nTurn 3: Frost Shock -- // -- This hits Remy\nTurn 4: Thrash\nTurn 5: Frost Shock\nTurn 6+: Thrash until Remy dies\nGusteau comes in\nTurn 1: Frost Shock\nTurn 2: Deep Freeze\nTurn 3: Frost Shock -- // -- This hits Dinner\nTurn 4: Thrash\nTurn 5: Thrash\nTurn 6+: Frost Shock until you're faster\n~~: Thrash until Kun-Lai Runt or Dinner dies\n\nBring in your Anubisath Idol\nAgainst Dinner:\nPriority 1: Crush to clear Bubble\nPriority 2: Sandstorm\nPriority 3: Crush all else\n\nAgainst Gusteau:\nPriority 1: Crush until Mech Rez\nPriority 2: Rupture on Mech Rez\nPriority 3: Crush all else\n",
		["name"] = "Chopped (Humanoid)",
		["tags"] = {
			"122814E", -- [1]
			"1126143", -- [2]
			"ZR1", -- [3]
		},
		["teamID"] = "team:300",
		["groupID"] = "group:12",
		["targets"] = {
			105674, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
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
	["team:61"] = {
		["pets"] = {
			"BattlePet-0-000012B99D22", -- [1]
			"BattlePet-0-00000839A881", -- [2]
			"BattlePet-0-000012BA1A7F", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/1935\n\nStrategy added by Sully\nScript thanks to TURBOKillex\n\nTurn 1: Diseased Bite\nTurn 2: Ethereal\nTurn 3: Ghostly Bite\nTurn 4: Pass - Yen swaps out and bolo comes in\nTurn 5: Diseased Bite until Ghastly Kid Resses\nTurn 7: Ghostly Bite - Bolo Dies and so does Ghastly Kid\nBring in your Fel Pup\nTurn 1: Crouch\nPass if you are stunned\nTurn 2: Diseased Bite until Yen dies\nTurn 4: Diseased Bite\nTurn 6: Howl\nTurn 7: Diseased Bite until Li dies\n",
		["name"] = "Taran Zhu",
		["tags"] = {
			"22161D2", -- [1]
			"21151JS", -- [2]
			"00061CI", -- [3]
		},
		["teamID"] = "team:61",
		["targets"] = {
			71931, -- [1]
		},
		["groupID"] = "group:11",
	},
	["team:356"] = {
		["pets"] = {
			"BattlePet-0-000012BF63D8", -- [1]
			"BattlePet-0-000012C4AA56", -- [2]
			"random:5", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/496\n\npbScript thanks to isthevao#1164\n\nTurn 1: Headbutt\nTurn 2: Pass\nTurn 3: Pass\nTurn 4: Shell Shield\nTurn 5: Ooze Touch\nTurn 6: Headbutt\nTurns 7+: Ooze Touch until Rocklick is dead\nSlow Moe comes in\nTurn 1: Ooze Touch\nTurn 2: Shell Shield\nTurn 3: Headbutt\nTurns 4+: Ooze Touch until your snail dies\nBring in your Rabbit\nTurn 1: Dodge\nTurns 2+: Scratch until Slow Moe is dead (should be 1 or 2 turns)\nSnot comes in\nTurn 1: Scratch\nTurn 2: Scratch\nTurn 3: Dodge\nTurn 4: Scratch\nTurns 5-6: Burrow\nTurn 7: Scratch\nTurn 8: Dodge\nTurns 9+: Scratch until Snot is dead",
		["name"] = "Snail Fight! (Critter)",
		["tags"] = {
			"1229HO", -- [1]
			"121BMP", -- [2]
			"ZR5", -- [3]
		},
		["teamID"] = "team:356",
		["groupID"] = "group:12",
		["targets"] = {
			104553, -- [1]
		},
		["preferences"] = {
			["minXP"] = 15,
		},
	},
	["team:306"] = {
		["pets"] = {
			"BattlePet-0-000012C4F6DE", -- [1]
			"BattlePet-0-000012C4AA56", -- [2]
			"BattlePet-0-000012C8B13E", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/737\n\nScript and strategy update thanks to Berendain\n\nTurn 1: Apocalypse\nTurn 2: Pass\nTurn 3: Swap to your Tolai Hare\nTurn 4: Dodge\nTurn 5: Pass\nTurns 6+7: Burrow\nTurn 8+: Pass until dead\nBring in your Elfin Rabbit\nTurn 9: Dodge\nTurn 10: Pass\nTurns 11-12: Burrow\nTurns 14+: Pass until your Rabbit dies\nBring in your Roach\nTurn 1: Survival\nTurn 2: Pass - Apocalypse kills Flummox :-)\n",
		["name"] = "Flummoxed (Critter)",
		["tags"] = {
			"222BD8", -- [1]
			"221BMP", -- [2]
			"2213EV", -- [3]
		},
		["teamID"] = "team:306",
		["groupID"] = "group:12",
		["targets"] = {
			97709, -- [1]
		},
	},
	["team:278"] = {
		["pets"] = {
			"BattlePet-0-00000D450505", -- [1]
			0, -- [2]
			0, -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/13420\n\nStrategy added by WildCard\nThe same team can be used for all < 21 trainers.\nFull TD Script for them is in this comment (https://wow-petguide.com/Comment/95382).\n\nTurn 1: Swap to your Level Pet #2\nTurn 2: Swap to your Level Pet #3\nTurn 3: Swap to your Celestial Dragon\nPriority 1: Ancient Blessing if health < 70%\nPriority 2: Moonfire if  (ID: 596) duration 1 or none\nPriority 3: Flamethrower\n",
		["name"] = "Nicki Tinytech",
		["tags"] = {
			"11167V", -- [1]
			"ZL", -- [2]
			"ZL", -- [3]
		},
		["teamID"] = "team:278",
		["groupID"] = "group:11",
		["targets"] = {
			66550, -- [1]
		},
		["preferences"] = {
			["minHP"] = 353,
			["minXP"] = 3,
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
		["targets"] = {
			116786, -- [1]
		},
		["groupID"] = "group:7",
	},
	["team:425"] = {
		["pets"] = {
			"BattlePet-0-000012C2231A", -- [1]
			"BattlePet-0-000012C42046", -- [2]
			"BattlePet-0-000012C8C1E1", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3512\n\nStrategy added by DragonsAfterDark\nS/S & B/B have been confirmed as working, let me know how the H/S does ^^\n\nVideo for Fight (https://youtu.be/ppIiTwudh1c?t=1083)\n\nTurn 1+: Peck until Itchy dies\nSalty Bird comes in\nTurn 1+: Peck until Ragepeep dies\nBring in your Thaumaturgical Piglet\nHP < 928: Arcane Dash\nHP > 928: Ooze Touch > Arcane Dash\nGrommet comes in\nTurn 1+: Ooze Touch until Grommet or Thaumaturgical Piglet dies\nBring in your Antoran Bile Larva\nTurn 1: Plagued Blood\nTurn 2+: Diseased Bite\n",
		["name"] = "Fight Night: Bodhi Sunwayver (Beast)",
		["tags"] = {
			"10052C5", -- [1]
			"20281MV", -- [2]
			"201A22A", -- [3]
		},
		["teamID"] = "team:425",
		["groupID"] = "group:12",
		["targets"] = {
			99210, -- [1]
		},
	},
	["team:84"] = {
		["pets"] = {
			"BattlePet-0-000012E7A769", -- [1]
			"BattlePet-0-000012B146C7", -- [2]
			"BattlePet-0-000006E4C7B4", -- [3]
		},
		["notes"] = "Strategy added by Hollandshoop\nScript thanks to Dpaul\n\nTurn 1: Pass or use any ability with your Level Pet\nTurn 2: Swap to your Boneshard\nTurn 3: Blistering Cold\nTurn 4: Boneshard stunned. Swap to your Ikky\nTurn 5: Black Claw\nTurn 6: Flock\nAnd the job is done!!!\n",
		["name"] = "Retinus the Seeker",
		["tags"] = {
			"12252PO", -- [1]
			"11231TB", -- [2]
			"11181FS", -- [3]
		},
		["teamID"] = "team:84",
		["targets"] = {
			162458, -- [1]
		},
		["groupID"] = "group:none",
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
	["team:349"] = {
		["pets"] = {
			"BattlePet-0-000012B66DA8", -- [1]
			"BattlePet-0-000012F20B9E", -- [2]
			"random:3", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/524\n\nScript thanks to Rinoe\n\nTurn 1: Dodge\nTurns 2+: Alpha Strike until Gulp is dead\nEgcellent comes in\nTurn 1: Swap to Ikky\nTurn 2: Black Claw\nTurn 3+: Flock - Egcellent dies or Feigns Death\nRed Wire swaps in\nTurn 1+: Flock until Ikky dies\nBring back your Teroclaw Hatchling\nTurn 1+: Use Dodge on cooldown and otherwise Alpha Strike until the fight is won or your Teroclaw Hatchling dies\nBring in your Flying pet\nTurn 1: Any standard attack will finish the fight\n",
		["name"] = "Tiny Poacher, Tiny Animals (Flyer)",
		["tags"] = {
			"21071C8", -- [1]
			"01181FS", -- [2]
			"ZR3", -- [3]
		},
		["teamID"] = "team:349",
		["groupID"] = "group:12",
		["targets"] = {
			99150, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
		},
	},
	["team:438"] = {
		["pets"] = {
			"BattlePet-0-000012E38593", -- [1]
			"random:7", -- [2]
			"random:7", -- [3]
		},
		["notes"] = "Xu-Fu's Pet Guides =^_^=\nhttps://www.wow-petguide.com/Strategy/3548\n\nStrategy added by DragonsAfterDark\nYour backline pets won't matter here, as you shouldn't need more than the crab, and Foof will kill them with his AOE\n\nTurn 1-3: Magma Wave\nTurn 4: Cauterize\nFollow 1-4 until Enemy Backline pets die\nAfter that:\nPriority 1: Cauterize on CD\nPriority 2: Burn\n",
		["name"] = "Fight Night: Amalia (Elemental)",
		["tags"] = {
			"1226D7", -- [1]
			"ZR7", -- [2]
			"ZR7", -- [3]
		},
		["teamID"] = "team:438",
		["groupID"] = "group:12",
		["targets"] = {
			107489, -- [1]
		},
		["preferences"] = {
			["minXP"] = 25,
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
		},
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
			"team:160", -- [2]
			"team:162", -- [3]
			"team:100", -- [4]
		},
	},
	["group:1"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["isExpanded"] = true,
		["name"] = "celestial week 1",
		["groupID"] = "group:1",
		["icon"] = 1519351,
		["teams"] = {
			"team:251", -- [1]
			"team:260", -- [2]
			"team:249", -- [3]
			"team:233", -- [4]
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
			"team:191", -- [1]
			"team:65", -- [2]
			"team:72", -- [3]
			"team:103", -- [4]
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
	["group:12"] = {
		["sortMode"] = 1,
		["name"] = "Family familiar",
		["isExpanded"] = true,
		["icon"] = "Interface\\Icons\\INV_Pet_BattlePetTraining",
		["groupID"] = "group:12",
		["teams"] = {
			"team:294", -- [1]
			"team:295", -- [2]
			"team:296", -- [3]
			"team:297", -- [4]
			"team:298", -- [5]
			"team:299", -- [6]
			"team:300", -- [7]
			"team:301", -- [8]
			"team:302", -- [9]
			"team:303", -- [10]
			"team:287", -- [11]
			"team:384", -- [12]
			"team:385", -- [13]
			"team:386", -- [14]
			"team:387", -- [15]
			"team:388", -- [16]
			"team:389", -- [17]
			"team:390", -- [18]
			"team:391", -- [19]
			"team:392", -- [20]
			"team:393", -- [21]
			"team:434", -- [22]
			"team:435", -- [23]
			"team:436", -- [24]
			"team:437", -- [25]
			"team:438", -- [26]
			"team:439", -- [27]
			"team:440", -- [28]
			"team:441", -- [29]
			"team:442", -- [30]
			"team:443", -- [31]
			"team:424", -- [32]
			"team:425", -- [33]
			"team:426", -- [34]
			"team:427", -- [35]
			"team:428", -- [36]
			"team:429", -- [37]
			"team:430", -- [38]
			"team:431", -- [39]
			"team:432", -- [40]
			"team:433", -- [41]
			"team:414", -- [42]
			"team:415", -- [43]
			"team:416", -- [44]
			"team:417", -- [45]
			"team:418", -- [46]
			"team:419", -- [47]
			"team:420", -- [48]
			"team:421", -- [49]
			"team:422", -- [50]
			"team:423", -- [51]
			"team:404", -- [52]
			"team:405", -- [53]
			"team:406", -- [54]
			"team:407", -- [55]
			"team:408", -- [56]
			"team:409", -- [57]
			"team:410", -- [58]
			"team:411", -- [59]
			"team:412", -- [60]
			"team:413", -- [61]
			"team:304", -- [62]
			"team:305", -- [63]
			"team:306", -- [64]
			"team:307", -- [65]
			"team:308", -- [66]
			"team:309", -- [67]
			"team:310", -- [68]
			"team:311", -- [69]
			"team:312", -- [70]
			"team:313", -- [71]
			"team:324", -- [72]
			"team:325", -- [73]
			"team:326", -- [74]
			"team:327", -- [75]
			"team:328", -- [76]
			"team:329", -- [77]
			"team:330", -- [78]
			"team:331", -- [79]
			"team:332", -- [80]
			"team:333", -- [81]
			"team:288", -- [82]
			"team:334", -- [83]
			"team:335", -- [84]
			"team:336", -- [85]
			"team:337", -- [86]
			"team:338", -- [87]
			"team:339", -- [88]
			"team:340", -- [89]
			"team:341", -- [90]
			"team:342", -- [91]
			"team:343", -- [92]
			"team:354", -- [93]
			"team:355", -- [94]
			"team:356", -- [95]
			"team:357", -- [96]
			"team:358", -- [97]
			"team:359", -- [98]
			"team:360", -- [99]
			"team:361", -- [100]
			"team:362", -- [101]
			"team:363", -- [102]
			"team:314", -- [103]
			"team:315", -- [104]
			"team:316", -- [105]
			"team:317", -- [106]
			"team:318", -- [107]
			"team:319", -- [108]
			"team:320", -- [109]
			"team:321", -- [110]
			"team:322", -- [111]
			"team:323", -- [112]
			"team:344", -- [113]
			"team:345", -- [114]
			"team:346", -- [115]
			"team:347", -- [116]
			"team:348", -- [117]
			"team:349", -- [118]
			"team:350", -- [119]
			"team:351", -- [120]
			"team:352", -- [121]
			"team:353", -- [122]
			"team:364", -- [123]
			"team:365", -- [124]
			"team:366", -- [125]
			"team:367", -- [126]
			"team:368", -- [127]
			"team:369", -- [128]
			"team:370", -- [129]
			"team:371", -- [130]
			"team:372", -- [131]
			"team:373", -- [132]
			"team:374", -- [133]
			"team:375", -- [134]
			"team:376", -- [135]
			"team:377", -- [136]
			"team:378", -- [137]
			"team:379", -- [138]
			"team:380", -- [139]
			"team:381", -- [140]
			"team:382", -- [141]
			"team:383", -- [142]
			"team:394", -- [143]
			"team:395", -- [144]
			"team:396", -- [145]
			"team:397", -- [146]
			"team:398", -- [147]
			"team:399", -- [148]
			"team:400", -- [149]
			"team:401", -- [150]
			"team:402", -- [151]
			"team:403", -- [152]
		},
	},
	["group:none"] = {
		["sortMode"] = 1,
		["isExpanded"] = true,
		["teams"] = {
			"team:1", -- [1]
			"team:215", -- [2]
			"team:158", -- [3]
			"team:2", -- [4]
			"team:38", -- [5]
			"team:74", -- [6]
			"team:88", -- [7]
			"team:86", -- [8]
			"team:224", -- [9]
			"team:257", -- [10]
			"team:263", -- [11]
			"team:47", -- [12]
			"team:247", -- [13]
			"team:265", -- [14]
			"team:228", -- [15]
			"team:244", -- [16]
			"team:246", -- [17]
			"team:230", -- [18]
			"team:240", -- [19]
			"team:236", -- [20]
			"team:51", -- [21]
			"team:232", -- [22]
			"team:154", -- [23]
			"team:179", -- [24]
			"team:116", -- [25]
			"team:12", -- [26]
			"team:16", -- [27]
			"team:75", -- [28]
			"team:17", -- [29]
			"team:59", -- [30]
			"team:217", -- [31]
			"team:183", -- [32]
			"team:98", -- [33]
			"team:185", -- [34]
			"team:132", -- [35]
			"team:95", -- [36]
			"team:124", -- [37]
			"team:159", -- [38]
			"team:198", -- [39]
			"team:213", -- [40]
			"team:30", -- [41]
			"team:81", -- [42]
			"team:258", -- [43]
			"team:269", -- [44]
			"team:254", -- [45]
			"team:237", -- [46]
			"team:231", -- [47]
			"team:252", -- [48]
			"team:226", -- [49]
			"team:229", -- [50]
			"team:234", -- [51]
			"team:264", -- [52]
			"team:235", -- [53]
			"team:200", -- [54]
			"team:102", -- [55]
			"team:68", -- [56]
			"team:201", -- [57]
			"team:9", -- [58]
			"team:115", -- [59]
			"team:48", -- [60]
			"team:150", -- [61]
			"team:204", -- [62]
			"team:125", -- [63]
			"team:83", -- [64]
			"team:292", -- [65]
			"team:105", -- [66]
			"team:26", -- [67]
			"team:80", -- [68]
			"team:178", -- [69]
			"team:34", -- [70]
			"team:36", -- [71]
			"team:82", -- [72]
			"team:32", -- [73]
			"team:85", -- [74]
			"team:37", -- [75]
			"team:274", -- [76]
			"team:92", -- [77]
			"team:144", -- [78]
			"team:266", -- [79]
			"team:91", -- [80]
			"team:13", -- [81]
			"team:55", -- [82]
			"team:78", -- [83]
			"team:140", -- [84]
			"team:223", -- [85]
			"team:119", -- [86]
			"team:71", -- [87]
			"team:56", -- [88]
			"team:157", -- [89]
			"team:106", -- [90]
			"team:96", -- [91]
			"team:94", -- [92]
			"team:73", -- [93]
			"team:142", -- [94]
			"team:248", -- [95]
			"team:20", -- [96]
			"team:21", -- [97]
			"team:63", -- [98]
			"team:31", -- [99]
			"team:135", -- [100]
			"team:184", -- [101]
			"team:22", -- [102]
			"team:112", -- [103]
			"team:67", -- [104]
			"team:90", -- [105]
			"team:57", -- [106]
			"team:70", -- [107]
			"team:79", -- [108]
			"team:84", -- [109]
			"team:171", -- [110]
			"team:110", -- [111]
			"team:170", -- [112]
			"team:99", -- [113]
			"team:25", -- [114]
			"team:131", -- [115]
			"team:64", -- [116]
			"team:76", -- [117]
			"team:193", -- [118]
			"team:62", -- [119]
			"team:172", -- [120]
			"team:164", -- [121]
			"team:60", -- [122]
			"team:89", -- [123]
			"team:293", -- [124]
			"team:7", -- [125]
			"team:186", -- [126]
			"team:151", -- [127]
			"team:214", -- [128]
			"team:19", -- [129]
			"team:190", -- [130]
			"team:33", -- [131]
			"team:39", -- [132]
			"team:27", -- [133]
			"team:121", -- [134]
			"team:137", -- [135]
			"team:181", -- [136]
			"team:129", -- [137]
			"team:93", -- [138]
			"team:46", -- [139]
			"team:220", -- [140]
			"team:122", -- [141]
			"team:271", -- [142]
			"team:114", -- [143]
			"team:104", -- [144]
			"team:197", -- [145]
			"team:256", -- [146]
			"team:245", -- [147]
			"team:262", -- [148]
			"team:239", -- [149]
			"team:267", -- [150]
			"team:255", -- [151]
			"team:238", -- [152]
			"team:227", -- [153]
			"team:242", -- [154]
			"team:243", -- [155]
			"team:250", -- [156]
			"team:136", -- [157]
			"team:8", -- [158]
			"team:24", -- [159]
			"team:177", -- [160]
			"team:168", -- [161]
			"team:196", -- [162]
			"team:141", -- [163]
			"team:108", -- [164]
			"team:218", -- [165]
			"team:219", -- [166]
			"team:187", -- [167]
			"team:206", -- [168]
			"team:107", -- [169]
			"team:127", -- [170]
			"team:118", -- [171]
			"team:6", -- [172]
			"team:11", -- [173]
			"team:270", -- [174]
			"team:130", -- [175]
			"team:97", -- [176]
		},
		["meta"] = true,
		["icon"] = 132091,
		["groupID"] = "group:none",
		["name"] = "ALL",
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
	["group:11"] = {
		["showTab"] = true,
		["sortMode"] = 1,
		["name"] = "PLUSHIE",
		["isExpanded"] = true,
		["icon"] = 1044082,
		["groupID"] = "group:11",
		["teams"] = {
			"team:212", -- [1]
			"team:291", -- [2]
			"team:284", -- [3]
			"team:69", -- [4]
			"team:277", -- [5]
			"team:273", -- [6]
			"team:272", -- [7]
			"team:134", -- [8]
			"team:50", -- [9]
			"team:44", -- [10]
			"team:290", -- [11]
			"team:35", -- [12]
			"team:77", -- [13]
			"team:111", -- [14]
			"team:128", -- [15]
			"team:4", -- [16]
			"team:139", -- [17]
			"team:283", -- [18]
			"team:87", -- [19]
			"team:40", -- [20]
			"team:222", -- [21]
			"team:282", -- [22]
			"team:101", -- [23]
			"team:281", -- [24]
			"team:280", -- [25]
			"team:286", -- [26]
			"team:278", -- [27]
			"team:275", -- [28]
			"team:285", -- [29]
			"team:279", -- [30]
			"team:289", -- [31]
			"team:208", -- [32]
			"team:276", -- [33]
			"team:53", -- [34]
			"team:28", -- [35]
			"team:61", -- [36]
			"team:109", -- [37]
			"team:153", -- [38]
			"team:15", -- [39]
			"team:138", -- [40]
			"team:143", -- [41]
			"team:66", -- [42]
			"team:221", -- [43]
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
			"team:10", -- [13]
			"team:49", -- [14]
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
		"team:314", -- [1]
		"team:315", -- [2]
		"team:316", -- [3]
		"team:317", -- [4]
		"team:318", -- [5]
		"team:319", -- [6]
		"team:320", -- [7]
		"team:321", -- [8]
		"team:322", -- [9]
		"team:323", -- [10]
	},
	[66522] = {
		"team:222", -- [1]
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
	[162461] = {
		"team:91", -- [1]
	},
	[66553] = {
		"team:281", -- [1]
	},
	[99035] = {
		"team:8", -- [1]
		"team:374", -- [2]
		"team:375", -- [3]
		"team:376", -- [4]
		"team:377", -- [5]
		"team:378", -- [6]
		"team:379", -- [7]
		"team:380", -- [8]
		"team:381", -- [9]
		"team:382", -- [10]
		"team:383", -- [11]
	},
	[150925] = {
		"team:173", -- [1]
	},
	[201858] = {
		"team:56", -- [1]
	},
	[71926] = {
		"team:40", -- [1]
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
	[161663] = {
		"team:18", -- [1]
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
	[162465] = {
		"team:102", -- [1]
	},
	[141077] = {
		"team:184", -- [1]
	},
	[141046] = {
		"team:50", -- [1]
	},
	[154911] = {
		"team:59", -- [1]
	},
	[66635] = {
		"team:284", -- [1]
	},
	[160205] = {
		"team:43", -- [1]
	},
	[200678] = {
		"team:214", -- [1]
	},
	[200684] = {
		"team:206", -- [1]
	},
	[162466] = {
		"team:107", -- [1]
	},
	[141588] = {
		"team:132", -- [1]
	},
	[124617] = {
		"team:9", -- [1]
	},
	[154912] = {
		"team:62", -- [1]
	},
	[204926] = {
		"team:199", -- [1]
	},
	[68564] = {
		"team:200", -- [1]
	},
	[66557] = {
		"team:277", -- [1]
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
	[161662] = {
		"team:14", -- [1]
	},
	[154913] = {
		"team:64", -- [1]
	},
	[66636] = {
		"team:286", -- [1]
	},
	[146182] = {
		"team:120", -- [1]
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
	[105779] = {
		"team:271", -- [1]
	},
	[173372] = {
		"team:63", -- [1]
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
	[67370] = {
		"team:288", -- [1]
	},
	[154915] = {
		"team:68", -- [1]
	},
	[139489] = {
		"team:185", -- [1]
	},
	[201899] = {
		"team:215", -- [1]
	},
	[66552] = {
		"team:280", -- [1]
	},
	[200688] = {
		"team:6", -- [1]
	},
	[162470] = {
		"team:119", -- [1]
	},
	[160207] = {
		"team:46", -- [1]
	},
	[141879] = {
		"team:55", -- [1]
	},
	[154916] = {
		"team:70", -- [1]
	},
	[99150] = {
		"team:104", -- [1]
		"team:344", -- [2]
		"team:345", -- [3]
		"team:346", -- [4]
		"team:348", -- [5]
		"team:349", -- [6]
		"team:350", -- [7]
		"team:351", -- [8]
		"team:352", -- [9]
		"team:353", -- [10]
		"team:347", -- [11]
	},
	[162471] = {
		"team:178", -- [1]
	},
	[155267] = {
		"team:202", -- [1]
	},
	[104553] = {
		"team:164", -- [1]
		"team:354", -- [2]
		"team:355", -- [3]
		"team:356", -- [4]
		"team:357", -- [5]
		"team:358", -- [6]
		"team:359", -- [7]
		"team:360", -- [8]
		"team:361", -- [9]
		"team:362", -- [10]
		"team:363", -- [11]
	},
	[71929] = {
		"team:53", -- [1]
	},
	[146183] = {
		"team:123", -- [1]
	},
	[154917] = {
		"team:73", -- [1]
	},
	[119407] = {
		"team:176", -- [1]
	},
	[66638] = {
		"team:285", -- [1]
	},
	[72009] = {
		"team:160", -- [1]
	},
	[72291] = {
		"team:162", -- [1]
	},
	[116792] = {
		"team:210", -- [1]
	},
	[160210] = {
		"team:54", -- [1]
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
	[154919] = {
		"team:187", -- [1]
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
	[62621] = {
		"team:204", -- [1]
	},
	[162458] = {
		"team:84", -- [1]
	},
	[119408] = {
		"team:192", -- [1]
	},
	[189376] = {
		"team:190", -- [1]
	},
	[161661] = {
		"team:10", -- [1]
	},
	[119343] = {
		"team:174", -- [1]
	},
	[200692] = {
		"team:24", -- [1]
	},
	[116794] = {
		"team:23", -- [1]
	},
	[66815] = {
		"team:273", -- [1]
	},
	[155413] = {
		"team:41", -- [1]
	},
	[154920] = {
		"team:82", -- [1]
	},
	[97709] = {
		"team:304", -- [1]
		"team:305", -- [2]
		"team:306", -- [3]
		"team:307", -- [4]
		"team:308", -- [5]
		"team:309", -- [6]
		"team:310", -- [7]
		"team:311", -- [8]
		"team:312", -- [9]
		"team:313", -- [10]
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
	[99742] = {
		"team:292", -- [1]
	},
	[119345] = {
		"team:205", -- [1]
	},
	[154921] = {
		"team:85", -- [1]
	},
	[66822] = {
		"team:139", -- [1]
	},
	[141215] = {
		"team:196", -- [1]
	},
	[173377] = {
		"team:74", -- [1]
	},
	[66551] = {
		"team:279", -- [1]
	},
	[83837] = {
		"team:35", -- [1]
	},
	[104970] = {
		"team:159", -- [1]
		"team:384", -- [2]
		"team:385", -- [3]
		"team:386", -- [4]
		"team:387", -- [5]
		"team:388", -- [6]
		"team:389", -- [7]
		"team:390", -- [8]
		"team:391", -- [9]
		"team:392", -- [10]
		"team:393", -- [11]
	},
	[155145] = {
		"team:5", -- [1]
	},
	[85622] = {
		"team:16", -- [1]
	},
	[204934] = {
		"team:81", -- [1]
	},
	[68559] = {
		"team:135", -- [1]
	},
	[196264] = {
		"team:129", -- [1]
	},
	[119346] = {
		"team:216", -- [1]
	},
	[71932] = {
		"team:66", -- [1]
	},
	[85685] = {
		"team:7", -- [1]
	},
	[145988] = {
		"team:113", -- [1]
	},
	[154923] = {
		"team:89", -- [1]
	},
	[173315] = {
		"team:79", -- [1]
	},
	[87110] = {
		"team:109", -- [1]
	},
	[161649] = {
		"team:155", -- [1]
	},
	[107489] = {
		"team:125", -- [1]
		"team:434", -- [2]
		"team:435", -- [3]
		"team:436", -- [4]
		"team:437", -- [5]
		"team:438", -- [6]
		"team:439", -- [7]
		"team:440", -- [8]
		"team:441", -- [9]
		"team:442", -- [10]
		"team:443", -- [11]
	},
	[141814] = {
		"team:158", -- [1]
	},
	[66466] = {
		"team:276", -- [1]
	},
	[98270] = {
		"team:21", -- [1]
		"team:334", -- [2]
		"team:335", -- [3]
		"team:336", -- [4]
		"team:337", -- [5]
		"team:338", -- [6]
		"team:339", -- [7]
		"team:340", -- [8]
		"team:341", -- [9]
		"team:342", -- [10]
		"team:343", -- [11]
	},
	[154924] = {
		"team:92", -- [1]
	},
	[99210] = {
		"team:83", -- [1]
		"team:424", -- [2]
		"team:425", -- [3]
		"team:426", -- [4]
		"team:427", -- [5]
		"team:428", -- [6]
		"team:429", -- [7]
		"team:430", -- [8]
		"team:431", -- [9]
		"team:432", -- [10]
		"team:433", -- [11]
	},
	[161650] = {
		"team:209", -- [1]
	},
	[197350] = {
		"team:130", -- [1]
	},
	[200697] = {
		"team:36", -- [1]
	},
	[71933] = {
		"team:69", -- [1]
	},
	[66824] = {
		"team:275", -- [1]
	},
	[145968] = {
		"team:58", -- [1]
	},
	[154925] = {
		"team:95", -- [1]
	},
	[142151] = {
		"team:97", -- [1]
	},
	[197447] = {
		"team:48", -- [1]
	},
	[161651] = {
		"team:165", -- [1]
	},
	[154926] = {
		"team:217", -- [1]
	},
	[205065] = {
		"team:90", -- [1]
	},
	[87122] = {
		"team:4", -- [1]
	},
	[66738] = {
		"team:290", -- [1]
	},
	[146001] = {
		"team:163", -- [1]
	},
	[201878] = {
		"team:112", -- [1]
	},
	[68465] = {
		"team:153", -- [1]
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
	[66550] = {
		"team:278", -- [1]
	},
	[140461] = {
		"team:31", -- [1]
	},
	[154927] = {
		"team:218", -- [1]
	},
	[150911] = {
		"team:126", -- [1]
	},
	[105674] = {
		"team:294", -- [1]
		"team:295", -- [2]
		"team:296", -- [3]
		"team:297", -- [4]
		"team:298", -- [5]
		"team:299", -- [6]
		"team:300", -- [7]
		"team:301", -- [8]
		"team:302", -- [9]
		"team:303", -- [10]
	},
	[66675] = {
		"team:282", -- [1]
	},
	[72285] = {
		"team:75", -- [1]
	},
	[197417] = {
		"team:142", -- [1]
	},
	[142114] = {
		"team:2", -- [1]
	},
	[66739] = {
		"team:138", -- [1]
	},
	[146003] = {
		"team:175", -- [1]
	},
	[73626] = {
		"team:223", -- [1]
	},
	[175778] = {
		"team:12", -- [1]
	},
	[173129] = {
		"team:93", -- [1]
	},
	[66819] = {
		"team:272", -- [1]
	},
	[154928] = {
		"team:219", -- [1]
	},
	[142054] = {
		"team:213", -- [1]
	},
	[173257] = {
		"team:94", -- [1]
	},
	[146004] = {
		"team:189", -- [1]
	},
	[161657] = {
		"team:211", -- [1]
	},
	[201849] = {
		"team:38", -- [1]
	},
	[173130] = {
		"team:96", -- [1]
	},
	[99077] = {
		"team:136", -- [1]
		"team:364", -- [2]
		"team:365", -- [3]
		"team:366", -- [4]
		"team:367", -- [5]
		"team:368", -- [6]
		"team:369", -- [7]
		"team:370", -- [8]
		"team:371", -- [9]
		"team:372", -- [10]
		"team:373", -- [11]
	},
	[154929] = {
		"team:108", -- [1]
	},
	[87124] = {
		"team:291", -- [1]
	},
	[202458] = {
		"team:220", -- [1]
	},
	[146005] = {
		"team:191", -- [1]
	},
	[106552] = {
		"team:394", -- [1]
		"team:395", -- [2]
		"team:396", -- [3]
		"team:397", -- [4]
		"team:398", -- [5]
		"team:399", -- [6]
		"team:400", -- [7]
		"team:401", -- [8]
		"team:402", -- [9]
		"team:403", -- [10]
	},
	[150914] = {
		"team:133", -- [1]
	},
	[173131] = {
		"team:98", -- [1]
	},
	[87123] = {
		"team:15", -- [1]
	},
	[146002] = {
		"team:149", -- [1]
	},
	[161658] = {
		"team:146", -- [1]
	},
	[173381] = {
		"team:86", -- [1]
	},
	[161656] = {
		"team:203", -- [1]
	},
	[141479] = {
		"team:19", -- [1]
	},
	[141002] = {
		"team:99", -- [1]
	},
	[197102] = {
		"team:168", -- [1]
	},
	[141799] = {
		"team:22", -- [1]
	},
	[68462] = {
		"team:128", -- [1]
	},
	[87125] = {
		"team:28", -- [1]
	},
	[66741] = {
		"team:212", -- [1]
	},
	[145971] = {
		"team:65", -- [1]
	},
	[173324] = {
		"team:103", -- [1]
	},
	[85659] = {
		"team:39", -- [1]
	},
	[173133] = {
		"team:106", -- [1]
	},
	[99182] = {
		"team:105", -- [1]
		"team:414", -- [2]
		"team:415", -- [3]
		"team:416", -- [4]
		"team:417", -- [5]
		"team:418", -- [6]
		"team:419", -- [7]
		"team:420", -- [8]
		"team:421", -- [9]
		"team:422", -- [10]
		"team:423", -- [11]
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
	[105386] = {
		"team:170", -- [1]
	},
	[200696] = {
		"team:34", -- [1]
	},
	[150917] = {
		"team:147", -- [1]
	},
	[68463] = {
		"team:134", -- [1]
	},
	[97804] = {
		"team:80", -- [1]
		"team:404", -- [2]
		"team:405", -- [3]
		"team:406", -- [4]
		"team:407", -- [5]
		"team:408", -- [6]
		"team:409", -- [7]
		"team:410", -- [8]
		"team:411", -- [9]
		"team:412", -- [10]
		"team:413", -- [11]
	},
	[140813] = {
		"team:110", -- [1]
	},
	[175780] = {
		"team:20", -- [1]
	},
	[116793] = {
		"team:169", -- [1]
	},
	[173274] = {
		"team:150", -- [1]
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
	[154922] = {
		"team:274", -- [1]
	},
	[175781] = {
		"team:25", -- [1]
	},
	[173263] = {
		"team:115", -- [1]
	},
	[119409] = {
		"team:207", -- [1]
	},
	[200693] = {
		"team:177", -- [1]
	},
	[66918] = {
		"team:289", -- [1]
	},
	[68464] = {
		"team:143", -- [1]
	},
	[105455] = {
		"team:13", -- [1]
		"team:324", -- [2]
		"team:325", -- [3]
		"team:326", -- [4]
		"team:327", -- [5]
		"team:328", -- [6]
		"team:329", -- [7]
		"team:330", -- [8]
		"team:331", -- [9]
		"team:332", -- [10]
		"team:333", -- [11]
	},
	[66639] = {
		"team:283", -- [1]
	},
	[175782] = {
		"team:27", -- [1]
	},
	[155414] = {
		"team:42", -- [1]
	},
	[105009] = {
		"team:293", -- [1]
	},
	[68560] = {
		"team:144", -- [1]
	},
	[160208] = {
		"team:49", -- [1]
	},
	[139987] = {
		"team:122", -- [1]
	},
	[141529] = {
		"team:157", -- [1]
	},
	[66733] = {
		"team:101", -- [1]
	},
	[175783] = {
		"team:30", -- [1]
	},
	[140880] = {
		"team:118", -- [1]
	},
	[200689] = {
		"team:11", -- [1]
	},
	[160206] = {
		"team:45", -- [1]
	},
	[207572] = {
		"team:270", -- [1]
	},
	[72290] = {
		"team:100", -- [1]
	},
	[116787] = {
		"team:166", -- [1]
	},
	[119341] = {
		"team:195", -- [1]
	},
	[175784] = {
		"team:32", -- [1]
	},
	[173303] = {
		"team:51", -- [1]
	},
	[150858] = {
		"team:179", -- [1]
	},
	[85519] = {
		"team:287", -- [1]
	},
	[116788] = {
		"team:156", -- [1]
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
		["BattlePet-0-000012CA14BF"] = "QQQ3348",
		["BattlePet-0-000012CA855A"] = "QQQ72JA",
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
		["Similar"] = {
		},
		["Sources"] = {
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
