local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_MountJournal = _G.C_MountJournal

local loc_id = ArkInventory.Const.Location.Mount
local PLAYER_MOUNT_LEVEL = 20

ArkInventory.Collection.Mount = { }

local collection = {
	
	isInit = false,
	isScanning = false,
	isReady = false,
	
	numTotal = 0,
	numOwned = 0,
	
	cache = { }, -- [mountId] = { data }
	owned = { }, -- [mta] = { } array of all mounts of that type that you own, updated here when scanned
	usable = { }, -- [mta] = { } array of all mounts of that type that you can use at the location you called it, updated via LDB
	
	cachespell = { }, -- spellId = MountId
	
--	filter = {
--		ignore = false,
--		search = nil,
--		collected = true,
--		uncollected = true,
--		family = { },
--		source = { },
--		backup = false,
--	},
	
}

-- /dump C_Map.GetBestMapForUnit( "player" )
local ZoneRestrictions = {
	[25953] = ArkInventory.Const.Mount.Zone.AhnQiraj, -- Blue Qiraji Battle Tank
	[26054] = ArkInventory.Const.Mount.Zone.AhnQiraj, -- Red Qiraji Battle Tank
	[26055] = ArkInventory.Const.Mount.Zone.AhnQiraj, -- Yellow Qiraji Battle Tank
	[26056] = ArkInventory.Const.Mount.Zone.AhnQiraj, -- Green Qiraji Battle Tank
	
	[75207] = ArkInventory.Const.Mount.Zone.Vashjir, -- Vashj'ir Seahorse
	
--	[000000] = ArkInventory.Const.Mount.Zone.DragonIsles, -- is now calculated
	
--	[294143] = { [85]=1 }, -- X-995 Mechanocat, testing in org
	
}

