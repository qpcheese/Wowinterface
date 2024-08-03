local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_PetJournal = _G.C_PetJournal
local C_PetBattles = _G.C_PetBattles

local loc_id = ArkInventory.Const.Location.Pet
local BreedAvailable = ArkInventory.CrossClient.IsAddOnLoaded( "BattlePetBreedID" )

ArkInventory.Collection.Pet = { }

local collection = {
	
	isScanning = false,
	isReady = false,
	
	numTotal = 0, -- number of total pets
	numOwned = 0, -- number of owned pets
	
	cache = { }, -- [guid] = { }
	species = { }, -- [speciesID] = { } - all pet types
	ability = { }, -- [abilityID] = { } - all pet types
	creature = { },	-- [creatureID] = speciesID
	
	isTrainerDataLoaded = false,
	trainer = nil, -- linked to ArkInventory.db.cache.trainerspecies when acedb is loaded
	
	filter = {
		ignore = false,
		search = nil,
		collected = true,
		uncollected = true,
		family = { },
		source = { },
		backup = false,
	},
	
}

local ImportCrossRefTableAttempt = 0
local ImportCrossRefTable = {
-- {NPC_ID,{Item_ID1,Item_ID2,Item_IDx,-Spell_ID}}

-- manually added
{14878,{19462}}, -- Jubling / Unhatched Jubling Egg
{7546,{118675,-10699}}, -- Bronze Whelpling / Time-Locked Box
{17254,{23712,-30152}}, -- Ash'ana / White Tiger Cub
{55187,{75040}}, -- Darkmoon Balloon / Flimsy Darkmoon Balloon
{91226,{122477}}, -- Graves / My Special Pet

-- extracted from wowhead
{2671,{4401,-4055}}, -- Mechanical Squirrel / Mechanical Squirrel Box
{7385,{8485,-10673}}, -- Bombay Cat / Cat Carrier (Bombay)
{7384,{8486,-10674}}, -- Cornish Rex Cat / Cat Carrier (Cornish Rex)
{7383,{8491,-10675}}, -- Black Tabby Cat / Cat Carrier (Black Tabby)
{7382,{8487,-10676}}, -- Orange Tabby Cat / Cat Carrier (Orange Tabby)
{7380,{8490,-10677}}, -- Siamese Cat / Cat Carrier (Siamese)
{7381,{8488,-10678}}, -- Silver Tabby Cat / Cat Carrier (Silver Tabby)
{7386,{8489,-10679}}, -- White Kitten / Cat Carrier (White Kitten)
{7390,{8496,-10680}}, -- Cockatiel / Parrot Cage (Cockatiel)
{7391,{8494,-10682}}, -- Hyacinth Macaw / Parrot Cage (Hyacinth Macaw)
{7387,{8492,-10683}}, -- Green Wing Macaw / Parrot Cage (Green Wing Macaw)
{7389,{8495,-10684}}, -- Senegal / Parrot Cage (Senegal)
{7394,{11023,-10685}}, -- Ancona Chicken
{7395,{10393,-10688}}, -- Undercity Cockroach
{7543,{10822,-10695}}, -- Dark Whelpling
{7547,{34535,-10696}}, -- Azure Whelpling
{7544,{8499,-10697}}, -- Crimson Whelpling / Tiny Crimson Whelpling
{7545,{8498,-10698}}, -- Emerald Whelpling
{7550,{11027,-10703}}, -- Wood Frog / Wood Frog Box
{7549,{11026,-10704}}, -- Tree Frog / Tree Frog Box
{7555,{8501,-10706}}, -- Hawk Owl
{7553,{8500,-10707}}, -- Great Horned Owl
{14421,{10394,-10709}}, -- Brown Prairie Dog / Prairie Dog Whistle
{7560,{8497,-10711}}, -- Snowshoe Rabbit / Rabbit Crate (Snowshoe)
{7561,{44822,-10713}}, -- Albino Snake
{7565,{10360,-10714}}, -- Black Kingsnake
{7562,{10361,-10716}}, -- Brown Snake
{7567,{10392,-10717}}, -- Crimson Snake
{8376,{10398,-12243}}, -- Mechanical Chicken
{30379,{11110,-13548}}, -- Westfall Chicken / Chicken Egg
{9656,{11825,-15048}}, -- Pet Bombling
{9657,{11826,-15049}}, -- Lil' Smoky
{9662,{11474,-15067}}, -- Sprite Darter Hatchling / Sprite Darter Egg
{10259,{12264,-15999}}, -- Worg Pup / Worg Carrier
{10598,{12529,68673,-16450}}, -- Smolderweb Hatchling / Smolderweb Carrier
{11325,{13583,-17707}}, -- Panda Cub / Panda Collar
{11326,{13584,-17708}}, -- Mini Diablo / Diablo Stone
{11327,{13582,-17709}}, -- Zergling / Zergling Leash
{12419,{15996,-19772}}, -- Lifelike Toad / Lifelike Mechanical Toad
{14756,{19054,-23530}}, -- Tiny Red Dragon / Red Dragon Orb
{14755,{19055,-23531}}, -- Tiny Green Dragon / Green Dragon Orb
{14878,{19450,-23811}}, -- Jubling / A Jubling's Tiny Home
{15186,{20371,-24696}}, -- Murky / Blue Murloc Egg
{15358,{30360,-24988}}, -- Lurky / Lurky's Egg
{15429,{20769,-25162}}, -- Disgusting Oozeling
{15699,{21277,-26010}}, -- Tranquil Mechanical Yeti
{15710,{21309,-26045}}, -- Tiny Snowman / Snowman Kit
{15706,{21308,-26529}}, -- Winter Reindeer / Jingling Bell
{15698,{21301,-26533}}, -- Father Winter's Helper / Green Helper Box
{15705,{21305,-26541}}, -- Winter's Little Helper / Red Helper Box
{16069,{22114,-27241}}, -- Gurky / Pink Murloc Egg
{16085,{22235,-27570}}, -- Peddlefeet / Truesilver Shafted Arrow
{16456,{22781,-28505}}, -- Poley / Polar Bear Collar
{16547,{23002,-28738}}, -- Speedy / Turtle Box
{16548,{23007,-28739}}, -- Mr. Wiggles / Piglet's Collar
{16549,{23015,-28740}}, -- Whiskers the Rat / Rat Cage
{16701,{23083,-28871}}, -- Spirit of Summer / Captured Flame
{17255,{23713,-30156}}, -- Hippogryph Hatchling
{18381,{25535,-32298}}, -- Netherwhelp / Netherwhelp's Collar
{18839,{27445,-33050}}, -- Magical Crawdad / Magical Crawdad Box
{20408,{29363,-35156}}, -- Mana Wyrmling
{20472,{29364,-35239}}, -- Brown Rabbit / Brown Rabbit Crate
{21010,{29901,-35907}}, -- Blue Moth / Blue Moth Egg
{21009,{29902,-35909}}, -- Red Moth / Red Moth Egg
{21008,{29903,-35910}}, -- Yellow Moth / Yellow Moth Egg
{21018,{29904,-35911}}, -- White Moth / White Moth Egg
{21055,{29953,-36027}}, -- Golden Dragonhawk Hatchling
{21064,{29956,-36028}}, -- Red Dragonhawk Hatchling
{21063,{29957,-36029}}, -- Silver Dragonhawk Hatchling
{21056,{29958,-36031}}, -- Blue Dragonhawk Hatchling
{21076,{29960,-36034}}, -- Firefly / Captured Firefly
{22445,{31760,-39181}}, -- Miniwing
{22943,{32233,-39709}}, -- Wolpertinger / Wolpertinger's Tankard
{23114,{-40319}}, -- Lucky
{23198,{32498,-40405}}, -- Lucky / Fortune Coin
{23234,{32588,-40549}}, -- Bananas / Banana Charm
{23231,{32617,-40613}}, -- Willy / Sleepy Willy
{23258,{32616,-40614}}, -- Egbert / Egbert's Egg
{23266,{32622,-40634}}, -- Peanut / Elekk Training Collar
{23274,{40653,-40990}}, -- Stinker / Reeking Pet Carrier
{23909,{33154,-42609}}, -- Sinister Squashling
{24388,{33816,-43697}}, -- Toothy / Toothy's Bucket
{24389,{33818,-43698}}, -- Muckbreath / Muckbreath's Bucket
{24480,{33993,-43918}}, -- Mojo
{24753,{46707,-44369}}, -- Pint-Sized Pink Pachyderm
{25062,{34478,69991,-45082}}, -- Tiny Sporebat
{25109,{34492,-45125}}, -- Rocket Chicken
{25110,{34493,-45127}}, -- Dragon Kite
{25146,{34518,-45174}}, -- Golden Pig / Golden Pig Coin
{25147,{34519,-45175}}, -- Silver Pig / Silver Pig Coin
{25706,{34955,-45890}}, -- Searing Scorchling / Scorched Stone
{26050,{35349,-46425}}, -- Snarly / Snarly's Bucket
{26056,{35350,-46426}}, -- Chuck / Chuck's Bucket
{26119,{35504,-46599}}, -- Phoenix Hatchling
{27217,{37297,-48406}}, -- Spirit of Competition / Gold Medallion
{27346,{37298,-48408}}, -- Essence of Competition / Competitor's Souvenir
{27914,{38050,-49964}}, -- Ethereal Soul-Trader / Soul-Trader Beacon
{28470,{38628,-51716}}, -- Nether Ray Fry
{28513,{38658,-51851}}, -- Vampiric Batling
{28883,{39286,-52615}}, -- Frosty / Frosty's Collar
{29089,{39656,-53082}}, -- Mini Tyrael / Tyrael's Hilt
{29147,{39973,-53316}}, -- Ghostly Skull
{24968,{34425,-54187}}, -- Clockwork Rocket Bot
{29726,{41133,-55068}}, -- Mr. Chilly / Unhatched Mr. Chilly
{31575,{43698,-59250}}, -- Giant Sewer Rat
{32589,{39896,-61348}}, -- Tickbird Hatchling
{32590,{39899,-61349}}, -- White Tickbird Hatchling
{32592,{44721,-61350}}, -- Proto-Drake Whelp
{32591,{39898,-61351}}, -- Cobra Hatchling
{32595,{44723,-61357}}, -- Pengu / Nurtured Penguin Egg
{32643,{44738,-61472}}, -- Kirin Tor Familiar
{32791,{44794,-61725}}, -- Spring Rabbit / Spring Rabbit's Foot
{32818,{44810,-61773}}, -- Plump Turkey / Turkey Cage
{32841,{44819,-61855}}, -- Baby Blizzard Bear
{32939,{44841,-61991}}, -- Little Fawn / Little Fawn's Salt Lick
{33188,{44965,-62491}}, -- Teldrassil Sproutling
{33194,{44970,-62508}}, -- Dun Morogh Cub
{33197,{44971,-62510}}, -- Tirisfal Batling
{33198,{44973,-62513}}, -- Durotar Scorpion
{33200,{44974,-62516}}, -- Elwynn Lamb
{33219,{44980,-62542}}, -- Mulgore Hatchling
{33226,{44983,-62561}}, -- Strand Crawler
{33205,{44984,-62562}}, -- Ammen Vale Lashling
{33227,{44982,-62564}}, -- Enchanted Broom
{33238,{44998,-62609}}, -- Argent Squire
{33274,{45002,-62674}}, -- Mechanopeep
{33239,{45022,-62746}}, -- Argent Gruntling
{33578,{45180,46892,-63318}}, -- Murkimus the Gladiator / Murkimus' Little Spear
{33810,{45606,-63712}}, -- Sen'jin Fetish
{34031,{-64351}}, -- XS-001 Constructor Bot
{34278,{46325,-65046}}, -- Withers
{34364,{46398,-65358}}, -- Calico Cat / Cat Carrier (Calico Cat)
{33530,{46545,-65381}}, -- Curious Oracle Hatchling
{33529,{46544,-65382}}, -- Curious Wolvar Pup
{34587,{46767,95621,-65682}}, -- Warbot / Warbot Ignition Key
{34694,{46802,-66030}}, -- Grunty / Heavy Murloc Egg
{34724,{46820,46821,69992,-66096}}, -- Shimmering Wyrmling
{34770,{46831,-66175}}, -- Macabre Marionette
{34930,{-66520}}, -- Jade Tiger
{35396,{48112,-67413}}, -- Darting Hatchling
{35395,{48114,-67414}}, -- Deviate Hatchling
{35400,{48116,-67415}}, -- Gundrak Hatchling
{35387,{48118,-67416}}, -- Leaping Hatchling
{35399,{48120,-67417}}, -- Obsidian Hatchling
{35397,{48122,-67418}}, -- Ravasaur Hatchling
{35398,{48124,-67419}}, -- Razormaw Hatchling
{35394,{48126,-67420}}, -- Razzashi Hatchling
{35468,{48527,-67527}}, -- Onyx Panther / Enchanted Onyx
{36482,{49287,-68767}}, -- Tuskarr Kite
{36511,{49343,-68810}}, -- Spectral Tiger Cub
{36607,{49362,-69002}}, -- Onyxian Whelpling
{36871,{49646,-69452}}, -- Core Hound Pup
{36908,{49662,-69535}}, -- Gryphon Hatchling
{36909,{49663,-69536}}, -- Wind Rider Cub
{36910,{49664,-69539}}, -- Zipao Tiger / Enchanted Purple Jade
{36911,{49665,-69541}}, -- Pandaren Monk
{36979,{49693,-69677}}, -- Lil' K.T. / Lil' Phylactery
{37865,{49912,-70613}}, -- Perky Pug
{38374,{50446,-71840}}, -- Toxic Wasteling
{40198,{53641,-74932}}, -- Frigid Frostling / Ice Chip
{40295,{54436,-75134}}, -- Blue Clockwork Rocket Bot
{40624,{54810,-75613}}, -- Celestial Dragon
{40703,{54847,-75906}}, -- Lil' XT
{40721,{-75936}}, -- Murkimus the Gladiator
{42078,{56806,-78381}}, -- Mini Thor
{42177,{65661,-78683}}, -- Blue Mini Jouster
{42183,{65662,-78685}}, -- Gold Mini Jouster
{43800,{59597,-81937}}, -- Personal World Destroyer
{43916,{60216,-82173}}, -- De-Weaponized Mechanical Companion
{45128,{60847,-84263}}, -- Crawling Claw
{45247,{60869,-84492}}, -- Pebble
{45340,{60955,-84752}}, -- Fossilized Hatchling
{46896,{62540,-87344}}, -- Lil' Deathwing
{47169,{-87863}}, -- Hardboiled Egg / Eat the Egg
{47944,{63138,-89039}}, -- Dark Phoenix Hatchling
{48107,{63355,64996,-89472}}, -- Rustberg Gull / Rustberg Seagull
{48242,{63398,-89670}}, -- Armadillo Pup
{48376,{-89929}}, -- Rumbling Rockling
{48377,{-89930}}, -- Swirling Stormling
{48378,{-89931}}, -- Whirling Waveling
{48609,{64372,-90523}}, -- Clockwork Gnome
{48641,{64403,90897,90898,-90637}}, -- Fox Kit
{48982,{64494,-91343}}, -- Tiny Shale Spider
{49586,{65361,-92395}}, -- Guild Page
{49588,{65362,-92396}}, -- Guild Page
{49587,{65363,-92397}}, -- Guild Herald
{49590,{65364,-92398}}, -- Guild Herald
{50384,{-93461}}, -- Landro's Lil' XT
{50468,{67128,-93624}}, -- Landro's Lil' XT
{50586,{66076,-93739}}, -- Mr. Grubbs
{51632,{66080,-93813}}, -- Tiny Flamefly
{51634,{-93815}}, -- Bubbles
{51635,{66073,-93817}}, -- Scooter the Snail / Snail Shell
{51636,{-93818}}, -- Lizzy
{51090,{66067,-93823}}, -- Singing Sunflower / Brazie's Sunflower Seeds
{46898,{67274,-93836}}, -- Enchanted Lantern
{50545,{67275,-93837}}, -- Magic Lamp
{50722,{67282,-93838}}, -- Elementium Geode
{51122,{67418,-94070}}, -- Deathy / Smoldering Murloc Egg
{51601,{68618,-95786}}, -- Moonkin Hatchling
{51600,{68385,-95787}}, -- Lil' Ragnaros
{51649,{68619,-95909}}, -- Moonkin Hatchling
{52226,{68833,-96571}}, -- Panther Cub
{52343,{68840,-96817}}, -- Landro's Lichling
{52344,{68841,-96819}}, -- Nightsaber Cub
{52831,{69239,-97638}}, -- Winterspring Cub
{52894,{69251,-97779}}, -- Lashtail Hatchling
{53048,{69648,-98079}}, -- Legs
{53225,{69821,-98571}}, -- Pterrordax Hatchling
{53232,{69824,-98587}}, -- Voodoo Figurine
{53283,{69847,72068,-98736}}, -- Guardian Cub
{53623,{70099,-99578}}, -- Cenarion Hatchling
{53658,{70140,-99663}}, -- Hyjal Bear Cub
{53661,{70160,-99668}}, -- Crimson Lasher
{53884,{70908,-100330}}, -- Feline Familiar
{54027,{71033,-100576}}, -- Lil' Tarecgosa
{54128,{71076,-100684}}, -- Creepy Crate
{54227,{71140,-100970}}, -- Nuts / Nuts' Acorn
{54374,{71387,-101424}}, -- Brilliant Kaliri
{54383,{71624,-101493}}, -- Purple Puffer
{54438,{71726,-101606}}, -- Murkablo / Murky's Little Soulstone
{54491,{73764,-101733}}, -- Darkmoon Monkey
{54539,{72042,-101986}}, -- Alliance Balloon
{54541,{72045,-101989}}, -- Horde Balloon
{54730,{72134,-102317}}, -- Gregarious Grell / Grell Moss
{54745,{72153,-102353}}, -- Sand Scarab
{54487,{73765,-103074}}, -- Darkmoon Turtle
{55187,{73762,-103076}}, -- Darkmoon Balloon
{55215,{73797,-103125}}, -- Lumpy / Lump of Coal
{55356,{73903,-103544}}, -- Darkmoon Tonk
{55367,{73905,-103549}}, -- Darkmoon Zeppelin
{55386,{73953,-103588}}, -- Sea Pony
{55571,{74610,-104047}}, -- Lunar Lantern
{55574,{74611,-104049}}, -- Festival Lantern
{56031,{74981,-105122}}, -- Darkmoon Cub
{56266,{76062,-105633}}, -- Fetish Shaman / Fetish Shaman's Spear
{58163,{78916,-110029}}, -- Soul of the Aspects
{59020,{79744,-112994}}, -- Eye of the Legion
{59358,{80008,-114090}}, -- Darkmoon Rabbit
{61086,{89587,-118414}}, -- Porcupette
{61877,{82774,-120501}}, -- Jade Owl
{61883,{82775,-120507}}, -- Sapphire Cub
{62829,{84105,-122748}}, -- Fishy
{63097,{-123212}}, -- Shore Crawler
{63098,{-123214}}, -- Gilnean Raven
{63365,{85220,-123778}}, -- Terrible Turnip
{63370,{85222,-123784}}, -- Red Cricket
{63559,{85447,-124000}}, -- Tiny Goldfish
{63621,{85578,-124152}}, -- Feral Vermling
{63832,{85871,-124660}}, -- Lucky Quilen Cub
{64632,{86562,-126247}}, -- Hopling
{64633,{86563,-126249}}, -- Aqua Strider / Hollow Reed
{64634,{86564,-126251}}, -- Grinder / Imbued Jade Fragment
{64899,{87526,-126885}}, -- Mechanical Pandaren Dragonling
{66105,{89367,-127006}}, -- Yu'lon Kite
{66104,{89368,-127008}}, -- Chi-Ji Kite
{65313,{85513,-127813}}, -- Thundering Serpent Hatchling
{64232,{88147,-127815}}, -- Singing Cricket / Singing Cricket Cage
{65314,{88148,-127816}}, -- Jade Crane Chick
{66450,{89686,-130726}}, -- Jade Tentacle
{66491,{89736,-130759}}, -- Venus
{66950,{90173,-131590}}, -- Pandaren Water Spirit
{66984,{90177,-131650}}, -- Baneling
{67230,{90900,-132574}}, -- Imperial Moth
{67233,{90902,-132580}}, -- Imperial Silkworm
{68502,{90953,-132759}}, -- Spectral Cub
{67319,{91003,-132762}}, -- Darkmoon Hatchling
{67329,{91031,-132785}}, -- Darkmoon Glowfly
{67332,{91040,-132789}}, -- Darkmoon Eye
{68267,{92707,-134538}}, -- Cinder Kitten
{68466,{92798,-134892}}, -- Pandaren Fire Spirit
{68467,{92799,-134894}}, -- Pandaren Air Spirit
{68468,{92800,-134895}}, -- Pandaren Earth Spirit
{68601,{93025,-135156}}, -- Clock'em
{68656,{93030,-135254}}, -- Giant Bone Spider / Dusty Clutch of Eggs
{68657,{93032,-135255}}, -- Fungal Abomination / Blighted Spore
{68655,{93031,-135256}}, -- Mr. Bigglesworth
{68654,{93029,-135257}}, -- Stitched Pup / Gluth's Bone
{68665,{93033,-135258}}, -- Harbinger of Flame / Mark of Flame
{68664,{93034,-135259}}, -- Corefire Imp / Blazing Rune
{68666,{93035,-135261}}, -- Ashstone Core / Core of Hardened Ash
{68661,{93036,-135263}}, -- Untamed Hatchling / Unscathed Egg
{68662,{93038,-135264}}, -- Chrominius / Whistle of Chromatic Bone
{68663,{93037,-135265}}, -- Death Talon Whelpguard / Blackwing Banner
{68660,{93039,-135266}}, -- Viscidus Globule
{68659,{93040,-135267}}, -- Anubisath Idol
{68658,{93041,-135268}}, -- Mini Mindslayer / Jewel of Maddening Whispers
{69208,{93669,-136484}}, -- Gusting Grimoire
{69649,{94025,-137568}}, -- Red Panda
{69748,{94125,-137977}}, -- Living Sandling
{69778,{94124,-138082}}, -- Sunreaver Micro-Sentry
{69796,{94126,-138087}}, -- Zandalari Kneebiter
{69820,{94152,-138161}}, -- Son of Animus
{69848,{94190,-138285}}, -- Spectral Porcupette
{69849,{94191,-138287}}, -- Stunted Direhorn
{69891,{94208,-138380}}, -- Sunfur Panda
{69893,{94209,-138381}}, -- Snowy Panda
{69892,{94210,-138382}}, -- Mountain Panda
{70082,{94903,-138824}}, -- Pierre
{70083,{94574,-138825}}, -- Pygmy Direhorn
{70098,{94595,-138913}}, -- Spawn of G'nathus
{70144,{94835,-139148}}, -- Ji-Kun Hatchling
{70154,{94573,-139153}}, -- Direhorn Runt
{70257,{94932,-139361}}, -- Tiny Red Carp
{70258,{94933,-139362}}, -- Tiny Blue Carp
{70259,{94934,-139363}}, -- Tiny Green Carp
{70260,{94935,-139365}}, -- Tiny White Carp
{70451,{95422,-139932}}, -- Zandalari Anklerender
{70452,{95423,-139933}}, -- Zandalari Footslasher
{70453,{95424,-139934}}, -- Zandalari Toenibbler
{71014,{97548,-141433}}, -- Lil' Bad Wolf / Spiky Collar
{71015,{97549,-141434}}, -- Menagerie Custodian / Instant Arcane Sanctum Security Kit
{71016,{97550,-141435}}, -- Netherspace Abyssal / Netherspace Portal-Stone
{71017,{97552,-141436}}, -- Tideskipper / Shell of Tide-Calling
{71018,{97553,-141437}}, -- Tainted Waveling / Tainted Core
{71019,{97554,-141446}}, -- Coilfang Stalker / Dripping Strider Egg
{71020,{97555,-141447}}, -- Pocket Reaver / Tiny Fel Engine Key
{71021,{97556,-141448}}, -- Lesser Voidcaller / Crystal of the Void
{71022,{97557,-141449}}, -- Phoenix Hawk Hatchling / Brilliant Phoenix Hawk Feather
{71023,{97558,-141450}}, -- Tito / Tito's Basket
{71033,{97551,-141451}}, -- Fiendish Imp / Satyr Charm
{71159,{97821,-141789}}, -- Gahz'rooki / Gahz'rooki's Summoning Stone
{71199,{97959,-142028}}, -- Living Fluid / Quivering Blob
{71200,{97960,-142029}}, -- Viscous Horror / Dark Quivering Blob
{71201,{97961,-142030}}, -- Filthling / Half-Empty Food Container
{71488,{98550,-142880}}, -- Blossoming Ancient
{71655,{100870,128423,-143637}}, -- Zeradar / Summon Zeradar / Murkimus' Tyrannical Spear
{71693,{100905,-143703}}, -- Rascal-Bot
{71700,{-143732}}, -- Crafty
{72160,{101570,-144761}}, -- Moon Moon
{71942,{101771,-145696}}, -- Xu-Fu, Cub of Xuen
{72462,{102145,-145697}}, -- Chi-Chi, Hatchling of Chi-Ji
{72463,{102147,-145698}}, -- Yu'la, Broodling of Yu'lon
{72464,{102146,-145699}}, -- Zao, Calfling of Niuzao
{73011,{103670,-147124}}, -- Lil' Bling
{73533,{104156,-148046}}, -- Ashleaf Spriteling / Ashleaft Spriteling
{73534,{104157,-148047}}, -- Azure Crane Chick
{73352,{104158,-148049}}, -- Blackfuse Bombling
{73356,{104159,-148050}}, -- Ruby Droplet
{73532,{104160,-148051}}, -- Dandelion Frolicker
{73364,{104161,-148052}}, -- Death Adder Hatchling
{73350,{104162,-148058}}, -- Droplet of Y'Shaarj
{73351,{104163,-148059}}, -- Gooey Sha-ling
{73355,{104164,-148060}}, -- Jademist Dancer
{73354,{104165,-148061}}, -- Kovok
{73357,{104166,-148062}}, -- Ominous Flame
{73367,{104167,-148063}}, -- Skunky Alemental
{73368,{-148065}}, -- Skywisp Moth
{73366,{104168,-148066}}, -- Spineclaw Crab
{73359,{104169,-148067}}, -- Gulp Froglet
{73542,{-148068}}, -- Ashwing Moth
{73543,{-148069}}, -- Flamering Moth
{73668,{104202,-148373}}, -- Bonkers
{73688,{103637,-148427}}, -- Vengeful Porcupette
{73730,{104291,-148527}}, -- Gu'chi Swarmling / Swarmling of Gu'chi
{73732,{104295,-148530}}, -- Harmonious Porcupette
{73738,{104307,-148552}}, -- Jadefire Spirit
{73741,{104317,-148567}}, -- Rotten Little Helper / Rotten Helper Box
{73809,{104332,-148684}}, -- Sky Lantern
{74402,{106240,-149787}}, -- Alterac Brew-Pup / Alterac Brandy
{74405,{106244,-149792}}, -- Murkalot / Murkalot's Flail
{74413,{106256,-149810}}, -- Treasure Goblin / Treasure Goblin's Pack
{77137,{109014,-155748}}, -- Dread Hatchling
{77221,{111660,-155838}}, -- Iron Starlette
{78421,{113558,-158261}}, -- Weebomination
{78895,{110684,-159296}}, -- Lil' Leftovers / Leftovers
{79039,{110721,-159581}}, -- Crazy Carrot
{79410,{111402,-160403}}, -- Mechanical Axebeak
{80101,{111866,-161643}}, -- Royal Peachick / Royal Peacock
{80329,{112057,-162135}}, -- Lifelike Mechanical Frostboar
{81431,{112699,-164212}}, -- Teroclaw Hatchling
{82464,{113216,-166071}}, -- Elekk Plushie
{83562,{113554,-167336}}, -- Zomstrok
{83584,{118599,-167389}}, -- Autumnal Sproutling
{83583,{119149,-167390}}, -- Forest Sproutling / Captured Forest Sproutling
{83589,{-167392}}, -- Kelp Sproutling
{83594,{118595,-167394}}, -- Nightshade Sproutling
{83592,{-167395}}, -- Sassy Sproutling
{83588,{118598,-167397}}, -- Sun Sproutling
{83817,{113623,-167731}}, -- Ghastly Kid / Spectral Bell
{84330,{114834,-168668}}, -- Meadowstomper Calf / Meadowstomper Calfling
{84441,{114919,-168977}}, -- Sea Calf
{84521,{114968,-169220}}, -- Deathwatch Hatchling
{84885,{119142,-169666}}, -- Draenei Micro Defender
{84915,{115301,-169695}}, -- Molten Corgi
{76873,{123862,-170267}}, -- Hogs / Hogs' Studded Collar
{87669,{118574,-170268}}, -- Hatespark the Tiny
{86081,{116815,-170269}}, -- Netherspawn, Spawn of Netherspawn
{86447,{-170270}}, -- Ikky
{88452,{119150,-170271}}, -- Sky Fry
{88103,{118709,-170272}}, -- Doom Bloom / Dread Dandelion
{86879,{118207,-170273}}, -- Hydraling
{86422,{117380,-170274}}, -- Frostwolf Ghostpup
{88490,{119170,-170275}}, -- Eye of Observation
{84853,{119328,-170276}}, -- Soul of the Forge
{88401,{119143,-170277}}, -- Son of Sethe
{88692,{119431,-170278}}, -- Servant of Demidos
{88300,{119467,-170279}}, -- Puddle Terror
{85667,{118919,-170280}}, -- Ore Eater / Red Goren Egg
{87111,{119141,-170281}}, -- Frostwolf Pup
{85231,{116402,-170282}}, -- Stonegrinder
{88573,{120050,-170283}}, -- Veilwatcher Hatchling
{87257,{-170284}}, -- Pygmy Cow / Pygmy Cow (G4BC)
{85387,{117564,-170285}}, -- Fruit Hunter
{85014,{119146,-170286}}, -- Bone Wasp
{85281,{119148,-170287}}, -- Albino River Calf / Indentured Albino River Calf
{88134,{118741,-170288}}, -- Mechanical Scorpid
{87705,{118577,-170289}}, -- Stormwing
{87257,{-170290}}, -- Pygmy Cow / Pygmy Cow (BSG)
{87704,{118578,-170291}}, -- Firewing
{85284,{115483,-170292}}, -- Sky-Bo
{85527,{116064,-170774}}, -- Syd the Squid
{85710,{116155,-171118}}, -- Lovebird Hatchling
{85773,{116258,-171222}}, -- Mystical Spring Bouquet
{85846,{116403,-171500}}, -- Bush Chicken / Frightened Bush Chicken
{85872,{116439,-171552}}, -- Blazing Cindercrawler
{85994,{116756,-171758}}, -- Stout Alemental
{86061,{116801,-171912}}, -- Cursed Birman
{86067,{116804,-171915}}, -- Widget the Departed
{86420,{117354,-172632}}, -- Ancient Nest Guardian
{86445,{117404,-172695}}, -- Land Shark
{86532,{117528,-172998}}, -- Lanticore Spawnling
{86715,{118101,-173532}}, -- Zangar Spore
{86716,{118106,-173542}}, -- Crimson Spore
{86717,{118104,-173543}}, -- Umbrafen Spore
{86718,{118105,-173544}}, -- Seaborne Spore
{86719,{118107,-173547}}, -- Brilliant Spore
{88222,{118921,-176137}}, -- Everbloom Peachick
{88225,{118923,-176140}}, -- Sentinel's Companion
{77021,{119434,-177212}}, -- Albino Chimaeraling
{88574,{120051,-177215}}, -- Kaliri Hatchling
{87257,{120309,-177216}}, -- Pygmy Cow / Glass of Warm Milk
{143814,{163816,-177217}}, -- Snapper
{91408,{122533,-177218}}, -- Young Talbuk
{143813,{163815,-177219}}, -- Littlehoof
{88814,{-177220}}, -- Nethaera's Light
{143812,{163814,-177221}}, -- Mischievous Zephyr
{143811,{163813,-177222}}, -- Playful Frostkin
{91407,{122534,-177223}}, -- Slithershock Elver
{143810,{163812,-177224}}, -- Laughing Stonekin
{143809,{163811,-177225}}, -- Giggling Flame
{143808,{163810,-177226}}, -- Thistlebrush Bud
{88367,{119468,-177227}}, -- Sunfire Kaliri
{143807,{163809,-177228}}, -- Deathsting Scorpid
{143806,{163808,-177229}}, -- Sandshell Chitterer
{143805,{163807,-177230}}, -- Tinder Pup
{143804,{163806,-177231}}, -- False Knucklebump
{88807,{118516,-177232}}, -- Argi
{88830,{120121,-177233}}, -- Trunks
{88805,{118517,-177234}}, -- Grommloc
{143803,{163805,-177235}}, -- Craghoof Kid
{143802,{163804,-177236}}, -- Kindleweb Spiderling
{143801,{163803,-177237}}, -- Sparkleshell Sandcrawler
{88577,{122532,-177238}}, -- Bone Serpent
{143799,{163802,-177239}}, -- Inky
{143798,{163801,-177240}}, -- Octopode Fry
{143797,{163800,-177241}}, -- Poro
{143796,{163799,-177242}}, -- Barnaby
{143795,{163798,-177243}}, -- Captain Nibs
{143794,{163797,-177244}}, -- Scuttle
{90200,{122105,-179811}}, -- Grotesque / Grotesque Statue
{90201,{122104,-179830}}, -- Leviathan Hatchling / Leviathan / Leviathan Egg
{90202,{122106,-179831}}, -- Abyssius / Shard of Supremus
{90203,{122107,-179832}}, -- Fragment of Anger
{90204,{122108,-179833}}, -- Fragment of Suffering
{90205,{122109,-179834}}, -- Fragment of Desire
{90206,{122110,-179835}}, -- Sister of Temptation / Sultry Grimoire
{90207,{122111,-179836}}, -- Stinkrot / Smelly Gravestone
{90208,{122112,-179837}}, -- Hyjal Wisp
{90212,{122113,-179838}}, -- Sunblade Micro-Defender / Sunblade Rune of Activation
{90213,{122114,-179839}}, -- Chaos Pup / Void Collar
{90214,{122115,-179840}}, -- Wretched Servant / Servant's Bell
{90215,{122116,-179841}}, -- K'ute / Holy Chime
{90345,{122125,-179954}}, -- Race MiniZep / Race MiniZep Controller
{91226,{-181086}}, -- Graves
{91823,{129205,-184480}}, -- Fel Pup / A Tiny Infernal Collar
{93142,{127705,-184481}}, -- Lost Netherpup
{93143,{127748,-184482}}, -- Cinder Pup
{93483,{127753,-185055}}, -- Nightmare Bell
{93808,{126926,-185591}}, -- Ghostshell Crab / Translucent Shell
{93814,{126925,-185601}}, -- Blorp / Blorp's Bubble
{96622,{128354,146417,-186299}}, -- Grumpy / Grumpy's Leash
{88575,{127701,-187376}}, -- Glowing Sporebat
{88415,{127703,-187383}}, -- Dusty Sporewing
{88514,{127704,-187384}}, -- Bloodthorn Hatchling
{94623,{127749,-187532}}, -- Corrupted Nest Guardian
{93352,{127754,-187555}}, -- Periwinkle Calf
{94867,{127856,-188084}}, -- Left Shark
{94927,{127868,-188235}}, -- Crusher
{95572,{128309,-189357}}, -- Shard of Cyrukh
{95841,{128426,-190020}}, -- Nibbles
{85283,{128424,-190035}}, -- Brightpaw / Summon Brightpaw
{85009,{128427,-190036}}, -- Murkidan / Summon Murkidan
{96123,{128478,-190681}}, -- Blazing Firehawk
{96126,{128477,-190682}}, -- Savage Cub
{96403,{128533,152879,152880,-191071}}, -- Enchanted Cauldron
{96404,{128534,-191072}}, -- Enchanted Torch
{96405,{128535,-191073}}, -- Enchanted Pen
{96649,{128690,-191425}}, -- Ashmaw Cub
{97229,{128770,-191967}}, -- Grumpling
{98004,{129108,-193279}}, -- Son of Goredome
{98077,{129175,-193368}}, -- Crispin
{97207,{129178,-193388}}, -- Emmigosa
{98116,{129188,-193434}}, -- Bleakwater Jelly
{97205,{129208,-193514}}, -- Stormborne Whelpling
{98236,{129216,-193572}}, -- Energized Manafiend / Vibrating Arcane Crystal
{98237,{129217,-193588}}, -- Empowered Manafiend / Warm Arcane Crystal
{98238,{129218,-193589}}, -- Empyreal Manafiend / Glittering Arcane Crystal
{97079,{129277,-193680}}, -- Skyhorn Nestling
{98463,{129362,-193943}}, -- Broot
{98185,{129760,-194294}}, -- Fel Piglet
{98132,{129798,-194330}}, -- Plump Jelly
{97238,{129826,-194357}}, -- Nursery Spider
{97127,{129878,-194393}}, -- Nightwatch Swooper
{99394,{130168,-195368}}, -- Fetid Waveling
{99389,{130167,-195369}}, -- Thistleleaf Adventurer
{99403,{130166,-195370}}, -- Risen Saber Kitten
{103159,{134047,-204148}}, -- Baby Winston
{97126,{136897,-210665}}, -- Northern Hawk Owl
{97128,{136898,-210669}}, -- Fledgling Warden Owl
{97174,{136899,-210671}}, -- Extinguished Eye
{97178,{136900,-210672}}, -- Hateful Eye
{97179,{136901,-210673}}, -- Eye of Inquisition
{97206,{136902,-210674}}, -- Dream Whelpling / Toxic Whelpling
{112015,{136903,-210675}}, -- Nightmare Whelpling
{98128,{136904,-210677}}, -- Sewer-Pipe Jelly
{98172,{136905,-210678}}, -- Ridgeback Piglet
{98181,{136906,-210679}}, -- Brown Piglet
{98182,{136907,-210680}}, -- Black Piglet
{98183,{136908,-210681}}, -- Thaumaturgical Piglet
{99425,{136910,-210682}}, -- Alarm-o-Bot
{99505,{136911,-210683}}, -- Knockoff Blingtron
{99513,{136913,-210690}}, -- Vicious Broodling / Red Broodling
{99526,{136914,-210691}}, -- Leyline Broodling
{99527,{-210692}}, -- Crystalline Broodling / Purple Broodling
{99528,{-210693}}, -- Thornclaw Broodling / Yellow Broodling
{106152,{136919,-210694}}, -- Baby Elderhorn
{106181,{136920,-210695}}, -- Sunborne Val'kyr
{106210,{136921,132519,-210696}}, -- Trigger
{106232,{136922,-210697}}, -- Wyrmy Tunkins
{106270,{136923,-210698}}, -- Celestial Calf
{106278,{136924,-210699}}, -- Felbat Pup
{106283,{136925,-210701}}, -- Corgi Pup
{107206,{137298,-212749}}, -- Zoom
{108568,{130154,-215560}}, -- Pygmy Owl
{109216,{138810,-217218}}, -- Sting Ray Pup
{111296,{139776,-221683}}, -- Horde Fanatic
{111202,{139775,-221684}}, -- Alliance Enthusiast
{111425,{139789,-221906}}, -- Transmutant
{111423,{139790,-221907}}, -- Untethered Wyrmling
{111421,{139791,-221908}}, -- Lurking Owl Kitten
{111984,{140261,-223027}}, -- Hungering Claw
{79730,{140274,-223110}}, -- River Calf
{112132,{140316,-223339}}, -- Firebat Pup
{112144,{140320,-223359}}, -- Corgnelius
{112167,{140323,-223409}}, -- Lagan
{112728,{140672,-224403}}, -- Court Scribe
{112798,{140741,-224536}}, -- Nightmare Lasher
{112945,{140761,-224786}}, -- Nightmare Treant
{113136,{140934,-225200}}, -- Benax
{113440,{141316,-225663}}, -- Squirky / Odd Murloc Egg
{113527,{141893,-225761}}, -- Mischief
{113827,{141348,-226682}}, -- Wondrous Wisdomball
{113855,{141352,-226813}}, -- Rescued Fawn
{113984,{141895,-227051}}, -- Legionnaire Murky
{113983,{141894,-227052}}, -- Knight-Captain Murky
{114063,{141530,-227093}}, -- Snowfang / Snowfang's Trust
{33975,{141532,-227113}}, -- Noblegarden Bunny
{114543,{141714,-227964}}, -- Igneous Flameling
{115135,{142083,-229090}}, -- Dreadmaw / Giant Worm Egg
{115136,{142084,-229091}}, -- Snobold Runt / Magnataur Hunting Horn
{115137,{142085,-229092}}, -- Nerubian Swarmer / Nerubian Relic
{115138,{142086,-229093}}, -- Magma Rageling / Red-Hot Coal
{115139,{142087,-229094}}, -- Ironbound Proto-Whelp / Ironbound Collar
{115140,{142088,-229095}}, -- Runeforged Servitor / Stormforged Rune
{115141,{142089,-229096}}, -- Sanctum Cub / Glittering Ball of Yarn
{115142,{142090,-229097}}, -- Winter Rageling / Ominous Pile of Snow
{115143,{142091,-229098}}, -- Snaplasher / Blessed Seed
{115144,{142092,-229099}}, -- G0-R41-0N Ultratonk / Overcomplicated Controller
{115145,{142093,-229100}}, -- Creeping Tentacle / Wriggling Darkness
{115146,{142094,-229101}}, -- Boneshard / Fragment of Frozen Bone
{115147,{142095,-229102}}, -- Blood Boil / Remains of a Blood Beast
{115148,{142096,-229103}}, -- Blightbreath / Putricide's Alchemy Supplies
{115149,{142097,-229104}}, -- Soulbroken Whelpling / Skull of a Frozen Whelp
{115150,{142098,-229105}}, -- Drudge Ghoul / Drudge Remains
{115152,{142099,-229106}}, -- Wicked Soul / Call of the Frozen Blade
{115158,{142100,-229110}}, -- Stardust
{115784,{-230073}}, -- Snowfeather Hatchling
{115785,{-230074}}, -- Direbeak Hatchling
{115786,{-230075}}, -- Sharptalon Hatchling
{115787,{-230076}}, -- Bloodgazer Hatchling
{115918,{142379,-230443}}, -- Dutiful Squire
{115919,{142380,-230444}}, -- Dutiful Gruntling
{116080,{142448,-231017}}, -- Albino Buzzard
{61087,{142223,-231215}}, -- Sun Darter Hatchling
{116871,{143679,-232867}}, -- Crackers
{117180,{143756,-233331}}, -- Everliving Spore
{117182,{143754,-233333}}, -- Cavern Moccasin
{117184,{143755,-233335}}, -- Young Venomfang
{117340,{151645,-233647}}, -- Dibbler / Model D1-BB-L3R
{117341,{151269,-233649}}, -- Naxxy
{117343,{163218,-233650}}, -- Hearthy
{117371,{143842,-233805}}, -- Trashy
{118060,{143953,-234555}}, -- Infinite Hatchling
{118063,{143954,-234556}}, -- Paradox Spirit
{119040,{144394,-236285}}, -- Tylarr Gronnden
{119498,{147539,-237250}}, -- Bloodbrood Whelpling
{119499,{147540,-237251}}, -- Frostbrood Whelpling
{119500,{147541,-237252}}, -- Vilebrood Whelpling
{120397,{146953,-240064}}, -- Scraps
{120830,{147542,-240794}}, -- Ban-Fu, Cub of Ban-Lu
{120973,{-241072}}, -- Golden Retriever
{121317,{147543,-242047}}, -- Son of Skum
{121715,{147841,-243136}}, -- Orphaned Felbat
{122033,{147900,-243499}}, -- Twilight
{119794,{150739,-244345}}, -- Pocket Cannon
{122612,{150741,-244440}}, -- Tricorne
{122629,{150742,-244466}}, -- Foe Reaper 0.9 / Pet Reaper 50 / Pet Reaper 0.9
{123650,{151234,-246105}}, -- Shadow
{124389,{151569,-247123}}, -- Sneaky Marmot
{124589,{151632,-247452}}, -- Mining Monkey
{124594,{151633,-247474}}, -- Dig Rat
{124858,{151829,-248025}}, -- Bronze Proto-Whelp / Summon Bronze Proto-Whelp
{124944,{151828,-248240}}, -- Ageless Bronze Drake / Summon Ageless Bronze Drake
{63724,{101426,-249870}}, -- Micronax / Micronax Controller
{126579,{152555,-251191}}, -- Ghost Shark
{127850,{152966,-253788}}, -- Tinytron / Rough-Hewn Remote
{127852,{152967,-253790}}, -- Discarded Experiment / Experiment-In-A-Jar
{127853,{152968,-253799}}, -- Rattlejaw / Shadowy Pile of Bones
{127857,{152969,-253805}}, -- Twilight Clutch-Sister / Odd Twilight Egg
{127858,{152970,-253809}}, -- Bound Stream / Lesser Circle of Binding
{127859,{152972,-253813}}, -- Faceless Minion / Twilight Summoning Portal
{127862,{152973,-253816}}, -- Zephyrian Prince / Zephyr's Call
{127863,{152974,-253818}}, -- Drafty / Breezy Essence
{127947,{152975,-253916}}, -- Blazehound / Smoldering Treat
{127948,{152976,-253918}}, -- Cinderweb Recluse / Cinderweb Egg
{127950,{152977,-253924}}, -- Surger / Vibrating Stone
{127951,{152978,-253925}}, -- Infernal Pyreclaw / Fandral's Pet Carrier
{127952,{152979,-253926}}, -- Faceless Mindlasher / Puddle of Black Liquid
{127953,{152980,-253927}}, -- Corrupted Blood / Elementium Back Plate
{127954,{152981,-253928}}, -- Unstable Tendril / Severed Tentacle
{127956,{152963,-253929}}, -- Amalgam of Destruction
{128118,{153026,-254196}}, -- Cross Gazer
{128119,{153027,-254197}}, -- Orphaned Marsuul
{128146,{153040,-254255}}, -- Felclaw Marsuul
{128137,{153045,-254271}}, -- Fel Lasher
{128157,{153054,-254295}}, -- Docile Skyfin
{128158,{153055,-254296}}, -- Fel-Afflicted Skyfin
{128159,{153056,-254297}}, -- Grasping Manifestation
{128160,{153057,-254298}}, -- Fossorial Bile Larva
{128388,{153252,-254749}}, -- Rebellious Imp
{128396,{153195,-254763}}, -- Uuna / Uuna's Doll
{129049,{153541,-255702}}, -- Tottle
{129253,{162686,-256010}}, -- REUSE / Demon Goat
{131644,{156566,-259758}}, -- Dart
{132366,{156721,-260887}}, -- Mailemental
{133064,{156851,-261755}}, -- Silithid Mini-Tank
{134406,{158077,-264001}}, -- Francois / Faberge Egg
{138742,{160587,-272771}}, -- Whomper / Summon Whomper
{138741,{160588,-272772}}, -- Cap'n Crackers / Summon Cap'n Crackers
{138964,{160702,-273159}}, -- Spawn of Merektha / Summon Spawn of Merektha
{139049,{160704,-273184}}, -- Filthy Slime / Summon Filthy Slime / Filthy Bucket
{139073,{158464,-273195}}, -- Poda / Summon Poda
{139081,{160708,-273215}}, -- Smoochums / Summon Smoochums / Smoochums' Bloody Heart
{139252,{160847,-273839}}, -- Guardian Cobra Hatchling / Summon Guardian Cobra Hatchling / Snake Charmer's Flute
{139372,{160940,-273869}}, -- Vengeful Chicken / Summon Vengeful Chicken / Intact Chicken Brain
{139622,{161016,-274202}}, -- Lil' Tika / Summon Lil' Tika
{139744,{161080,-274348}}, -- Direhorn Hatchling / Summon Direhorn Hatchling / Intact Direhorn Egg
{139770,{161081,-274353}}, -- Taptaf / Summon Taptaf
{139782,{161089,-274380}}, -- Restored Revenant / Summon Restored Revenant / Pile of Bones
{139743,{152878,-274760}}, -- Enchanted Tiki Mask / Summon Enchanted Tiki Mask
{140125,{161214,-274776}}, -- Miimii / Summon Mummy / Thousand Year Old Mummy Wraps
{141941,{162578,-277461}}, -- Baa'l / Baa'ls Darksign
{143142,{163220,-279129}}, -- Rooter
{143160,{163244,-279171}}, -- Brutus
{143175,{163489,-279205}}, -- Abyssal Eel
{143176,{163490,-279206}}, -- Seabreeze Bumblebee / Pair of Bee Wings
{143177,{163491,166791,-279207}}, -- Corlain Falcon / Pristine Falcon Feather
{143178,{163492,-279208}}, -- Drustvar Piglet
{143179,{163493,-279209}}, -- Frenzied Cottontail / Bloody Rabbit Fang
{143181,{163494,-279210}}, -- Bilefang Skitterer / Wad of Spider Web
{143184,{163495,-279211}}, -- Greatwing Macaw / Greatwing Macaw Feather
{143188,{163496,-279212}}, -- Mechanical Prairie Dog / Strange Looking Mechanical Squirrel
{143189,{163497,-279213}}, -- Wicker Pup / Spooky Bundle of Sticks
{143191,{163498,-279214}}, -- Tiny Direhorn
{143193,{163499,-279215}}, -- Zandalari Shinchomper / Raptor Containment Crate
{143194,{163500,-279216}}, -- Bloodfeaster Larva
{143195,{163501,-279217}}, -- Tragg the Curious
{143196,{163502,-279218}}, -- Lil' Ben'fon
{143197,{163503,-279219}}, -- Ranishu Runt
{143198,{163504,-279220}}, -- Child of Jani
{143199,{163505,-279221}}, -- Swamp Toad / Toad in a Box
{143200,{163506,-279224}}, -- Accursed Hexxer
{143202,{163560,-279225}}, -- Saurolisk Hatchling
{143203,{163508,-279226}}, -- Blue Flitter / Butterfly in a Jar
{143204,{163509,-279227}}, -- Freshwater Pincher
{143205,{163510,-279228}}, -- Crimson Frog
{143206,{163511,-279230}}, -- Barnacled Hermit Crab
{143207,{163512,-279231}}, -- Sandstinger Wasp
{143209,{163513,-279232}}, -- Cou'pa
{143211,{163514,-279233}}, -- Carnivorous Lasher / Violent Looking Flower Pot
{143214,{163515,-279234}}, -- Azeriti / Shard of Azerite
{143611,{163555,-279365}}, -- Azerite Puddle / Drop of Azerite
{143360,{163568,-279433}}, -- Lost Platysaur
{143374,{163859,-279435}}, -- Baby Crawg
{143464,{163634,-279576}}, -- Dreadtick Leecher
{143499,{163648,-279631}}, -- Fuzzy Creepling
{143503,{163650,-279638}}, -- Aldrusian Sproutling
{143507,{163652,-279643}}, -- Voidwiggler / Tiny Grimoire
{143515,{163677,-279657}}, -- Teeny Titan Orb
{143533,{163684,-279686}}, -- Scabby
{143563,{163689,-279723}}, -- Ragepeep / Angry Egg
{143564,{163690,-279724}}, -- Foulfeather / Plagued Egg
{143627,{163711,-279929}}, -- Fozling / Shard of Fozruk
{143628,{163712,-279930}}, -- Squawkling / Mana-Warped Egg
{143730,{163776,-280157}}, -- Bumbles / Large Honeycomb Cluster
{143738,{163778,-280185}}, -- Lil' Siege Tower
{143739,{163779,-280188}}, -- Lil' War Machine
{143815,{163817,-280331}}, -- Sunscale Hatchling
{143816,{163818,-280332}}, -- Bloodstone Tunneler
{143817,{163819,-280333}}, -- Snort
{143818,{163820,-280334}}, -- Muskflank Calfling
{143819,{163821,-280335}}, -- Juvenile Brineshell
{143820,{163822,-280336}}, -- Kunchong Hatchling
{143821,{163823,-280337}}, -- Coldlight Surfrunner
{143822,{163824,-280338}}, -- Voru'kar Leecher
{143957,{163860,-280617}}, -- Gearspring Hopper / Wind-Up Frog
{143958,{163861,-280618}}, -- Bloated Bloodfeaster / Undulating Blue Sac
{143959,{163858,-280619}}, -- Slippy / Ball of Tentacles
{144004,{163974,-280727}}, -- Bucketshell
{144005,{163975,-280728}}, -- Sir Snips
{144617,{164629,-281878}}, -- Test Pet
{145946,{164969,-283740}}, -- Horse Balloon
{145947,{164971,-283741}}, -- Murloc Balloon
{145948,{164970,-283744}}, -- Wolf Balloon
{147221,{165722,-285843}}, -- Redridge Tarantula / Redridge Tarantula Egg
{147583,{165845,-286474}}, -- Feathers
{147587,{165847,-286482}}, -- Thunder Lizard Runt / Thundering Scale of Akunda
{147586,{165846,-286483}}, -- Child of Pa'ku / Enchanted Talon of Pa'ku
{147585,{165848,-286484}}, -- Spawn of Krag'wa
{147619,{165849,-286514}}, -- Mechantula
{147671,{165854,-286574}}, -- Mechanical Cockroach
{147679,{165855,-286576}}, -- Leper Rat / Leper Rat Tail
{147692,{165857,-286582}}, -- Alarm-O-Dog / Rechargeable Alarm-O-Dog Battery
{147838,{165894,-286790}}, -- Mini Spider Tank
{147884,{165907,-286837}}, -- Wicker Wraith
{148520,{166345,-287997}}, -- Dasher / Zandalari Raptor Egg
{148524,{166346,-288006}}, -- Trecker / Trecker's Cage
{148525,{166347,-288009}}, -- Tanzil
{148542,{166358,-288054}}, -- Proper Parrot
{148781,{166449,-288486}}, -- Darkshore Sentinel
{148784,{166448,-288582}}, -- Gust of Cyclarus / Binding of Cyclarus
{148825,{166451,-288592}}, -- Detective Ray / Rattling Bones
{148841,{166452,-288595}}, -- Hydrath Droplet / Hydrath Water Droplet / Bottled Essence of Hydrath
{148843,{166453,-288597}}, -- Everburning Treant
{148844,{166454,-288598}}, -- Void Jelly / Squishy Purple Goo
{148846,{166455,-288600}}, -- Zur'aj the Depleted
{148976,{166486,-288867}}, -- Baby Stonehide
{148979,{166487,-288868}}, -- Leatherwing Screecher
{148981,{166488,-288870}}, -- Rotting Ghoul
{148982,{166489,-288875}}, -- Needleback Pup
{148984,{166492,-288889}}, -- Shadefeather Hatchling
{148985,{166491,-288890}}, -- Albino Duskwatcher
{148988,{166493,-288895}}, -- Firesting Buzzer
{148989,{166494,-288901}}, -- Lord Woofington
{148990,{166495,-288910}}, -- Tonguelasher
{148991,{166498,-288914}}, -- Scritches
{148995,{166499,-288916}}, -- Thunderscale Whelpling
{148997,{166500,-288919}}, -- Crimson Octopode
{149205,{166528,-289359}}, -- Nightwreathed Watcher
{149348,{166715,-289604}}, -- Rebuilt Gorilla Bot
{149361,{166723,-289605}}, -- Rebuilt Mechanical Spider
{149363,{166714,-289606}}, -- Albatross Hatchling / Albatross Feather
{149372,{166716,-289622}}, -- Crimson Bat Pup / Pair of Tiny Bat Wings
{149375,{166718,-289629}}, -- Cobalt Raven / Cobalt Raven Hatchling
{149376,{166719,-289633}}, -- Violet Abyssal Eel
{150098,{167008,-291203}}, -- Mr. Crabs / Sandy Hermit Crab Shell
{150119,{167010,-291214}}, -- Beakbert
{150120,{167011,-291215}}, -- Froglet / Slimy Pouch
{150126,{167009,-291223}}, -- Scaley / Enchanted Saurolisk Scale
{150354,{167047,-291513}}, -- Stoneclaw
{150356,{167048,-291515}}, -- Wayward Spirit
{150357,{167049,-291517}}, -- Comet / Celestial Gift
{150360,{167050,-291533}}, -- Baoh-Xi / Mogu Statue
{150365,{167051,-291537}}, -- Azure Windseeker / Azure Cloud Serpent Egg
{150372,{167052,-291547}}, -- Spirit of the Spring
{150374,{167058,-291548}}, -- Kor'thik Swarmling
{150375,{167053,-291549}}, -- Amberglow Stinger / Tiny Amber Wings
{150377,{167054,-291553}}, -- Spawn of Garalon
{150380,{167055,-291556}}, -- Living Amber / Amber Goo Puddle
{150381,{167056,-291560}}, -- Ravenous Prideling / Essence of Pride
{150385,{167057,-291561}}, -- Happiness
{151779,{172016,-294206}}, -- Lil' Nefarian
{151780,{178533,-294211}}, -- Jingles / Shaking Pet Carrier
{151788,{-294231}}, -- Dottie
{151631,{167804,-294274}}, -- Slimy Sea Slug
{151700,{167805,-294275}}, -- Slimy Otter
{151673,{167806,-294276}}, -- Slimy Octopode
{151696,{167807,-294277}}, -- Slimy Fangtooth
{151697,{167808,-294278}}, -- Slimy Eel
{151651,{167809,-294279}}, -- Slimy Darkhunter
{151632,{167810,-294280}}, -- Slimy Hermit Crab
{154165,{169205,-300367}}, -- Ghostly Whelpling
{154445,{169670,-300387}}, -- Minimancer / Evil Wizard Hat
{154693,{169322,-300934}}, -- Adventurous Hopling / Adventurous Hopling Pack
{154819,{169348,-301015}}, -- Zanj'ir Poker
{154822,{169349,-301020}}, -- Kelpfin
{154823,{169350,-301021}}, -- Glittering Diamondshell
{154824,{169351,-301022}}, -- Sandclaw Nestseeker
{154825,{169352,-301023}}, -- Pearlescent Glimmershell
{154826,{169353,-301024}}, -- Lustrous Glimmershell
{154827,{169354,-301025}}, -- Brilliant Glimmershell
{154828,{169355,-301026}}, -- Chitterspine Needler
{154829,{169356,-301027}}, -- Caverndark Nightmare
{154830,{169357,-301028}}, -- Chitterspine Devourer
{154831,{169358,-301029}}, -- Lightless Ambusher
{154832,{169359,-301030}}, -- Spawn of Nalaada
{154833,{169360,-301031}}, -- Mindlost Bloodfrenzy
{154834,{169361,-301032}}, -- Daggertooth Frenzy
{154835,{169362,-301033}}, -- Nameless Octopode
{154836,{169363,-301034}}, -- Amethyst Softshell
{154837,{169364,-301035}}, -- Prismatic Softshell
{154838,{169365,-301036}}, -- Damplight Slug
{154839,{169366,-301037}}, -- Wriggler
{154840,{169367,-301038}}, -- Seafury
{154841,{169368,-301039}}, -- Stormwrath
{154842,{169369,-301040}}, -- Sandkeep
{154843,{169370,-301041}}, -- Scalebrood Hydra
{154820,{169371,-301042}}, -- Murgle
{154821,{169372,-301043}}, -- Necrofin Tadpole
{154845,{169373,-301044}}, -- Brinestone Algan
{154846,{169374,-301045}}, -- Budding Algan
{154847,{169375,-301046}}, -- Coral Lashling
{154848,{169376,-301047}}, -- Skittering Eel
{154849,{169377,-301048}}, -- Drowned Hatchling
{154850,{169378,-301049}}, -- Golden Snorf
{154851,{169379,-301050}}, -- Snowsoft Nibbler
{154852,{169380,-301051}}, -- Mustyfur Snooter
{154853,{169381,-301052}}, -- OOX-35/MG
{154854,{169382,-301053}}, -- Lost Robogrip
{154855,{169383,-301054}}, -- Utility Mechanoclaw
{154856,{169384,-301055}}, -- Microbot XD
{154857,{169385,-301056}}, -- Microbot 8D
{154893,{169392,-301136}}, -- Bonebiter
{154894,{169393,-301137}}, -- Arachnoid Skitterbot
{154904,{169396,-301162}}, -- Echoing Oozeling
{155240,{169679,-301985}}, -- Gruesome Belcher / Smelly Cleaver
{155244,{169678,-301992}}, -- Ziggy
{155246,{169677,-301996}}, -- Crypt Fiend
{155248,{169676,-302003}}, -- Shrieker / Contained Banshee Wail
{155600,{169886,-303023}}, -- Spraybot 0D
{155579,{169879,-303608}}, -- Irradiated Elementaling / Melted Irradiated Undercoat
{155829,{170072,-303784}}, -- Armored Vaultbot
{155865,{170102,-303899}}, -- Burnout
{157524,{173296,-307264}}, -- Rikki / Rikki's Pith Helmet
{157715,{-307654}}, -- Gillvanas
{157716,{-307655}}, -- Finduin
{157969,{-308067}}, -- Anima Wyrmling
{158142,{-308369}}, -- Daisy
{158681,{172491,-309516}}, -- Papi
{158683,{172492,-309519}}, -- Sunsoaked Flitter
{158685,{172493,-309522}}, -- Crimson Skipper / Snarling Butterfly Crate
{159783,{-311289}}, -- Jenafur
{160187,{173726,-312029}}, -- Void-Scarred Toad / Box With Faintly Glowing 'Air' Holes
{160196,{174646,-312030}}, -- Void-Scarred Pup / Void-Link Frostwolf Collar
{160703,{173891,-312833}}, -- Plagueborn Slime
{161919,{174446,-315221}}, -- Muar / Fractured Obsidian Claw
{161921,{174447,-315225}}, -- Void-Scarred Anubisath
{161923,{174448,-315229}}, -- Aqir Hivespawn
{161924,{174449,-315231}}, -- Ra'kim
{161946,{174452,-315270}}, -- Eye of Corruption
{161951,{174456,-315285}}, -- Gloop / Bottle of Gloop
{161959,{174457,-315290}}, -- C'Thuffer
{161961,{174458,-315297}}, -- Void-Scarred Hare
{161962,{174459,-315298}}, -- Void-Scarred Cat / Voidwoven Cat Collar
{161963,{174460,-315301}}, -- Void-Scarred Rat / Box Labeled \"Danger: Void Rat Inside\"
{161964,{174461,-315302}}, -- Anomalus / Swirling Black Bottle
{161966,{174462,-315303}}, -- Void-Scarred Beetle / Void Cocoon
{161967,{174463,-315304}}, -- Reek
{161954,{174473,-315339}}, -- K'uddly
{161992,{174474,-315353}}, -- Corrupted Tentacle
{161997,{174475,-315355}}, -- Rotbreath / Stinky Sack
{162004,{174476,-315360}}, -- Aqir Tunneler / Black Chitinous Plate
{162006,{174477,-315363}}, -- Pygmy Camel
{162007,{174481,-315367}}, -- Cursed Dune Watcher
{162012,{174478,-315370}}, -- Wicked Lurker
{162013,{174479,-315371}}, -- Jade Defender
{162014,{174480,-315372}}, -- Windfeather Chick / Windfeather Quill
{162677,{174827,-316627}}, -- Wailing Lasher
{162670,{174829,-316628}}, -- Tinyclaw
{162663,{174828,-316629}}, -- Experiment 13
{163646,{175049,-318300}}, -- Shadowbarb Hatchling
{163897,{175114,-318876}}, -- Renny
{169514,{180034,-329900}}, -- Glimr / Glimr's Cracked Egg
{170421,{180208,-330997}}, -- PHA7-YNX
{171117,{180584,-333794}}, -- Blushing Spiderling
{171118,{180585,-333795}}, -- Wrathling / Bottled Up Rage
{171119,{180586,-333796}}, -- Bound Lightspawn / Lightbinders
{171120,{180587,-333797}}, -- Animated Tome
{171121,{180588,-333799}}, -- Primordial Bogling / Bucket of Primordial Sludge
{171122,{180589,-333800}}, -- Burdened Soul / Soullocked Sinstone
{171124,{180591,-333802}}, -- Raw Emotion / Vial of Roiling Emotions
{171125,{180592,-333803}}, -- Trapped Stonefiend
{171127,{180593,-333804}}, -- Court Messenger / Court Messenger Scroll
{171136,{183859,-333819}}, -- Dal / Dal's Courier Badge
{171150,{180602,-333865}}, -- Crimson Dredwing Pup
{171151,{180603,-333868}}, -- Violet Dredwing Pup
{171227,{180628,-334139}}, -- Pearlwing Heron
{171240,{180629,-334141}}, -- Devouring Animite
{171230,{180630,-334142}}, -- Gorm Harrier
{171231,{180631,-334143}}, -- Gorm Needler
{171241,{180633,-334145}}, -- Grubby
{171243,{180634,-334146}}, -- Gloober, as G'huun
{171242,{180635,-334149}}, -- Hungry Burrower
{171224,{180636,-334150}}, -- Willowbreeze
{171225,{180637,-334151}}, -- Starry Dreamfoal
{171235,{180638,-334153}}, -- Fuzzy Shimmermoth
{171233,{180639,-334154}}, -- Dusty Sporeflutterer
{171234,{180640,-334155}}, -- Amber Glitterwing
{171248,{180641,-334156}}, -- Floofa
{171238,{180642,-334157}}, -- Cloudfeather Fledgling
{171239,{180643,-334158}}, -- Chirpy Valeshrieker
{171246,{180644,-334159}}, -- Rocky
{171247,{180645,-334160}}, -- Dodger
{171565,{180812,-334789}}, -- Golden Cloudfeather
{171568,{180814,-334796}}, -- Sable
{171569,{180815,-334798}}, -- Brightscale Hatchling
{171667,{180839,-334987}}, -- Helpful Glimmerfly
{171693,{180856,-335050}}, -- Silvershell Snapper / Summon Silvershell Snapper
{171694,{180857,-335053}}, -- Goldenpaw Kit
{171697,{180859,-335056}}, -- Purity
{171710,{180866,-335076}}, -- Gilded Wader
{171714,{180869,-335083}}, -- Devoured Wader
{171716,{180871,-335085}}, -- Indigo
{171719,{180872,-335087}}, -- Spirited Skyfoal
{171954,{181164,-335698}}, -- Oonar's Arm
{171982,{181168,-335753}}, -- Corpulent Bonetusk
{171984,{181170,-335755}}, -- Pernicious Bonetusk
{171985,{181171,-335762}}, -- Luminous Webspinner
{171986,{181172,-335764}}, -- Boneweave Hatchling
{171987,{181173,-335765}}, -- Skittering Venomspitter
{172132,{181262,-335966}}, -- Bubbling Pustule
{172134,{181263,-335969}}, -- Shy Melvin
{172135,{181264,-335972}}, -- Plaguelouse Larva
{172136,{181265,-335974}}, -- Corpselouse Larva
{172137,{181266,-335977}}, -- Feasting Larva
{172139,{181267,-335979}}, -- Writhing Spine
{172140,{181268,-335980}}, -- Backbone
{172148,{181269,-336020}}, -- Micromancer / Micromancer's Mystical Cowl
{172149,{181270,-336021}}, -- Invertebrate Oil
{172150,{181271,-336022}}, -- Sludge Feeler
{172151,{181272,-336024}}, -- Toenail
{172153,{181282,-336030}}, -- Mu'dud
{172155,{181283,-336031}}, -- Foulwing Buzzer
{172284,{181315,-336311}}, -- Bloodfeaster Spiderling
{172570,{181555,-337031}}, -- Sinheart
{172854,{182683,-337694}}, -- Dredger Butler / Butler Contract / Dredger Butler's Contract
{173502,{180601,-339590}}, -- Stoneskin Dredwing Pup / Stonewing Dredwing Pup
{173508,{182613,-339593}}, -- Lost Quill / Refilling Inkwell
{173531,{182612,-339668}}, -- The Count / The Count's Pendant
{173533,{183853,-339670}}, -- Sinfall Screecher
{173535,{183854,-339671}}, -- Battie / Battie's Pendant
{173536,{183855,-339674}}, -- Stony / Stony's Infused Ruby
{173534,{182606,-339677}}, -- Bloodlouse Larva
{173585,{182661,-339976}}, -- Fun Guss
{173586,{182662,-339981}}, -- Leafadore
{173587,{182663,-339982}}, -- Trootie
{173588,{182664,-339983}}, -- Stemmins
{173589,{182671,-339997}}, -- Runelight Leaper
{173591,{182673,-339999}}, -- Shimmerbough Hoarder
{173593,{182674,-340002}}, -- Sir Reginald
{173842,{183107,-340710}}, -- Char / Pile of Ashen Dust
{173847,{183114,-340717}}, -- Carpal
{173849,{183115,-340721}}, -- Tower Deathroach
{173850,{183116,-340722}}, -- Hissing Deathroach
{173851,{183117,-340723}}, -- Severs
{173988,{183191,-341289}}, -- Maw Crawler
{173989,{183193,-341292}}, -- Ashen Chomper / Jar of Ashes
{173990,{183192,-341293}}, -- Frenzied Mawrat
{173991,{183194,-341295}}, -- Maw Stalker
{173992,{183195,-341298}}, -- Torghast Lurker
{173993,{183196,-341301}}, -- Lavender Nibbler
{173994,{183395,-341302}}, -- Will of Remornia / Pommel Jewel of Remornia
{174081,{183407,-341492}}, -- Dread / Contained Essence of Dread
{174082,{183408,-341493}}, -- Undying Deathroach
{174083,{183409,-341494}}, -- Decaying Mawrat
{174084,{183410,-341495}}, -- Sharpclaw
{174085,{183412,-341497}}, -- Death Seeker
{174087,{184350,-341515}}, -- Ruffle
{174088,{183601,-341516}}, -- Jiggles
{174089,{183623,-341519}}, -- Spinemaw Gormling
{174125,{183515,-341635}}, -- Iridescent Ooze
{174181,{183621,-341825}}, -- Putrid Geist
{174677,{-343161}}, -- Spinebug
{175203,{-344755}}, -- Moon-Touched Netherwhelp
{175220,{184221,-344792}}, -- Archivist's Quill
{175561,{184398,-345740}}, -- Steward Featherling
{175560,{184397,-345741}}, -- Lost Featherling
{175562,{184401,-345742}}, -- Larion Pouncer
{175563,{184400,-345743}}, -- Courage
{175564,{184399,-345744}}, -- Larion Cub
{175715,{184507,-346192}}, -- Lucy / Lucy's Lost Collar
{175756,{184509,-346236}}, -- Spriggan Trickster
{175787,{184512,-346260}}, -- Winterleaf Spriggan
{176662,{184867,-348561}}, -- Squibbles
{178216,{185919,-351636}}, -- Flawless Amethyst Baubleworm
{179008,{186188,-353206}}, -- Lil'Abom
{179025,{186191,-353230}}, -- Infused Etherwyrm
{179125,{186556,-353442}}, -- Timeless Mechanical Dragonling
{179083,{186539,-353450}}, -- Sly
{179132,{186546,-353451}}, -- Copperback Etherwyrm
{179137,{186537,-353456}}, -- Ruby Baubleworm
{179138,{186536,-353457}}, -- Turquoise Baubleworm
{179139,{186535,-353458}}, -- Topaz Baubleworm
{179140,{186553,-353460}}, -- Gurgl
{179166,{186534,-353525}}, -- Gizmo
{179169,{186540,-353528}}, -- Rarity
{179171,{186557,-353529}}, -- Fodder
{179180,{186547,-353569}}, -- Invasive Buzzer
{179181,{186449,-353570}}, -- Amaranthine Stinger
{179220,{186559,-353638}}, -- Grappling Gauntlet
{179222,{186558,-353639}}, -- Irongrasp
{179228,{186564,-353644}}, -- Golden Eye
{179230,{186548,-353645}}, -- Chompy
{179232,{186554,-353648}}, -- Eye of Allseeing
{179233,{186555,-353649}}, -- Eye of Extermination
{179239,{186549,-353656}}, -- Gilded Darknight
{179240,{186550,-353658}}, -- Mawsworn Minion
{179241,{186551,-353659}}, -- Mord'al Eveningstar
{179242,{186552,-353661}}, -- Rook
{179251,{186542,-353663}}, -- Korthian Specimen
{179252,{186541,-353664}}, -- Mosscoated Gromit / Mosscoated Hopper
{179253,{186543,-353665}}, -- Domestic Aunian
{179255,{186538,-353666}}, -- Gnashtooth
{179589,{188837,-354743}}, -- Blinky / Blinky Egg
{181308,{187713,-359559}}, -- Archetype of Focus / Summon Archetype of Focus
{181335,{187733,-359604}}, -- Resonant Echo / Summon Resonant Echo
{181336,{187734,-359605}}, -- Omnipotential Core / Summon Omnipotential Core
{181337,{187735,-359606}}, -- Geordy / Summon Geordy
{181488,{187795,-359760}}, -- Archetype of Discovery / Summon Archetype of Discovery
{181547,{187798,-359813}}, -- Tunneling Vombata / Summon Tunneling Vombata
{181575,{-359855}}, -- Drakks
{181578,{187803,-359863}}, -- Archetype of Motion / Summon Archetype of Motion
{181615,{189369,-359898}}, -- Archetype of Animation / Summon Archetype of Animation
{182081,{189382,-360389}}, -- Archetype of Serenity / Summon Archetype of Serenity
{182183,{189375,-360691}}, -- Archetype of Multiplicity / Summon Archetype of Multiplicity
{182264,{187928,-360800}}, -- Archetype of Metamorphosis / Summon Archetype of Metamorphosis
{182393,{189381,-360986}}, -- Archetype of Predation / Summon Archetype of Predation
{182504,{189364,-361157}}, -- Archetype of Survival / Summon Archetype of Survival
{182735,{189380,-361400}}, -- Archetype of Cunning / Summon Archetype of Cunning
{182840,{189383,-361572}}, -- Archetype of Malice / Summon Archetype of Malice
{183557,{189367,-362640}}, -- Archetype of Satisfaction / Summon Archetype of Satisfaction
{183772,{188679,-363086}}, -- Lightless Tormentor
{184183,{189363,-364174}}, -- Ambystan Darter / Summon Ambystan Darter
{184184,{189365,-364176}}, -- Fierce Scarabid / Summon Fierce Scarabid
{184189,{189366,-364178}}, -- Violent Poultrid / Summon Violent Poultrid
{184190,{189368,-364181}}, -- Multichicken / Summon Multichicken
{184191,{189370,-364182}}, -- Stabilized Geomental / Summon Stabilized Geomental
{184192,{189372,-364184}}, -- Terror Jelly / Summon Terror Jelly
{184193,{189373,-364193}}, -- Prototickles / Summon Prototickles
{184194,{189374,-364251}}, -- Leaping Leporid / Summon Leaping Leporid
{184195,{189376,-364252}}, -- Microlicid / Summon Microlicid
{184187,{189377,-364254}}, -- Archetype of Vigilance / Summon Archetype of Vigilance
{184196,{189378,-364255}}, -- Shelly / Summon Shelly
{184197,{189379,-364256}}, -- Viperid Menace / Summon Viperid Menace
{184186,{189371,-364259}}, -- Archetype of Renewal / Summon Archetype of Renewal
{184923,{189585,-366069}}, -- E'rnee / Summon E'rnee
{185477,{191039,-367376}}, -- Pocopoc / Pocopoc Traveler
{185586,{190586,-367702}}, -- Lil' Ursoc
{186844,{193889,191126,-369723}}, -- Jeweled Onyx Whelpling
{188709,{191915,-371534}}, -- Time-Lost Feral Rabbit
{188821,{191930,-371594}}, -- Blue Phoenix Hatchling
{188849,{191932,-371621}}, -- Violet Violence / Summon Violet Violence
{188861,{191936,-371636}}, -- Secretive Frogduck / Summon Secretive Frogduck
{188885,{191941,-371655}}, -- Crystalline Mini-Monster / Summon Crystalline Mini-Monster
{188901,{191946,-371675}}, -- Mister Muskoxeles / Summon Mister Muskoxeles
{189204,{193619,-371925}}, -- Yipper / Summon Yipper
{189211,{193620,-371930}}, -- Time-Lost Slyvern
{189663,{193852,-372585}}, -- Azure Frillfish
{189695,{192459,-372750}}, -- Jean's Lucky Fish / Summon Jean's Lucky Fish
{189096,{193066,-374600}}, -- Chestnut
{192108,{201441,-374678}}, -- Scout
{189098,{193068,-374710}}, -- Time-Lost Treeflitter
{189099,{193071,-374734}}, -- Pistachio
{198269,{201265,-374751}}, -- Tide Spirit
{198271,{201260,-374755}}, -- Dust Spirit
{198272,{201261,-374840}}, -- Blaze Spirit
{198273,{201262,-374883}}, -- Gale Spirit
{198480,{201463,-374887}}, -- Cubbly
{189105,{193225,-374889}}, -- Whiskuk
{189106,{193235,-374895}}, -- Scarlet Ottuk Pup
{189108,{200519,-374998}}, -- Mister Toots
{189111,{200173,-375035}}, -- Ghostflame
{198511,{201707,-375036}}, -- Troubled Tome
{198543,{201703,-375043}}, -- Pinkie
{189113,{193363,-375045}}, -- Auburntusk Calf
{189115,{193364,-375047}}, -- Time-Lost Baby Mammoth
{189117,{193373,-375084}}, -- Smoldering Phoenix Hatchling
{189118,{193374,-375085}}, -- Crimson Phoenix Hatchling
{189119,{193377,-375089}}, -- Time-Lost Phoenix Hatchling
{198077,{200927,-375223}}, -- Petal
{189123,{193429,-375235}}, -- Time-Lost Salamanther
{189128,{193380,-375242}}, -- Pink Salamanther
{189138,{193484,-375266}}, -- Pilot
{189140,{193571,-375312}}, -- Mallard Duckling
{189142,{193572,-375321}}, -- Quack-E
{189145,{-375336}}, -- Time-Lost Duckling
{189133,{199172,-375344}}, -- Viridescent Duck
{189135,{193587,-375355}}, -- Time-Lost Duck
{189150,{193614,-375366}}, -- Groundshaker
{189154,{193618,-375378}}, -- Hoofhelper
{189156,{193834,-375413}}, -- Blackfeather Nester
{189158,{193835,-375448}}, -- Brightfeather
{189655,{193837,-375473}}, -- Backswimmer Timbertooth
{189661,{193850,-375499}}, -- Time-Lost Timbertooth
{189694,{193853,-375511}}, -- Emerald Frillfish
{189696,{193851,-375536}}, -- Purple Frillfish
{191287,{193854,-375553}}, -- Blue Vorquin Foal
{191298,{193855,-375567}}, -- Time-Lost Vorquin Foal
{191435,{193908,-375642}}, -- Sapphire Crystalspine
{191377,{-375699}}, -- Black Dragon Whelp
{191379,{-375705}}, -- Blue Dragon Whelp
{191380,{-375706}}, -- Red Dragon Whelp
{191381,{198622,-375707}}, -- Spyragos
{191382,{-375708}}, -- Bronze Dragon Whelp
{191383,{193886,-375709}}, -- Jeweled Sapphire Whelpling
{191384,{193885,-375710}}, -- Jeweled Amber Whelpling
{191385,{193887,-375711}}, -- Jeweled Ruby Whelpling
{191386,{193888,-375712}}, -- Jeweled Emerald Whelpling
{191387,{199109,-375713}}, -- Primal Stormling
{191627,{194098,-376302}}, -- Lord Basilton / Summon Lord Basilton
{192343,{-377361}}, -- Snowclaw Cub
{192350,{-377392}}, -- Bugbiter Tortoise
{192363,{-377401}}, -- Diamond Crab
{192365,{-377407}}, -- Sapphire Crab
{192366,{-377410}}, -- Truesilver Crab
{192368,{-377417}}, -- Striped Snakebiter
{192369,{199916,-377423}}, -- Roseate Hopper
{189095,{191886,-378738}}, -- Alvin the Anvil
{194004,{198353,-382811}}, -- Shiverweb Broodling / Shiverweb Egg
{194893,{198725,-384874}}, -- Gray Marmoni
{189152,{199175,-386575}}, -- Lubbins
{195896,{199326,-386985}}, -- Chip
{189101,{199688,-387685}}, -- Bronze Racing Enthusiast
{196304,{199757,-388085}}, -- Magic Nibbler / Magic Nipper
{196305,{199758,-388086}}, -- Crimson Proto-Whelp
{196409,{198726,-388268}}, -- Black Skitterbug
{196666,{200114,-388913}}, -- Stormie
{192258,{200183,-389143}}, -- Echo of the Cave
{189112,{200255,-389363}}, -- Echo of the Inferno
{189130,{200260,-389378}}, -- Echo of the Depths
{189132,{200263,-389384}}, -- Echo of the Heights
{189134,{200276,-389429}}, -- Ohuna Companion
{189159,{200290,-389503}}, -- Bakar Companion
{197089,{200479,-389801}}, -- Titan-Touched Elemental
{197963,{200872,-392351}}, -- Living Mud Mask
{197969,{200874,-392380}}, -- Lady Feathersworth
{198316,{200930,-393330}}, -- Obsidian Proto-Whelp
-- end of live

}