local ImportCrossRefTableAttempt = 0
local ImportCrossRefTable = {
-- {Spell_ID,{Item_ID1,Item_ID2,Item_IDx},{Zone_ID1,Zone_ID2,Zone_IDx}}

-- manually added
{171840,{137576}}, -- Coldflame Infernal
{213349,{137615}}, -- Flarecore Infernal
{229377,{142224}}, -- High Priest's Lightsworn Seeker
{231437,{143638}}, -- Archdruid's Lunarwing Form
{278979,{163188}}, -- Surf Jelly

-- may no longer exist
{343550,{186480}}, -- Battle-Hardened Aquilon
{346136,{}}, -- Viridian Phase-Hunter

-- extracted from wowhead
{458,{5656}}, -- Brown Horse / Brown Horse Bridle
{470,{2411}}, -- Black Stallion / Black Stallion Bridle
{472,{2414}}, -- Pinto / Pinto Bridle
{580,{1132}}, -- Timber Wolf / Horn of the Timber Wolf
{6648,{5655}}, -- Chestnut Mare / Chestnut Mare Bridle
{6653,{5665}}, -- Dire Wolf / Horn of the Dire Wolf
{6654,{5668}}, -- Brown Wolf / Horn of the Brown Wolf
{6777,{5864}}, -- Gray Ram
{6898,{5873}}, -- White Ram
{6899,{5872}}, -- Brown Ram
{8394,{8631}}, -- Striped Frostsaber / Reins of the Striped Frostsaber
{8395,{8588}}, -- Emerald Raptor / Whistle of the Emerald Raptor
{10789,{8632}}, -- Spotted Frostsaber / Reins of the Spotted Frostsaber
{10790,{}}, -- Tiger
{10793,{8629}}, -- Striped Nightsaber / Reins of the Striped Nightsaber
{10796,{8591}}, -- Turquoise Raptor / Whistle of the Turquoise Raptor
{10799,{8592}}, -- Violet Raptor / Whistle of the Violet Raptor
{10873,{8563}}, -- Red Mechanostrider
{10969,{8595}}, -- Blue Mechanostrider
{15779,{13326}}, -- White Mechanostrider Mod B
{16055,{12303}}, -- Black Nightsaber / Reins of the Nightsaber
{16056,{12302}}, -- Ancient Frostsaber / Reins of the Ancient Frostsaber
{16080,{12330}}, -- Red Wolf / Horn of the Red Wolf
{16081,{12351}}, -- Arctic Wolf / Horn of the Arctic Wolf
{16082,{12354}}, -- Palomino / Palomino Bridle
{16083,{12353}}, -- White Stallion / White Stallion Bridle
{16084,{8586}}, -- Mottled Red Raptor / Whistle of the Mottled Red Raptor
{17229,{13086}}, -- Winterspring Frostsaber / Reins of the Winterspring Frostsaber
{17450,{13317}}, -- Ivory Raptor / Whistle of the Ivory Raptor
{17453,{13321}}, -- Green Mechanostrider
{17454,{13322}}, -- Unpainted Mechanostrider
{17459,{13327}}, -- Icy Blue Mechanostrider Mod A
{17460,{13329}}, -- Frost Ram
{17461,{13328}}, -- Black Ram
{17462,{13331}}, -- Red Skeletal Horse
{17463,{13332}}, -- Blue Skeletal Horse
{17464,{13333}}, -- Brown Skeletal Horse
{17465,{13334}}, -- Green Skeletal Warhorse
{17481,{13335}}, -- Rivendare's Deathcharger / Deathcharger's Reins
{18989,{15277}}, -- Gray Kodo
{18990,{15290}}, -- Brown Kodo
{18991,{15292}}, -- Green Kodo
{18992,{15293}}, -- Teal Kodo
{22717,{29468}}, -- Black War Steed / Black War Steed Bridle
{22718,{29466}}, -- Black War Kodo
{22719,{29465}}, -- Black Battlestrider
{22720,{29467}}, -- Black War Ram
{22721,{29472}}, -- Black War Raptor / Whistle of the Black War Raptor
{22722,{29470}}, -- Red Skeletal Warhorse
{22723,{29471}}, -- Black War Tiger / Reins of the Black War Tiger
{22724,{29469}}, -- Black War Wolf / Horn of the Black War Wolf
{23219,{18767}}, -- Swift Mistsaber / Reins of the Swift Mistsaber
{23221,{18766}}, -- Swift Frostsaber / Reins of the Swift Frostsaber
{23222,{18774}}, -- Swift Yellow Mechanostrider
{23223,{18773}}, -- Swift White Mechanostrider
{23225,{18772}}, -- Swift Green Mechanostrider
{23227,{18776}}, -- Swift Palomino
{23228,{18778}}, -- Swift White Steed
{23229,{18777}}, -- Swift Brown Steed
{23238,{18786}}, -- Swift Brown Ram
{23239,{18787}}, -- Swift Gray Ram
{23240,{18785}}, -- Swift White Ram
{23241,{18788}}, -- Swift Blue Raptor
{23242,{18789}}, -- Swift Olive Raptor
{23243,{18790}}, -- Swift Orange Raptor
{23246,{18791}}, -- Purple Skeletal Warhorse
{23247,{18793}}, -- Great White Kodo
{23248,{18795}}, -- Great Gray Kodo
{23249,{18794}}, -- Great Brown Kodo
{23250,{18796}}, -- Swift Brown Wolf / Horn of the Swift Brown Wolf
{23251,{18797}}, -- Swift Timber Wolf / Horn of the Swift Timber Wolf
{23252,{18798}}, -- Swift Gray Wolf / Horn of the Swift Gray Wolf
{23338,{18902}}, -- Swift Stormsaber / Reins of the Swift Stormsaber
{23509,{19029}}, -- Frostwolf Howler / Horn of the Frostwolf Howler
{23510,{19030}}, -- Stormpike Battle Charger
{24242,{19872}}, -- Swift Razzashi Raptor
{24252,{19902}}, -- Swift Zulian Tiger
{25863,{}}, -- Black Qiraji Battle Tank
{25953,{21218}}, -- Blue Qiraji Battle Tank / Blue Qiraji Resonating Crystal
{26054,{21321}}, -- Red Qiraji Battle Tank / Red Qiraji Resonating Crystal
{26055,{21324}}, -- Yellow Qiraji Battle Tank / Yellow Qiraji Resonating Crystal
{26056,{21323}}, -- Green Qiraji Battle Tank / Green Qiraji Resonating Crystal
{26655,{}}, -- Black Qiraji Battle Tank
{26656,{21176}}, -- Black Qiraji Battle Tank / Black Qiraji Resonating Crystal
{30174,{103630,23720}}, -- Riding Turtle / Lucky Riding Turtle
{32235,{25470}}, -- Golden Gryphon
{32239,{25471}}, -- Ebon Gryphon
{32240,{25472}}, -- Snowy Gryphon
{32242,{25473}}, -- Swift Blue Gryphon
{32243,{25474}}, -- Tawny Wind Rider
{32244,{25475}}, -- Blue Wind Rider
{32245,{25476}}, -- Green Wind Rider
{32246,{25477}}, -- Swift Red Wind Rider
{32289,{25527}}, -- Swift Red Gryphon
{32290,{25528}}, -- Swift Green Gryphon
{32292,{25529}}, -- Swift Purple Gryphon
{32295,{25531}}, -- Swift Green Wind Rider
{32296,{25532}}, -- Swift Yellow Wind Rider
{32297,{25533}}, -- Swift Purple Wind Rider
{32345,{}}, -- Peep the Phoenix Mount
{33660,{28936}}, -- Swift Pink Hawkstrider
{34406,{28481}}, -- Brown Elekk
{34790,{29228}}, -- Dark War Talbuk / Reins of the Dark War Talbuk
{34795,{28927}}, -- Red Hawkstrider
{34896,{29102,29227}}, -- Cobalt War Talbuk / Reins of the Cobalt War Talbuk
{34897,{29103,29231}}, -- White War Talbuk / Reins of the White War Talbuk
{34898,{29104,29229}}, -- Silver War Talbuk / Reins of the Silver War Talbuk
{34899,{29105,29230}}, -- Tan War Talbuk / Reins of the Tan War Talbuk
{35018,{29222}}, -- Purple Hawkstrider
{35020,{29220}}, -- Blue Hawkstrider
{35022,{29221}}, -- Black Hawkstrider
{35025,{29223}}, -- Swift Green Hawkstrider
{35027,{29224}}, -- Swift Purple Hawkstrider
{35028,{34129}}, -- Swift Warstrider
{35710,{29744}}, -- Gray Elekk
{35711,{29743}}, -- Purple Elekk
{35712,{29746}}, -- Great Green Elekk
{35713,{29745}}, -- Great Blue Elekk
{35714,{29747}}, -- Great Purple Elekk
{36702,{30480}}, -- Fiery Warhorse / Fiery Warhorse's Reins
{37015,{30609}}, -- Swift Nether Drake
{39315,{31829,31830}}, -- Cobalt Riding Talbuk / Reins of the Cobalt Riding Talbuk
{39316,{28915}}, -- Dark Riding Talbuk / Reins of the Dark Riding Talbuk
{39317,{31831,31832}}, -- Silver Riding Talbuk / Reins of the Silver Riding Talbuk
{39318,{31833,31834}}, -- Tan Riding Talbuk / Reins of the Tan Riding Talbuk
{39319,{31835,31836}}, -- White Riding Talbuk / Reins of the White Riding Talbuk
{39798,{32314}}, -- Green Riding Nether Ray
{39800,{32317}}, -- Red Riding Nether Ray
{39801,{32316}}, -- Purple Riding Nether Ray
{39802,{32318}}, -- Silver Riding Nether Ray
{39803,{32319}}, -- Blue Riding Nether Ray
{40192,{32458}}, -- Ashes of Al'ar
{41252,{32768}}, -- Raven Lord / Reins of the Raven Lord
{41513,{32857}}, -- Onyx Netherwing Drake / Reins of the Onyx Netherwing Drake
{41514,{32858}}, -- Azure Netherwing Drake / Reins of the Azure Netherwing Drake
{41515,{32859}}, -- Cobalt Netherwing Drake / Reins of the Cobalt Netherwing Drake
{41516,{32860}}, -- Purple Netherwing Drake / Reins of the Purple Netherwing Drake
{41517,{32861}}, -- Veridian Netherwing Drake / Reins of the Veridian Netherwing Drake
{41518,{32862}}, -- Violet Netherwing Drake / Reins of the Violet Netherwing Drake
{42776,{49283}}, -- Spectral Tiger / Reins of the Spectral Tiger
{42777,{49284}}, -- Swift Spectral Tiger / Reins of the Swift Spectral Tiger
{43688,{33809}}, -- Amani War Bear
{43899,{33976}}, -- Brewfest Ram
{43900,{33977}}, -- Swift Brewfest Ram
{43927,{33999}}, -- Cenarion War Hippogryph
{44151,{34061}}, -- Turbo-Charged Flying Machine
{44153,{34060}}, -- Flying Machine
{44744,{34092}}, -- Merciless Nether Drake
{46197,{49285}}, -- X-51 Nether-Rocket
{46199,{49286}}, -- X-51 Nether-Rocket X-TREME
{46628,{35513}}, -- Swift White Hawkstrider
{48025,{37012}}, -- Headless Horseman's Mount / The Horseman's Reins
{48027,{35906}}, -- Black War Elekk / Reins of the Black War Elekk
{48778,{}}, -- Acherus Deathcharger
{49193,{37676}}, -- Vengeful Nether Drake
{49322,{37719}}, -- Swift Zhevra
{49379,{37828}}, -- Great Brewfest Kodo
{50869,{}}, -- Brewfest Kodo
{51412,{49282}}, -- Big Battle Bear
{54729,{40775}}, -- Winged Steed of the Ebon Blade
{54753,{43962}}, -- White Polar Bear / Reins of the White Polar Bear
{55164,{}}, -- Swift Spectral Gryphon
{55531,{41508}}, -- Mechano-Hog
{58615,{43516}}, -- Brutal Nether Drake
{58983,{43599}}, -- Big Blizzard Bear
{59567,{43952}}, -- Azure Drake / Reins of the Azure Drake
{59568,{43953}}, -- Blue Drake / Reins of the Blue Drake
{59569,{43951}}, -- Bronze Drake / Reins of the Bronze Drake
{59570,{43955}}, -- Red Drake / Reins of the Red Drake
{59571,{43954}}, -- Twilight Drake / Reins of the Twilight Drake
{59650,{43986}}, -- Black Drake / Reins of the Black Drake
{59785,{43956}}, -- Black War Mammoth / Reins of the Black War Mammoth
{59788,{44077}}, -- Black War Mammoth / Reins of the Black War Mammoth
{59791,{44230}}, -- Wooly Mammoth / Reins of the Wooly Mammoth
{59793,{44231}}, -- Wooly Mammoth / Reins of the Wooly Mammoth
{59797,{44080}}, -- Ice Mammoth / Reins of the Ice Mammoth
{59799,{43958}}, -- Ice Mammoth / Reins of the Ice Mammoth
{59961,{44160}}, -- Red Proto-Drake / Reins of the Red Proto-Drake
{59976,{44164}}, -- Black Proto-Drake / Reins of the Black Proto-Drake
{59996,{44151}}, -- Blue Proto-Drake / Reins of the Blue Proto-Drake
{60002,{44168}}, -- Time-Lost Proto-Drake / Reins of the Time-Lost Proto-Drake
{60021,{44175}}, -- Plagued Proto-Drake / Reins of the Plagued Proto-Drake
{60024,{44177}}, -- Violet Proto-Drake / Reins of the Violet Proto-Drake
{60025,{44178}}, -- Albino Drake / Reins of the Albino Drake
{60114,{44225}}, -- Armored Brown Bear / Reins of the Armored Brown Bear
{60116,{44226}}, -- Armored Brown Bear / Reins of the Armored Brown Bear
{60118,{44223}}, -- Black War Bear / Reins of the Black War Bear
{60119,{44224}}, -- Black War Bear / Reins of the Black War Bear
{60424,{44413}}, -- Mekgineer's Chopper
{61229,{44689}}, -- Armored Snowy Gryphon
{61230,{44690}}, -- Armored Blue Wind Rider
{61294,{44707}}, -- Green Proto-Drake / Reins of the Green Proto-Drake
{61309,{44558}}, -- Magnificent Flying Carpet
{61425,{44235}}, -- Traveler's Tundra Mammoth / Reins of the Traveler's Tundra Mammoth
{61447,{44234}}, -- Traveler's Tundra Mammoth / Reins of the Traveler's Tundra Mammoth
{61451,{44554}}, -- Flying Carpet
{61465,{43959}}, -- Grand Black War Mammoth / Reins of the Grand Black War Mammoth
{61467,{44083}}, -- Grand Black War Mammoth / Reins of the Grand Black War Mammoth
{61469,{44086}}, -- Grand Ice Mammoth / Reins of the Grand Ice Mammoth
{61470,{43961}}, -- Grand Ice Mammoth / Reins of the Grand Ice Mammoth
{61996,{44843}}, -- Blue Dragonhawk
{61997,{44842}}, -- Red Dragonhawk
{63232,{45125}}, -- Stormwind Steed
{63635,{45593}}, -- Darkspear Raptor
{63636,{45586}}, -- Ironforge Ram
{63637,{45591}}, -- Darnassian Nightsaber
{63638,{45589}}, -- Gnomeregan Mechanostrider
{63639,{45590}}, -- Exodar Elekk
{63640,{45595}}, -- Orgrimmar Wolf
{63641,{45592}}, -- Thunder Bluff Kodo
{63642,{45596}}, -- Silvermoon Hawkstrider
{63643,{45597}}, -- Forsaken Warhorse
{63796,{45693}}, -- Mimiron's Head
{63844,{45725}}, -- Argent Hippogryph
{63956,{45801}}, -- Ironbound Proto-Drake / Reins of the Ironbound Proto-Drake
{63963,{45802}}, -- Rusted Proto-Drake / Reins of the Rusted Proto-Drake
{64656,{}}, -- Blue Skeletal Warhorse
{64657,{46100}}, -- White Kodo
{64658,{46099}}, -- Black Wolf / Horn of the Black Wolf
{64659,{46102}}, -- Venomhide Ravasaur / Whistle of the Venomhide Ravasaur
{64731,{46109}}, -- Sea Turtle
{64927,{46708}}, -- Deadly Gladiator's Frost Wyrm
{64977,{46308}}, -- Black Skeletal Horse
{65439,{46171}}, -- Furious Gladiator's Frost Wyrm
{65637,{46745}}, -- Great Red Elekk
{65638,{46744}}, -- Swift Moonsaber
{65639,{46751}}, -- Swift Red Hawkstrider
{65640,{46752}}, -- Swift Gray Steed
{65641,{46750}}, -- Great Golden Kodo
{65642,{46747}}, -- Turbostrider
{65643,{46748}}, -- Swift Violet Ram
{65644,{46743}}, -- Swift Purple Raptor
{65645,{46746}}, -- White Skeletal Warhorse
{65646,{46749}}, -- Swift Burgundy Wolf
{65917,{49290}}, -- Magic Rooster / Magic Rooster Egg
{66087,{46813}}, -- Silver Covenant Hippogryph
{66088,{46814}}, -- Sunreaver Dragonhawk
{66090,{46815}}, -- Quel'dorei Steed
{66091,{46816}}, -- Sunreaver Hawkstrider
{66846,{47101}}, -- Ochre Skeletal Warhorse
{66847,{47100}}, -- Striped Dawnsaber / Reins of the Striped Dawnsaber
{66906,{47179}}, -- Argent Charger
{66907,{}}, -- Argent Warhorse
{67336,{47840}}, -- Relentless Gladiator's Frost Wyrm
{67466,{47180}}, -- Argent Warhorse
{68056,{49046}}, -- Swift Horde Wolf
{68057,{49044}}, -- Swift Alliance Steed
{68187,{49096}}, -- Crusader's White Warhorse
{68188,{49098}}, -- Crusader's Black Warhorse
{69395,{49636}}, -- Onyxian Drake / Reins of the Onyxian Drake
{71342,{50250}}, -- Big Love Rocket
{71810,{50435}}, -- Wrathful Gladiator's Frost Wyrm
{72286,{50818}}, -- Invincible / Invincible's Reins
{72807,{51955}}, -- Icebound Frostbrood Vanquisher / Reins of the Icebound Frostbrood Vanquisher
{72808,{51954}}, -- Bloodbathed Frostbrood Vanquisher / Reins of the Bloodbathed Frostbrood Vanquisher
{73313,{52200}}, -- Crimson Deathcharger / Reins of the Crimson Deathcharger
{74856,{54069,74269}}, -- Blazing Hippogryph
{74918,{54068}}, -- Wooly White Rhino
{75207,{54465}}, -- Vashj'ir Seahorse
{75596,{54797}}, -- Frosty Flying Carpet
{75614,{54811}}, -- Celestial Steed
{75973,{54860}}, -- X-53 Touring Rocket
{84751,{60954}}, -- Fossilized Raptor
{87090,{62461}}, -- Goblin Trike / Goblin Trike Key
{87091,{62462}}, -- Goblin Turbo-Trike / Goblin Turbo-Trike Key
{88331,{62900}}, -- Volcanic Stone Drake / Reins of the Volcanic Stone Drake
{88335,{62901}}, -- Drake of the East Wind / Reins of the Drake of the East Wind
{88718,{63042}}, -- Phosphorescent Stone Drake / Reins of the Phosphorescent Stone Drake
{88741,{63039,65356}}, -- Drake of the West Wind / Reins of the Drake of the West Wind
{88742,{63040}}, -- Drake of the North Wind / Reins of the Drake of the North Wind
{88744,{63041}}, -- Drake of the South Wind / Reins of the Drake of the South Wind
{88746,{63043}}, -- Vitreous Stone Drake / Reins of the Vitreous Stone Drake
{88748,{63044}}, -- Brown Riding Camel / Reins of the Brown Riding Camel
{88749,{63045}}, -- Tan Riding Camel / Reins of the Tan Riding Camel
{88750,{63046}}, -- Grey Riding Camel / Reins of the Grey Riding Camel
{88990,{63125}}, -- Dark Phoenix / Reins of the Dark Phoenix
{89520,{}}, -- Goblin Mini Hotrod
{90621,{62298}}, -- Golden King / Reins of the Golden King
{92155,{64883}}, -- Ultramarine Qiraji Battle Tank / Scepter of Azj'Aqir
{92231,{64998}}, -- Spectral Steed / Reins of the Spectral Steed
{92232,{64999}}, -- Spectral Wolf / Reins of the Spectral Wolf
{93326,{65891}}, -- Sandstone Drake / Vial of the Sands
{93623,{68008}}, -- Mottled Drake
{93644,{67107}}, -- Kor'kron Annihilator / Reins of the Kor'kron Annihilator
{96491,{68823}}, -- Armored Razzashi Raptor
{96499,{68824}}, -- Swift Zulian Panther
{96503,{68825}}, -- Amani Dragonhawk
{97359,{69213}}, -- Flameward Hippogryph
{97493,{69224}}, -- Pureblood Fire Hawk / Smoldering Egg of Millagazor
{97501,{69226}}, -- Felfire Hawk
{97560,{69230}}, -- Corrupted Fire Hawk / Corrupted Egg of Millagazor
{97581,{69228}}, -- Savage Raptor
{98204,{69747}}, -- Amani Battle Bear
{98718,{67151}}, -- Subdued Seahorse / Reins of Poseidus
{98727,{69846}}, -- Winged Guardian
{100332,{70909}}, -- Vicious War Steed / Reins of the Vicious War Steed
{100333,{70910}}, -- Vicious War Wolf / Horn of the Vicious War Wolf
{101282,{71339}}, -- Vicious Gladiator's Twilight Drake
{101542,{71665}}, -- Flametalon of Alysrazor
{101573,{71718}}, -- Swift Shorestrider
{101821,{71954}}, -- Ruthless Gladiator's Twilight Drake
{102346,{72140}}, -- Swift Forest Strider
{102349,{72145}}, -- Swift Springstrider
{102350,{72146}}, -- Swift Lovebird
{102488,{72575}}, -- White Riding Camel
{102514,{72582}}, -- Corrupted Hippogryph
{103081,{73766}}, -- Darkmoon Dancing Bear
{103195,{73838}}, -- Mountain Horse
{103196,{73839}}, -- Swift Mountain Horse
{107203,{76755}}, -- Tyrael's Charger
{107516,{76889}}, -- Spectral Gryphon
{107517,{76902}}, -- Spectral Wind Rider
{107842,{77067}}, -- Blazing Drake / Reins of the Blazing Drake
{107844,{77068}}, -- Twilight Harbinger / Reins of the Twilight Harbinger
{107845,{77069}}, -- Life-Binder's Handmaiden
{110039,{78919}}, -- Experiment 12-B
{110051,{78924}}, -- Heart of the Aspects
{113120,{79771}}, -- Feldrake
{113199,{79802}}, -- Jade Cloud Serpent / Reins of the Jade Cloud Serpent
{118089,{81354}}, -- Azure Water Strider / Reins of the Azure Water Strider
{118737,{81559}}, -- Pandaren Kite / Pandaren Kite String
{120043,{82453}}, -- Jeweled Onyx Panther
{120395,{82765,91004}}, -- Green Dragon Turtle / Reins of the Green Dragon Turtle
{120822,{82811,91010}}, -- Great Red Dragon Turtle / Reins of the Great Red Dragon Turtle
{121820,{83086}}, -- Obsidian Nightwing / Heart of the Nightwing
{121836,{83090}}, -- Sapphire Panther
{121837,{83088}}, -- Jade Panther
{121838,{83087}}, -- Ruby Panther
{121839,{83089}}, -- Sunstone Panther
{122708,{84101}}, -- Grand Expedition Yak / Reins of the Grand Expedition Yak
{123160,{}}, -- Crimson Riding Crane
{123182,{}}, -- White Riding Yak
{123886,{85262}}, -- Amber Scorpion / Reins of the Amber Scorpion
{123992,{85430}}, -- Azure Cloud Serpent / Reins of the Azure Cloud Serpent
{123993,{85429}}, -- Golden Cloud Serpent / Reins of the Golden Cloud Serpent
{124408,{85666}}, -- Thundering Jade Cloud Serpent / Reins of the Thundering Jade Cloud Serpent
{124550,{85785}}, -- Cataclysmic Gladiator's Twilight Drake
{124659,{85870}}, -- Imperial Quilen
{126507,{87250}}, -- Depleted-Kyparium Rocket
{126508,{87251}}, -- Geosynchronous World Spinner
{127154,{87768}}, -- Onyx Cloud Serpent / Reins of the Onyx Cloud Serpent
{127156,{87769}}, -- Crimson Cloud Serpent / Reins of the Crimson Cloud Serpent
{127158,{87771}}, -- Heavenly Onyx Cloud Serpent / Reins of the Heavenly Onyx Cloud Serpent
{127161,{87773}}, -- Heavenly Crimson Cloud Serpent / Reins of the Heavenly Crimson Cloud Serpent
{127164,{87774}}, -- Heavenly Golden Cloud Serpent / Reins of the Heavenly Golden Cloud Serpent
{127165,{87775}}, -- Yu'lei, Daughter of Jade
{127169,{87776}}, -- Heavenly Azure Cloud Serpent / Reins of the Heavenly Azure Cloud Serpent
{127170,{87777}}, -- Astral Cloud Serpent / Reins of the Astral Cloud Serpent
{127174,{87781}}, -- Azure Riding Crane / Reins of the Azure Riding Crane
{127176,{87782}}, -- Golden Riding Crane / Reins of the Golden Riding Crane
{127177,{87783}}, -- Regal Riding Crane / Reins of the Regal Riding Crane
{127178,{}}, -- Jungle Riding Crane
{127180,{}}, -- Albino Riding Crane
{127209,{}}, -- Black Riding Yak
{127213,{}}, -- Brown Riding Yak
{127216,{87788}}, -- Grey Riding Yak / Reins of the Grey Riding Yak
{127220,{87789}}, -- Blonde Riding Yak / Reins of the Blonde Riding Yak
{127271,{87791}}, -- Crimson Water Strider / Reins of the Crimson Water Strider
{127272,{}}, -- Orange Water Strider
{127274,{}}, -- Jade Water Strider
{127278,{}}, -- Golden Water Strider
{127286,{87795,91008}}, -- Black Dragon Turtle / Reins of the Black Dragon Turtle
{127287,{87796,91009}}, -- Blue Dragon Turtle / Reins of the Blue Dragon Turtle
{127288,{87797,91005}}, -- Brown Dragon Turtle / Reins of the Brown Dragon Turtle
{127289,{87799,91006}}, -- Purple Dragon Turtle / Reins of the Purple Dragon Turtle
{127290,{87800,91007}}, -- Red Dragon Turtle / Reins of the Red Dragon Turtle
{127293,{87801,91012}}, -- Great Green Dragon Turtle / Reins of the Great Green Dragon Turtle
{127295,{87802,91011}}, -- Great Black Dragon Turtle / Reins of the Great Black Dragon Turtle
{127302,{87803,91013}}, -- Great Blue Dragon Turtle / Reins of the Great Blue Dragon Turtle
{127308,{87804,91014}}, -- Great Brown Dragon Turtle / Reins of the Great Brown Dragon Turtle
{127310,{87805,91015}}, -- Great Purple Dragon Turtle / Reins of the Great Purple Dragon Turtle
{129552,{89154}}, -- Crimson Pandaren Phoenix / Reins of the Crimson Pandaren Phoenix
{129918,{89304}}, -- Thundering August Cloud Serpent / Reins of the Thundering August Cloud Serpent
{129932,{89305}}, -- Green Shado-Pan Riding Tiger / Reins of the Green Shado-Pan Riding Tiger
{129934,{89307}}, -- Blue Shado-Pan Riding Tiger / Reins of the Blue Shado-Pan Riding Tiger
{129935,{89306}}, -- Red Shado-Pan Riding Tiger / Reins of the Red Shado-Pan Riding Tiger
{130086,{89362}}, -- Brown Riding Goat / Reins of the Brown Riding Goat
{130092,{89363}}, -- Red Flying Cloud / Disc of the Red Flying Cloud
{130137,{89390}}, -- White Riding Goat / Reins of the White Riding Goat
{130138,{89391}}, -- Black Riding Goat / Reins of the Black Riding Goat
{130965,{89783}}, -- Son of Galleon / Son of Galleon's Saddle
{130985,{89785}}, -- Pandaren Kite / Pandaren Kite String
{132036,{90655}}, -- Thundering Ruby Cloud Serpent / Reins of the Thundering Ruby Cloud Serpent
{132117,{90710}}, -- Ashen Pandaren Phoenix / Reins of the Ashen Pandaren Phoenix
{132118,{90711}}, -- Emerald Pandaren Phoenix / Reins of the Emerald Pandaren Phoenix
{132119,{90712}}, -- Violet Pandaren Phoenix / Reins of the Violet Pandaren Phoenix
{133023,{91802}}, -- Jade Pandaren Kite / Jade Pandaren Kite String
{134359,{95416}}, -- Sky Golem
{134573,{92724}}, -- Swift Windsteed
{135416,{93168}}, -- Grand Armored Gryphon
{135418,{93169}}, -- Grand Armored Wyvern
{136163,{93385}}, -- Grand Gryphon
{136164,{93386}}, -- Grand Wyvern
{136400,{93662}}, -- Armored Skyscreamer / Reins of the Armored Skyscreamer
{136471,{93666}}, -- Spawn of Horridon
{136505,{93671}}, -- Ghastly Charger / Ghastly Charger's Skull
{138423,{94228}}, -- Cobalt Primordial Direhorn / Reins of the Cobalt Primordial Direhorn
{138424,{94230}}, -- Amber Primordial Direhorn / Reins of the Amber Primordial Direhorn
{138425,{94229}}, -- Slate Primordial Direhorn / Reins of the Slate Primordial Direhorn
{138426,{94231}}, -- Jade Primordial Direhorn / Reins of the Jade Primordial Direhorn
{138640,{94290}}, -- Bone-White Primal Raptor / Reins of the Bone-White Primal Raptor
{138641,{94291}}, -- Red Primal Raptor / Reins of the Red Primal Raptor
{138642,{94292}}, -- Black Primal Raptor / Reins of the Black Primal Raptor
{138643,{94293}}, -- Green Primal Raptor / Reins of the Green Primal Raptor
{139407,{95041}}, -- Malevolent Gladiator's Cloud Serpent
{139442,{95057}}, -- Thundering Cobalt Cloud Serpent / Reins of the Thundering Cobalt Cloud Serpent
{139448,{95059}}, -- Clutch of Ji-Kun
{139595,{95341}}, -- Armored Bloodwing
{140249,{95564}}, -- Golden Primal Direhorn / Reins of the Golden Primal Direhorn
{140250,{95565}}, -- Crimson Primal Direhorn / Reins of the Crimson Primal Direhorn
{142073,{98618}}, -- Hearthsteed
{142266,{98104}}, -- Armored Red Dragonhawk
{142478,{98259}}, -- Armored Blue Dragonhawk
{142641,{98405}}, -- Brawler's Burly Mushan Beast
{142878,{97989}}, -- Enchanted Fey Dragon
{142910,{129922,129744}}, -- Ironbound Wraithcharger / Bridle of the Ironbound Wraithcharger
{146615,{102514}}, -- Vicious Kaldorei Warsaber / Reins of the Vicious Warsaber
{146622,{102533}}, -- Vicious Skeletal Warhorse / Reins of the Vicious Skeletal Warhorse
{147595,{104011}}, -- Stormcrow
{148392,{104208}}, -- Spawn of Galakras / Reins of Galakras
{148396,{104246}}, -- Kor'kron War Wolf / Reins of the Kor'kron War Wolf
{148417,{104253}}, -- Kor'kron Juggernaut
{148428,{103638}}, -- Ashhide Mushan Beast / Reins of the Ashhide Mushan Beast
{148476,{104269}}, -- Thundering Onyx Cloud Serpent / Reins of the Thundering Onyx Cloud Serpent
{148618,{104325}}, -- Tyrannical Gladiator's Cloud Serpent
{148619,{104326}}, -- Grievous Gladiator's Cloud Serpent
{148620,{104327}}, -- Prideful Gladiator's Cloud Serpent
{149801,{106246}}, -- Emerald Hippogryph
{153489,{107951}}, -- Iron Skyreaver
{155741,{109013}}, -- Dread Raven / Reins of the Dread Raven
{163024,{112326}}, -- Warforged Nightmare
{163025,{112327}}, -- Grinning Reaver
{169952,{115363}}, -- Creeping Carpet
{170347,{115484}}, -- Core Hound / Core Hound Chain
{171436,{116383}}, -- Gorestrider Gronnling
{171616,{116655}}, -- Witherhide Cliffstomper
{171617,{116656}}, -- Trained Icehoof
{171618,{116657}}, -- Ancient Leatherhide
{171619,{116658}}, -- Tundra Icehoof
{171620,{116659}}, -- Bloodhoof Bull
{171621,{116660}}, -- Ironhoof Destroyer
{171622,{116661}}, -- Mottled Meadowstomper
{171623,{116662}}, -- Trained Meadowstomper
{171624,{116663}}, -- Shadowhide Pearltusk
{171625,{116664}}, -- Dusty Rockhide
{171626,{116665}}, -- Armored Irontusk
{171627,{116666}}, -- Blacksteel Battleboar
{171628,{116667}}, -- Rocktusk Battleboar
{171629,{116668}}, -- Armored Frostboar
{171630,{116669}}, -- Armored Razorback
{171632,{116670}}, -- Frostplains Battleboar
{171633,{116671}}, -- Wild Goretusk
{171634,{116672}}, -- Domesticated Razorback
{171635,{116673}}, -- Giant Coldsnout
{171636,{116674}}, -- Great Greytusk
{171637,{116675}}, -- Trained Rocktusk
{171638,{116676}}, -- Trained Riverwallow
{171824,{116767}}, -- Sapphire Riverbeast
{171825,{116768}}, -- Mosshide Riverwallow
{171826,{116769}}, -- Mudback Riverbeast
{171827,{137575}}, -- Hellfire Infernal / Fiendish Hellfire Core
{171828,{116771}}, -- Solar Spirehawk
{171829,{116772}}, -- Shadowmane Charger
{171830,{116773}}, -- Swift Breezestrider
{171831,{116774}}, -- Trained Silverpelt
{171832,{116775}}, -- Breezestrider Stallion
{171833,{116776}}, -- Pale Thorngrazer
{171834,{116777}}, -- Vicious War Ram
{171835,{116778}}, -- Vicious War Raptor
{171836,{116779}}, -- Garn Steelmaw
{171837,{116780}}, -- Warsong Direfang
{171838,{116781}}, -- Armored Frostwolf
{171839,{116782}}, -- Ironside Warwolf
{171841,{116784}}, -- Trained Snarler
{171842,{116785}}, -- Swift Frostwolf
{171843,{116786}}, -- Smoky Direwolf
{171844,{108883}}, -- Dustmane Direwolf / Riding Harness
{171845,{116788}}, -- Warlord's Deathwheel
{171846,{116789}}, -- Champion's Treadblade
{171847,{118515}}, -- Cindermane Charger
{171848,{116791}}, -- Challenger's War Yeti
{171849,{116792}}, -- Sunhide Gronnling
{171850,{137573}}, -- Llothien Prowler / Reins of the Llothien Prowler
{171851,{116794}}, -- Garn Nighthowl
{175700,{118676}}, -- Emerald Drake / Reins of the Emerald Drake
{179244,{122703}}, -- Summon Chauffeur / Chauffeured Chopper
{179245,{120968}}, -- Summon Chauffeur / Chauffeured Chopper
{179478,{121815}}, -- Voidtalon of the Dark Star
{180545,{122469}}, -- Mystic Runesaber
{182912,{123890}}, -- Felsteel Annihilator
{183117,{123974}}, -- Corrupted Dreadwing / Reins of the Corrupted Dreadwing
{183889,{124089}}, -- Vicious War Mechanostrider
{185052,{124540}}, -- Vicious War Kodo
{186305,{127140}}, -- Infernal Direwolf
{186828,{128277}}, -- Primal Gladiator's Felblood Gronnling
{189043,{128281}}, -- Wild Gladiator's Felblood Gronnling
{189044,{128282}}, -- Warmongering Gladiator's Felblood Gronnling
{189364,{128311}}, -- Coalfist Gronnling
{189998,{128425}}, -- Illidari Felstalker / Reins of the Illidari Felstalker
{189999,{128422}}, -- Grove Warden / Reins of the Grove Warden
{190690,{128480,128481}}, -- Bristling Hellboar
{190977,{128526,128527}}, -- Deathtusk Felboar
{191314,{128671}}, -- Minion of Grumpus
{191633,{128706}}, -- Soaring Skyterror
{193007,{141216}}, -- Grove Defiler / Defiled Reins
{193695,{129280}}, -- Prestigious War Steed / Reins of the Prestigious War Steed
{194046,{}}, -- Swift Spectral Rylak
{194464,{129923}}, -- Eclipse Dragonhawk / Reins of the Eclipse Dragonhawk
{196681,{131734}}, -- Spirit of Eche'ro
{200175,{}}, -- Felsaber
{201098,{133543}}, -- Infinite Timereaver / Reins of the Infinite Timereaver
{204166,{143864}}, -- Prestigious War Wolf / Reins of the Prestigious War Wolf
{213115,{137570}}, -- Bloodfang Widow / Bloodfang Cocoon
{213134,{137574}}, -- Felblaze Infernal / Living Infernal Core
{213158,{137577}}, -- Predatory Bloodgazer
{213163,{137578}}, -- Snowfeather Hunter
{213164,{137579}}, -- Brilliant Direbeak
{213165,{137580}}, -- Viridian Sharptalon
{213209,{137686}}, -- Steelbound Devourer / Steelbound Harness
{213339,{129962}}, -- Great Northern Elderhorn / Elderhorn Riding Harness
{213350,{137614}}, -- Frostshard Infernal / Biting Frostshard Core
{214791,{138811}}, -- Brinedeep Bottom-Feeder
{215159,{138258}}, -- Long-Forgotten Hippogryph / Reins of the Long-Forgotten Hippogryph
{215545,{186479}}, -- Mastercraft Gravewing
{215558,{138387}}, -- Ratstallion
{221883,{}}, -- Divine Steed
{221885,{}}, -- Divine Steed
{221886,{}}, -- Divine Steed
{221887,{}}, -- Divine Steed
{222202,{140228}}, -- Prestigious Bronze Courser
{222236,{140230}}, -- Prestigious Royal Courser
{222237,{140232}}, -- Prestigious Forest Courser
{222238,{140233}}, -- Prestigious Ivory Courser
{222240,{140408}}, -- Prestigious Azure Courser
{222241,{140407}}, -- Prestigious Midnight Courser
{223018,{138201}}, -- Fathom Dweller
{223341,{140353}}, -- Vicious Gilnean Warhorse
{223354,{140354}}, -- Vicious War Trike
{223363,{140348}}, -- Vicious Warstrider
{223578,{140350}}, -- Vicious War Elekk
{223814,{140500}}, -- Mechanized Lumber Extractor
{225765,{141217}}, -- Leyfeather Hippogryph / Reins of the Leyfeather Hippogryph
{227956,{141713}}, -- Arcadian War Turtle
{227986,{141843}}, -- Vindictive Gladiator's Storm Dragon
{227988,{141844}}, -- Fearless Gladiator's Storm Dragon
{227989,{141845}}, -- Cruel Gladiator's Storm Dragon
{227991,{141846}}, -- Ferocious Gladiator's Storm Dragon
{227994,{141847}}, -- Fierce Gladiator's Storm Dragon
{227995,{141848}}, -- Dominant Gladiator's Storm Dragon
{228919,{142398}}, -- Darkwater Skate
{229376,{}}, -- Archmage's Prismatic Disc
{229377,{}}, -- High Priest's Lightsworn Seeker
{229385,{142225}}, -- Ban-Lu, Grandmaster's Companion / Ban-lu, Grandmaster's Companion
{229386,{142227}}, -- Huntmaster's Loyal Wolfhawk / Trust of a Loyal Wolfhawk
{229387,{142231}}, -- Deathlord's Vilebrood Vanquisher / Decaying Reins of the Vilebrood Vanquisher
{229388,{142232}}, -- Battlelord's Bloodthirsty War Wyrm / Iron Reins of the Bloodthirsty War Wyrm
{229417,{}}, -- Slayer's Felbroken Shrieker
{229438,{142226}}, -- Huntmaster's Fierce Wolfhawk / Trust of a Fierce Wolfhawk
{229439,{142228}}, -- Huntmaster's Dire Wolfhawk / Trust of a Dire Wolfhawk
{229486,{142235}}, -- Vicious War Bear
{229487,{142234}}, -- Vicious War Bear
{229499,{142236}}, -- Midnight / Midnight's Eternal Reins
{229512,{142237}}, -- Vicious War Lion
{230401,{142369}}, -- Ivory Hawkstrider
{230844,{142403}}, -- Brawler's Burly Basilisk
{230987,{142436}}, -- Arcanist's Manasaber
{230988,{142437}}, -- Vicious War Scorpion
{231428,{142552}}, -- Smoldering Ember Wyrm
{231434,{143493}}, -- Shadowblade's Murderous Omen / Razor-Lined Reins of Dark Portent
{231435,{143502}}, -- Highlord's Golden Charger / Glowing Reins of the Golden Charger
{231442,{143489}}, -- Farseer's Raging Tempest / Raging Tempest Totem
{231523,{143492}}, -- Shadowblade's Lethal Omen / Midnight Black Reins of Dark Portent
{231524,{143491}}, -- Shadowblade's Baneful Omen / Mephitic Reins of Dark Portent
{231525,{143490}}, -- Shadowblade's Crimson Omen / Bloody Reins of Dark Portent
{231587,{143503}}, -- Highlord's Vengeful Charger / Harsh Reins of the Vengeful Charger
{231588,{143504}}, -- Highlord's Vigilant Charger / Stoic Reins of the Vigilant Charger
{231589,{143505}}, -- Highlord's Valorous Charger / Heraldic Reins of the Valorous Charger
{232405,{143631}}, -- Primal Flamesaber
{232412,{}}, -- Netherlord's Chaotic Wrathsteed
{232519,{143643}}, -- Abyss Worm
{232523,{143648}}, -- Vicious War Turtle
{232525,{143649}}, -- Vicious War Turtle
{233364,{143764}}, -- Leywoven Flying Carpet
{235764,{152843}}, -- Darkspore Mana Ray
{237285,{}}, -- Hyena Mount White (PH)
{237286,{163576}}, -- Dune Scavenger / Captured Dune Scavenger
{237287,{161773}}, -- Alabaster Hyena / Reins of the Alabaster Hyena
{237288,{166417}}, -- Reins of the Onyx War Hyena
{238452,{143637}}, -- Netherlord's Brimstone Wrathsteed / Hellblazing Reins of the Brimstone Wrathsteed
{238454,{142233}}, -- Netherlord's Accursed Wrathsteed / Shadowy Reins of the Accursed Wrathsteed
{239013,{152788}}, -- Lightforged Warframe
{239049,{161215}}, -- Obsidian Krolusk / Reins of the Obsidian Krolusk
{239363,{}}, -- Swift Spectral Hippogryph
{239766,{151626}}, -- Blue Qiraji War Tank / Sapphire Qiraji Resonating Crystal
{239767,{151625}}, -- Red Qiraji War Tank / Ruby Qiraji Resonating Crystal
{239769,{}}, -- Purple Qiraji War Tank
{239770,{}}, -- Black Qiraji War Tank
{242305,{152791}}, -- Sable Ruinstrider / Reins of the Sable Ruinstrider
{242874,{147807}}, -- Highmountain Elderhorn
{242875,{147804}}, -- Wild Dreamrunner
{242881,{147806}}, -- Cloudwing Hippogryph
{242882,{147805}}, -- Valarjar Stormwing
{242896,{152870}}, -- Vicious War Fox
{242897,{152869}}, -- Vicious War Fox
{243025,{147835}}, -- Riddler's Mind-Worm
{243201,{153493}}, -- Demonic Gladiator's Storm Dragon
{243512,{147901}}, -- Luminous Starseeker
{243651,{152789}}, -- Shackled Ur'zul
{243652,{152790}}, -- Vile Fiend
{243795,{163575}}, -- Leaping Veinseeker / Reins of a Tamed Bloodfeaster
{244712,{161664}}, -- Spectral Pterrorwing / Reins of the Spectral Pterrorwing
{245723,{151618}}, -- Stormwind Skychaser
{245725,{151617}}, -- Orgrimmar Interceptor
{247402,{151623}}, -- Lucid Nightmare
{247448,{153485}}, -- Darkmoon Dirigible
{250735,{163216}}, -- Bloodgorged Crawg
{253004,{152794}}, -- Amethyst Ruinstrider / Reins of the Amethyst Ruinstrider
{253005,{152795}}, -- Beryl Ruinstrider / Reins of the Beryl Ruinstrider
{253006,{152793}}, -- Russet Ruinstrider / Reins of the Russet Ruinstrider
{253007,{152797}}, -- Cerulean Ruinstrider / Reins of the Cerulean Ruinstrider
{253008,{152796}}, -- Umber Ruinstrider / Reins of the Umber Ruinstrider
{253058,{152814}}, -- Maddened Chaosrunner
{253087,{152815}}, -- Antoran Gloomhound
{253088,{152816}}, -- Antoran Charhound
{253106,{152842}}, -- Vibrant Mana Ray
{253107,{152844}}, -- Lambent Mana Ray
{253108,{152841}}, -- Felglow Mana Ray
{253109,{152840}}, -- Scintillating Mana Ray
{253639,{152901}}, -- Violet Spellwing / Kirin Tor Summoning Crystal
{253660,{152903}}, -- Biletooth Gnasher
{253661,{152905}}, -- Crimson Slavermaw
{253662,{152904}}, -- Acid Belcher
{253711,{152912}}, -- Pond Nettle
{254069,{153042}}, -- Glorious Felcrusher
{254258,{153043}}, -- Blessed Felcrusher
{254259,{153044}}, -- Avenging Felcrusher
{254260,{153041}}, -- Bleakhoof Ruinstrider
{254471,{}}, -- Divine Steed
{254472,{}}, -- Divine Steed
{254473,{}}, -- Divine Steed
{254474,{}}, -- Divine Steed
{254811,{163586}}, -- Squawks
{254812,{}}, -- PH Giant Parrot (Blue)
{254813,{159842}}, -- Summon Sharkbait / Sharkbait's Favorite Crackers
{255695,{153539}}, -- Seabraid Stallion
{255696,{153540}}, -- Gilded Ravasaur
{256121,{}}, -- PH Goblin Hovercraft (Blue)
{256123,{153594}}, -- Xiwyllag ATV
{256124,{}}, -- PH Goblin Hovercraft (Red)
{256125,{}}, -- PH Goblin Hovercraft (Green)
{258022,{155656}}, -- Lightforged Felcrusher
{258060,{155662}}, -- Highmountain Thunderhoof
{258845,{156487}}, -- Nightborne Manasaber
{259202,{156486}}, -- Starcursed Voidstrider
{259213,{161911}}, -- Admiralty Stallion / Reins of the Admiralty Stallion
{259395,{156564}}, -- Shu-Zen, the Divine Sentinel
{259740,{163183}}, -- Green Marsh Hopper
{259741,{170069}}, -- Honeyback Harvester / Honeyback Harvester's Harness
{260172,{161912}}, -- Dapple Gray / Reins of the Dapple Gray
{260173,{161910}}, -- Smoky Charger / Reins of the Smoky Charger
{260174,{163574}}, -- Terrified Pack Mule / Chewed-On Reins of the Terrified Pack Mule
{260175,{163573}}, -- Goldenmane / Goldenmane's Reins
{261395,{156798}}, -- The Hivemind
{261433,{163122}}, -- Vicious War Basilisk
{261434,{163121}}, -- Vicious War Basilisk
{261437,{161134}}, -- Mecha-Mogul Mk2
{262022,{156879}}, -- Dread Gladiator's Proto-Drake
{262023,{156880}}, -- Sinister Gladiator's Proto-Drake
{262024,{156881}}, -- Notorious Gladiator's Proto-Drake
{262025,{156882}}, -- Pale Gladiator's Proto-Drake
{262026,{156883}}, -- Green Gladiator's Proto-Drake
{262027,{156884}}, -- Corrupted Gladiator's Proto-Drake
{262028,{156885}}, -- Gold Gladiator's Proto-Drake
{263707,{157870}}, -- Zandalari Direhorn
{264058,{163042}}, -- Mighty Caravan Brutosaur / Reins of the Mighty Caravan Brutosaur
{266058,{159921}}, -- Tomb Stalker / Mummified Raptor Skull
{266925,{166745}}, -- Siltwing Albatross
{267270,{159146}}, -- Kua'fon / Kua'fon's Harness
{267274,{161330,143752}}, -- Mag'har Direwolf
{270560,{163124}}, -- Vicious War Clefthoof
{271646,{161331}}, -- Dark Iron Core Hound
{272472,{163128}}, -- Undercity Plaguebat / War-Torn Reins of the Undercity Plaguebat
{272481,{163123}}, -- Vicious War Riverbeast
{272770,{160589}}, -- The Dreadwake
{273541,{160829}}, -- Underrot Crawg / Underrot Crawg Harness
{274610,{163127}}, -- Teldrassil Hippogryph / Smoldering Reins of the Teldrassil Hippogryph
{275623,{161479}}, -- Nazjatar Blood Serpent
{275837,{161665}}, -- Cobalt Pterrordax / Reins of the Cobalt Pterrordax
{275838,{161666}}, -- Captured Swampstalker / Reins of the Captured Swampstalker
{275840,{161667}}, -- Voldunai Dunescraper / Reins of the Voldunai Dunescraper
{275841,{161774}}, -- Expedition Bloodswarmer / Reins of the Expedition Bloodswarmer
{275859,{161908}}, -- Dusky Waycrest Gryphon / Reins of the Dusky Waycrest Gryphon
{275866,{161909}}, -- Stormsong Coastwatcher / Reins of the Stormsong Coastwatcher
{275868,{161879}}, -- Proudmoore Sea Scout / Reins of the Proudmoore Sea Scout
{276111,{}}, -- Divine Steed
{276112,{}}, -- Divine Steed
{278656,{163063}}, -- Spectral Phoenix / Reins of the Spectral Phoenix
{278803,{163131}}, -- Great Sea Ray
{278966,{163186}}, -- Tempestuous Skystallion
{278979,{163585}}, -- Surf Jelly
{279454,{163577}}, -- Conqueror's Scythemaw
{279456,{163579}}, -- Highland Mustang
{279457,{163578}}, -- Broken Highland Mustang
{279466,{163584}}, -- Twilight Avenger
{279467,{163583}}, -- Craghorn Chasm-Leaper
{279469,{163582}}, -- Qinsho's Eternal Hound
{279474,{163589}}, -- Palehide Direhorn / Reins of the Palehide Direhorn
{279569,{163644}}, -- Swift Albino Raptor
{279608,{163646}}, -- Lil' Donkey
{279611,{163645}}, -- Skullripper
{279868,{163706}}, -- Witherbark Direwing
{280729,{163981}}, -- Frenzied Feltalon
{280730,{163982}}, -- Pureheart Courser
{281044,{164250}}, -- Prestigious Bloodforged Courser
{281554,{164571}}, -- Meat Wagon
{281887,{165019}}, -- Vicious Black Warsaber
{281888,{173714}}, -- Vicious White Warsaber
{281889,{173713}}, -- Vicious White Bonesteed
{281890,{165020}}, -- Vicious Black Bonesteed
{282682,{164762}}, -- Kul Tiran Charger
{288438,{166428,166438}}, -- Blackpaw
{288495,{166432}}, -- Ashenvale Chimaera
{288499,{166433}}, -- Frightened Kodo
{288503,{166434,166803}}, -- Umber Nightsaber / Captured Umber Nightsaber
{288505,{166437,166435}}, -- Kaldorei Nightsaber / Captured Kaldorei Nightsaber
{288506,{166436,174373}}, -- Sandy Nightsaber
{288587,{166442}}, -- Blue Marsh Hopper
{288589,{166443}}, -- Yellow Marsh Hopper
{288711,{166471}}, -- Saltwater Seahorse
{288712,{166470}}, -- Stonehide Elderhorn
{288714,{166469}}, -- Bloodthirsty Dreadwing
{288720,{166468}}, -- Bloodgorged Hunter
{288721,{166467}}, -- Island Thunderscale
{288722,{166466}}, -- Risen Mare
{288735,{166464}}, -- Rubyshell Krolusk
{288736,{166465}}, -- Azureshell Krolusk
{288740,{166463}}, -- Priestess' Moonsaber
{289083,{166518}}, -- G.M.O.D.
{289101,{166539}}, -- Dazar'alor Windreaver
{289555,{166705}}, -- Glacial Tidestorm
{289639,{166724}}, -- Bruce
{290132,{166776}}, -- Sylverian Dreamer
{290133,{166775}}, -- Vulpine Familiar
{290134,{166774}}, -- Hogrus, Swine of Good Fortune
{290328,{169162}}, -- Wonderwing 2.0
{290718,{168830}}, -- Aerial Unit R-21/X
{291492,{168823}}, -- Rusty Mechanocrawler
{291538,{167170}}, -- Unshackled Waveray
{292407,{167167}}, -- Ankoan Waveray
{292419,{167171}}, -- Azshari Bloatray
{294038,{169198}}, -- Royal Snapdragon
{294039,{169194}}, -- Snapback Scuttler
{294143,{167751}}, -- X-995 Mechanocat / Mechanocat Laser Pointer
{294197,{172012}}, -- Obsidian Worldbreaker
{294568,{167894}}, -- Beastlord's Irontusk
{294569,{167895}}, -- Beastlord's Warwolf
{295386,{168056}}, -- Ironclad Frostclaw
{295387,{168055}}, -- Bloodflank Charger
{296788,{168329}}, -- Mechacycle Model W / Keys to the Model W
{297157,{168370}}, -- Junkheap Drifter / Rusted Keys to the Junkheap Drifter
{297560,{168408}}, -- Child of Torcali
{298367,{174842}}, -- Mollie / Slightly Damp Pile of Fur
{299158,{168826}}, -- Mechagon Peacekeeper
{299159,{168827}}, -- Scrapforged Mechaspider
{299170,{168829}}, -- Rustbolt Resistor
{300146,{169199}}, -- Snapdragon Kelpstalker
{300147,{169200}}, -- Deepcoral Snapdragon
{300149,{169163}}, -- Silent Glider
{300150,{169201}}, -- Fabious
{300151,{169203}}, -- Inkscale Deepseeker
{300152,{}}, -- Tidestallion
{300153,{169202}}, -- Crimson Tidestallion
{300154,{}}, -- Tidestallion
{301841,{}}, -- Kua'fon
{302143,{174862}}, -- Uncorrupted Voidwing
{302361,{}}, -- Alabaster Stormtalon
{302362,{}}, -- Alabaster Thunderwing
{302794,{}}, -- Swift Spectral Fathom Ray
{302795,{}}, -- Swift Spectral Magnetocraft
{302796,{}}, -- Swift Spectral Armored Gryphon
{302797,{}}, -- Swift Spectral Pterrordax
{303766,{}}, -- Honeyback Drone
{303767,{}}, -- Honeyback Hivemother
{305182,{174654}}, -- Black Serpent of N'Zoth
{305592,{174067}}, -- Mechagon Mechanostrider
{306421,{172023}}, -- Frostwolf Snarler
{306423,{174066}}, -- Caravan Hyena
{307256,{173299}}, -- Explorer's Jungle Hopper / Keys to the Explorer's Jungle Hopper
{307263,{173297}}, -- Explorer's Dunetrekker / Reins of the Explorer's Dunetrekker
{307932,{}}, -- Ensorcelled Everwyrm
{308078,{}}, -- Squeakers, the Trickster
{308087,{}}, -- Lucky Yun
{308250,{172022}}, -- Stormpike Battle Ram
{308814,{174872}}, -- Ny'alotha Allseer
{312751,{173887}}, -- Clutch of Ha-Li
{312753,{180581}}, -- Hopecrusher Gargon
{312754,{180948}}, -- Battle Gargon Vrednic
{312756,{}}, -- PH Phalynx
{312758,{}}, -- PH Epic Phalynx
{312759,{180263}}, -- Dreamlight Runestag
{312761,{180721}}, -- Enchanted Dreamlight Runestag
{312762,{184167}}, -- Mawsworn Soulhunter
{312763,{183052}}, -- Darkwarren Hardshell
{312765,{180773}}, -- Sundancer
{312767,{180728}}, -- Swift Gloomhoof
{312772,{}}, -- Gilded Prowler
{312776,{183617}}, -- Chittering Animite
{312777,{181316}}, -- Silvertip Dredwing
{315014,{174752}}, -- Ivory Cloud Serpent
{315427,{174649}}, -- Rajani Warserpent
{315847,{174641}}, -- Drake of the Four Winds / Reins of the Drake of the Four Winds
{315987,{174653}}, -- Mail Muncher
{316275,{174753}}, -- Waste Marauder
{316276,{174754}}, -- Wastewander Skyterror
{316337,{174769}}, -- Malevolent Drone
{316339,{174771}}, -- Shadowbarb Drone
{316340,{174770}}, -- Wicked Swarmer
{316343,{174861}}, -- Wriggling Parasite
{316493,{174860}}, -- Elusive Quickhoof / Reins of the Elusive Quickhoof
{316637,{174836}}, -- Awakened Mindborer
{316722,{174841}}, -- Ren's Stalwart Hound
{316723,{174840}}, -- Xinlao
{316802,{174859}}, -- Springfur Alpaca / Reins of the Springfur Alpaca
{318051,{180748}}, -- Silky Shimmermoth
{318052,{181817}}, -- Deathbringer's Flayedwing
{326390,{}}, -- Steamscale Incinerator
{327405,{182081}}, -- Colossal Slaughterclaw / Reins of the Colossal Slaughterclaw
{327407,{184014}}, -- Vicious War Spider
{327408,{184013}}, -- Vicious War Spider
{332243,{180413}}, -- Shadeleaf Runestag
{332244,{180414}}, -- Wakener's Runestag
{332245,{180415}}, -- Winterborn Runestag
{332246,{180722}}, -- Enchanted Shadeleaf Runestag
{332247,{180723}}, -- Enchanted Wakener's Runestag
{332248,{180724}}, -- Enchanted Winterborn Runestag
{332252,{180727}}, -- Shimmermist Runner
{332256,{180729}}, -- Duskflutter Ardenmoth
{332400,{183937}}, -- Sinful Gladiator's Soul Eater
{332455,{182077}}, -- War-Bred Tauralus
{332456,{182076}}, -- Plaguerot Tauralus
{332457,{182075}}, -- Bonehoof Tauralus
{332460,{182074}}, -- Chosen Tauralus
{332462,{181822}}, -- Armored War-Bred Tauralus
{332464,{181821}}, -- Armored Plaguerot Tauralus
{332466,{181815}}, -- Armored Bonehoof Tauralus
{332467,{181820}}, -- Armored Chosen Tauralus
{332478,{182085}}, -- Blisterback Bloodtusk
{332480,{182084}}, -- Gorespine
{332482,{182083}}, -- Bonecleaver's Skullboar
{332484,{182082}}, -- Lurid Bloodtusk
{332882,{180461}}, -- Horrid Dredwing
{332903,{182596}}, -- Rampart Screecher
{332904,{185996}}, -- Harvester's Dredwing / Harvester's Dredwing Saddle
{332905,{180582}}, -- Endmire Flyer / Endmire Flyer Tether
{332908,{}}, -- PH Devourer Mite (Green)
{332923,{182954}}, -- Inquisition Gargon
{332927,{183715}}, -- Sinfall Gargon
{332932,{180945}}, -- Crypt Gargon
{332949,{182209}}, -- Desire's Battle Gargon
{333021,{182332}}, -- Gravestone Battle Gargon / Gravestone Battle Armor
{333023,{183798}}, -- Battle Gargon Silessa / Silessa's Battle Harness
{333027,{182589}}, -- Loyal Gorger
{334352,{180731}}, -- Wildseed Cradle
{334364,{180725}}, -- Spinemaw Gladechewer
{334365,{180726}}, -- Pale Acidmaw
{334366,{180730}}, -- Wild Glimmerfur Prowler
{334382,{180761}}, -- Phalynx of Loyalty
{334386,{180762}}, -- Phalynx of Humility
{334391,{180763}}, -- Phalynx of Courage
{334398,{180764}}, -- Phalynx of Purity
{334403,{180765}}, -- Eternal Phalynx of Purity
{334406,{180766}}, -- Eternal Phalynx of Courage
{334408,{180767}}, -- Eternal Phalynx of Loyalty
{334409,{180768}}, -- Eternal Phalynx of Humility
{334433,{180772}}, -- Silverwind Larion
{334482,{}}, -- PH Death Elemental
{336036,{181819}}, -- Marrowfang / Marrowfang's Reins
{336038,{181818}}, -- Callow Flayedwing / Chewed Reins of the Callow Flayedwing
{336039,{181300}}, -- Gruesome Flayedwing
{336041,{182078}}, -- Bonesewn Fleshroc
{336042,{182079}}, -- Hulking Deathroc / Slime-Covered Reins of the Hulking Deathroc
{336045,{182080}}, -- Predatory Plagueroc
{336064,{181317}}, -- Dauntless Duskrunner
{339588,{182614}}, -- Sinrunner Blanchy / Blanchy's Reins
{339632,{182650}}, -- Arboreal Gulper
{339956,{186655}}, -- Mawsworn Charger / Mawsworn Charger's Reins
{339957,{186653}}, -- Hand of Hrestimorak / Bracer of Hrestimorak
{340068,{182717}}, -- Sintouched Deathwalker
{340503,{183053}}, -- Umbral Scythehorn
{341639,{183518}}, -- Court Sinrunner
{341766,{183615}}, -- Warstitched Darkhound
{341776,{183618}}, -- Highwind Darkmane
{341821,{}}, -- Snowstorm
{342334,{183740}}, -- Gilded Prowler
{342335,{183741}}, -- Ascended Skymane
{342666,{183800}}, -- Amber Ardenmoth
{342667,{183801}}, -- Vibrant Flutterwing
{343550,{186480}}, -- Battle-Hardened Aquilon
{344228,{184062}}, -- Battle-Bound Warhound / Gnawed Reins of the Battle-Bound Warhound
{344574,{184160}}, -- Bulbous Necroray
{344575,{184162}}, -- Pestilent Necroray
{344576,{184161}}, -- Infested Necroray
{344577,{184168}}, -- Bound Shadehound
{344578,{184166}}, -- Corridor Creeper
{344659,{184183}}, -- Voracious Gorger
{346136,{}}, -- Viridian Phase-Hunter
{346141,{}}, -- Slime Serpent
{346554,{186637}}, -- Tazavesh Gearglider
{346718,{}}, -- PH Wolf Serpent
{347250,{186489}}, -- Lord of the Corpseflies
{347251,{186648}}, -- Soaring Razorwing
{347536,{186641}}, -- Tamed Mauler / Tamed Mauler Harness
{347810,{186644}}, -- Beryl Shardhide
{347812,{}}, -- Sapphire Skyblazer
{347813,{}}, -- Fireplume Phoenix
{348769,{186179}}, -- Vicious War Gorm
{348770,{186178}}, -- Vicious War Gorm
{349823,{187642}}, -- Vicious Warstalker
{349824,{187644}}, -- Vicious Warstalker
{349935,{204382}}, -- Noble Bruffalon
{350219,{192777}}, -- Magmashell
{351195,{186642}}, -- Vengeance / Vengeance's Reins
{352309,{185973}}, -- Hand of Bahmethra / Chain of Bahmethra
{352441,{186000}}, -- Wild Hunt Legsplitter / Legsplitter War Harness
{352742,{186103}}, -- Undying Darkhound / Undying Darkhound's Harness
{352926,{192800}}, -- Skyskin Hornstrider
{353036,{186177}}, -- Unchained Gladiator's Soul Eater
{353263,{186638}}, -- Cartel Master's Gearglider
{353264,{186639}}, -- Pilfered Gearglider
{353265,{186640}}, -- Silver Gearglider
{353856,{186493}}, -- Ardenweald Wilderling / Ardenweald Wilderling Harness
{353857,{186494}}, -- Autumnal Wilderling / Autumnal Wilderling Harness
{353858,{186495}}, -- Winter Wilderling / Winter Wilderling Harness
{353859,{186492}}, -- Summer Wilderling / Summer Wilderling Harness
{353860,{186491}}, -- Spring Wilderling / Spring Wilderling Harness
{353866,{186478}}, -- Obsidian Gravewing
{353872,{186476}}, -- Sinfall Gravewing
{353873,{186477}}, -- Pale Gravewing
{353875,{186482}}, -- Elysian Aquilon
{353877,{186483}}, -- Forsworn Aquilon
{353880,{186485}}, -- Ascendant's Aquilon
{353883,{186487}}, -- Maldraxxian Corpsefly / Maldraxxian Corpsefly Harness
{353884,{186488}}, -- Regal Corpsefly / Regal Corpsefly Harness
{353885,{186490}}, -- Battlefield Swarmer / Battlefield Swarmer Harness
{354351,{186656}}, -- Sanctum Gloomcharger / Sanctum Gloomcharger's Reins
{354352,{186657}}, -- Soulbound Gloomcharger / Soulbound Gloomcharger's Reins
{354353,{186659}}, -- Fallen Charger / Fallen Charger's Reins
{354354,{186713}}, -- Hand of Nilganihmaht / Nilganihmaht Control Ring
{354355,{186654}}, -- Hand of Salaranga / Bracelet of Salaranga
{354356,{186647}}, -- Amber Shardhide
{354357,{186645}}, -- Crimson Shardhide
{354358,{186646}}, -- Darkmaul
{354359,{186649}}, -- Fierce Razorwing
{354360,{186652}}, -- Garnet Razorwing
{354361,{186651}}, -- Dusklight Razorwing
{354362,{186643}}, -- Wandering Arden Doe / Reins of the Wanderer
{356488,{}}, -- Sarge's Tale
{356501,{187183}}, -- Rampaging Mauler
{356802,{}}, -- Holy Lightstrider
{358072,{}}, -- Bound Blizzard
{358319,{187525}}, -- Soultwisted Deathwalker
{359013,{187595}}, -- Val'sharah Hippogryph / Favor of the Val'sharah Hippogryph
{359229,{187629}}, -- Heartlight Vombata / Heartlight Stone
{359230,{187630}}, -- Curious Crystalsniffer
{359231,{187631}}, -- Darkened Vombata
{359232,{187632}}, -- Adorned Vombata
{359276,{187640}}, -- Anointed Protostag / Anointed Protostag Reins
{359277,{187641}}, -- Sundered Zerethsteed / Reins of the Sundered Zerethsteed
{359278,{187638}}, -- Deathrunner
{359317,{}}, -- Wen Lo, the River's Edge
{359318,{188674}}, -- Soaring Spelltome / Mage-Bound Spelltome
{359364,{187663}}, -- Bronzewing Vespoid
{359366,{187665}}, -- Buzz
{359367,{187664}}, -- Forged Spiteflyer
{359372,{187667}}, -- Mawdapted Raptora
{359373,{187668}}, -- Raptora Swooper
{359376,{187670}}, -- Bronze Helicid
{359377,{187671}}, -- Unsuccessful Prototype Fleetpod
{359378,{187672}}, -- Scarlet Helicid
{359379,{187675}}, -- Shimmering Aurelid
{359381,{187673}}, -- Cryptic Aurelid
{359401,{187677}}, -- Genesis Crawler
{359402,{187678}}, -- Tarachnid Creeper
{359403,{187679}}, -- Ineffable Skitterer
{359407,{187682}}, -- Wastewarped Deathwalker
{359408,{198821}}, -- Divine Kiss of Ohn'ahra
{359409,{198871}}, -- Iskaara Trader's Ottuk
{359413,{187683}}, -- Goldplate Bufonid
{359545,{190771}}, -- Carcinized Zerethsteed / Fractal Cypher of the Carcinized Zerethsteed
{359622,{201440}}, -- Liberated Slyvern / Reins of the Liberated Slyvern
{359843,{}}, -- Tangled Dreamweaver
{360954,{194106,194705}}, -- Highland Drake
{363136,{188696}}, -- Colossal Ebonclaw Mawrat / Sturdy Soulsteel Mawrat Harness
{363178,{188700}}, -- Colossal Umbrahide Mawrat / Sturdy Silver Mawrat Harness
{363297,{188736}}, -- Colossal Soulshredder Mawrat / Sturdy Gilded Mawrat Harness
{363608,{}}, -- Divine Steed
{363701,{188808}}, -- Patient Bufonid
{363703,{188809}}, -- Prototype Leaper
{363706,{188810}}, -- Russet Bufonid
{365559,{189507}}, -- Cosmic Gladiator's Soul Eater
{366647,{189978}}, -- Magenta Cloud Serpent / Reins of the Magenta Cloud Serpent
{366789,{190168}}, -- Crusty Crawler
{366790,{190169}}, -- Quawks
{366791,{190170}}, -- Jigglesworth Sr. / Jigglesworth, Sr.
{366962,{190231}}, -- Ash'adar, Harbinger of Dawn
{367190,{}}, -- JZB Test Mount
{367620,{190539}}, -- Coral-Stalker Waveray
{367673,{190580}}, -- Heartbond Lupine
{367676,{190581}}, -- Nether-Gorged Greatwyrm
{367826,{190613}}, -- Savage Green Battle Turtle
{367875,{190636}}, -- Armored Siege Kodo
{368105,{190765}}, -- Colossal Plaguespew Mawrat / Iska's Mawrat Leash
{368126,{190767}}, -- Armored Golden Pterrordax
{368128,{190766}}, -- Colossal Wraithbound Mawrat / Spectral Mawrat's Tail
{368158,{190768}}, -- Zereth Overseer / Fractal Cypher of the Zereth Overseer
{368893,{204361}}, -- Winding Slitherdrake
{368896,{194034}}, -- Renewed Proto-Drake
{368899,{194549}}, -- Windborne Velocidrake
{368901,{194521}}, -- Cliffside Wylderdrake
{369451,{}}, -- Jade, Bright Foreseer
{369476,{191114}}, -- Amalgam of Rage / Reins of the Amalgam of Rage
{369480,{}}, -- Cerulean Marsh Hopper
{369666,{191123}}, -- Grimhowl / Grimhowl's Face Axe
{370346,{191290}}, -- Eternal Gladiator's Soul Eater
{370620,{191566}}, -- Elusive Emerald Hawkstrider
{370770,{}}, -- Tuskarr Shoreglider
{371176,{191838}}, -- Subterranean Magmammoth
{372995,{}}, -- Swift Spectral Drake
{373859,{192601,201837}}, -- Loyal Magmammoth
{374032,{192761}}, -- Tamed Skitterfly
{374034,{192762}}, -- Azure Skitterfly
{374048,{192764}}, -- Verdant Skitterfly
{374090,{192772}}, -- Ancient Salamanther
{374098,{192775}}, -- Stormhide Salamanther
{374138,{192779}}, -- Seething Slug
{374155,{192784}}, -- Shellack
{374157,{192785}}, -- Gooey Snailemental
{374162,{192786}}, -- Scrappy Worldsnail / Slumbering Worldsnail Shell
{374194,{192790}}, -- Mossy Mammoth
{374196,{192791}}, -- Plainswalker Bearer
{374247,{192799}}, -- Lizi, Thunderspine Tramper / Lizi's Reins
{374263,{192804}}, -- Restless Hornstrider
{374275,{192806}}, -- Raging Magmammoth
{374278,{192807}}, -- Renewed Magmammoth
{376873,{198870}}, -- Otto
{376875,{198872}}, -- Brown Scouting Ottuk
{376879,{198873}}, -- Ivory Trader's Ottuk
{376880,{200118}}, -- Yellow Scouting Ottuk
{376910,{201426}}, -- Brown War Ottuk
{376912,{198654}}, -- Otterworldly Ottuk Carrier
{376913,{201425}}, -- Yellow War Ottuk
{377071,{202086}}, -- Crimson Gladiator's Drake
{381529,{}}, -- Telix the Stormhorn
{384963,{198808}}, -- Guardian Vorquin
{385115,{198811}}, -- Majestic Armored Vorquin
{385131,{198809}}, -- Armored Vorquin Leystrider
{385134,{198810}}, -- Swift Armored Vorquin
{385262,{198824}}, -- Duskwing Ohuna
{385266,{198825}}, -- Zenet Hatchling
{385738,{201454}}, -- Temperamental Skyclaw
{386452,{}}, -- Frostbrood Proto-Wyrm
{387231,{199412}}, -- Hailstorm Armoredon
{387948,{}}, -- [PH] Wind Proto-Drake
{394216,{201702}}, -- Crimson Vorquin
{394218,{201704}}, -- Sapphire Vorquin
{394219,{201720}}, -- Bronze Vorquin
{394220,{201719}}, -- Obsidian Vorquin
{394737,{201789}}, -- Vicious Sabertooth
{394738,{201788}}, -- Vicious Sabertooth
{395095,{}}, -- Whelpling
{395644,{}}, -- Divine Kiss of Ohn'ahra
{397406,{206167}}, -- Wonderous Wavewhisker / Way of the Wonderous Wavewhisker
{399708,{203226}}, -- Stormfused Salamanther
{400733,{204091}}, -- Rocket Shredder 9001
{400976,{203727}}, -- Gleaming Moonbeast / Gleaming Moonbeast's Reins
{406637,{204798}}, -- Inferno Armoredon
{407555,{206162}}, -- Tarecgosa's Visage / Lingering Echo of Tarecgosa
{408313,{205155}}, -- Big Slick in the City
{408627,{205197}}, -- Igneous Shalewing
{408647,{205203}}, -- Cobalt Shalewing
{408648,{}}, -- Shalewing, Fire (Yellow) [PH]
{408649,{205205}}, -- Shadowflame Shalewing
{408651,{205204}}, -- Cataloged Shalewing / Flaming Shalewing Subject 01
{408653,{205209}}, -- Boulder Hauler / Boulder Hauler Reins
{408654,{}}, -- Sandy Shalewing
{408655,{205207}}, -- Morsel Sniffer / Morsel Sniffer Reins
{408977,{205233}}, -- Obsidian Gladiator's Slitherdrake
{409032,{205245}}, -- Vicious War Snail
{409034,{205246}}, -- Vicious War Snail
{411565,{206027}}, -- Felcrystal Scorpion / Reins of the Felcrystal Scorpion
{412088,{206156}}, -- Grotto Netherwing Drake
{413409,{}}, -- Riders of Azeroth Drake
{413825,{206566}}, -- Scarlet Pterrordax / Reins of the Scarlet Pterrordax
{413827,{206567}}, -- Harbor Gryphon
{413922,{206585}}, -- Valiance / Reins of Valiance
{414316,{206673}}, -- White War Wolf / Horn of the White War Wolf
{414323,{206674}}, -- Ravenous Black Gryphon / Reins of the Ravenous Black Gryphon
{414324,{206675}}, -- Gold-Toed Albatross
{414326,{206676}}, -- Felstorm Dragon
{414327,{206678}}, -- Sulfur Hound / Sulfur Hound's Leash
{414328,{206679}}, -- Perfected Juggernaut
{414334,{206680}}, -- Scourgebound Vanquisher / Reins of the Scourgebound Vanquisher
{414986,{206976}}, -- Royal Swarmer / Royal Swarmer's Reins
{417245,{207821}}, -- Ancestral Clefthoof
{417548,{}}, -- Riders of Azeroth Proto-Drake
{417552,{}}, -- Riders of Azeroth Velocidrake
{417554,{}}, -- Riders of Azeroth Wylderdrake
{417556,{}}, -- Riders of Azeroth Slitherdrake
{418078,{208152}}, -- Pattie / Pattie's Cap
{419002,{208433}}, -- Bronze Racer's Pennant
{419345,{208598}}, -- Eve's Ghastly Rider
{419567,{}}, -- Ginormous Grrloc
{420097,{208572}}, -- Azure Worldchiller
{424082,{210022}}, -- Mimiron's Jumpjets
-- end of live

-- ptr
--end of ptr

}

function ArkInventory.Collection.Mount.ImportCrossRefTable( )
	
	if not ImportCrossRefTable then return end
	if not ArkInventory.Collection.Mount.IsReady( ) then return end
	
	ImportCrossRefTableAttempt = ImportCrossRefTableAttempt + 1
	--ArkInventory.Output( "attempt ", ImportCrossRefTableAttempt )
	
	if ImportCrossRefTableAttempt > 8 or ( ArkInventory.Table.Elements( ImportCrossRefTable ) == 0 ) then
		
		ArkInventory.Table.Clean( ImportCrossRefTable )
		ImportCrossRefTable = nil
		
		return
		
	end
	
	
	local spell, key1, key2
	
	for k, v in pairs( ImportCrossRefTable ) do
		
		--ArkInventory.Output( k )
		
		spell = tonumber( v[1] ) or 0
		
		if spell > 0 then
			
			key2 = ArkInventory.ObjectIDCount( string.format( "spell:%s", spell ) )
			
			for k2, v2 in pairs( v[2] ) do
				
				v2 = tonumber( v2 ) or 0
				
				key1 = nil
				if v2 > 0 then
					key1 = ArkInventory.ObjectIDCount( string.format( "item:%s", v2 ) )
				end
				
				--ArkInventory.Output( k, " - ", spell, " - ", k2, " - ", key1, " - ", key2 )
				
				if key1 then
					
					if not ArkInventory.Global.ItemCrossReference[key1] then
						ArkInventory.Global.ItemCrossReference[key1] = { }
					end
					ArkInventory.Global.ItemCrossReference[key1][key2] = true
					
					if not ArkInventory.Global.ItemCrossReference[key2] then
						ArkInventory.Global.ItemCrossReference[key2] = { }
					end
					ArkInventory.Global.ItemCrossReference[key2][key1] = true
					
				end
				
			end
			
		end
		
		ImportCrossRefTable[k] = nil
		
	end
	
	--ArkInventory.Output( "mount xref import attempt ", ImportCrossRefTableAttempt, ": ", ArkInventory.Table.Elements( ImportCrossRefTable ), " entries left" )
	