function ArkInventory.Collection.Pet.ImportCrossRefTable( )
	
	if not ImportCrossRefTable then return end
	if not ArkInventory.Collection.Pet.IsReady( ) then return end
	
	ImportCrossRefTableAttempt = ImportCrossRefTableAttempt + 1
	--ArkInventory.Output( "attempt ", ImportCrossRefTableAttempt )
	
	if ImportCrossRefTableAttempt > 8 or ( ArkInventory.Table.Elements( ImportCrossRefTable ) == 0 ) then
		
		ArkInventory.Table.Clean( ImportCrossRefTable )
		ImportCrossRefTable = nil
		
		return
		
	end
	
	
	local npc, speciesID, key1, key2
	
	for k, v in pairs( ImportCrossRefTable ) do
		
		--ArkInventory.Output( k, " - ", npc )
		
		npc = tonumber( v[1] ) or 0
		if npc > 0 then
			
			speciesID = ArkInventory.Collection.Pet.GetSpeciesIDForCreatureID( npc )
			if speciesID then
				
				key2 = ArkInventory.ObjectIDCount( string.format( "battlepet:%s", speciesID ) )
				
				for k2, v2 in pairs( v[2] ) do
					
					v2 = tonumber( v2 ) or 0
					
					key1 = nil
					if v2 > 0 then
						key1 = ArkInventory.ObjectIDCount( string.format( "item:%s", v2 ) )
					elseif v2 < 0 then
						key1 = ArkInventory.ObjectIDCount( string.format( "spell:%s", math.abs( v2 ) ) )
					end
					
					--ArkInventory.Output( k, " - ", npc, " - ", k2, " - ", key1, " - ", key2 )
					
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
				
				ImportCrossRefTable[k] = nil
				
			else
				
				--ArkInventory.Output( "unknown: npc[", npc, "], species[", speciesID, "]" )
				
			end
			
		end
		
	end
	
	--ArkInventory.Output( "pet xref import attempt ", ImportCrossRefTableAttempt, ": ", ArkInventory.Table.Elements( ImportCrossRefTable ), " entries left" )
	