end


-- the UI filters have no impact on the mount source so we can safely ignore them

function ArkInventory.Collection.Mount.OnHide( )
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", "FRAME_HIDE" )
end

function ArkInventory.Collection.Mount.IsReady( )
	return collection.isReady
end

function ArkInventory.Collection.Mount.GetCount( mta )
	if mta then
		ArkInventory.OutputDebug("mounts [", mta, "] [", ArkInventory.Table.Elements( collection.usable[mta] ), " / ", ArkInventory.Table.Elements( collection.owned[mta] ), "]" )
		return ArkInventory.Table.Elements( collection.usable[mta] ), ArkInventory.Table.Elements( collection.owned[mta] )
	else
		return collection.numOwned, collection.numTotal
	end
end

function ArkInventory.Collection.Mount.GetMount( index )
	if type( index ) == "number" then
		return collection.cache[index]
	end
end

function ArkInventory.Collection.Mount.ZoneCheck( mapid_table )
	local mapid = C_Map.GetBestMapForUnit( "player" )
	for _, id in ipairs( mapid_table ) do
		if mapid == id then
			return true
		end
	end
end

function ArkInventory.Collection.Mount.GetUsable( mta )
	if mta then
		return collection.usable[mta]
	end
end

function ArkInventory.Collection.Mount.isDragonridingAvailable( )
	
	local DragonRidingMounts = C_MountJournal.GetCollectedDragonridingMounts( )
	for _, mountID in pairs( DragonRidingMounts ) do
		local isUsable, useError = C_MountJournal.GetMountUsabilityByID( mountID, IsIndoors( ) )
		if isUsable then
			ArkInventory.OutputDebug( "dragonriding mount [", mountID, "] is usable here" )
			return true
		else
			ArkInventory.OutputDebug( "dragonriding mount [", mountID, "] is not usable here [", useError, "]" )
			return false
		end
	end