end

local function FilterGetSearch( )
	return PetJournal.searchBox:GetText( )
end

local function FilterSetSearch( s )
	PetJournal.searchBox:SetText( s )
	C_PetJournal.SetSearchFilter( s )
end

local function FilterSetCollected( value )
	C_PetJournal.SetFilterChecked( ArkInventory.Const.BLIZZARD.GLOBAL.PET.FILTER.COLLECTED, value )
end

local function FilterGetCollected( )
	return C_PetJournal.IsFilterChecked( ArkInventory.Const.BLIZZARD.GLOBAL.PET.FILTER.COLLECTED )
end

local function FilterGetUncollected( )
	return C_PetJournal.IsFilterChecked( ArkInventory.Const.BLIZZARD.GLOBAL.PET.FILTER.NOTCOLLECTED )
end

local function FilterSetUncollected( value )
	C_PetJournal.SetFilterChecked( ArkInventory.Const.BLIZZARD.GLOBAL.PET.FILTER.NOTCOLLECTED, value )
end

local function FilterGetFamilyTypes( )
	return C_PetJournal.GetNumPetTypes( )
end

local function FilterSetFamily( t )
	if type( t ) == "table" then
		for i = 1, FilterGetFamilyTypes( ) do
			C_PetJournal.SetPetTypeFilter( i, t[i] )
		end
	elseif type( t ) == "boolean" then
		for i = 1, FilterGetFamilyTypes( ) do
			C_PetJournal.SetPetTypeFilter( i, t )
			
		end
	else
		assert( false, "parameter is " .. type( t ) .. ", not a table or boolean" )
	end
end

local function FilterGetFamily( t )
	assert( type( t ) == "table", "parameter is not a table" )
	for i = 1, FilterGetFamilyTypes( ) do
		t[i] = C_PetJournal.IsPetTypeChecked( i )
	end
end

local function FilterGetSourceTypes( )
	return C_PetJournal.GetNumPetSources( )
end

local function FilterGetSource( t )
	assert( type( t ) == "table", "parameter is not a table" )
	for i = 1, FilterGetSourceTypes( ) do
		t[i] = C_PetJournal.IsPetSourceChecked( i )
	end
end

local function FilterSetSource( t )
	if type( t ) == "table" then
		for i = 1, FilterGetSourceTypes( ) do
			C_PetJournal.SetPetSourceChecked( i, t[i] )
		end
	elseif type( t ) == "boolean" then
		for i = 1, FilterGetSourceTypes( ) do
			C_PetJournal.SetPetSourceChecked( i, t )
		end
	else
		assert( false, "parameter is not a table or boolean" )
	end
end

local function FilterActionClear( )
	
	collection.filter.ignore = true
	
	FilterSetSearch( "" )
	FilterSetCollected( true )
	FilterSetUncollected( true )
	FilterSetFamily( true )
	FilterSetSource( true )
	
end

local function FilterActionBackup( )
	
	if collection.filter.backup then return end
	
	collection.filter.search = FilterGetSearch( )
	collection.filter.collected = FilterGetCollected( )
	collection.filter.uncollected = FilterGetUncollected( )
	FilterGetFamily( collection.filter.family )
	FilterGetSource( collection.filter.source )
	
	collection.filter.backup = true
	