end

function ArkInventory.Collection.Mount.GetMountBySpell( spellID )
	local mountID = collection.cachespell[spellID]
	if mountID then
		local md = collection.cache[mountID]
		if md then
			return md
		end
	end
end

function ArkInventory.Collection.Mount.GetMountByID( mountID )
	if mountID then
		local md = collection.cache[mountID]
		if md then
			return md
		end
	end
end

function ArkInventory.Collection.Mount.IterateAll( )
	local t = collection.cache
	return ArkInventory.spairs( t, function( a, b ) return ( t[a].name or "" ) < ( t[b].name or "" ) end )
end

function ArkInventory.Collection.Mount.Iterate( mta )
	local t = collection.owned
	if mta and t[mta] then
		return ArkInventory.spairs( t[mta], function( a, b ) return ( t[mta][a].name or "" ) < ( t[mta][b].name or "" ) end )
	end
end

function ArkInventory.Collection.Mount.Dismiss( )
	C_MountJournal.Dismiss( )
end

function ArkInventory.Collection.Mount.Summon( id )
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	if obj then
		C_MountJournal.SummonByID( obj.index )
	end
end

function ArkInventory.Collection.Mount.GetFavorite( id )
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	if obj then
		return C_MountJournal.GetIsFavorite( obj.index )
	end
end

function ArkInventory.Collection.Mount.SetFavorite( id, value )
	-- value = true|false
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	--ArkInventory.Output( id, " / ", value, " (", type(value), ") / ", obj )
	if obj then
		C_MountJournal.SetIsFavorite( obj.index, value )
	end
end


function ArkInventory.Collection.Mount.IsFlyableAdvanced( )
	
	local IsFlyable = ArkInventory.CrossClient.IsAdvancedFlyableArea( ) and IsOutdoors( )
	
	return IsFlyable
	
end

function ArkInventory.Collection.Mount.IsFlyableNormal( )
	
	local IsFlyable = IsFlyableArea( ) -- its dynamic based off skill and location but its got some issues.  its usually only wrong about flying zones but it got worse in 7.3.5
	
	--local name, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, instanceMapId, instanceGroupSize, lfgID = GetInstanceInfo( )
	local instancemapid = select( 8, GetInstanceInfo( ) )
	local uimapid = C_Map.GetBestMapForUnit( "player" )
	
	if not IsFlyable then
		
		--ArkInventory.Output( "blizzard says this is NOT a flyable area" )
		
		-- /run ArkInventory.Output(IsFlyableArea())
		-- /run ArkInventory.Output({GetInstanceInfo()})
		
		if ArkInventory.Const.Flying.Bug735[instancemapid] then
			
			--ArkInventory.Output( "zone, instancemapid, " is not flyable, but you can actually fly here" )
			IsFlyable = true
			
		end
		
	end
	
	return IsFlyable
	
end

function ArkInventory.Collection.Mount.IsFlyable( )
	
	if IsIndoors( ) or ArkInventory.Collection.Mount.SkillLevel( ) < 225 then
		return false
	end
	
	local IsFlyable = ArkInventory.Collection.Mount.IsFlyableNormal( ) or ArkInventory.Collection.Mount.IsFlyableAdvanced( )
	
	--local name, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, instanceMapId, instanceGroupSize, lfgID = GetInstanceInfo( )
	local instancemapid = select( 8, GetInstanceInfo( ) )
	local uimapid = C_Map.GetBestMapForUnit( "player" )
	
	if IsFlyable then
		
		--ArkInventory.Output( "blizzard says this is a flyable area" )
		
		-- dont care what blizzard says, you cant actually fly in this zone
		if IsFlyable and ArkInventory.Const.Flying.Never.Instance[instancemapid] then
			--ArkInventory.Output( "zone ", instancemapid, " is non flyable" )
			IsFlyable = false
		end
		
		-- you can fly here but you need a specific achievement
		if IsFlyable and ArkInventory.Const.Flying.Achievement[instancemapid] then
			local known = select( 4, GetAchievementInfo( ArkInventory.Const.Flying.Achievement[instancemapid] ) )
			if not known then
				--ArkInventory.Output( "zone ", instancemapid, " but you do not have achievement ", ArkInventory.Const.Flying.Achievement[instancemapid] )
				IsFlyable = false
			end
		end
		
		-- you can fly here but you need a specific quest
		if IsFlyable and ArkInventory.Const.Flying.Quest[instancemapid] then
			local known = C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted( ArkInventory.Const.Flying.Quest[instancemapid] )
			if not known then
				--ArkInventory.Output( "zone ", instancemapid, " but you do not have quest ", ArkInventory.Const.Flying.Spell[instancemapid] )
				IsFlyable = false
			end
		end
		
		-- you can fly here but you need a specific spell
		if IsFlyable and ArkInventory.Const.Flying.Spell[instancemapid] then
			local known = IsSpellKnown( ArkInventory.Const.Flying.Spell[instancemapid] )
			if not known then
				--ArkInventory.Output( "zone ", instancemapid, " but you do not have spell ", ArkInventory.Const.Flying.Spell[instancemapid] )
				IsFlyable = false
			end
		end
		
		-- while you can fly in this zone, you cannot fly in this particular map
		if IsFlyable and ArkInventory.Const.Flying.Never.Map[uimapid] then
			--ArkInventory.Output( "zone ", instancemapid, " is flyable but map ", uimapid, " is not" )
			IsFlyable = false
		end
		
	end
	
	if IsFlyable then
		
		-- world pvp battle in progress?
		
		for index = 1, ArkInventory.CrossClient.GetNumWorldPVPAreas( ) do
			
			local pvpID, pvpZone, isActive = GetWorldPVPAreaInfo( index )
			--ArkInventory.Output( pvpID, " / ", pvpZone, " / ", isActive )
			
			if isActive and GetRealZoneText( ) == pvpZone then
				-- ArkInventory.Output( "battle in progress, no flying allowed" )
				IsFlyable = false
				break
			end
			
		end
		
	end
	
	return IsFlyable
	
end

function ArkInventory.Collection.Mount.isUsable( id )
	
	local md = ArkInventory.Collection.Mount.GetMount( id )
	if md then
		
		if IsUsableSpell( md.spellID ) then
			
			local mz = false
			
			--local mu = select( 5, C_MountJournal.GetMountInfoByID( id ) ) -- is not always correct
			local mu = C_MountJournal.GetMountUsabilityByID( id, IsIndoors( ) )
			if mu then
				
				if md.mta == "a" then
					if md.isDragonriding then
						if not ArkInventory.Collection.Mount.IsFlyableAdvanced( ) then
							mu = false
						end
					else
						if not ArkInventory.Collection.Mount.IsFlyableNormal( ) then
							mu = false
						end
					end
				end
				
				if ZoneRestrictions[md.spellID] then
					
					ArkInventory.OutputDebug( "mount ", md.spellID, " has zone restrictions ", ZoneRestrictions[md.spellID] )
					
					local map = C_Map.GetBestMapForUnit( "player" )
					for _, z in pairs( ZoneRestrictions[md.spellID] ) do
						if map == z then
							mz = true
							break
						end
					end
					
					if not mz then
						ArkInventory.OutputDebug( "mount ", md.spellID, " cannot be used here [zone=", map, "]" )
						mu = false
					end
					
				end
				
				return mu, mz
				
			end
			
		end
		
	end
	
end

function ArkInventory.Collection.Mount.SkillLevel( )
	
	local skill = 1 -- the chauffer and sea tutle mounts can be ridden by anyone reagrdless of riding skill
	
	if UnitLevel( "player" ) >= PLAYER_MOUNT_LEVEL then
		
		if IsSpellKnown( 90265 ) then
			-- master
			-- level 80
			-- 310% flying
			-- 100% ground
			skill = 310
		elseif IsSpellKnown( 34091 ) then
			-- artisan
			-- level 70
			-- 280% flying
			-- 100% ground
			skill = 300
		elseif IsSpellKnown( 34090 ) then
			-- expert
			-- level 60
			-- 150% flying
			-- 100% ground
			skill = 225
		elseif IsSpellKnown( 33391 ) then
			-- journeyman
			-- level 40
			-- 100% ground
			skill = 150
		elseif IsSpellKnown( 33388 ) then
			-- apprentice
			-- level 20
			-- 60% ground
			skill = 75
		end
		
	end
	
	return skill
	
end

function ArkInventory.Collection.Mount.GetEquipmentID( )
	local itemID = C_MountJournal.GetAppliedMountEquipmentID( )
	if itemID then
		itemID = string.format( "item:%s", itemID )
	end
	return itemID
end

function ArkInventory.Collection.Mount.UpdateOwned( )
	
	for mta, mt in pairs( ArkInventory.Const.Mount.Types ) do
		if not collection.owned[mta] then
			collection.owned[mta] = { }
		else
			wipe( collection.owned[mta] )
		end
	end
	
	for _, md in ArkInventory.Collection.Mount.IterateAll( ) do
		if md.owned then
			collection.owned[md.mta][md.index] = md
		end
	end
	
end

function ArkInventory.Collection.Mount.UpdateUsable( useDragonridingWhenAvailable, forceDragonridingAlternative )
	
	for mta in pairs( ArkInventory.Const.Mount.Types ) do
		if not collection.usable[mta] then
			collection.usable[mta] = { }
		else
			wipe( collection.usable[mta] )
		end
	end
	
	if not ArkInventory.Collection.Mount.IsReady( ) then return end
	
	local n = ArkInventory.Collection.Mount.GetCount( )
	if n == 0 then return end
	
	local me = ArkInventory.GetPlayerCodex( )
	
	ArkInventory.OutputDebug( "Area Flyable (Normal) = ", ArkInventory.Collection.Mount.IsFlyableNormal( ) )
	ArkInventory.OutputDebug( "Area Flyable (Advanced) = ", ArkInventory.Collection.Mount.IsFlyableAdvanced( ) )
	
	for mta, mt in pairs( ArkInventory.Const.Mount.Types ) do
		
		for checkType = 0, 2 do
			
			-- 0 = check for zone specific mounts
			-- 1 = preferred flying mount type (normal/dragonriding)
			-- 2 = pick any mount that works
			
			for _, md in ArkInventory.Collection.Mount.Iterate( mta ) do
				
				local usable = true
				local mz = false
				
				if me.player.data.ldb.mounts.type[mta].selected[md.spellID] == false then
					usable = false
				elseif not me.player.data.ldb.mounts.type[mta].useall then
					usable = me.player.data.ldb.mounts.type[mta].selected[md.spellID]
				end
				
				if usable then
					usable, mz = ArkInventory.Collection.Mount.isUsable( md.index )
				end
				
				if usable and checkType == 0 and not mz then
					usable = false
				end
				
				if usable and checkType == 1 and mta == "a" then
					if useDragonridingWhenAvailable then
						if forceDragonridingAlternative then
							if md.isDragonriding then
								usable = false
							end
						else
							if not md.isDragonriding then
								usable = false
							end
						end
					else
						if forceDragonridingAlternative then
							if not md.isDragonriding then
								usable = false
							end
						else
							if md.isDragonriding then
								usable = false
							end
						end
					end
				end
				
				if usable then
					collection.usable[mta][md.index] = md
				end
				
			end
			
			local c = ArkInventory.Table.Elements( collection.usable[mta] )
			
			ArkInventory.OutputDebug( "check type [", mta, "] [", checkType, "] mounts found [", c, "]" )
			
			if c > 0 then
				break
			end
			
		end
		
	end
	
end

function ArkInventory.Collection.Mount.ApplyUserCorrections( )
	
	-- apply user corrections (these are global settings so the mount may not exist for this character)
	
	for _, md in ArkInventory.Collection.Mount.IterateAll( ) do
		
		local correction = ArkInventory.db.option.mount.correction[md.spellID]
		
		if correction ~= nil then -- check for nil as we use both true and false
			if correction == md.mto then
				-- code has been updated, clear correction
				--ArkInventory.Output( "clearing mount correction ", md.spellID, ": system=", md.mt, ", correction=", correction )
				ArkInventory.db.option.mount.correction[md.spellID] = nil
				md.mt = md.mto
			else
				-- apply correction
				--ArkInventory.Output( "correcting mount ", md.spellID, ": system=", md.mt, ", correction=", correction )
				md.mt = correction
				
				for mta, mt in pairs( ArkInventory.Const.Mount.Types ) do
					if md.mt == mt then
						md.mta = mta
						break
					end
				end
				
			end
		end
		
	end
	
	ArkInventory.Collection.Mount.UpdateOwned( )
	
end


local function ScanInit( )
	
	collection.isInit = true
	
end

local function Scan_Threaded( thread_id )
	
	local update = false
	
	local numTotal = 0
	local numOwned = 0
	local YieldCount = 0
	
	--ArkInventory.Output2( "Mount: Start Scan @ ", time( ) )
	
	if not collection.isInit then
		ScanInit( )
		ArkInventory.ThreadYield_Scan( thread_id )
	end
	
	if not collection.isInit then
		-- recheck later
		return
	end
	
	local c = collection.cache
	
	local data_source = C_MountJournal.GetMountIDs( )
	
	for _, index in pairs( data_source ) do
		
		numTotal = numTotal + 1
		YieldCount = YieldCount + 1
		
		local name, spellID, icon, isActive, isUsable, source, isFavorite, isFactionSpecific, faction, shouldHideOnChar, isCollected, mountID, isDragonriding = C_MountJournal.GetMountInfoByID( index )
		local creatureDisplayInfoID, description, source2, isSelfMount, mountTypeID, uiModelSceneID = C_MountJournal.GetMountInfoExtraByID( index )
--		local isFavorite, canSetFavorite = C_MountJournal.GetIsFavorite( i )
		
		local i = mountID
		
		local isOwned = isCollected and not shouldHideOnChar
		
		if isFactionSpecific and not shouldHideOnChar then
			-- faction is either 0 = horde / 1 = alliance
			-- cater for races who are neutral until they choose a faction
			local f0 = -1
			local f1, f2 = UnitFactionGroup( "player" )
			f2 = f2 or FACTION_OTHER
			if f2 == FACTION_HORDE then
				f0 = 0
			elseif f2 == FACTION_ALLIANCE then
				f0 = 1
			end
			if faction ~= f0 then
				shouldHideOnChar = true
				isOwned = false
			end
		end
		
		if not c[i] then
			update = true
			c[i] = { index = index }
		end
		
		if c[i].name ~= name or c[i].index ~= index or c[i].spellID ~= spellID then
			
			update = true
			
			c[i].name = name
			c[i].spellID = spellID
			c[i].icon = icon
			c[i].source = source
			c[i].isFactionSpecific = isFactionSpecific
			c[i].faction = faction
			c[i].creatureDisplayInfoID = creatureDisplayInfoID
			c[i].description = description
			c[i].isSelfMount = isSelfMount
			c[i].mountTypeID = mountTypeID
			c[i].uiModelSceneID = uiModelSceneID
			c[i].isDragonriding = isDragonriding
			
			collection.cachespell[spellID] = i
			
			c[i].link = GetSpellLink( spellID )
			
			local mta = ( mountTypeID and ArkInventory.Const.Mount.TypeID[mountTypeID] ) or "x"
			if mta == "x" then
				ArkInventory.OutputDebug( "unknown mount type [", mountTypeID, "] for ", name )
			end
			
			c[i].mta = mta
			c[i].mt = ArkInventory.Const.Mount.Types[mta]
			c[i].mto = c[i].mt -- save original mount type (user corrections can override the other value)
			
		end
		
		if c[i].isCollected ~= isCollected then
			update = true
			c[i].isCollected = isCollected
		end
		
		if c[i].isActive ~= isActive then
			update = true
			c[i].isActive = isActive
		end
		
		if c[i].isUsable ~= isUsable then
			update = true
			c[i].isUsable = isUsable
		end
		
		if c[i].isFavorite ~= isFavorite then
			update = true
			c[i].isFavorite = isFavorite
		end
		
		if isOwned then
			numOwned = numOwned + 1
		end
		
		if c[i].owned ~= isOwned then
			update = true
			c[i].owned = isOwned
		end
		
		if YieldCount % ArkInventory.Const.YieldAfter == 0 then
			ArkInventory.ThreadYield_Scan( thread_id )
		end
		
	end
	
	ArkInventory.ThreadYield_Scan( thread_id )
	
	collection.numOwned = numOwned
	collection.numTotal = numTotal
	
	ArkInventory.Collection.Mount.ApplyUserCorrections( )
	
	--ArkInventory.Output2( "Mount: End Scan @ ", time( ), " [", collection.numOwned, "] [", collection.numTotal, "] [", update, "]" )
	
	collection.isReady = true
	
	ArkInventory.Collection.Mount.ImportCrossRefTable( )
	ArkInventory.Collection.Mount.ApplyUserCorrections( )
	
	if update then
		ArkInventory.ScanLocation( loc_id )
--		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
	end
	
end

local function Scan( )
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Collection, "mount" )
	
	if not ArkInventory.Global.Thread.Use then
		local tz = debugprofilestop( )
		ArkInventory.OutputThread( thread_id, " start" )
		Scan_Threaded( )
		tz = debugprofilestop( ) - tz
		ArkInventory.OutputThread( string.format( "%s took %0.0fms", thread_id, tz ) )
		return
	end

	local tf = function ( )
		Scan_Threaded( thread_id )
	end
	
	ArkInventory.ThreadStart( thread_id, tf )
	