end

local function FilterActionRestore( )
	
	if not collection.filter.backup then return end
	
	collection.filter.ignore = true
	
	FilterActionClear( )
	
	FilterSetSearch( collection.filter.search )
	FilterSetCollected( collection.filter.collected )
	FilterSetUncollected( collection.filter.uncollected )
	FilterSetFamily( collection.filter.family )
	FilterSetSource( collection.filter.source )
	
	collection.filter.backup = false
	
end


function ArkInventory.Collection.Pet.OnHide( )
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET", "FRAME_CLOSED" )
end

function ArkInventory.Collection.Pet.IsReady( )
	return collection.isReady
end

function ArkInventory.Collection.Pet.GetCount( )
	return collection.numOwned, collection.numTotal
end

function ArkInventory.Collection.Pet.Iterate( )
	local t = collection.cache
	return ArkInventory.spairs( t, function( a, b ) return ( t[a].fullname or "" ) < ( t[b].fullname or "" ) end )
end

function ArkInventory.Collection.Pet.GetByID( arg1 )
	
	if type( arg1 ) == "number" then
		--ArkInventory.Output( "GetPet( index=", arg1, " ) " )
		for _, obj in ArkInventory.Collection.Pet.Iterate( ) do
			if obj.index == arg1 then
				return obj
			end
		end
		--ArkInventory.Output( "no pet found at index ", arg1 )
		return
	elseif type( arg1 ) == "string" then
		--ArkInventory.Output( "GetPet( guid=", arg1, " ) " )
		if collection.cache[arg1] then
			return collection.cache[arg1]
		else
			--ArkInventory.Output( "no pet found with guid ", arg1 )
		end
	end
	