end


function ArkInventory:EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET( events )
	
	--ArkInventory.Output2( "MOUNT BUCKET [", events, "]" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.Global.Mode.Combat then
		-- set to scan when leaving combat
		ArkInventory.Global.ScanAfterCombat[loc_id] = true
		return
	end
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (MOUNTS NOT MONITORED)" )
		return
	end
	
	if MountJournal:IsVisible( ) then
		--ArkInventory.Output( "ABORTED (MOUNT JOURNAL IS OPEN)" )
		return
	end
	
	if not collection.isScanning then
		collection.isScanning = true
		Scan( )
		collection.isScanning = false
	else
		--ArkInventory.Output( "IGNORED (MOUNT JOURNAL BEING SCANNED - WILL RESCAN WHEN DONE)" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", "RESCAN" )
	end
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_MOUNT_UPDATE( event, ... )
	
	if event == "COMPANION_LEARNED" or event == "COMPANION_UNLEARNED" then
		local arg1 = ...
		if arg1 == "MOUNT" then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", event )
		elseif arg1 == "PET" then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET", event )
		end
	elseif event == "NEW_MOUNT_ADDED" then
		--local arg1 = ... -- mount id
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", event )
	end
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_MOUNT_EQUIPMENT_UPDATE( event )
	local loc_id = ArkInventory.Const.Location.MountEquipment
	ArkInventory.ScanLocation( loc_id )	
end



function ArkInventory:EVENT_ARKINV_UNIT_AURA_BUCKET( events )
	
	--ArkInventory.Output( "events = [", events, "]" )
	
	if not IsMounted( ) then
		
		--ArkInventory.Output( "player is dismounted - check for run on dismount" )
		
		for loc_id in pairs( ArkInventory.Global.ScanAfterDismount ) do
			
			ArkInventory.Global.ScanAfterDismount[loc_id] = nil
			
			if loc_id == ArkInventory.Const.Location.Currency then
				ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE_BUCKET", "DISMOUNTED" )
			end
			
		end

	end
	
end

function ArkInventory:EVENT_ARKINV_UNIT_AURA( event, ... )
	
	local arg1, arg2, arg3 = ...
	
	if arg1 == "player" then
		--ArkInventory.Output( "event = [", event, "] [", arg1, "] [", arg2, "] [", arg3, "]" ) 
		ArkInventory:SendMessage( "EVENT_ARKINV_UNIT_AURA_BUCKET", event )
	end
	
end

function ArkInventory:EVENT_ARKINV_PLAYER_CAN_GLIDE_CHANGED( event, ... )
	
	--ArkInventory.Output( "event = [", event, "] [", arg1, "] [", arg2, "] [", arg3, "]" ) 
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", event )
	
end

function ArkInventory.SetMountMacro( )
	
	if not InCombatLockdown( ) then
		
		--ArkInventory.Output( "SetMountMacro" )
		
		local codex = ArkInventory.GetPlayerCodex( )
		
		local macrotext = ""
		macrotext = macrotext .. "/dismount [combat,mounted,noflying]" -- dismount if in combat and mounted and not flying
		macrotext = macrotext .. "\n/stopmacro [combat]" -- abort if in combat
		
		if codex.player.data.info.class == "DRUID" or codex.player.data.info.class == "WARLOCK" or codex.player.data.info.class == "SHAMAN" then
			macrotext = macrotext .. "\n/cancelform [noform:0]" -- cancel all forms
		end
		
		
		local usingtravelform = false
		if codex.player.data.ldb.travelform then
			
			if codex.player.data.info.class == "DRUID" then
				
				usingtravelform = true
				
				local cat_form = GetSpellInfo( 768 )
				local travel_form = GetSpellInfo( 783 )
				macrotext = macrotext .. "\n/cast [indoors] " .. cat_form .. "; " .. travel_form
				
			elseif codex.player.data.info.class == "SHAMAN" then
				-- shaman ghost wolf?
			end
			
		end
		
		
		if not usingtravelform then
			macrotext = macrotext .. "\n/run ArkInventory.LDB.Mounts.GetNext( )"
		end
		
		--ArkInventory.OutputDebug( macrotext )
		
		local btn = ARKINV_MountToggle
		if not btn then
			btn = CreateFrame( "Button", "ARKINV_MountToggle", UIParent, "SecureActionButtonTemplate" )
			btn:SetAttribute( "type", "macro" )
			btn:SetPoint( "CENTER" )
			btn:Hide( )
			btn:RegisterForClicks( "LeftButtonDown", "LeftButtonUp" )
		end
		btn:SetAttribute( "macrotext", macrotext )
		
		if ArkInventory.ClientCheck( nil, ArkInventory.ENUM.EXPANSION.SHADOWLANDS ) then
			
			local state = ArkInventory.CrossClient.GetCVarBool( "ActionButtonUseKeyDown" )
			
			-- /run C_CVar.SetCVar("ActionButtonUseKeyDown",1)
			
			if state then
				btn:RegisterForClicks( "LeftButtonDown" )
			else
				btn:RegisterForClicks( "LeftButtonUp" )
			end
		end
		
	end
	
end