end

function ArkInventory.Collection.Pet.CanSummon( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return not C_PetJournal.PetIsRevoked( obj.guid ) and not C_PetJournal.PetIsLockedForConvert( obj.guid ) and C_PetJournal.PetIsSummonable( obj.guid )
	end
end

function ArkInventory.Collection.Pet.CanRelease( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return C_PetJournal.PetCanBeReleased( obj.guid )
	end
end

function ArkInventory.Collection.Pet.CanTrade( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return C_PetJournal.PetIsTradable( obj.guid )
	end
end

function ArkInventory.Collection.Pet.Summon( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		C_PetJournal.SummonPetByGUID( obj.guid )
	end
end

function ArkInventory.Collection.Pet.GetCurrent( )
	local guid = C_PetJournal.GetSummonedPetGUID( )
	if guid then
		local obj = ArkInventory.Collection.Pet.GetByID( guid )
		if obj then
			return obj.guid, guid, obj
		end
	end
end

function ArkInventory.Collection.Pet.Dismiss( )
	local guid = ArkInventory.Collection.Pet.GetCurrent( )
	if guid then
		C_PetJournal.SummonPetByGUID( guid )
	end
end

function ArkInventory.Collection.Pet.GetStats( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return C_PetJournal.GetPetStats( obj.guid )
	end
end

function ArkInventory.Collection.Pet.PickupPet( arg1, arg2 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return C_PetJournal.PickupPet( obj.guid, arg2 )
	end
end

function ArkInventory.Collection.Pet.IsRevoked( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return C_PetJournal.PetIsRevoked( obj.guid )
	end
end

function ArkInventory.Collection.Pet.IsLockedForConvert( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return C_PetJournal.PetIsLockedForConvert( obj.guid )
	end
end

function ArkInventory.Collection.Pet.IsFavorite( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return C_PetJournal.PetIsFavorite( obj.guid )
	end
end

function ArkInventory.Collection.Pet.IsSlotted( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return C_PetJournal.PetIsSlotted( obj.guid )
	end
end

function ArkInventory.Collection.Pet.IsHurt( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return C_PetJournal.PetIsHurt( obj.guid )
	end
end

function ArkInventory.Collection.Pet.InBattle( )
	return C_PetBattles.IsInBattle( )
end

function ArkInventory.Collection.Pet.SetName( arg1, arg2 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		C_PetJournal.SetCustomName( obj.guid, arg2 )
	end
end

function ArkInventory.Collection.Pet.IsUnlocked( )
	return C_PetJournal.IsJournalUnlocked( )
end

function ArkInventory.Collection.Pet.SetFavorite( arg1, arg2 )
	-- arg2 = 0 (remove) | 1 (set)
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		C_PetJournal.SetFavorite( obj.guid, arg2 )
	end
end

function ArkInventory.Collection.Pet.IsUsable( arg1 )
	local obj = ArkInventory.Collection.Pet.GetByID( arg1 )
	if obj then
		return ( IsUsableSpell( obj.spell ) )
	end
end

function ArkInventory.Collection.Pet.GetSpeciesIDfromGUID( guid )
	
	-- breaks apart a guid to get the battlepet speciesid
	-- Creature-[unknown]-[serverID]-[instanceID]-[zoneUID]-[npcID]-[spawnUID]
	
	-- replaced with UnitBattlePetSpeciesID( unit )
	
	local creatureID = string.match( guid or "", "Creature%-.-%-.-%-.-%-.-%-(.-)%-.-$" )
	--ArkInventory.Output( creatureID, " / ", guid )
	if creatureID then
		creatureID = tonumber( creatureID ) or 0
		return ArkInventory.Collection.Pet.GetSpeciesIDForCreatureID( creatureID )
	end
	
end

function ArkInventory.Collection.Pet.GetSpeciesIDForCreatureID( creatureID )
	if type( creatureID ) ~= "number" then return end
	if creatureID > 0 then
		return collection.creature[creatureID]
	end
end

function ArkInventory.Collection.Pet.PetTypeName( arg1 )
	return _G[string.format( "BATTLE_PET_NAME_%s", arg1 )] or ArkInventory.Localise["UNKNOWN"]
end


local PET_STRONG = { 2, 6, 9, 1, 4, 3, 10, 5, 7, 8 }
--[[
	HUMANOID vs DRAGONKIN
	DRAGONKIN vs MAGIC
	FLYING vs AQUATIC
	UNDEAD vs HUMANOID
	CRITTER vs UNDEAD
	MAGIC vs FLYING
	ELEMENTAL vs MECHANICAL
	BEAST vs CRITTER
	AQUATIC vs ELEMENTAL
	MECHANICAL vs BEAST
]]--

local PET_WEAK = { 8, 4, 2, 8, 1, 10, 5, 3, 6, 7 }
--[[
	HUMANOID vs BEAST
	DRAGONKIN vs UNDEAD
	FLYING vs DRAGONKIN
	UNDEAD vs AQUATIC
	CRITTER vs HUMANOID
	MAGIC vs MECHANICAL
	ELEMENTAL vs CRITTER
	BEAST vs FLYING
	AQUATIC vs MAGIC
	MECHANICAL vs ELEMENTAL
]]--

local function ScanAbility( abilityID )
	
	if ( not abilityID ) or ( type( abilityID ) ~= "number" ) or ( abilityID <= 0 ) then
		error( "invalid abilityID" )
		return
	end
	
	if not collection.ability[abilityID] then
		
		local id, name, icon, maxCooldown, unparsedDescription, numTurns, petType, noStrongWeakHints = C_PetBattles.GetAbilityInfoByID( abilityID )
		
		collection.ability[abilityID] = {
			name = name,
			icon = icon,
			petType = petType,
			noStrongWeakHints = noStrongWeakHints,
			strong = PET_STRONG[petType],
			weak = PET_WEAK[petType],
		}
		
	end
	
	return collection.ability[abilityID]
	
end

local function LinkTrainerSpecies( speciesID )
	
	assert( speciesID, "speciesID is nil" )
	assert( type( speciesID ) == "number", "speciesID not a number" )
	assert( speciesID > 0, "species ID <= 0 " )
	
	
	local species = collection.species
	assert( species[speciesID], "speciesID is invalid" )
	
	species[speciesID].isTrainer = true
	species[speciesID].td = { }
	
	if not ArkInventory.db then
		ArkInventory.OutputWarning( "saved variables are not ready, cannot link trainer species at this time.  please try again later" )
		return
	end
	
	
	if not collection.isTrainerDataLoaded then
		--ArkInventory.OutputDebug( "linking saved trainer species data into cache" )
		collection.trainer = ArkInventory.db.cache.trainerspecies
		local c = 0
		for k, v in pairs( collection.trainer ) do
			if speciesID ~= k then
				c = c + 1
				species[k] = v
			end
		end
		--ArkInventory.OutputDebug( c, " trainer species entries were linked" )
		collection.isTrainerDataLoaded = true
	end
	
	local trainer = collection.trainer
	-- backup any trainer data
	local td = trainer[speciesID] and trainer[speciesID].td or { }
	-- replace any existing trainer species data with this species data 
	trainer[speciesID] = species[speciesID]
	-- add the trainer data back
	trainer[speciesID].td = td or { }
	
	--ArkInventory.OutputDebug( "linked species ", speciesID, " to trainer species" )
	
end

local function ScanSpecies( speciesID, foundAfter )
	
	if speciesID and type( speciesID ) == "number" and speciesID > 0 then
		-- good to go
	else
		--assert( speciesID, "speciesID is nil" )
		--assert( type( speciesID ) == "number", "speciesID not a number" )
		--assert( speciesID > 0, "species ID <= 0 " )
		return
	end
	
	local species = collection.species
	
	if ( not species[speciesID] ) then
		
		local name, icon, petType, creatureID, sourceText, description, isWild, canBattle, isTradable, unique, obtainable, displayID = C_PetJournal.GetPetInfoBySpeciesID( speciesID )
		
--		if name and ( name ~= "" ) then
			
			species[speciesID] = {
				speciesID = speciesID,
				name = name or ArkInventory.Localise["UNKNOWN"],
				icon = icon,
				petType = petType,
				strong = PET_STRONG[petType],
				weak = PET_WEAK[petType],
				creatureID = creatureID,
				sourceText = sourceText,
				description = description,
				isWild = isWild,
				canBattle = canBattle,
				isTradable = isTradable,
				unique = unique,
				obtainable = obtainable,
				abilityID = { },
				abilityLevel = { },
				--foundAfter = not not foundAfter,
				colour = false, -- set on mouseover
			}
			
			local _, maxAllowed = C_PetJournal.GetNumCollectedInfo( speciesID )
			species[speciesID].maxAllowed = maxAllowed
			
			if canBattle then
				
				C_PetJournal.GetPetAbilityList( speciesID, species[speciesID].abilityID, species[speciesID].abilityLevel )
				--ArkInventory.Output( "id = ", species[speciesID].abilityID )
				--ArkInventory.Output( "level = ", species[speciesID].abilityLevel )
				
				for i, abilityID in ipairs( species[speciesID].abilityID ) do
					ScanAbility( abilityID )
				end
				
			end
			
			if not obtainable or foundAfter then
				LinkTrainerSpecies( speciesID )
			end
			
--		end
		
	end
	
	return species[speciesID]
	
end

function ArkInventory.Collection.Pet.GetSpeciesInfo( speciesID )
	if collection.isReady then
		return ScanSpecies( speciesID, true )
	end
end

local function Scan_Threaded( thread_id )
	
	local update = false
	
	local numTotal = 0
	local numOwned = 0
	local YieldCount = 0
	
	--ArkInventory.Output( "Pets: Start Scan @ ", time( ) )
	
	FilterActionBackup( )
	FilterActionClear( )
	
	
	-- flag all pets as not being processed this scan
	for _, obj in ArkInventory.Collection.Pet.Iterate( ) do
		obj.processed = false
	end
	
	-- scan the pet frame (now unfiltered)
	
	local c = collection.cache
	
	for index = 1, C_PetJournal.GetNumPets( ) do
		
		if PetJournal:IsVisible( ) then
			ArkInventory.OutputDebug( "PET: ABORTED (PET JOURNAL WAS OPENED)" )
			FilterActionRestore( )
			return
		end
		
		if ArkInventory.Global.Mode.Combat then
			ArkInventory.OutputDebug( "PET: ABORTED (ENTERED COMBAT)" )
			ArkInventory.Global.ScanAfterCombat[loc_id] = true
			FilterActionRestore( )
			return
		end
		
		if ArkInventory.Global.Mode.DragonRace then
			ArkInventory.OutputDebug( "PET: ABORTED (DRAGON RACE)" )
			ArkInventory.Global.ScanAfterDragonRace[loc_id] = true
			FilterActionRestore( )
			return
		end
		
		
		numTotal = numTotal + 1
		YieldCount = YieldCount + 1
		
		local petID, speciesID, isOwned, customName, level, isFavorite, isRevoked, petName, petIcon, petType, creatureID, sourceText, description, isWild, canBattle, isTradable, isUnique, isObtainable = C_PetJournal.GetPetInfoByIndex( index )
		
--		if string.sub( petName, 1, 4 ) == "Fort" then
--			ArkInventory.Output( petID, " / ", speciesID, " / ", creatureID, " / ", petName )
--		end
		-- species data (generate for all species)
		local sd = ScanSpecies( speciesID )
		if not sd then
			FilterActionRestore( )
			--ArkInventory.Output( "ABORTED (NO SPECIES DATA)" )
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET", "NO_SPECIES_DATA" )
			return
		end
		
		-- creatureid to speciesid lookup (generate for all species)
		if not collection.creature[sd.creatureID] then
			collection.creature[sd.creatureID] = speciesID
			--ArkInventory.Output( sd.creatureID, " = ", speciesID )
		end
		
		
		if petID and isOwned then
			
			local speciesID, customName, level, xp, maxXp, displayID, isFavorite, petName, petIcon, petType, creatureID, sourceText, description, isWild, canBattle, isTradable, isUnique, isObtainable = C_PetJournal.GetPetInfoByPetID( petID )
			local needsFanfare = petID and C_PetJournal.PetNeedsFanfare( petID )
			local health, maxHealth, power, speed, quality = C_PetJournal.GetPetStats( petID )
			quality = quality - 1 -- back down to item colour
			--local link = ArkInventory.BattlepetBaseHyperlink( speciesID, level, quality, health, power, speed, customName, petID )
			local link = C_PetJournal.GetBattlePetLink( petID )
			
			
			if not canBattle then
				--ArkInventory.OutputDebug( petName, " / ", health, " / ", maxHealth )
			end
			
			numOwned = numOwned + 1
			
			local i = petID
			
			if not c[i] then
				c[i] = { index = index }
				update = true
			end
			
			if c[i].guid ~= petID then
				c[i].guid = petID
				c[i].sd = collection.species[speciesID] -- species data for this pet
				update = true
			end
			
			local breed = BreedAvailable and GetBreedID_Journal( petID )
			if c[i].breed ~= breed then
				c[i].breed = breed
				update = true
			end
			
			if c[i].cn ~= customName then
				c[i].cn = customName
				update = true
			end
			
			local fullname = petName
			if customName then
				fullname = string.format( "%s (%s)", petName, customName )
			end
			c[i].fullname = fullname
			
			if c[i].fav ~= isFavorite then
				c[i].fav = isFavorite
				update = true
			end
			
			if c[i].isRevoked ~= isRevoked then
				c[i].isRevoked = isRevoked
				update = true
			end
			
			if c[i].needsFanfare ~= needsFanfare then
				c[i].needsFanfare = needsFanfare
				update = true
			end
			
			if c[i].level ~= level then
				c[i].level = level
				c[i].maxXp = maxXp
				c[i].maxHealth = maxHealth
				c[i].power = power
				c[i].speed = speed
				update = true
			end
			
			if c[i].xp ~= xp then
				c[i].xp = xp
				update = true
			end
			
			if c[i].health ~= health then
				c[i].health = health
				update = true
			end
			
			if c[i].quality ~= quality then
				update = true
				c[i].quality = quality
				
			end
			
			if c[i].link ~= link then
				update = true
				c[i].link = link
			end
			
			c[i].active = false
			c[i].processed = true
			
		end
		
		if YieldCount % ArkInventory.Const.YieldAfter == 0 then
			ArkInventory.ThreadYield_Scan( thread_id )
		end
		
	end
	
	
	-- cleanup any old pets that were released/caged
	for _, obj in ArkInventory.Collection.Pet.Iterate( ) do
		if not obj.processed then
			c[obj.guid] = nil
			update = true
		end
	end
	
	
	ArkInventory.ThreadYield_Scan( thread_id )
	
	FilterActionRestore( )
	
	collection.numOwned = numOwned
	collection.numTotal = numTotal
	
	--ArkInventory.Output( "Pets: End Scan @ ", time( ), " [", collection.numOwned, "] [", collection.numTotal, "]  [", update, "]" )
	
	if not collection.isReady then
		collection.isReady = true
		--ArkInventory.OutputDebug( "pet data is now ready" )
	end
	
	ArkInventory.Collection.Pet.ImportCrossRefTable( )
	
	if update then
		ArkInventory.ScanLocation( loc_id )
--		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_PET_UPDATE_BUCKET" )
	end
	
end

local function Scan( )
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Collection, "pet" )
	
	local thread_func = function( )
		Scan_Threaded( thread_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end


function ArkInventory:EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET( events )
	
	--ArkInventory.Output( "PET BUCKET [", events, "]" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (PETS NOT MONITORED)" )
		return
	end
	
	if PetJournal:IsVisible( ) then
		--ArkInventory.Output( "IGNORED (PET JOURNAL IS OPEN)" )
		return
	end
	
	if ArkInventory.Global.Mode.Combat then
		ArkInventory.Global.ScanAfterCombat[loc_id] = true
		return
	end
	
	if ArkInventory.Global.Mode.DragonRace then
		ArkInventory.Global.ScanAfterDragonRace[loc_id] = true
		return
	end
	
	
	if not collection.isScanning then
		collection.isScanning = true
		Scan( )
		collection.isScanning = false
	else
		--ArkInventory.Output( "IGNORED (PET JOURNAL BEING SCANNED - WILL RESCAN WHEN DONE)" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET", "RESCAN" )
	end
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_PET_UPDATE( event, ... )
	
	--ArkInventory.Output( "PET UPDATE [", event, "]" )
	
	if event == "PET_JOURNAL_LIST_UPDATE" then
		
		if collection.filter.ignore then
			--ArkInventory.Output( "IGNORED (FILTER CHANGED BY ME)" )
			collection.filter.ignore = false
			return
		end
		
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET", event )
		
	elseif ( event == "COMPANION_UPDATE" ) then
		
		local c = ...
		if ( c == "CRITTER" ) then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET", event )
		end
		
	else
		
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET", event )
		
	end
	
end

function ArkInventory:EVENT_ARKINV_BATTLEPET_OPENING_DONE( event, ... )
	
	--ArkInventory.Output( "EVENT_ARKINV_BATTLEPET_OPENING_DONE" )
	-- /run ArkInventory:EVENT_ARKINV_BATTLEPET_OPENING_DONE( "MANUAL" )
	
	-- WARNING WARNING WARNING - THIS MUST RUN TO COLLECT SPECIES DATA FOR THE LEGENDARY / ELITE / TRAINER PETS
	
	
	local player = ArkInventory.ENUM.BATTLEPET.ENEMY
	local isnpc = C_PetBattles.IsPlayerNPC( player )
	local opponents = C_PetBattles.GetNumPets( player )
	
	if ArkInventory.db.option.message.battlepet.opponent then
	--	if opponents > 1 then
			ArkInventory.Output( "--- --- --- --- --- --- ---" )
	--	end
	end
	
	if not ArkInventory.Collection.Pet.IsReady( ) then
		if ArkInventory.db.option.message.battlepet.opponent then
			ArkInventory.Output( "pet data not ready" )
		end
		return
	end
	
	for i = 1, opponents do
		
		local speciesID = C_PetBattles.GetPetSpeciesID( player, i )
		local name = C_PetBattles.GetName( player, i )
		local level = C_PetBattles.GetLevel( player, i )
		local maxHealth = C_PetBattles.GetMaxHealth( player, i )
		local power = C_PetBattles.GetPower( player, i )
		local speed = C_PetBattles.GetSpeed( player, i )
		local breed = ""
		
		if BreedAvailable then
			breed = string.format( " %s", GetBreedID_Battle( { ["petOwner"] = player, ["petIndex"] = i } ) )
		end
		
		local quality = C_PetBattles.GetBreedQuality( player, i )
		quality = ( quality and ( quality - 1 ) ) or -1
		
		local info = ""
		local count
		
		local sd = ArkInventory.Collection.Pet.GetSpeciesInfo( speciesID )
		if not sd then
			
			info = string.format( " %s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["NO_DATA_AVAILABLE"] )
			
		else
			
			if sd.isTrainer then
				
				LinkTrainerSpecies( speciesID )
				
				-- update saved trainer pet data
				local td = collection.trainer[speciesID].td
				td.level = level
				td.quality = quality
				td.colour = select( 4, ArkInventory.GetItemQualityColor( quality ) )
				sd.colour = td.colour
				td.health = maxHealth
				td.power = power
				td.speed = speed
				td.breed = breed
				
			end
			
			
			if C_PetBattles.IsWildBattle( ) then
				
				--ArkInventory.OutputDebug( "wild battle" )
				
				if sd.isTrainer then
					-- elite/legendary, dont add anything
				elseif not sd.canBattle then
					-- opponent cannot battle (and yet it is), its one of the secondary non-capturabe opponents
					info = string.format( " %s(%s)", YELLOW_FONT_COLOR_CODE, ArkInventory.Localise["BATTLEPET_OPPONENT_IMMUNE"] )
				else
					count = true
				end
				
			elseif isnpc then
				-- npc battle, dont add anything
			else
				-- pvp battle, dont add anything, but do show collected
				count = true
			end
			
			if count and ArkInventory.db.option.message.battlepet.opponent then
				
				-- add matching pets that you have already captured
				
				local numOwned, maxAllowed = C_PetJournal.GetNumCollectedInfo( speciesID )
				
				if numOwned == 0 then
					
					if sd.obtainable then
						info = string.format( "%s- %s", RED_FONT_COLOR_CODE, ArkInventory.Localise["NOT_COLLECTED"] )
					end
					
				else
					
					if numOwned >= maxAllowed then
						
						info = string.format( "- %s", ArkInventory.Localise["BATTLEPET_OPPONENT_KNOWN_MAX"] )
						
					elseif C_PetBattles.IsWildBattle( ) then
						
						local upgrade = false
						
						for _, pd in ArkInventory.Collection.Pet.Iterate( ) do
							if ( pd.sd.speciesID == speciesID ) then
								
								local q = pd.quality
								--ArkInventory.Output( "s=[", speciesID, "], ", h, ", [", quality, "] / ", pd.link, " [", q, "]" )
								if ( quality >= q ) then
									upgrade = true
								end
								
								if string.len( info ) < 2 then
									info = string.format( "- %s", ArkInventory.Localise["BATTLEPET_OPPONENT_UPGRADE"] )
								end
								
								info = string.format( "%s  %s", info, pd.link )
								
								if pd.breed then
									info = string.format( "%s %s", info, pd.breed )
								end
								
							end
						end
						
						if not upgrade then
							info = ""
						end
						
					end
					
				end
				
			end
			
			
			--ArkInventory.Output( YELLOW_FONT_COLOR_CODE, ArkInventory.Localise["BATTLEPET"], " #", i, ": ", h, " ", YELLOW_FONT_COLOR_CODE, info )
			
		end
		--ArkInventory.OutputDebug( { speciesID, level, quality, maxHealth, power, speed, "", name } )
		
		if ArkInventory.db.option.message.battlepet.opponent then
			local h = string.format( "%s|Hbattlepet:%s:%s:%s:%s:%s:%s:%s|h[%s]|h|r", select( 5, ArkInventory.GetItemQualityColor( quality ) ), speciesID, level, quality, maxHealth, power, speed, "", name )
			ArkInventory.Output( YELLOW_FONT_COLOR_CODE, "#", i, ": ", h, breed, " ", YELLOW_FONT_COLOR_CODE, info )
		end
		
	end
	
end


-- unit guid, from mouseover = Creature-[unknown]-[serverID]-[instanceID]-[zoneUID]-[creatureID]-[spawnUID]
-- caged battletpet (item) = battlepet:
-- pet journal = battlepet:[speciesID]:16:3:922:185:185:[guid]

--[[

battlepet:1387:1:3:152:12:11:BattlePet-0-000006589760
battlepet:1387:1:3:155:12:10:0000000000000000
item:111660:0:0:0:0:0:0:0:90:0:11:0

]]--

