local AddonName, AddonTable = ...

UltraSquirt = LibStub("AceAddon-3.0"):NewAddon(AddonName, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceHook-3.0")
-- useful global strings:
-- SERVER_MESSAGE_COLON
-- KEYBIND_NOT_SET_TOOLTIP
-- SPELL_FAILED_BAD_TARGETS
-- TARGET
-- ON_COOLDOWN

---@class USQ
local USQ = UltraSquirt

local L = LibStub("AceLocale-3.0"):GetLocale(AddonName)
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local ScrollingTable = LibStub("ScrollingTable")

USQ.DebugLevel = 0
-- USQ.DebugLevel = 1
-- use 1 for non-spammy stuff and current testing, e.g. response to button click
-- use 2 for common outputs, e.g. interface testing
-- use 3 for very frequent outputs, e.g. once per second
-- use 4 for very spammy stuff like aura update events

USQ.BattleNPCID = 79179
-- USQ.BattleHealingThreshold = 100
USQ.WaitFlag = false
USQ.WaitTimer = nil
USQ.TargetConfirmed = false

-- Advanced Teams
local EnableAdvancedTeams = false  -- toggle to disable the advanced teams functions in release (testing in Alpha)
if not Rematch.Start then
    -- Assuming Rematch 5
    -- Disable advance teams
    EnableAdvancedTeams = false
end
USQ.AdvancedTeam = 1
USQ.BattledSinceHeal = false

-- Configure NPC list
USQ.npcInfoTimerCount = 0
USQ.npcInfoFoundAll = false

-- EXPANSION_NAME0 = "Classic"
-- EXPANSION_NAME1 = "The Burning Crusade"
-- EXPANSION_NAME2 = "Wrath of the Lich King"
-- EXPANSION_NAME3 = "Cataclysm"
-- EXPANSION_NAME4 = "Mists of Pandaria"
-- EXPANSION_NAME5 = "Warlords of Draenor"
-- EXPANSION_NAME6 = "Legion"
-- EXPANSION_NAME7 = "Battle for Azeroth"
-- EXPANSION_NAME8 = "Shadowlands"
-- EXPANSION_NAME9 = "Dragonflight"

USQ.npcInfo = {
    -- Warlords Garrison Stable Masters
    [79858] = {npcName = nil, canBattle = false, canUseStableMaster = false, questID = nil, reviveGossipOptionID = 43647, expansionNumber = 5, expansionName = EXPANSION_NAME5, custom = false,},      -- Serr'ah
    [85418] = {npcName = nil, canBattle = false, canUseStableMaster = false, questID = nil, reviveGossipOptionID = 43251, expansionNumber = 5, expansionName = EXPANSION_NAME5, custom = false,},      -- Lio the Lioness

    -- Warlords Garrison
    [85659] = {npcName = nil, canBattle = true, canUseStableMaster = true, questID = nil, battleGossipOptionID = nil, expansionNumber = 5, expansionName = EXPANSION_NAME5, custom = false,},          -- The Beakinator
    [79751] = {npcName = nil, canBattle = true, canUseStableMaster = true, questID = nil, battleGossipOptionID = nil, expansionNumber = 5, expansionName = EXPANSION_NAME5, custom = false,},          -- Eleanor
    [85650] = {npcName = nil, canBattle = true, canUseStableMaster = true, questID = nil, battleGossipOptionID = nil, expansionNumber = 5, expansionName = EXPANSION_NAME5, custom = false,},          -- Quintessence of Light
    [79179] = {npcName = nil, canBattle = true, canUseStableMaster = true, questID = nil, battleGossipOptionID = nil, expansionNumber = 5, expansionName = EXPANSION_NAME5, custom = false,},          -- Squirt
    [85685] = {npcName = nil, canBattle = true, canUseStableMaster = true, questID = nil, battleGossipOptionID = nil, expansionNumber = 5, expansionName = EXPANSION_NAME5, custom = false,},          -- Stitches Jr.

    -- Legion
    [107489] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 42442, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Amalia
    [105387] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = nil, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},        -- Andurs
    [105250] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 41895, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Aulier
    [99210] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 40299, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},       -- Bodhi Sunwayver
    [99077] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 40280, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},       -- Bredda Tenderhide
    [99035] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 40279, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},       -- Durian Strongfruit
    [99150] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 40282, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},       -- Grixis Tinypop
    [106552] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 42159, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Nightwatcher Merayl
    [104553] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 41687, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Odrogg
    [98270] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 40278, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},       -- Robert Craig
    [105386] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = nil, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},        -- Rydyr
    [99182] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 40298, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},       -- Sir Galveston
    [97804] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 40277, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},       -- Tiffany Nelson
    [105455] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 41944, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Trapper Jarrun
    [105674] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 41990, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Varenne
    [104970] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 41860, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Xorvasc

    -- Legion (Argus)
    [128009] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49043, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Baneglow
    [128020] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49054, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Bloat
    [128013] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49047, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Bucky
    [128017] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49051, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Corrupted Blood of Argus
    [128011] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49045, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Deathscreech
    [128021] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49055, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Earseeker
    [128008] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49042, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Foulclaw
    [128015] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49049, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Gloamwing
    [128012] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49046, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Gnasher
    [128018] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49052, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Marcuus
    [128023] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49057, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Minixis
    [128024] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49058, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- One-of-Many
    [128022] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49056, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Pilfer
    [128010] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49044, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Retch
    [128007] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49041, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Ruinhoof
    [128016] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49050, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Shadeflicker
    [128014] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49048, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Snozz
    [128019] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 49053, battleGossipOptionID = nil, expansionNumber = 6, expansionName = EXPANSION_NAME6, custom = false,},      -- Watcher

    -- BFA
    [162465] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 58743, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Aqir Sandcrawler
    [162470] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 58748, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Baruk Stone Defender
    [141588] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52779, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Bloodtusk
    [162466] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 58745, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Blotto
    [139987] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52126, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Bristlespine
    [141479] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52751, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Burly
    [139489] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52009, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Captain Hermes
    [141215] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52455, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Chitara
    [141292] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52471, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Delia Hanako
    [140461] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52218, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Dilbert Mcclint
    [140315] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52165, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Eddie Fixit
    [141002] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52316, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Ellie Vern
    [140813] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52278, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Fizzie Sparkwhistle
    [141799] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52799, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Grady Prett
    [142151] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52937, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Jammer
    [142096] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52892, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Karaga
    [141879] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52850, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Keeyo
    [141814] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52803, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Korval Darkbeard
    [162468] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 58746, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Ktiny The Mad
    [142054] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52878, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Kusa
    [141077] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52430, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Kwint
    [141046] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52325, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Leana Darkwind
    [141529] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52754, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Lozu
    [140880] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52297, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Michael Skarn
    [162458] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 58742, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Retinus The Seeker
    [141945] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52856, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Sizzik
    [141969] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52864, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Spineleaf
    [142114] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52923, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Talia Sparkbrow
    [162469] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 58747, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Tormentius
    [162471] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 58749, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Vilthik Hatchling
    [162461] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 58744, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Whispers
    [142234] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 52938, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Zujai

    -- BFA (Mechagon)
    [154926] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56397, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Ck 9 Micro Oppression Unit
    [154925] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56396, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Creakclank
    [154922] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56393, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Gnomefeaster
    [154924] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56395, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Goldenbot Xd
    [154923] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56394, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Sputtertube
    [154929] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56400, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Unit 17
    [154927] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56398, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Unit 35
    [154928] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56399, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Unit 6

    -- BFA (Nazjatar)
    [154911] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56382, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Chomp
    [154915] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56386, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Elderspawn of Nalaada
    [154920] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56391, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Frenzied Knifefang
    [154921] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56392, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Giant Opaline Conch
    [154918] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56389, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Kelpstone
    [154917] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56388, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Mindshackle
    [154914] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56385, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Pearlhusk Crawler
    [154910] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56381, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Prince Wiggletail
    [154916] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56387, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Ravenous Scalespawn
    [154913] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56384, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Shadowspike Lurker
    [154912] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56383, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Silence
    [154919] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 56390, battleGossipOptionID = nil, expansionNumber = 7, expansionName = EXPANSION_NAME7, custom = false,},     -- Voltgorger

    -- Shadowlands
    [173331] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61886, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Addius The Tormentor
    [173257] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61866, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Caregiver Maximillian
    [173267] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61868, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Dundley Stickyfingers
    [173324] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61885, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Eyegor
    [173377] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61948, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Faryl
    [173372] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61946, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Glitterdust
    [173274] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61870, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Gorgemouth
    [173133] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61783, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Jawbone
    [173376] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61947, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Nightfang
    [173381] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61949, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Rascal
    [173263] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61867, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Rotgut
    [173303] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61879, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Scorch
    [173131] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61784, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Stratios
    [173315] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61883, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Sylla
    [173129] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61791, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Thenia
    [173130] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 61787, battleGossipOptionID = nil, expansionNumber = 8, expansionName = EXPANSION_NAME8, custom = false,},      -- Zolla

	-- Dragonflight
    [197447] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 71206, battleGossipOptionID = nil, expansionNumber = 9, expansionName = EXPANSION_NAME9, custom = false,},      -- Stormamu (no gossip needed)
    [189376] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 66588, battleGossipOptionID = nil, expansionNumber = 9, expansionName = EXPANSION_NAME9, custom = false,},      -- Swog (no gossip needed)
    [197336] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 71166, battleGossipOptionID = nil, expansionNumber = 9, expansionName = EXPANSION_NAME9, custom = false,},      -- Enyobon (no gossip needed)
    [197102] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 71140, battleGossipOptionID = 107097, expansionNumber = 9, expansionName = EXPANSION_NAME9, custom = false,},   -- Bakhushek
    [197417] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 71202, battleGossipOptionID = nil, expansionNumber = 9, expansionName = EXPANSION_NAME9, custom = false,},      -- Arcantus (no gossip needed)
    [196069] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 71145, battleGossipOptionID = 107108, expansionNumber = 9, expansionName = EXPANSION_NAME9, custom = false,},   -- Patchu
    [196264] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 66551, battleGossipOptionID = 107091, expansionNumber = 9, expansionName = EXPANSION_NAME9, custom = false,},   -- Haniko
    [197350] = {npcName = nil, canBattle = true, canUseStableMaster = false, questID = 71180, battleGossipOptionID = 107135, expansionNumber = 9, expansionName = EXPANSION_NAME9, custom = false,},   -- Setimothes
}

USQ.questName = {}

function USQ.Debug(DebugLevel, ...)
    if DebugLevel <= USQ.DebugLevel then
        USQ:Print(...)
    end
end

USQ.ldb = LibStub:GetLibrary("LibDataBroker-1.1")
USQ.ldb:NewDataObject("UltraSquirt", {
	type = "launcher",
    text = "UltraSquirt",
	icon = "Interface\\ICONS\\Spell_Misc_PetHeal.blp",
    tooltiptext = "UltraSquirt",
	OnClick = function(self, button)
        if USQ.USQFrame:IsShown() then
            USQ.Close()
        else
            USQ.Open()
        end
	end,
})

function USQ:OnInitialize()
    USQ:RegisterChatCommand("ultra", "SlashHandler")
    USQ:RegisterChatCommand("ultrasquirt", "SlashHandler")
    USQ:RegisterChatCommand("squirt", "SlashHandler")

    -- Addon Options
    USQ.defaultOptions = {
        global = {
            KEYBIND = "SPACE",
            AutoSafariHat = true,
            AutoLesserPetTreat = false,
            AutoPetTreat = false,
            AutoDarkmoonTopHat = false,
            AutoReviveBattlePets = true,
            AutoBandage = false,
            BattleHealingThreshold = {['*'] = 100},
            RematchLoadTeamDelay = 3,
            PetBattleCloseDelay = 2,
            HealDelay = 2,
            AdvancedTeamsList = {
                ['*'] = {           -- npcID
                    ['*'] = {       -- index (1,2,3,4,5 etc.)
                        RematchTeamKey = nil,
                        BattleHealingThreshold = 100,
                    }
                }
            },
            AdvancedTeamsReviveEarly = {
                ['*'] = false       -- npcID
            },
            MuteEnableDisableMessages = false,
        }
    }
    USQ.db = LibStub("AceDB-3.0"):New("UltraSquirtSettingsDB", USQ.defaultOptions)

    -- Create Frames here, so that Layout-Cache will be applied to them
    USQ.USQFrame = USQ:CreateUltraFrame("UltraSquirtFrame", "UltraSquirt", {"TOP", "UIParent", "TOP", 0, -225}, 372, 205, USQ.Close) --320
    USQ.USQAdvancedTeamsFrame = USQ:CreateUltraFrame("UltraSquirtAdvancedTeamsFrame", "UltraSquirt Advanced Teams", {"TOP", "UIParent", "TOP", 0, -500}, 743, 400, function() USQ.USQAdvancedTeamsFrame:Hide() end)

    -- Rematch specifics
    if Rematch then
        USQ.Debug(1, "Rematch already loaded - running Setup Rematch Links")
        USQ:SetupRematchLinks()
    else
        USQ.Debug(1, "Rematch not yet loaded - registering ADDON_LOADED")
        USQ:RegisterEvent("ADDON_LOADED")
    end
end

function USQ:OnEnable()
    USQ.db.RegisterCallback(USQ, "OnProfileChanged", "RefreshConfig")
    USQ.db.RegisterCallback(USQ, "OnProfileCopied", "RefreshConfig")
    USQ.db.RegisterCallback(USQ, "OnProfileReset", "RefreshConfig")

    local options = {
        type = "group",
        args = {
            generalgroup = {
                type = "group",
                name = L["General Settings Group"],
                inline = true,
                order = 10,
                args = {
                    keybind = {
                        type = "keybinding",
                        name = KEY_BINDING,
                        set = function(info, val) USQ.db.global.KEYBIND = val end,
                        get = function(info) return USQ.db.global.KEYBIND end,
                        order = 10,
                    },
                    muteenabledisablemessages = {
                        type = "toggle",
                        name = L["Mute Addon Enabled and Disabled Messages"],
                        set = function(info,val) USQ.db.global.MuteEnableDisableMessages = val end,
                        get = function(info) return USQ.db.global.MuteEnableDisableMessages end,
                        order = 20,
                    },
                },
            },
            delaygroup = {
                type = "group",
                name = L["Delay Settings Group"],
                order = 30,
                inline = true,
                args = {
                    delaysettingsdescription = {
                        type = "description",
                        fontSize = "medium",
                        name = L["Delay Settings Description"],
                        order = 10,
                    },
                    rematchloadteamspacer = {
                        type = "description",
                        fontSize = "medium",
                        name = "\n",
                        order = 20,
                    },
                    rematchloadteamdelay = {
                        type = "range",
                        name = L["Rematch Load Team Delay Setting"],
                        desc = L["Rematch Load Team Delay Description"],
                        min = 1,
                        max = 20,
                        step = 1,
                        set = function(info, val) USQ.db.global.RematchLoadTeamDelay = val end,
                        get = function(info) return USQ.db.global.RematchLoadTeamDelay end,
                        order = 30,
                        width = "double",
                    },
                    petbattleclosespacer = {
                        type = "description",
                        fontSize = "medium",
                        name = "\n",
                        order = 40,
                    },
                    petbattleclosedelay = {
                        type = "range",
                        name = L["Pet Battle Close Delay Setting"],
                        desc = L["Pet Battle Close Delay Description"],
                        min = 1,
                        max = 20,
                        step = 1,
                        set = function(info, val) USQ.db.global.PetBattleCloseDelay = val end,
                        get = function(info) return USQ.db.global.PetBattleCloseDelay end,
                        order = 50,
                        width = "double",
                    },
                    healdelayspacer = {
                        type = "description",
                        fontSize = "medium",
                        name = "\n",
                        order = 60,
                    },
                    healdelay = {
                        type = "range",
                        name = L["Heal Delay Setting"],
                        desc = L["Heal Delay Description"],
                        min = 1,
                        max = 20,
                        step = 1,
                        set = function(info, val) USQ.db.global.HealDelay = val end,
                        get = function(info) return USQ.db.global.HealDelay end,
                        order = 70,
                        width = "double",
                    },
                },
            },
        },
    }

    AceConfig:RegisterOptionsTable("UltraSquirt", options)
    AceConfigDialog:AddToBlizOptions("UltraSquirt")

    USQ.USQFrame.MacroButton = CreateFrame("Button", "UltraSquirtButton", USQ.USQFrame, "InsecureActionButtonTemplate")
	USQ.USQFrame.MacroButton:RegisterForClicks("AnyUp", "AnyDown")
    USQ.USQFrame.MacroButton:SetAttribute("type1", "macro")

    USQ.USQFrame.MacroButton:SetText("Ultra")
    USQ.USQFrame.MacroButton:HookScript("OnClick", USQ.Update)
    USQ.USQFrame:SetScript("OnKeyDown", USQ.Update)
	USQ.USQFrame:SetScript("OnKeyUp", USQ.Update)
    USQ.USQFrame:SetPropagateKeyboardInput(true)

    USQ.USQFrame.SafariHatButton = USQ.ButtonFactory(USQ.USQFrame, "ItemButton", "SafariHatButton", "toy", 92738, true, true, "AutoSafariHat")
    USQ.USQFrame.LesserPetTreatButton = USQ.ButtonFactory(USQ.USQFrame, "ItemButton", "LesserPetTreatButton", "item", 98112, true, false, "AutoLesserPetTreat")
    USQ.USQFrame.PetTreatButton = USQ.ButtonFactory(USQ.USQFrame, "ItemButton", "PetTreatButton", "item", 98114, true, false, "AutoPetTreat")
    USQ.USQFrame.DarkmoonTopHatButton = USQ.ButtonFactory(USQ.USQFrame, "ItemButton", "DarkmoonTopHatButton", "item", 171364, true, true, "AutoDarkmoonTopHat")
    USQ.USQFrame.ReviveBattlePetsButton = USQ.ButtonFactory(USQ.USQFrame, "ItemButton", "ReviveBattlePetsButton", "spell", 125439, true, true, "AutoReviveBattlePets")
    USQ.USQFrame.BandageButton = USQ.ButtonFactory(USQ.USQFrame, "ItemButton", "BandageButton", "item", 86143, true, true, "AutoBandage")

    -- ref: C:\Games\World of Warcraft\_retail_\BlizzardInterfaceCode\Interface\FrameXML\UIPanelTemplates.xml line #425
    -- ref: C:\Games\World of Warcraft\_retail_\BlizzardInterfaceCode\Interface\FrameXML\UIPanelTemplates.lua line #138
    USQ.USQFrame.ToggleAdvancedTeamsButton = CreateFrame("Button", USQ.USQFrame:GetName() .. "ToggleAdvancedTeamsButton", USQ.USQFrame, "UIPanelSquareButton")
    USQ.USQFrame.ToggleAdvancedTeamsButton:SetWidth(32)
    USQ.USQFrame.ToggleAdvancedTeamsButton:SetHeight(32)
    USQ.USQFrame.ToggleAdvancedTeamsButton.icon:SetTexture("Interface\\Buttons\\SquareButtonTextures")
    USQ.USQFrame.ToggleAdvancedTeamsButton.icon:SetTexCoord(0.42187500, 0.23437500, 0.01562500, 0.20312500)
    USQ.USQFrame.ToggleAdvancedTeamsButton:SetScript("OnClick", function() if USQ.USQAdvancedTeamsFrame:IsShown() then USQ.USQAdvancedTeamsFrame:Hide() else USQ.USQAdvancedTeamsFrame:Show() end end)
    -- TODO: Disabling this for release version - testing still in progress
    if EnableAdvancedTeams == false then
        USQ.USQFrame.ToggleAdvancedTeamsButton:Disable()
    end

    USQ.USQFrame.SetBattleNPCButton = CreateFrame("Button", USQ.USQFrame:GetName() .. "SetBattleNPCButton", USQ.USQFrame)
	USQ.USQFrame.SetBattleNPCButton:RegisterForClicks("AnyUp", "AnyDown")
    USQ.USQFrame.SetBattleNPCButton:SetWidth(32)
    USQ.USQFrame.SetBattleNPCButton:SetHeight(32)
    USQ.USQFrame.SetBattleNPCButton.icon = USQ.USQFrame.SetBattleNPCButton:CreateTexture(USQ.USQFrame.SetBattleNPCButton:GetName() .. "IconTexture", "BORDER")
    USQ.USQFrame.SetBattleNPCButton.icon:SetAllPoints(USQ.USQFrame.SetBattleNPCButton)
    USQ.USQFrame.SetBattleNPCButton.icon:SetTexture("Interface\\Cursor\\Crosshairs")
    USQ.USQFrame.SetBattleNPCButton.IconBorder = USQ.USQFrame.SetBattleNPCButton:CreateTexture(nil, "OVERLAY")
    USQ.USQFrame.SetBattleNPCButton.IconBorder:SetHeight(37)
    USQ.USQFrame.SetBattleNPCButton.IconBorder:SetWidth(37)
    USQ.USQFrame.SetBattleNPCButton.IconBorder:SetPoint("CENTER", USQ.USQFrame.SetBattleNPCButton, "CENTER")
    USQ.USQFrame.SetBattleNPCButton.IconBorder:SetTexture("Interface\\Common\\WhiteIconFrame")

    USQ.USQFrame.SetBattleNPCButton.NormalTexture = USQ.USQFrame.SetBattleNPCButton:CreateTexture(USQ.USQFrame.SetBattleNPCButton:GetName() .. "NormalTexture")
	USQ.USQFrame.SetBattleNPCButton.NormalTexture:SetTexture("Interface\\BUTTONS\\UI-Quickslot2")
    USQ.USQFrame.SetBattleNPCButton.NormalTexture:SetWidth(64)
    USQ.USQFrame.SetBattleNPCButton.NormalTexture:SetHeight(64)
    USQ.USQFrame.SetBattleNPCButton.NormalTexture:SetPoint("CENTER", USQ.USQFrame.SetBattleNPCButton, 0, -1)
    USQ.USQFrame.SetBattleNPCButton:SetNormalTexture(USQ.USQFrame.SetBattleNPCButton.NormalTexture)
    USQ.USQFrame.SetBattleNPCButton:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
    USQ.USQFrame.SetBattleNPCButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    USQ.USQFrame.SetBattleNPCButton:SetScript("OnClick", USQ.SetBattleNPCButton_OnClick)

    USQ.USQFrame.BattleNPCFontString = USQ.USQFrame:CreateFontString(USQ.USQFrame:GetName() .. "BattleNPCFontString", "OVERLAY", "GameFontWhite", 0)
    USQ.USQFrame.BattleNPCFontString:SetWordWrap(true)
    USQ.USQFrame.BattleNPCFontString:SetJustifyH("LEFT")
    USQ.USQFrame.BattleNPCFontString:SetWidth(280) -- 188 + 26 + 12 + 2 --228
    USQ.USQFrame.BattleNPCFontString:SetHeight(32)

    -- ref: C:\Games\World of Warcraft\_retail_\BlizzardInterfaceCode\Interface\SharedXML\VideoOptionsPanels.xml  #344
    --USQ.USQFrame.BattleHealingThresholdSlider = CreateFrame("Slider", USQ.USQFrame:GetName() .. "BattleHealingThresholdSlider", USQ.USQFrame, "HorizontalSliderTemplate")
	USQ.USQFrame.BattleHealingThresholdSlider = CreateFrame("Slider", USQ.USQFrame:GetName() .. "BattleHealingThresholdSlider", USQ.USQFrame, "SettingsAdvancedSliderTemplate")
	-- USQ.USQFrame.BattleHealingThresholdSlider:ClearAllPoints()
	-- USQ.USQFrame.BattleHealingThresholdSlider:SetPoint("TOPLEFT", )
	USQ.USQFrame.BattleHealingThresholdSlider.Text:SetText(_G["MINIMUM"] .. " " .. _G["HP"])
	USQ.USQFrame.BattleHealingThresholdSlider.Text:ClearAllPoints()
	USQ.USQFrame.BattleHealingThresholdSlider.Text:SetPoint("BOTTOMLEFT", USQ.USQFrame.BattleHealingThresholdSlider, "TOPLEFT", 0, 0)
    -- USQ.USQFrame.BattleHealingThresholdSlider:SetWidth(332) -- 280
    -- USQ.USQFrame.BattleHealingThresholdSlider:SetHeight(16)
	USQ.USQFrame.BattleHealingThresholdSlider.options = CreateFromMixins(SettingsSliderOptionsMixin)
	-- USQ.USQFrame.BattleHealingThresholdSlider.options.minValue = 0
	-- USQ.USQFrame.BattleHealingThresholdSlider.options.maxValue = 100
	-- USQ.USQFrame.BattleHealingThresholdSlider.options.steps = 20
	USQ.USQFrame.BattleHealingThresholdSlider.options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Top, nil)
	USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers.Init(USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers, USQ.db.global.BattleHealingThreshold[USQ.BattleNPCID], 0, 100, 20, USQ.USQFrame.BattleHealingThresholdSlider.options.formatters)
    -- USQ.USQFrame.BattleHealingThresholdSlider:SetObeyStepOnDrag(true)
    -- USQ.USQFrame.BattleHealingThresholdSlider:SetMinMaxValues(0, 100)
    -- USQ.USQFrame.BattleHealingThresholdSlider:SetValueStep(5)
    -- USQ.USQFrame.BattleHealingThresholdSlider.Title = USQ.USQFrame.BattleHealingThresholdSlider:CreateFontString(USQ.USQFrame.BattleHealingThresholdSlider:GetName() .. "Title", "ARTWORK", "OptionsFontHighlight", 0)
    -- USQ.USQFrame.BattleHealingThresholdSlider.Title:SetPoint("BOTTOMLEFT", USQ.USQFrame.BattleHealingThresholdSlider, "TOPLEFT", 0, 2)
    -- USQ.USQFrame.BattleHealingThresholdSlider.Title:SetText(_G["MINIMUM"] .. " " .. _G["HP"])
    -- USQ.USQFrame.BattleHealingThresholdSlider.displayValue = USQ.USQFrame.BattleHealingThresholdSlider:CreateFontString(nil, "ARTWORK", "OptionsFontLarge", 0)
    -- USQ.USQFrame.BattleHealingThresholdSlider.displayValue:SetJustifyH("CENTER")
    -- USQ.USQFrame.BattleHealingThresholdSlider.displayValue:SetPoint("CENTER", USQ.USQFrame.BattleHealingThresholdSlider, "CENTER", 0, 18)
    -- USQ.USQFrame.BattleHealingThresholdSlider:SetScript("OnValueChanged", USQ.BattleHealingThresholdSlider_OnValueChanged)
    -- USQ.USQFrame.BattleHealingThresholdSlider:SetScript("OnEnable", function(self) self:SetAlpha(1) end)
    -- USQ.USQFrame.BattleHealingThresholdSlider:SetScript("OnDisable", function(self) self:SetAlpha(0.4) end)
    -- USQ.USQFrame.BattleHealingThresholdSlider:SetValue(USQ.db.global.BattleHealingThreshold[USQ.BattleNPCID])
	USQ.USQFrame.BattleHealingThresholdSlider.cbrHandles = CreateFromMixins(SettingsCallbackHandleContainerMixin)
	USQ.USQFrame.BattleHealingThresholdSlider.cbrHandles:Init()
	
	USQ.USQFrame.BattleHealingThresholdSlider.cbrHandles:RegisterCallback(USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers, MinimalSliderWithSteppersMixin.Event.OnValueChanged, USQ.BattleHealingThresholdSlider_OnValueChanged)
	-- USQ.USQFrame.BattleHealingThresholdSlider.cbrHandles:SetOnValueChangedCallback(USQ.db.global.BattleHealingThreshold[USQ.BattleNPCID], USQ.BattleHealingThresholdSlider_SetDisplayValue)
    -- /script UltraSquirt.USQFrame.BattleHealingThresholdSlider:Disable()
    -- /script UltraSquirt.USQFrame.BattleHealingThresholdSlider:Enable()

    USQ.USQFrame.HotkeyFontString = USQ.USQFrame:CreateFontString("UltraSquirtFrameHotkeyFontString", "OVERLAY", "GameFontWhite", 0)
    USQ.USQFrame.HotkeyFontString:SetWordWrap(false)
    USQ.USQFrame.HotkeyFontString:SetWidth(332) --280
    USQ.USQFrame.HotkeyFontString:SetHeight(16)

    USQ.USQFrame.SafariHatButton:SetPoint("TOPLEFT", 22, -44)
    USQ.USQFrame.LesserPetTreatButton:SetPoint("LEFT", USQ.USQFrame.SafariHatButton, "RIGHT", 20, 0)
    USQ.USQFrame.PetTreatButton:SetPoint("LEFT", USQ.USQFrame.LesserPetTreatButton, "RIGHT", 20, 0)
    USQ.USQFrame.DarkmoonTopHatButton:SetPoint("LEFT", USQ.USQFrame.PetTreatButton, "RIGHT", 20, 0)
    USQ.USQFrame.ReviveBattlePetsButton:SetPoint("LEFT", USQ.USQFrame.DarkmoonTopHatButton, "RIGHT", 20, 0)
    USQ.USQFrame.BandageButton:SetPoint("LEFT", USQ.USQFrame.ReviveBattlePetsButton, "RIGHT", 20, 0)
    USQ.USQFrame.ToggleAdvancedTeamsButton:SetPoint("LEFT", USQ.USQFrame.BandageButton, "RIGHT", 12, 0)

    USQ.USQFrame.SetBattleNPCButton:SetPoint("TOPLEFT", USQ.USQFrame.SafariHatButton, "BOTTOMLEFT", 0, -10)
    USQ.USQFrame.BattleNPCFontString:SetPoint("LEFT", USQ.USQFrame.SetBattleNPCButton, "RIGHT", 20, 0)

	USQ.USQFrame.BattleHealingThresholdSlider:ClearAllPoints()
    USQ.USQFrame.BattleHealingThresholdSlider:SetPoint("TOPLEFT", USQ.USQFrame.SetBattleNPCButton, "BOTTOMLEFT", 0, -25)
	USQ.USQFrame.BattleHealingThresholdSlider:SetPoint("RIGHT", USQ.USQFrame, "RIGHT", 0, -25)
	USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers:ClearAllPoints()
	USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers:SetPoint("LEFT", USQ.USQFrame.BattleHealingThresholdSlider, "LEFT")
	USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers:SetPoint("RIGHT", USQ.USQFrame.ToggleAdvancedTeamsButton, "RIGHT")
	

    USQ.USQFrame.HotkeyFontString:SetPoint("TOPLEFT", USQ.USQFrame.BattleHealingThresholdSlider, "BOTTOMLEFT", 0, -5)

    -- Pre/post click functions
    USQ.USQFrame.DarkmoonTopHatButton:SetScript("PreClick", USQ.DarkmoonTopHatButtonPreClick)
    USQ.USQFrame.DarkmoonTopHatButton:SetScript("PostClick", USQ.DarkmoonTopHatButtonPostClick)
    USQ.USQFrame.ReviveBattlePetsButton:SetScript("PreClick", USQ.BandageHealPreClick)
    USQ.USQFrame.ReviveBattlePetsButton:SetScript("PostClick", USQ.BandageHealPostClick)
    USQ.USQFrame.BandageButton:SetScript("PreClick", USQ.BandageHealPreClick)
    USQ.USQFrame.BandageButton:SetScript("PostClick", USQ.BandageHealPostClick)

    local NPCScrollFrameCols = {
        {
            ["name"] = "npcID",
            ["width"] = 50,
            ["align"] = "RIGHT",
            ["color"] = {["r"] = 1.0, ["g"] = 1.0, ["b"] = 0, ["a"] = 1.0,},
            ["colorargs"] = nil,
            ["bgcolor"] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.0, ["a"] = 1.0,},
            ["DoCellUpdate"] = nil,
        },
        {
            ["name"] = "npcName",
            ["width"] = 190,
            ["align"] = "LEFT",
            ["color"] = {["r"] = 1.0, ["g"] = 1.0, ["b"] = 0, ["a"] = 1.0,},
            ["colorargs"] = nil,
            ["bgcolor"] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.0, ["a"] = 1.0,},
            ["sort"] = "dsc",
            ["DoCellUpdate"] = nil,
        },
        {
            ["name"] = "Revive Early",
            ["width"] = 50,
            ["align"] = "LEFT",
            ["color"] = {["r"] = 1.0, ["g"] = 1.0, ["b"] = 0, ["a"] = 1.0,},
            ["colorargs"] = nil,
            ["bgcolor"] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.0, ["a"] = 1.0,},
            ["sort"] = "dsc",
            ["DoCellUpdate"] = function(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, st, ...)
                if fShow then
                    -- ref: C:\Games\World of Warcraft\_retail_\BlizzardInterfaceCode\Interface\FrameXML\ChatConfigFrame.xml #76
                    if not cellFrame.AdvancedTeamsReviveEarlyCheckButton then
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton = CreateFrame("CheckButton", nil, cellFrame)
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetPoint("CENTER", cellFrame, "CENTER")
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetWidth(20)
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetHeight(20)
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight", "ADD")
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
                        cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetScript("OnClick", function(self, button, down)
                            local npcID = USQ:NPCInfoScrollingTableGetCurrentnpcID()
                            local checked = self:GetChecked()
                            USQ.Debug(1, "Save setting: npcID: " .. tostring(self.npcID) .. " realrow: " .. tostring(self.realrow) .. " Checked: " .. tostring(checked))
                            USQ.db.global.AdvancedTeamsReviveEarly[self.npcID] = checked
							USQ:UpdateNPCInfoScrollingTable()
                        end)
                    end

                    local npcID = st:GetCell(realrow, 1)
                    local rowdata = st:GetRow(realrow)
                    local celldata = st:GetCell(rowdata, column)
                    local cellvalue = celldata  -- dropped .value as it's using the simple ST format

                    cellFrame.AdvancedTeamsReviveEarlyCheckButton.realrow = realrow
                    cellFrame.AdvancedTeamsReviveEarlyCheckButton.npcID = npcID

					-- USQ.Debug(1, "Setting checkbox for row: " .. tostring(row) .. " realrow: " .. tostring(realrow) .. " npcID: " .. tostring(npcID) .. " to cellvalue: " .. tostring(cellvalue))
                    cellFrame.AdvancedTeamsReviveEarlyCheckButton:SetChecked(cellvalue or false)
                end
            end,
        },
    }

    USQ.USQAdvancedTeamsFrame.NPCScrollFrame = ScrollingTable:CreateST(NPCScrollFrameCols, 10, 32, nil, USQ.USQAdvancedTeamsFrame)
    USQ.USQAdvancedTeamsFrame.NPCScrollFrame.frame:SetPoint("TOPLEFT", USQ.USQAdvancedTeamsFrame.DialogBG, "TOPLEFT", 4, -36)
    USQ.USQAdvancedTeamsFrame.NPCScrollFrame.frame:SetPoint("BOTTOMLEFT", USQ.USQAdvancedTeamsFrame.DialogBG, "BOTTOMLEFT", 4, 2)
    USQ.USQAdvancedTeamsFrame.NPCScrollFrame.frame:SetWidth(310) -- 260
    USQ.USQAdvancedTeamsFrame.NPCScrollFrame:EnableSelection(true)
    USQ.USQAdvancedTeamsFrame.NPCScrollFrame:RegisterEvents({
        ["OnClick"] = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            if button == "LeftButton" then
                if (row or realrow) then
                    USQ.Debug(1, "row: " .. tostring(row) .. " realrow: " .. tostring(realrow) .. " column: " .. tostring(column) .. " data[realrow][1]:" .. tostring(data[realrow][1]) .. " table:GetSelection(): " .. tostring(table:GetSelection()))
                    USQ.Debug(1, "table:GetSelection() == realrow: " .. tostring(table:GetSelection() == realrow))
                    local npcID
                    if table:GetSelection() == realrow then
                        -- Clicking on the selected row will clear the selection - so also clear the second table
                        npcID = false
                    else
                        npcID = data[realrow][1]
                    end
                    USQ.Debug(1, "from row click, npcID: " .. tostring(npcID))
                    USQ:UpdateTeamsScrollingTable(npcID)
                    return false
                end
                -- Must be on the header row, so don't run anything else (to avoid the sorting)
                return true
            end
        end,
    })
    USQ.USQAdvancedTeamsFrame.NPCScrollFrame:SetData(USQ:GenerateNPCInfoScrollingTableData(), true)

    local TeamsScrollFrameCols = {
        {
            ["name"] = "",  -- Rematch team name
            ["width"] = 1,
        },
        {
            ["name"] = "#",
            ["width"] = 20,
            ["align"] = "RIGHT",
            ["color"] = {["r"] = 1.0, ["g"] = 1.0, ["b"] = 0, ["a"] = 1.0,},
            ["colorargs"] = nil,
            ["bgcolor"] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.0, ["a"] = 1.0,},
            ["defaultsort"] = "asc",
            ["sort"] = "dsc",
            ["DoCellUpdate"] = nil,
        },
        {
            ["name"] = L["Team Name"],
            ["width"] = 130,
            ["align"] = "LEFT",
            ["color"] = {["r"] = 1.0, ["g"] = 1.0, ["b"] = 0, ["a"] = 1.0,},
            ["colorargs"] = nil,
            ["bgcolor"] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.0, ["a"] = 1.0,},
            ["DoCellUpdate"] = nil,
        },
        {
            ["name"] = _G["MINIMUM"] .. " " .. _G["HP"],
            ["width"] = 140,
            ["DoCellUpdate"] = function(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, st, ...)
                if fShow then
                    local rowdata = st:GetRow(realrow)
                    local celldata = st:GetCell(rowdata, column)
                    local cellvalue = celldata.value


                    if not cellFrame.BattleHealingThresholdSlider then

						cellFrame.BattleHealingThresholdSlider = CreateFrame("Slider", nil, cellFrame, "SettingsAdvancedSliderTemplate") --SettingsAdvancedSliderTemplate
						cellFrame.BattleHealingThresholdSlider:ClearAllPoints()
						cellFrame.BattleHealingThresholdSlider:SetAllPoints(cellFrame)
						-- cellFrame.BattleHealingThresholdSlider:SetPoint("CENTER", cellFrame, "CENTER")
			            -- cellFrame.BattleHealingThresholdSlider:SetWidth(120)
                        -- cellFrame.BattleHealingThresholdSlider:SetHeight(16)
						cellFrame.BattleHealingThresholdSlider.options = CreateFromMixins(SettingsSliderOptionsMixin)
						cellFrame.BattleHealingThresholdSlider.options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Top, nil)
						cellFrame.BattleHealingThresholdSlider.SliderWithSteppers.Init(cellFrame.BattleHealingThresholdSlider.SliderWithSteppers, cellvalue, 0, 100, 20, cellFrame.BattleHealingThresholdSlider.options.formatters)
						cellFrame.BattleHealingThresholdSlider.SliderWithSteppers:ClearAllPoints()
						cellFrame.BattleHealingThresholdSlider.SliderWithSteppers:SetAllPoints(cellFrame.BattleHealingThresholdSlider)
						cellFrame.BattleHealingThresholdSlider.cbrHandles = CreateFromMixins(SettingsCallbackHandleContainerMixin)
						cellFrame.BattleHealingThresholdSlider.cbrHandles:Init()
						cellFrame.BattleHealingThresholdSlider.cbrHandles:RegisterCallback(cellFrame.BattleHealingThresholdSlider.SliderWithSteppers, MinimalSliderWithSteppersMixin.Event.OnValueChanged, function(self, value, userInput)
                            USQ.Debug(1, "Slider_OnValueChanged: self: " .. tostring(self) .. " value: " .. tostring(value) .. " userInput: " .. tostring(userInput))
                            -- self.displayValue:SetText(tostring(value) .. "%")

                            -- if userInput then
                                local npcID = USQ:NPCInfoScrollingTableGetCurrentnpcID()
                                USQ.Debug(1, "Save setting: npcID: " .. tostring(npcID) .. " realrow: " .. tostring(self.realrow) .. " RematchTeamKey:  BattleHealingThreshold: " .. tostring(value))
                                USQ.db.global.AdvancedTeamsList[npcID][self.realrow].BattleHealingThreshold = value

                                USQ:UpdateTeamsScrollingTable()
                            -- end
                        end,
						cellFrame.BattleHealingThresholdSlider)
                    end
					-- USQ.Debug(1, "Setting slider value for row: " .. tostring(row) .. " realrow: " .. tostring(realrow) .. " to cellvalue: " .. tostring(cellvalue))
                    cellFrame.BattleHealingThresholdSlider.SliderWithSteppers:SetValue(cellvalue)
                    cellFrame.BattleHealingThresholdSlider.realrow = realrow
                end
            end,
        },
        {
            -- ["name"] =  "|TInterface\\Buttons\\UI-MicroStream-Green:28:28:0:0:32:32:0:32:32:0|t",
            ["name"] =  "",
            ["width"] = 26,
            ["align"] = "CENTER",
            ["color"] = {["r"] = 1.0, ["g"] = 1.0, ["b"] = 0, ["a"] = 1.0,},
            ["colorargs"] = nil,
            ["bgcolor"] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.0, ["a"] = 1.0,},
            -- ["DoCellUpdate"] = nil,
            -- ref: C:\Games\World of Warcraft\_retail_\BlizzardInterfaceCode\Interface\AddOns\Blizzard_GarrisonTemplates\Blizzard_GarrisonSharedTemplates.xml #476
            ["DoCellUpdate"] = function(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, st, ...)
                if fShow then
                    if not cellFrame.Button then
                        cellFrame.Button = CreateFrame("Button", nil, cellFrame, "UIPanelSquareButton")
                        cellFrame.Button:SetPoint("CENTER", cellFrame, "CENTER")
                        cellFrame.Button:SetWidth(20)
                        cellFrame.Button:SetHeight(20)
                        cellFrame.Button.icon:SetTexture("Interface\\Buttons\\SquareButtonTextures")
                        cellFrame.Button.icon:SetTexCoord(0.45312500, 0.64062500, 0.01562500, 0.20312500)
                        cellFrame.Button:SetScript("OnClick", function(self)
                            local npcID = USQ:NPCInfoScrollingTableGetCurrentnpcID()
                            USQ.Debug(1, "MoveUp: #self.data: " .. tostring(#self.data) .. " self.realrow: " .. tostring(self.realrow) .. " self.row: " .. tostring(self.row) .. " npcID: " .. tostring(npcID))
                            if self.realrow > 1 then
                                USQ:SwitchAdvancedTeamEntries(npcID, self.realrow, self.realrow - 1)
                            end
                        end)
                    end

                    -- USQ.Debug(1, "Updating MoveUp: row: " .. tostring(row) .. " realrow: " .. tostring(realrow))
                    cellFrame.Button.realrow = realrow
                    cellFrame.Button.row = row
                    cellFrame.Button.data = data

                    if row == 1 then
                        cellFrame.Button:Disable()
                    else
                        cellFrame.Button:Enable()
                    end
                end
            end,
        },
        {
            -- ["name"] =  "|TInterface\\Buttons\\UI-MicroStream-Green:28|t",
            ["name"] =  "",
            ["width"] = 26,
            ["align"] = "CENTER",
            ["color"] = {["r"] = 1.0, ["g"] = 1.0,["b"] = 0,["a"] = 1.0,},
            ["colorargs"] = nil,
            ["bgcolor"] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.0, ["a"] = 1.0,},
            ["DoCellUpdate"] = function(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, st, ...)
                if fShow then
                    if not cellFrame.Button then
                        cellFrame.Button = CreateFrame("Button", nil, cellFrame, "UIPanelSquareButton")
                        cellFrame.Button:SetPoint("CENTER", cellFrame, "CENTER")
                        cellFrame.Button:SetWidth(20)
                        cellFrame.Button:SetHeight(20)
                        cellFrame.Button.icon:SetTexture("Interface\\Buttons\\SquareButtonTextures")
                        cellFrame.Button.icon:SetTexCoord(0.45312500, 0.64062500, 0.20312500, 0.01562500)
                        cellFrame.Button:SetScript("OnClick", function(self)
                            local npcID = USQ:NPCInfoScrollingTableGetCurrentnpcID()
                            USQ.Debug(1, "MoveDown: #self.data: " .. tostring(#self.data) .. " self.realrow: " .. tostring(self.realrow) .. " self.row: " .. tostring(self.row) .. " npcID: " .. tostring(npcID))
                            if self.realrow < #self.data then
                                USQ:SwitchAdvancedTeamEntries(npcID, self.realrow, self.realrow + 1)
                            end
                        end)
                    end

                    -- USQ.Debug(1, "Updating MoveDown: row: " .. tostring(row) .. " realrow: " .. tostring(realrow))
                    cellFrame.Button.realrow = realrow
                    cellFrame.Button.row = row
                    cellFrame.Button.data = data

                    if row >= #data then
                        cellFrame.Button:Disable()
                    else
                        cellFrame.Button:Enable()
                    end
                end
            end,
        },
        {
            -- ["name"] =  "|TInterface\\Buttons\\UI-Panel-MinimizeButton-Up:28|t",
            ["name"] =  "",
            ["width"] = 26,
            ["align"] = "CENTER",
            ["color"] = {["r"] = 1.0, ["g"] = 1.0, ["b"] = 0, ["a"] = 1.0, },
            ["colorargs"] = nil,
            ["bgcolor"] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.0, ["a"] = 1.0,},
            -- ref: C:\Games\World of Warcraft\_retail_\BlizzardInterfaceCode\Interface\FrameXML\UIPanelTemplates.xml #425
            ["DoCellUpdate"] = function(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, st, ...)
                if fShow then
                    if not cellFrame.Button then
                        cellFrame.Button = CreateFrame("Button", nil, cellFrame, "UIPanelSquareButton")
                        cellFrame.Button:SetPoint("CENTER", cellFrame, "CENTER")
                        cellFrame.Button:SetWidth(20)
                        cellFrame.Button:SetHeight(20)
                        cellFrame.Button.icon:SetTexture("Interface\\Buttons\\SquareButtonTextures")
                        cellFrame.Button.icon:SetTexCoord(0.01562500, 0.20312500, 0.01562500, 0.20312500)
                        cellFrame.Button:SetScript("OnClick", function(self)
                            local npcID = USQ:NPCInfoScrollingTableGetCurrentnpcID()
                            USQ.Debug(1, "Delete: #self.data: " .. tostring(#self.data) .. " self.realrow: " .. tostring(self.realrow) .. " self.row: " .. tostring(self.row) .. " npcID: " .. tostring(npcID))
                            USQ:RemoveAdvancedTeamEntry(npcID, self.RematchTeamKey)
                        end)
                    end

                    -- USQ.Debug(1, "Updating Delete: row: " .. tostring(row) .. " realrow: " .. tostring(realrow))
                    cellFrame.Button.realrow = realrow
                    cellFrame.Button.row = row
                    cellFrame.Button.data = data
                    cellFrame.Button.RematchTeamKey = data[realrow].cols[1].value
                end
            end,
        },
    }

    USQ.USQAdvancedTeamsFrame.TeamsScrollFrame = ScrollingTable:CreateST(TeamsScrollFrameCols, 10, 32, nil, USQ.USQAdvancedTeamsFrame)

    -- USQ.USQAdvancedTeamsFrame.TeamsScrollFrame.frame:SetPoint("TOPRIGHT", USQ.USQAdvancedTeamsFrame.DialogBG, "TOPRIGHT", -4, -36)
    -- USQ.USQAdvancedTeamsFrame.TeamsScrollFrame.frame:SetPoint("BOTTOMRIGHT", USQ.USQAdvancedTeamsFrame.DialogBG, "BOTTOMRIGHT", -4, 2)
    -- USQ.USQAdvancedTeamsFrame.TeamsScrollFrame.frame:SetWidth(500)
    USQ.USQAdvancedTeamsFrame.TeamsScrollFrame.frame:SetPoint("TOPLEFT", USQ.USQAdvancedTeamsFrame.NPCScrollFrame.frame, "TOPRIGHT", 10, 0)
    USQ.USQAdvancedTeamsFrame.TeamsScrollFrame.frame:SetPoint("BOTTOMLEFT", USQ.USQAdvancedTeamsFrame.NPCScrollFrame.frame, "BOTTOMRIGHT", 10, 0)
    USQ.USQAdvancedTeamsFrame.TeamsScrollFrame:EnableSelection(false)
    USQ.USQAdvancedTeamsFrame.TeamsScrollFrame:RegisterEvents({
        ["OnClick"] = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            -- Disable clicking functionality
            return true
        end,
    })

    USQ:UpdateTeamsScrollingTable()

    -- USQ.USQAdvancedTeamsFrame:Show()

    -- Final setup
    USQ:PopulateLookupTables()

    -- Cache CVars
    USQ:CacheCVars()

    if not USQ.db.global.MuteEnableDisableMessages then
        USQ:Print(L["Addon Enabled"])
    end
end

function USQ:OnDisable()
    USQ.Close()
    if not USQ.db.global.MuteEnableDisableMessages then
        USQ:Print(L["Addon Disabled"])
    end
end

USQ.CachedCVars = {}

function USQ:CacheCVars()
    USQ.Debug(1, "Caching CVars")
    USQ.CachedCVars["AutoInteract"] = GetCVar("AutoInteract")
    USQ.CachedCVars["SoftTargetInteract"] = GetCVar("SoftTargetInteract")

    USQ.Debug(1, "AutoInteract = " .. tostring(USQ.CachedCVars["AutoInteract"]))
    USQ.Debug(1, "SoftTargetInteract = " .. tostring(USQ.CachedCVars["SoftTargetInteract"]))
end

function USQ:ClearCVars()
    USQ.Debug(1, "Clearing CVars")
    SetCVar("AutoInteract", 0)
    SetCVar("SoftTargetInteract", 0)
end

function USQ:ResetCVars()
    USQ.Debug(1, "Resetting CVars")
    SetCVar("AutoInteract", USQ.CachedCVars["AutoInteract"])
    SetCVar("SoftTargetInteract", USQ.CachedCVars["SoftTargetInteract"])
end

function USQ:ADDON_LOADED(eventName, addOnName)
    if addOnName == "Rematch" then
        USQ.Debug(1, "Rematch now loaded - running Setup Rematch Links.")
        USQ:SetupRematchLinks()
        USQ:UnregisterEvent("ADDON_LOADED")
    end
end

function USQ:SetupRematchLinks()
    USQ.Debug(1, "Running SetupRematchLinks.")
    if Rematch.Start then
        USQ.Debug(1, "Rematch.Start found, so assuming Rematch 4.")
        USQ:SecureHook(Rematch, "LoadHealthiestOfLoadedPets", "RematchLoadHealthiestOfLoadedPetsHandler")
        USQ:SecureHook(Rematch, "Start", "RematchStartHandler")
    else
        USQ.Debug(1, "Rematch.Start not found, so assuming Rematch 5.")
        -- Use Rematch5 event REMATCH_TEAM_LOADED, replacing LoadHealthiestOfLoadedPets
        Rematch.events:Register(USQ, "REMATCH_TEAM_LOADED", function(self, teamID) USQ:RematchEventRematchTeamLoadedHandler(teamID) end)
        Rematch.events:Register(USQ, "REMATCH_UI_UPDATE", function(self) USQ:RematchStartHandler() end)
    end
end

function USQ:RematchLoadHealthiestOfLoadedPetsHandler()
    USQ.Debug(1, "Running handler for hook to Rematch:LoadHealthiestOfLoadedPets.")
    USQ:CancelWaitForTimer()
end

function USQ:RematchEventRematchTeamLoadedHandler()
    USQ.Debug(1, "Running handler Rematch event REMATCH_TEAM_LOADED.")
    USQ:CancelWaitForTimer()
end

function USQ:RematchStartHandler()
    USQ.Debug(1, "Running handler for hook to Rematch:Start.")
    if Rematch.Start then
        -- assume Rematch 4
    else
        -- assume Rematch 5
        Rematch.events:Unregister(USQ, "REMATCH_UI_UPDATE")
    end

    -- TODO: disabling this for release version - testing still in progress
    if EnableAdvancedTeams and not USQ.AdvancedTeamsMenuCompleted then
        USQ:CreateRematchAdvancedTeamsMenu()
        if Rematch.Start then
            -- assume Rematch 4
            local DeleteMenuPosition, DeleteMenuEntry = USQ:FindRematchMenuItem("TeamMenu", DELETE)
            USQ:SecureHook(DeleteMenuEntry, "func", "RematchDeleteHandler")
            USQ:Hook(Rematch, "SaveAsAccept", USQ.RematchSaveAsAcceptHandler)
            USQ:Hook(Rematch, "OverwriteAccept", USQ.RematchOverwriteAcceptHandler)
        else
            -- assume Rematch 5
            -- need new functions for team deletion/change
            -- link to new events
            -- REMATCH_TEAMS_WIPED
            -- REMATCH_TEAM_OVERWRITTEN
            -- REMATCH_TEAM_DELETED
            Rematch.events:Register(USQ, "REMATCH_TEAM_OVERWRITTEN", function(self, teamID, oldTeamID) USQ:RematchEventRematchTeamOverwrittenHandler(teamID, oldTeamID) end)
            Rematch.events:Register(USQ, "REMATCH_TEAM_DELETED", function(self, teamID) USQ:RematchEventRematchTeamDeletedHandler(teamID) end)
            Rematch.events:Register(USQ, "REMATCH_TEAMS_WIPED", function(self) USQ:RematchEventRematchTeamsWipedHandler() end)
        end
    end
end

function USQ:RematchEventRematchTeamOverwrittenHandler(key, oldKey)
    USQ.Debug(1, "Running handler Rematch event REMATCH_TEAM_OVERWRITTEN, key: " .. tostring(key) .. " oldKey: " .. tostring(oldKey))
    USQ:RemoveAdvancedTeamEntry(nil, key)
end

function USQ:RematchEventRematchTeamDeletedHandler(key)
    USQ.Debug(1, "Running handler Rematch event REMATCH_TEAM_DELETED, key: " .. tostring(key))
    USQ:RemoveAdvancedTeamEntry(nil, key)
end

function USQ:RematchEventRematchTeamsWipedHandler()
    USQ.Debug(1, "Running handler Rematch event REMATCH_TEAMS_WIPED")
    USQ:RemoveAdvancedTeamEntry(nil, key)
end

function USQ:RematchDeleteHandler(_, key)
    USQ.Debug(1, "Running handler for hook to Rematch TeamMenu Delete function, for key: " .. tostring(key))
    hooksecurefunc(RematchDialog, "acceptFunc", function()
        USQ.Debug(1, "Rematch Delete Confirmed, for key: " .. tostring(key))
        USQ:RemoveAdvancedTeamEntry(nil, key)
    end)
end

function USQ:RematchSaveAsAcceptHandler()
    USQ.Debug(1, "Running handler for Rematch SaveAsAccept function")
    local originalKey = Rematch:GetSidelineContext('originalKey')
    local team, key = Rematch:GetSideline()
    USQ.Debug(1, "SaveAsAccept: originalKey: " .. tostring(originalKey) .. " team: " .. tostring(team) .. " key: " .. tostring(key))
    if not RematchSaved[key] or not Rematch:SidelinePetsDifferentThan(key) then
        USQ.Debug(1, "SaveAsAccept: Regular save")
        if originalKey == key then
            USQ.Debug(1, "SaveAsAccept: originalKey == key - no action required")
        elseif RematchSaved[originalKey] then
            USQ.Debug(1, "SaveAsAccept: originalKey was previously saved - replace all cases of originalKey with key")
            USQ:RenameAdvancedTeamEntries(originalKey, key)
        else
            USQ.Debug(1, "SaveAsAccept: originalKey did not exist, no action required")
        end
    else
        USQ.Debug(1, "SaveAsAccept: Overwrite save")
        -- don't do anything here - the hook for OverwriteAccept will take action if required
    end
end

function USQ:RematchOverwriteAcceptHandler()
    USQ.Debug(1, "Running handler for Rematch OverwriteAccept function")
    local originalKey = Rematch:GetSidelineContext('originalKey')
    local team, key = Rematch:GetSideline()
    USQ.Debug(1, "OverwriteAccept: originalKey: " .. tostring(originalKey) .. " team: " .. tostring(team) .. " key: " .. tostring(key))
    if originalKey == key then
        USQ.Debug(1, "OverwriteAccept: originalKey == key - no action required")
    elseif RematchSaved[originalKey] then
        USQ.Debug(1, "OverwriteAccept: originalKey was previously saved - replace all cases of originalKey with key")
        USQ:RenameAdvancedTeamEntries(originalKey, key)
    else
        USQ.Debug(1, "OverwriteAccept: originalKey did not exist, no action required")
    end
end

-- /dump UltraSquirt:FindRematchMenuItem("TeamMenu", DELETE)
function USQ:FindRematchMenuItem(Menu, MenuItem)
    USQ.Debug(1, "Searching for Rematch Menu: " .. tostring(Menu) .. " for MenuItem: " .. tostring(MenuItem))
    if Rematch then
        local RematchMenu = Rematch:GetMenu(Menu)
        for i, entry in ipairs(RematchMenu) do
            if entry.text == MenuItem then
                USQ.Debug(1, "Rematch Menu Item found at position " .. i)
                return i, entry
            end
        end
    end
end

function USQ:CreateRematchAdvancedTeamsMenu()
    USQ.Debug(1, "Creating Rematch Advanced Teams menu item v2.")
    USQ.AdvancedTeamsMenuCompleted = true

    -- Teams Menu
-- Teams Menu Item: UltraSquirt Menu
--            UltraSquirt Menu Item: Expansion1 Menu
--                                            Item 1: Pet 1
--                                            Item 2: Pet 2
--                                            Item 3: Pet 3
--            UltraSquirt Menu Item: Expansion2 Menu
--            UltraSquirt Menu Item: Expansion3 Menu

    local UltraSquirtExpansionsMenu = {} -- expansion menus go here
    local UltraSquirtPetsMenu = {} -- pets go here

    for npcID, npcDetails in pairs(USQ.npcInfo) do
        -- Create subtable for Expansion, if finding it for the first time
        if not UltraSquirtPetsMenu[npcDetails.expansionName] then
            UltraSquirtPetsMenu[npcDetails.expansionName] = {}
        end

        -- If the pet can battle, add it to the submenu for its expansion
        if npcDetails.canBattle then
            table.insert(UltraSquirtPetsMenu[npcDetails.expansionName], {
                stay=true,
                check=true,
                value=function(self, key) return USQ:TeamInAdvancedTeams(self.npcID, key) end,
                npcID=npcID,
                text=function(self, key) return USQ:GetNPCName(self.npcID) or ("npcID: " .. tostring(npcID)) end,
                highlight=function(self, key) return self.npcID == USQ.BattleNPCID end,
                func=function(self, key, checked) if checked then USQ:RemoveAdvancedTeamEntry(self.npcID, key) else USQ:AddAdvancedTeamEntry(self.npcID, key) end end
            })
        end
    end

    -- For each Expansion:
    --   sort it's submenu alphabetically, and add the OKAY button
    --   register the Expansion's submenu with Rematch
    --   add the Expansion as a menuitem in the main submenu (UltraSquirtExpansionsMenu)

    for expansionName, menu in pairs(UltraSquirtPetsMenu) do
        table.sort(menu, function(a,b) return a:text() < b:text() end)

        table.insert(menu, {stay=true, spacer=true})
        table.insert(menu, {text=OKAY})

        if Rematch.Start then
            -- assuming Rematch 4
            Rematch:RegisterMenu("UltraSquirt" .. expansionName, menu)
        else
            -- assuming Rematch 5
            Rematch.menus:Register("UltraSquirt" .. expansionName, menu)
        end
        
        table.insert(UltraSquirtExpansionsMenu, {
            text=expansionName,
            expansionName=expansionName,
            subMenu="UltraSquirt" .. expansionName,
            highlight=function(self, key) return self.expansionName == USQ.npcInfo[USQ.BattleNPCID].expansionName end,
        })
    end

    -- Finally, register the UltraSquirtExpansionsMenu submenu with Rematch
    -- create a MenuItem for the Rematch Teams menu, and insert to the Teams menu

    local TeamMenuItem = {text="UltraSquirt Advanced Teams", subMenu="UltraSquirtExpansionsMenu", }
    
    if Rematch.Start then
        -- assuming Rematch 4
        Rematch:RegisterMenu("UltraSquirtExpansionsMenu", UltraSquirtExpansionsMenu)
        local TeamMenu = Rematch:GetMenu("TeamMenu")
        table.insert(TeamMenu, 7, TeamMenuItem)
    else
        -- assuming Rematch 5
        Rematch.menus:Register("UltraSquirtExpansionsMenu", UltraSquirtExpansionsMenu)
        Rematch.menus:AddToMenu("TeamMenu", TeamMenuItem, Rematch.localization["Delete Team"])
    end
end

function USQ:AddAdvancedTeamEntry(npcID, RematchTeamKey, BattleHealingThreshold)
    USQ.Debug(1, "Running AddAdvancedTeamEntry: npcID: " .. tostring(npcID) .. " RematchTeamKey: " .. tostring(RematchTeamKey))
    if npcID and RematchTeamKey then
        if USQ:TeamInAdvancedTeams(npcID, RematchTeamKey) then
            USQ.Debug(1, "Team already listed.  No action.")
            return
        else
            USQ.Debug(1, "Adding team to AdvancedTeamsList.")
            table.insert(USQ.db.global.AdvancedTeamsList[npcID], {RematchTeamKey = RematchTeamKey, BattleHealingThreshold = BattleHealingThreshold or 100})
            USQ.AdvancedTeam = 1
            USQ:UpdateTeamsScrollingTable()
        end
    end
end

-- /script UltraSquirt:PrintAdvancedTeams()
function USQ:PrintAdvancedTeams()
    for SavednpcID, SavedTeamsList in pairs(USQ.db.global.AdvancedTeamsList) do
        USQ:Print("SavednpcID: " .. tostring(SavednpcID))
        for i, SavedTeam in pairs(SavedTeamsList) do
            USQ:Print("i: " .. tostring(i) .. " SavedTeam.RematchTeamKey: " .. tostring(SavedTeam.RematchTeamKey) .. " SavedTeam.BattleHealingThreshold: " .. tostring(SavedTeam.BattleHealingThreshold))
        end
    end
end

-- /script UltraSquirt:RemoveAdvancedTeamEntry(nil, "1111Delete")
-- /script UltraSquirt:RemoveAdvancedTeamEntry(79179, "1111Delete")
function USQ:RemoveAdvancedTeamEntry(npcID, RematchTeamKey)
    -- Rebuild the table without the denoted entries
    -- if npcID is nil then remove team from all npcs
    USQ.Debug(1, "Running RemoveAdvancedTeamEntry: npcID: " .. tostring(npcID) .. " RematchTeamKey: " .. tostring(RematchTeamKey))
    if RematchTeamKey then
        for SavednpcID, SavedTeamsList in pairs(USQ.db.global.AdvancedTeamsList) do
            if npcID == nil or npcID == SavednpcID then
                local NewAdvancedTeamsList = {}
                for i, SavedTeam in pairs(USQ.db.global.AdvancedTeamsList[SavednpcID]) do
                    local SavedKey = SavedTeam.RematchTeamKey
                    USQ.Debug(1, "i: " .. tostring(i) .. " SavedKey: " .. tostring(SavedKey))
                    if not(type(RematchTeamKey) == type(SavedKey) and RematchTeamKey == SavedKey) then
                        USQ.Debug(1, "Keeping team: SavedKey: " .. tostring(SavedKey))
                        table.insert(NewAdvancedTeamsList, SavedTeam)
                    else
                        USQ.Debug(1, "Team dropped: SavedKey: " .. tostring(SavedKey))
                    end
                end
                USQ.db.global.AdvancedTeamsList[SavednpcID] = NewAdvancedTeamsList
            end
        end
        USQ.AdvancedTeam = 1
        USQ:UpdateTeamsScrollingTable()
    end
end

function USQ:RemoveAllAdvancedTeamEntries()
    USQ.Debug(1, "Running RemoveAllAdvancedTeamEntries")
    USQ.db.global.AdvancedTeamsList = {}
    USQ.AdvancedTeam = 1
    USQ:UpdateTeamsScrollingTable()
end

-- /dump UltraSquirt:RenameAdvancedTeamEntries("1Test", "2Test")
-- /dump UltraSquirt:RenameAdvancedTeamEntries("2Test", "1Test")

function USQ:RenameAdvancedTeamEntries(originalKey, key)
    USQ.Debug(1, "Running RenameAdvancedTeamEntries: originalKey: " .. tostring(originalKey) .. " key: " .. tostring(key))
    if originalKey and key then
        for SavednpcID, _ in pairs(USQ.db.global.AdvancedTeamsList) do
            local NewAdvancedTeamsList = {}
            local TeamsSeen = {}
            USQ.Debug(1, "Rebuilding for SavednpcID: " .. tostring(SavednpcID))
            for i, SavedTeam in pairs(USQ.db.global.AdvancedTeamsList[SavednpcID]) do
                local SavedKey = SavedTeam.RematchTeamKey
                -- change SavedKey's value to the new key, if it matches originalKey
                if type(originalKey) == type(SavedKey) and originalKey == SavedKey then
                    USQ.Debug(1, "SavedKey: " .. tostring(SavedKey) .. " found to match originalKey.  Set SavedKey to key: " .. tostring(key))
                    SavedKey = key
                end
                -- if we've not seen SavedKey yet, then add entry to NewAdvancedTeamsList
                if not TeamsSeen[SavedKey] then
                    USQ.Debug(1, "SavedKey: " .. tostring(SavedKey) .. " not seen yet, adding to new table.")
                    table.insert(NewAdvancedTeamsList, {RematchTeamKey = SavedKey, BattleHealingThreshold = SavedTeam.BattleHealingThreshold})
                    TeamsSeen[SavedKey] = true
                else
                    USQ.Debug(1, "SavedKey: " .. tostring(SavedKey) .. " already seen - skipping.")
                end
            end
            USQ.db.global.AdvancedTeamsList[SavednpcID] = NewAdvancedTeamsList
        end
    end
    USQ:UpdateTeamsScrollingTable()
end

-- /dump UltraSquirt.db.global.AdvancedTeamsList[104970]
-- /script UltraSquirt:SwitchAdvancedTeamEntries(104970, 1, 2)

function USQ:SwitchAdvancedTeamEntries(npcID, key1, key2)
    USQ.Debug(1, "Running SwitchAdvancedTeamEntries: npcID: " .. tostring(npcID) .. " key1: " .. tostring(key1) .. " key2: " .. tostring(key2))
    if USQ.db.global.AdvancedTeamsList[npcID] and USQ.db.global.AdvancedTeamsList[npcID][key1] and USQ.db.global.AdvancedTeamsList[npcID][key2] then
        USQ.Debug(1, "Switching keys")
        USQ.db.global.AdvancedTeamsList[npcID][key2], USQ.db.global.AdvancedTeamsList[npcID][key1] = USQ.db.global.AdvancedTeamsList[npcID][key1], USQ.db.global.AdvancedTeamsList[npcID][key2]
        USQ.AdvancedTeam = 1
    end
    USQ:UpdateTeamsScrollingTable()
end

-- /dump UltraSquirt.db.global.AdvancedTeamsList[UltraSquirt.BattleNPCID]
-- /dump UltraSquirt.db.global.AdvancedTeamsList[79179]
-- /dump UltraSquirt:TeamInAdvancedTeams(79179, 79179)
-- /dump UltraSquirt:TeamInAdvancedTeams(79179, "1Capture")
-- /dump UltraSquirt:TeamInAdvancedTeams(79179, "Dealing with Satyrs")
function USQ:TeamInAdvancedTeams(npcID, key)
    USQ.Debug(2, "Seaching AdvancedTeamsList for npcID: " .. tostring(npcID) .. " key: " .. tostring(key))
    for i, SavedTeam in pairs(USQ.db.global.AdvancedTeamsList[npcID]) do
        local SavedKey = SavedTeam.RematchTeamKey
        if type(key) == type(SavedKey) and key == SavedKey then
            USQ.Debug(2, "Team Found")
            return true
        end
    end
    USQ.Debug(2, "Team Not Found")
    return false
end

-- /script UltraSquirt:FindRematchAdvancedTeams()
-- /script UltraSquirt:FindRematchAdvancedTeams(99210)
-- /dump UltraSquirt.db.global.AdvancedTeamsList[UltraSquirt.BattleNPCID]
-- /script Rematch:LoadTeam(UltraSquirt.db.global.AdvancedTeamsList[UltraSquirt.BattleNPCID][2].RematchTeamKey)
--
-- USQ.db.global.AdvancedTeamsList[BattleNPCID]
function USQ:FindRematchAdvancedTeams(BattleNPCID)
    USQ.Debug(1, "Running FindRematchAdvancedTeams")

    if not BattleNPCID then
        BattleNPCID = USQ.BattleNPCID
    end

    local npcName = USQ:GetNPCName(BattleNPCID)
    local questName = USQ:GetQuestName(USQ.npcInfo[BattleNPCID].questID)

    -- USQ.db.global.AdvancedTeamsList[BattleNPCID] = {}

    USQ.Debug(1, "BattleNPCID: " .. tostring(BattleNPCID) .. " npcName: " .. tostring(npcName) .. " questName: " .. tostring(questName))
    if Rematch and RematchSaved and Rematch.Start then
        for key, data in pairs(RematchSaved) do
            if key == BattleNPCID
                or npcName ~= nil and (
                    strmatch(Rematch:GetTeamTitle(key), "^" .. npcName .. "$")
                    or strmatch(Rematch:GetTeamTitle(key), "^" .. npcName .. "%s%(%d+%)$")
                )
                or questName ~= nil and (
                    strmatch(Rematch:GetTeamTitle(key), "^" .. questName .. "$")
                    or strmatch(Rematch:GetTeamTitle(key), "^" .. questName .. "%s%(%d+%)$")
                )
                then
                    USQ.Debug(1, "Team Found", key, Rematch:GetTeamTitle(key))
                    -- table.insert(USQ.db.global.AdvancedTeamsList[BattleNPCID], key)
                    USQ:AddAdvancedTeamEntry(BattleNPCID, key)
            end
        end
        USQ.AlphaNumSort(USQ.db.global.AdvancedTeamsList[BattleNPCID])
    else
        USQ.Debug(1, "Rematch not loaded")
    end
    USQ:UpdateTeamsScrollingTable()
end

-- /script UltraSquirt:TestAdvancedTeams()
-- /script UltraSquirt:TestAdvancedTeams(nil, 15)
-- /script UltraSquirt:TestAdvancedTeams(99182, 15)
function USQ:TestAdvancedTeams(npcID, count)
    USQ.Debug(1, "Running TestAdvancedTeams")

    npcID = npcID or USQ.BattleNPCID
    count = count or 50

    local npcName = USQ:GetNPCName(npcID)
    local questName = USQ:GetQuestName(USQ.npcInfo[npcID].questID)

    USQ.db.global.AdvancedTeamsList[npcID] = {}

    if Rematch and RematchSaved then
        local n = 0
        for RematchTeamKey, data in pairs(RematchSaved) do
            table.insert(USQ.db.global.AdvancedTeamsList[npcID], {RematchTeamKey = RematchTeamKey, BattleHealingThreshold = 100})
            n = n + 1
            if n > count then
                break
            end
        end
        USQ.AlphaNumSort(USQ.db.global.AdvancedTeamsList[npcID])
        USQ.AdvancedTeam = 1
    else
        USQ.Debug(1, "Rematch not loaded")
    end
    USQ:UpdateTeamsScrollingTable()
end

-- ref: https://wow.gamepedia.com/UIOBJECT_GameTooltip
-- /dump UltraSquirt:GetNPCName(189376)
function USQ:GetNPCName(npcID)
    USQ.Debug(2, "Running GetNPCName")
    USQ.Debug(2, "npcID: " .. tostring(npcID))

    if npcID == nil then
        return
    end

    if USQ.npcInfo[npcID] and USQ.npcInfo[npcID].npcName then
        USQ.Debug(2, "NPC found in USQ.npcInfo - returning result from table.  npcName: " .. tostring(USQ.npcInfo[npcID].npcName))
        return USQ.npcInfo[npcID].npcName
    end

    local npcName = USQ:ScanFromTooltip("unit:Creature-0-0-0-0-%s-0000000000", npcID)
    if npcName == nil then
        USQ.Debug(2, "npcName: not found")
    end

    USQ.Debug(2, "NPC name found from tooltip - saving in USQ.npcInfo.  npcName: " .. tostring(npcName))
    USQ.npcInfo[npcID].npcName = npcName
    -- USQ:UpdateNPCInfoScrollingTable()
    USQ:ScheduleUpdateNPCInfoScrollingTable(1)

    return npcName
end

function USQ:GetQuestName(questID)
    USQ.Debug(2, "Running GetQuestName")
    USQ.Debug(2, "questID: " .. tostring(questID))

    if questID == nil then
        return
    end

    if USQ.questName[questID] then
        USQ.Debug(2, "Quest found in USQ.questName - returning result from table.  questName: " .. tostring(USQ.questName[questID]))
        return USQ.questName[questID]
    end

    local questName = C_TaskQuest.GetQuestInfoByQuestID(questID) or C_QuestLog.GetTitleForQuestID(questID)
    if questName == nil then
        USQ.Debug(2, "questName: not found")
    end

    USQ.Debug(2, "Quest name found from tooltip - saving in USQ.questName.  questName: " .. tostring(questName))
    USQ.questName[questID] = questName
    -- USQ:UpdateNPCInfoScrollingTable()
    USQ:ScheduleUpdateNPCInfoScrollingTable(1)

    return questName
end


-- TODO: retire this function in place of new C_TooltipInfo.  See also TooltipUtil.SurfaceArgs
-- /dump UltraSquirt:ScanFromTooltip("quest:%s", 41944)
-- /dump UltraSquirt:ScanFromTooltip("unit:Creature-0-0-0-0-%s-0000000000", 154913)
-- /dump C_TooltipInfo.GetHyperlink(format("unit:Creature-0-0-0-0-%s-0000000000", 154913))
function USQ:ScanFromTooltip(linkTemplate, id)
    if not USQ.ScanningTooltip then
        USQ.ScanningTooltip = CreateFrame("GameTooltip", "UltraSquirtScanningTooltip", USQ.USQFrame, "GameTooltipTemplate")
		-- Mixin(USQ.ScanningTooltip, GameTooltipDataMixin)
    end
    USQ.ScanningTooltip:SetOwner(USQ.USQFrame, "ANCHOR_NONE")
    USQ.ScanningTooltip:SetHyperlink(format(linkTemplate, id))
    USQ.Debug(2, "linkTemplate: " .. tostring(linkTemplate))
    USQ.Debug(2, "id: " .. tostring(id))
    USQ.Debug(2, "String: " .. format(linkTemplate, id))
    USQ.Debug(2, "NumLines: " .. tostring(UltraSquirtScanningTooltip:NumLines()))

    local text
    if USQ.ScanningTooltip:NumLines() >= 1 then
        text = UltraSquirtScanningTooltipTextLeft1:GetText()
        USQ.Debug(2, "Tooltip Text: " .. text)
    else
        USQ.Debug(2, "Tooltip: id not found")
    end
    return text
end

-- /dump UltraSquirt:PopulateLookupTables()
-- run this on initialise
function USQ:PopulateLookupTables()
    USQ.Debug(1, "Running PopulateLookupTables")
    local FoundAll = true
    for npcID, npcDetails in pairs(USQ.npcInfo) do
        -- local questID = npcDetails.questID
        FoundAll = FoundAll and (USQ:GetNPCName(npcID) ~= nil)
        if npcDetails.questID then
            FoundAll = FoundAll and (USQ:GetQuestName(npcDetails.questID) ~= nil)
        end
    end
    USQ.Debug(1, "FoundAll: " .. tostring(FoundAll))

    if not FoundAll then
        if USQ.npcInfoTimerCount < 5 then
            USQ.npcInfoTimerCount = USQ.npcInfoTimerCount + 1
            USQ.PopulateLookupTablesTimer = USQ:ScheduleTimer("PopulateLookupTables", 5)
            USQ.Debug(1, "Started timer to rerun PopulateLookupTables.  USQ.npcInfoTimerCount: " .. tostring(USQ.npcInfoTimerCount))
        else
            USQ.Debug(1, "Max runs reached for PopulateLookupTables.  USQ.npcInfoTimerCount: " .. tostring(USQ.npcInfoTimerCount))
        end
    end

    USQ.npcInfoFoundAll = FoundAll
    USQ:UpdateBattleNPC(USQ.BattleNPCID)
    return FoundAll
end

-- ref: http://notebook.kulchenko.com/algorithms/alphanumeric-natural-sorting-for-humans-in-lua
-- post by Paul Kulchenko
function USQ.AlphaNumSort(o)
    local function padnum(d) return ("%012d"):format(d) end
    table.sort(o, function(a, b) return tostring(a.RematchTeamKey):gsub("%d+", padnum) < tostring(b.RematchTeamKey):gsub("%d+", padnum) end)
    return o
end

function USQ.SetBattleNPCButton_OnClick(button, buttonClicked, down)
    USQ.Debug(1, "button: " .. tostring(button:GetName()) .. " buttonClicked: " .. tostring(buttonClicked) .. " down: " .. tostring(down))
    local useKeyDownCvar = GetCVarBool("ActionButtonUseKeyDown")
    if InCombatLockdown() then
        USQ.Debug(1, "In combat - take no action")
    else
		if down == useKeyDownCvar then
			if C_PetBattles.IsInBattle() then
				USQ.Debug(1, "In pet battle - take no action")
				USQ:Print(L["Cannot Modify In Battle"])
			else
				local npcID = USQ:TargetNPCID()
				if npcID and USQ.npcInfo[npcID] and USQ.npcInfo[npcID].canBattle then
					USQ:UpdateBattleNPC(npcID)
					USQ.Update()
				else
					USQ:Print(L["Invalid Target"])
				end
			end
		end
    end
end

function USQ:UpdateBattleNPC(npcID)
    USQ.Debug(1, "Running UpdateBattleNPC")
    USQ.Debug(1, "Updating Battle NPC to: npcID: " .. tostring(npcID) .. " npcName: " .. (USQ:GetNPCName(npcID) or "nil"))
    USQ.BattleNPCID = npcID
    USQ.TargetConfirmed = false
    USQ.USQFrame.BattleNPCFontString:SetText(_G["TARGET"] .. ": " .. (USQ:GetNPCName(npcID) or "nil"))
    USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers:SetValue(USQ.db.global.BattleHealingThreshold[USQ.BattleNPCID])
    USQ.AdvancedTeam = 1
end

function USQ.BattleHealingThresholdSlider_SetDisplayValue(value)
    USQ.Debug(1, "Updating Battle Healing Theshold Slider Display Value: " .. tostring(value))
    USQ.USQFrame.BattleHealingThresholdSlider.displayValue:SetText(tostring(value) .. "%")
end

function USQ.BattleHealingThresholdSlider_OnValueChanged(self, value, userInput)
    USQ.Debug(1, "Running Slider_OnValueChanged")
    USQ.Debug(1, "Slider_OnValueChanged: value: " .. tostring(value) .. " userInput: " .. tostring(userInput))
    -- USQ.BattleHealingThresholdSlider_SetDisplayValue(value)
    USQ.db.global.BattleHealingThreshold[USQ.BattleNPCID] = value
end

function USQ:RefreshConfig()
    USQ.Debug(1, "Profile refresh detected.  Running UpdateKeybind().")
    USQ.UpdateKeybind()
    USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers:SetValue(USQ.db.global.BattleHealingThreshold[USQ.BattleNPCID])
end

function USQ.UpdateKeybind()
    if USQ.db.global.KEYBIND == nil or USQ.db.global.KEYBIND == "" then
        USQ.USQFrame.HotkeyFontString:SetText("<" .. L["Keybind Missing"] .. ">")
    else
        USQ.USQFrame.HotkeyFontString:SetText("<" .. USQ.db.global.KEYBIND .. ">")
    end
end

function USQ.UpdateSliderStatus()
    if #USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID] >= 1 and Rematch and RematchSettings then
        -- USQ.USQFrame.BattleHealingThresholdSlider:Disable()
        USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers:SetEnabled_(false)
    else
        USQ.USQFrame.BattleHealingThresholdSlider.SliderWithSteppers:SetEnabled_(true)
    end
end

function USQ.ButtonFactory(parentFrame, buttonType, buttonName, type1, actionID, isTogglable, autoCastAllowed, autoCastOption)
    local button = CreateFrame(buttonType, parentFrame:GetName() .. buttonName, parentFrame, "InsecureActionButtonTemplate")
	button:RegisterForClicks("AnyUp", "AnyDown") --, "LeftButtonUp", "RightButtonUp"

    button.actionID = actionID
    button.type1 = type1

    button:SetWidth(32)
    button:SetHeight(32)
    button:SetAttribute("type1", type1)
    if type1 == "item" then
        button.actionString = "item:" .. tostring(actionID)
        button:SetAttribute("item", button.actionString)
        button.icon:SetTexture(GetItemIcon(actionID))
    elseif type1 == "toy" then
        button.actionString = tostring(actionID)
        button:SetAttribute("toy", button.actionString)
        button.icon:SetTexture(GetItemIcon(actionID))
    elseif type1 == "spell" then
        button.actionString = tostring(actionID)
        button:SetAttribute("spell", button.actionString)
        button.icon:SetTexture(GetSpellTexture(actionID))
    end

    button.cooldown = CreateFrame("Cooldown", parentFrame:GetName() .. buttonName .. "Cooldown", button, "CooldownFrameTemplate")
    button.cooldown:SetAllPoints()
    button.cooldown:SetSwipeColor(1, 1, 1, .8)
    button.cooldown:Hide()

    button.AutoCastableTexture = button:CreateTexture(parentFrame:GetName() .. buttonName .. "AutoCastableTexture", "OVERLAY")
    button.AutoCastableTexture:SetTexture("Interface\\Buttons\\UI-AutoCastableOverlay")
    button.AutoCastableTexture:SetPoint("CENTER", button, "CENTER", 0, 0)
    button.AutoCastableTexture:SetWidth(62)
    button.AutoCastableTexture:SetHeight(62)

    if autoCastAllowed == true then
        button.AutoCastableTexture:Show()
        button.autoCastAllowed = true
    else
        button.AutoCastableTexture:Hide()
        button.autoCastAllowed = false
    end

    if isTogglable == true then
        button.isTogglable = true
    else
        button.isTogglable = false
    end

    button.Shine = CreateFrame("Frame", parentFrame:GetName() .. buttonName .. "Shine", button, "AutoCastShineTemplate")
    button.Shine:SetPoint("CENTER", button, "CENTER", 0, 0)
    button.Shine:SetWidth(32)
    button.Shine:SetHeight(32)

    button.autoCastOption = autoCastOption

    button:SetScript("OnShow", function(self)
        button:RegisterEvent("BAG_UPDATE")
        button:RegisterEvent("NEW_TOY_ADDED")
        button:RegisterEvent("PLAYER_ENTERING_WORLD")
        button:RegisterEvent("SPELL_UPDATE_COOLDOWN")
        button:RegisterEvent("TOYS_UPDATED")
        button:RegisterEvent("UNIT_AURA")
        button:RegisterEvent("UNIT_INVENTORY_CHANGED")
        button:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

        USQ.ItemButton_UpdateCooldown(button)
        USQ.ItemButton_UpdateCount(button)
        USQ.ItemButton_UpdateState(button)
    end)
    button:SetScript("OnHide", function(self) button:UnregisterAllEvents() end)
    button:SetScript("OnEvent", USQ.ItemButton_OnEvent)
    button:HookScript("OnClick", USQ.ItemButton_OnClick)

    return button
end

function USQ.SetMacro(macroText)
    if not InCombatLockdown() then
        USQ.Debug(2, "Setting macro to " .. tostring(macroText))
        USQ.USQFrame.MacroButton:SetAttribute("macrotext1", macroText)
    end
end

function USQ:SlashHandler(input)
    USQ.Debug(1, "Running: SlashHandler")
    local arg1, arg2 = USQ:GetArgs(input, 2, 1)
    USQ.Debug(1, "arg1: " .. tostring(arg1) .. " arg2: " .. tostring(arg2))

    if arg1 then
        if string.lower(arg1) == string.lower("config") then
            AceConfigDialog:Open("UltraSquirt")
        -- TODO: disabling this for release version - testing still in progress
        elseif EnableAdvancedTeams and (string.lower(arg1) == "adv" or string.lower(arg1) == "advanced") then
            if USQ.USQAdvancedTeamsFrame:IsShown() then
                USQ.USQAdvancedTeamsFrame:Hide()
            else
                USQ.USQAdvancedTeamsFrame:Show()
            end
        elseif string.lower(arg1) == "reset" then
            USQ:ResetOptions()
        elseif string.lower(arg1) == "help" then
            USQ:PrintHelp()
        else
            USQ:Print(L["Invalid Command"])
            USQ:PrintHelp()
        end
        -- HELP_LABEL
        -- RESET
        -- SETTINGS (or "config")
    elseif USQ.USQFrame:IsShown() then
        USQ.Close()
    else
        USQ.Open()
    end
end

function USQ:PrintHelp()
    USQ:Print(L["Help Header"])
    USQ:Print("/ultra - " .. L["Help Default"])
    USQ:Print("/ultra config - " .. L["Help Config"])
    -- TODO: disabling this for release version - testing still in progress
    if EnableAdvancedTeams then
        USQ:Print("/ultra adv[anced] - " .. L["Help Advanced"])
    end
    USQ:Print("/ultra reset - " .. L["Help Reset"])
    USQ:Print("/ultra help - " .. L["Help Help"])
end

function USQ:ResetOptions()
    USQ.Debug(1, "Running ResetOptions:")
    if not InCombatLockdown() then
        USQ.Debug(1, "Not in combat lockdown")
        -- run reset
        USQ:Print(L["Resetting Options"])
        USQ.Close()
        USQ.db:ResetDB("Default")
        -- USQ.USQFrame:ClearAllPoints()
        -- USQ.USQFrame:SetPoint("TOP", "UIParent", "TOP", 0, -225)
        -- USQ.USQFrame:SetWidth(280)
        -- USQ.USQFrame:SetHeight(195)
        -- USQ.USQFrame:SetFrameStrata("DIALOG")
        USQ.USQFrame:Reset()
        USQ.Open()
        -- Refresh any open options windows
        AceConfigRegistry:NotifyChange("UltraSquirt")
        -- clear flag and timer
        USQ.ResetOptionsAwaitingOOC = false
        USQ:CancelTimer(USQ.ResetOptionsOOCTimer)
        USQ:UpdateTeamsScrollingTable()
    else
        if not(USQ.ResetOptionsAwaitingOOC) then
            USQ:Print(L["Resetting Options OOC"])
        end
        USQ.ResetOptionsAwaitingOOC = true
        USQ.ResetOptionsOOCTimer = USQ:ScheduleTimer("ResetOptions", 1)
    end
end

function USQ.Close()
    USQ.Debug(1, "Close: Combat Lockdown:" .. tostring(InCombatLockdown()))
    -- SetCVar("AutoInteract", 0)
    USQ:ResetCVars()
    if not InCombatLockdown() then
        ClearOverrideBindings(USQ.USQFrame)
    end
    USQ:CancelAllTimers()
    USQ:ClearWaitFlag()
    -- USQ:UnregisterAllEvents()
    USQ:UnregisterEvent("PET_BATTLE_OPENING_START")
    USQ:UnregisterEvent("PET_BATTLE_CLOSE")
    USQ:UnregisterEvent("GOSSIP_SHOW")
    USQ:UnregisterEvent("PLAYER_REGEN_DISABLED")
    USQ.USQFrame:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    USQ.USQFrame:EnableKeyboard(false)
    USQ.USQFrame:Hide()
    USQ.Debug(1, "Frame hidden")
end

function USQ.Open()
    USQ.USQFrame:Show()
    USQ.Debug(1, "Frame shown")
    USQ:CacheCVars()
    USQ:ClearCVars()
    USQ:RegisterEvent("PET_BATTLE_OPENING_START")
    USQ:RegisterEvent("PET_BATTLE_CLOSE")
    USQ:RegisterEvent("GOSSIP_SHOW")
    USQ:RegisterEvent("PLAYER_REGEN_DISABLED")
    USQ.USQFrame:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player", "npc")
    USQ.USQFrame:SetScript("OnEvent", USQ.UNIT_SPELLCAST_SUCCEEDED)
    USQ.USQFrame:EnableKeyboard(true)
    USQ.UpdateKeybind()
    USQ.AdvancedTeam = 1
    USQ.Update()
    USQ.UpdateTimer = USQ:ScheduleRepeatingTimer("Update", 1)
end

function USQ.EventHandler(eventName)
    USQ.Debug(3, "Event: " .. (eventName or ""))
    if eventName == "PLAYER_REGEN_DISABLED" then
        USQ.Close()
    elseif (eventName == "PET_BATTLE_OPENING_START") then
        USQ.BattledSinceHeal = true
        USQ.Update()
    elseif (eventName == "PET_BATTLE_OVER" or "PET_BATTLE_CLOSE" or eventName == "PET_JOURNAL_LIST_UPDATE") then
        USQ.Update()
    else
        USQ.Debug(3, "Unknown Event: " .. (eventName or ""))
    end
end

function USQ.Update()
    -- runs when registered events are triggered, after certain event, on button clicks, and on a timer
    USQ.Debug(2, "Running Update")
    local hotkey = USQ.db.global.KEYBIND
    local BattleNPCName = USQ:GetNPCName(USQ.BattleNPCID)
    local StableMasterSerrahNPCName = USQ:GetNPCName(79858)
    local StableMasterLioNPCName = USQ:GetNPCName(85418)

    USQ.UpdateKeybind()
    USQ.UpdateSliderStatus()

    if InCombatLockdown() then
        USQ.Debug(2, "In combat - take no action")
		return
	end

	if USQ.USQFrame:IsShown() ~= true then
		USQ.Debug(2, "Frame is hidden, clear keybind and take no other action")
		ClearOverrideBindings(USQ.USQFrame)
		return
	end

    if hotkey == nil then
        USQ.Debug(2, "Hotkey not set - take no action")
    else
        if C_PetBattles.IsInBattle() then
            -- In pet battle
            USQ.Debug(2, "In pet battle - setting hotkey to /click for TD Script auto button.  Disable IWT and CTM.")
            SetCVar("AutoInteract", 0)
            ClearOverrideBindings(USQ.USQFrame)
            SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "tdBattlePetScriptAutoButton", "LeftButton")
            -- Close any open gossip windows
            if GossipFrame:IsShown() then
                C_GossipInfo.CloseGossip()
            end
        else
            local npcID = USQ:TargetNPCID()
            if Rematch then
                if Rematch.Start and ((Rematch:IsTimerRunning("ReloadLoadIn") or Rematch:IsTimerRunning("TeamlessReloadLoadIn")) or (not Rematch.Start and Rematch.loadTeam:IsTeamLoading())) then
                    USQ.Debug(1, "Rematch is loaded, and is current loading a team.  Doing nothing until next update.")
                    SetCVar("AutoInteract", 0)
                    ClearOverrideBindings(USQ.USQFrame)
                    USQ.SetMacro("/target player")
                    SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                    return
                end
            end
            if USQ.WaitFlag then
                USQ.Debug(1, "WaitFlag = true.  Wait for flag to time out, or Rematch to load a new team.")
                SetCVar("AutoInteract", 0)
                ClearOverrideBindings(USQ.USQFrame)
                USQ.SetMacro("/target player")
                SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                return
            end
            if not USQ.TargetConfirmed then
                USQ.Debug(2, "Target not yet confirmed.  Checking for target.  Disable IWT and CTM.")
                SetCVar("AutoInteract", 0)
                ClearOverrideBindings(USQ.USQFrame)
                if (npcID == USQ.BattleNPCID) then
                    USQ.Debug(2, "Target matched. Set confirmed flag.")
                    USQ.TargetConfirmed = true
                    -- No return here - target is now confirmed so logic can continue in this iteration
                else
                    USQ.Debug(2, "Target doesn't match.  Set macro to /targetexact [NPC].")
                    USQ.SetMacro("/targetexact " .. BattleNPCName)
                    SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                    return
                end
            end
            if #USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID] >= 1 and Rematch and RematchSettings and RematchSettings.loadedTeam ~= USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID][USQ.AdvancedTeam].RematchTeamKey then
                USQ.Debug(1, "Rematch team does not match expected Advanced Team.  Disable action button, then load expected team.")
                -- If Rematch was going to switch out substitute pets, it should have done so by this point.

                SetCVar("AutoInteract", 0)
                ClearOverrideBindings(USQ.USQFrame)
                USQ.SetMacro("/target player")
                SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")

                if RematchSaved[USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID][USQ.AdvancedTeam].RematchTeamKey] then
                    USQ.Debug(1, "Loading Advanced Team # " .. tostring(USQ.AdvancedTeam) .. ": " .. tostring(USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID][USQ.AdvancedTeam].RematchTeamKey))
                    Rematch:LoadTeam(USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID][USQ.AdvancedTeam].RematchTeamKey)
                    -- USQ:WaitForTimer(2)
                    USQ:WaitForTimer(USQ.db.global.PetBattleCloseDelay)
                    return
                else
                    USQ.Debug(1, "Advanced Team # " .. tostring(USQ.AdvancedTeam) .. " does not exist in Rematch - delete from all NPCs.")
                    USQ:RemoveAdvancedTeamEntry(nil, USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID][USQ.AdvancedTeam].RematchTeamKey)
                end
            end
            -- Revive Early USQ.db.global.AdvancedTeamsReviveEarly[npcID]
            if USQ.db.global.AdvancedTeamsReviveEarly[USQ.BattleNPCID] and USQ.db.global.AutoReviveBattlePets == true and GetSpellCooldown(125439) == 0 and IsSpellKnown(125439) and #USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID] >= 1 and Rematch and USQ.BattledSinceHeal then
                USQ.Debug(2, "Revive Early enabled.  Advanced Teams enabled for npc.  Rematch found.  Revive Battle Pets known and off CD.  Set button to /cast Revive Battle Pets.")
                SetCVar("AutoInteract", 0)
                ClearOverrideBindings(USQ.USQFrame)
                USQ.SetMacro("/cast " .. GetSpellInfo(125439))
                -- USQ.SetMacro("/click UltraSquirtFrameReviveBattlePetsButton LeftButton")
                SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                return
            end
            USQ.Debug(2, "Checking for pet damage")
            if USQ:SlottedPetsHurt(#USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID] >= 1 and USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID][USQ.AdvancedTeam].BattleHealingThreshold or USQ.db.global.BattleHealingThreshold[USQ.BattleNPCID]) then
                -- Pets need healed
                if #USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID] >= 1 and USQ.AdvancedTeam < #USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID] and Rematch then
                    -- If Rematch was going to switch out substitute pets, it should have done so by this point.
                    USQ.Debug(1, "AdvancedTeams enabled, not yet at last team.  Disable action button, then load next team.")
                    SetCVar("AutoInteract", 0)
                    ClearOverrideBindings(USQ.USQFrame)
                    USQ.SetMacro("/target player")
                    SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")

                    USQ.AdvancedTeam = USQ.AdvancedTeam + 1
                    -- This will reset to 1 when a Revive or a Bandage is successfully cast.
                    USQ.Debug(1, "Roll forward Advanced Team # " .. tostring(USQ.AdvancedTeam) .. ": " .. tostring(USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID][USQ.AdvancedTeam].RematchTeamKey))
                    -- Rematch:LoadTeam(USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID][USQ.AdvancedTeam].RematchTeamKey)
                    -- USQ:WaitForTimer(2)
                    -- USQ:WaitForTimer(USQ.db.global.PetBattleCloseDelay)
                    return
                elseif (USQ.db.global.AutoReviveBattlePets == true and GetSpellCooldown(125439) == 0 and IsSpellKnown(125439)) then
                    USQ.Debug(2, "Pets damaged or below threshold, Revive Battle Pets known and off CD.  Set button to /cast Revive Battle Pets.")
                    SetCVar("AutoInteract", 0)
                    ClearOverrideBindings(USQ.USQFrame)
                    USQ.SetMacro("/cast " .. GetSpellInfo(125439))
                    -- USQ.SetMacro("/click UltraSquirtFrameReviveBattlePetsButton LeftButton")
                    SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                elseif USQ.db.global.AutoBandage == true and GetItemCount(86143, false) > 0 and GetItemInfo(86143) then
                    -- included GetItemInfo(86143) in if just in case it returns nil (i.e. item details not yet in cache), which should also mean there are none in the inventory
                    USQ.Debug(2, "Pets damaged or below threshold, Revive Battle Pets disabled or on CD.  Set button to /use Battle Pet Bandage.")
                    SetCVar("AutoInteract", 0)
                    ClearOverrideBindings(USQ.USQFrame)
                    USQ.SetMacro("/use " .. (GetItemInfo(86143)))
                    -- USQ.SetMacro("/click UltraSquirtFrameBandageButton LeftButton")
                    SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                elseif USQ.npcInfo[USQ.BattleNPCID].canUseStableMaster then
                    USQ.Debug(2, "Pets damaged or below threshold, Revive Battle Pets disabled or on CD, Bandages disabled or none left, and fighting Garrison NPC, so use Stable Master to heal.")
                    if GossipFrame:IsShown() and (GossipFrameTitleText:GetText() == StableMasterLioNPCName or GossipFrameTitleText:GetText() == StableMasterSerrahNPCName) then -- GossipFrameNpcNameText:GetText()
                        USQ.Debug(2, "Running Squirt healing logic.  Gossip window open and NPC matches.  Select gossip option.")
                        SetCVar("AutoInteract", 0)
                        ClearOverrideBindings(USQ.USQFrame)
                        --C_GossipInfo.SelectOption(1, "", true)
						local gossipOptions = C_GossipInfo.GetOptions()
						if(gossipOptions and gossipOptions[1]) then
							C_GossipInfo.SelectOption(gossipOptions[1].gossipOptionID) -- TODO: replace with specific gossip id reviveGossipOptionID
						end
                    elseif (npcID == 85418 or npcID == 79858) then
                        USQ.Debug(2, "Pets damaged, target is Stable Master.  Set button to IWT and enable CTM.")
                        SetCVar("AutoInteract", 1)
                        ClearOverrideBindings(USQ.USQFrame)
                        SetOverrideBinding(USQ.USQFrame, true, hotkey, "INTERACTTARGET")
                    else
                        USQ.Debug(2, "Pets damaged, set macro to /target Stable Master.  Disable IWT and CTM.")
                        SetCVar("AutoInteract", 0)
                        ClearOverrideBindings(USQ.USQFrame)
                        USQ.SetMacro("/targetexact " .. StableMasterLioNPCName .. "\n/targetexact " .. StableMasterSerrahNPCName)
                        SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                    end
                else
                    -- no action to take
                    USQ.Debug(2, "Pets damaged or below threshold, Revive Battle Pets and Bandage both disabled, on cooldown, or ran out.  Doing nothing...")
                    SetCVar("AutoInteract", 0)
                    ClearOverrideBindings(USQ.USQFrame)
                    USQ.SetMacro("/target player")
                    SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                end
            else
                -- Pets OK - get ready for battle
                if USQ.db.global.AutoDarkmoonTopHat == true and GetItemCount(171364, false) > 0 and GetItemInfo(171364) and AuraUtil.FindAuraByName((GetItemSpell(171364)), "player") == nil then
                    USQ.Debug(2, "Pets not damaged or above threshold, player has Darkmoon Top Hat, and buff is missing.  Set macro to /use Darkmoon Top Hat.")
                    SetCVar("AutoInteract", 0)
                    ClearOverrideBindings(USQ.USQFrame)
                    USQ.SetMacro("/use " .. (GetItemInfo(171364)))
                    -- USQ.SetMacro("/click UltraSquirtFrameDarkmoonTopHatButton LeftButton")
                    SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                elseif USQ.db.global.AutoSafariHat and PlayerHasToy(92738) and AuraUtil.FindAuraByName((GetItemSpell(92738)), "player") == nil then
                    USQ.Debug(2, "Pets not damaged or above threshold, player has Safari Hat toy, and buff is missing.  Set macro to /use Safari Hat.")
                    SetCVar("AutoInteract", 0)
                    ClearOverrideBindings(USQ.USQFrame)
                    local toyName = (select(2, C_ToyBox.GetToyInfo(92738)))
                    if toyName == nil or string.len(toyName) == 0 then
                        USQ.Debug(2, "Safari Hat toy info not found.  Wait for next update.  Doing nothing...")
                        SetCVar("AutoInteract", 0)
                        ClearOverrideBindings(USQ.USQFrame)
                        USQ.SetMacro("/target player")
                        SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                        return
                    else
                        USQ.SetMacro("/use " .. toyName)
                        SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                    end
                elseif GossipFrame:IsShown() and GossipFrameTitleText:GetText() == BattleNPCName then -- GossipFrameNpcNameText:GetText()
                    USQ.Debug(1, "Pets not damaged or above threshold, Gossip window open and NPC matches.  Select gossip option.")
                    SetCVar("AutoInteract", 0)
                    ClearOverrideBindings(USQ.USQFrame)
                    --C_GossipInfo.SelectOption(1, "", true)
					local gossipOptions = C_GossipInfo.GetOptions()
					local battleGossipOptionID = USQ.npcInfo[USQ.BattleNPCID].battleGossipOptionID
					if gossipOptions == nil then
						USQ.Debug(1, "Gossip Options not found - cannot take action.")
					elseif battleGossipOptionID then
						USQ.Debug(1, "Gossip Option saved - selecting battleGossipOptionID:" .. tostring(battleGossipOptionID))
						C_GossipInfo.SelectOption(battleGossipOptionID)
					elseif(gossipOptions[1]) then
						USQ.Debug(1, "Gossip Option not saved, defaulting to first result.")
						C_GossipInfo.SelectOption(gossipOptions[1].gossipOptionID)
					end
                elseif (npcID == USQ.BattleNPCID) then
                    USQ.Debug(2, "Pets not damaged or above threshold, target matches.  Set button to IWT and enable CTM.")
                    SetCVar("AutoInteract", 1)
                    ClearOverrideBindings(USQ.USQFrame)
                    SetOverrideBinding(USQ.USQFrame, true, hotkey, "INTERACTTARGET", "LeftButton")
                else
                    USQ.Debug(2, "Pets not damaged or above threshold, set macro to /targetexact [NPC].  Disable IWT and CTM.")
                    SetCVar("AutoInteract", 0)
                    ClearOverrideBindings(USQ.USQFrame)
                    USQ.SetMacro("/targetexact " .. BattleNPCName)
                    SetOverrideBindingClick(USQ.USQFrame, true, hotkey, "UltraSquirtButton", "LeftButton")
                end
            end
        end
    end
end

function USQ:TargetNPCID()
    if UnitGUID("target") then
        return tonumber((select(6, strsplit("-", UnitGUID("target")))))
    end
end

function USQ:SlottedPetsHurt(threshold)
    USQ.Debug(2, "SlottedPetsHurt running.")

    threshold = threshold or 100

    USQ.Debug(2, "SlottedPetsHurt: threshold: " .. tostring(threshold))

    local petsHurt = false
    for i = 1, 3 do
        local petGUID, ability1, ability2, ability3, locked = C_PetJournal.GetPetLoadOutInfo(i)
        if petGUID then
            local health, maxHealth, power, speed, rarity = C_PetJournal.GetPetStats(petGUID)
            USQ.Debug(2, "SlottedPetsHurt: slot: " .. i .. " petGUID: " .. tostring(petGUID) .. " health: " .. tostring(health) .. " / " .. tostring(maxHealth))

            if threshold == 100 or not(maxHealth) or maxHealth <= 0 then
                petsHurt = (petsHurt or C_PetJournal.PetIsHurt(petGUID))
            else
                petsHurt = (petsHurt or (100 * health / maxHealth) < threshold)
            end
        end
        USQ.Debug(2, "SlottedPetsHurt: petsHurt: " .. tostring(petsHurt))
    end
    return petsHurt
end

function USQ:WaitForTimer(seconds)
    -- Pause any actions for a set period
    -- Flag is overridden when Rematch:LoadHealthiestOfLoadedPets (see hook function RematchLoadHealthiestOfLoadedPetsHandler)
    local TimeRemaining = USQ:TimeLeft(USQ.WaitTimer)
    if TimeRemaining > seconds then
        USQ.Debug(1, "WaitFlag timer already running, with " .. tostring(TimeRemaining) .. "s left.  Already covers new timer, so no action taken.")
        return
    elseif TimeRemaining > 0 then
        USQ.Debug(1, "WaitFlag timer already running, with " .. tostring(TimeRemaining) .. "s left.  Resetting to start new run.")
        USQ:CancelTimer(USQ.WaitTimer)
    end
    USQ.WaitFlag = true
    USQ.WaitTimer = USQ:ScheduleTimer(USQ.ClearWaitFlag, seconds)
    USQ.Debug(1, "WaitFlag set.  Time started for " .. tostring(seconds) .. "s.")
end

function USQ.ClearWaitFlag()
    -- Clear Wait Flag - only to be called by USQ:WaitForTimer
    if USQ.WaitFlag then
        USQ.Debug(1, "Clearing WaitFlag.")
    else
        USQ.Debug(1, "WaitFlag already cleared.")
    end
    USQ.WaitFlag = false
end

function USQ:CancelWaitForTimer()
    local TimeRemaining = USQ:TimeLeft(USQ.WaitTimer)
    if TimeRemaining > 0 then
        USQ.Debug(1, "Setting WaitFlag = false, cancelling timer with " .. tostring(TimeRemaining) .. "s left.")
        USQ:CancelTimer(USQ.WaitTimer)
    else
        USQ.Debug(1, "Setting WaitFlag = false, timer already expired.")
    end
    USQ.WaitFlag = false
end

-- Event Handlers
function USQ:PET_BATTLE_OPENING_START(eventName)
    USQ.EventHandler(eventName)
end

function USQ:PET_BATTLE_CLOSE(eventName)
    -- Wait after each battle for the UI to update.
    if Rematch.Start and (Rematch:IsTimerRunning("ReloadLoadIn") or Rematch:IsTimerRunning("TeamlessReloadLoadIn")) or (Rematch.loadTeam:IsTeamLoading()) then
        USQ.Debug(1, "Rematch ReloadLoadIn timer already running - no need for action.")
    elseif Rematch and Rematch.Start and (RematchSettings and RematchSettings.LoadHealthiest and RematchSettings.LoadHealthiestAfterBattle) or (Rematch.settings and Rematch.settings.LoadHealthiest and Rematch.settings.LoadHealthiestAfterBattle) then
        USQ.Debug(1, "Rematch ReloadLoadIn timer not running, LoadHealthiestAfterBattle enabled - wait up to " .. tostring(USQ.db.global.RematchLoadTeamDelay) .. " seconds.")
        USQ:WaitForTimer(USQ.db.global.RematchLoadTeamDelay)
    else
        USQ.Debug(1, "Rematch ReloadLoadIn timer not running, LoadHealthiestAfterBattle disabled - wait up to " .. tostring(USQ.db.global.PetBattleCloseDelay) .. " seconds.")
        USQ:WaitForTimer(USQ.db.global.PetBattleCloseDelay)
    end

    -- Rematch:LoadHealthiestOfLoadedPets is hooked in OnInitialize.  If it fires this flag will be set to false early, as Rematch will have either loaded or set a timer to load a new pet setup.

    -- Continue processing
    USQ.EventHandler(eventName)
end

function USQ:PET_JOURNAL_LIST_UPDATE(eventName)
    USQ.EventHandler(eventName)
end

function USQ:GOSSIP_SHOW(eventName)
    USQ.Debug(2, "GOSSIP_SHOW triggered.")
    USQ.Update()
end

function USQ:PLAYER_REGEN_DISABLED(eventName)
    USQ.EventHandler(eventName)
end

function USQ:UNIT_SPELLCAST_SUCCEEDED(eventName, unitTarget, castGUID, spellID)
    if (unitTarget == "player" and (spellID == 125439 or spellID == 133994)) or (unitTarget == "npc" and spellID == 125801) then
        USQ.Debug(1, "UNIT_SPELLCAST_SUCCEEDED triggered by player healing pets - wait up to " .. tostring(USQ.db.global.HealDelay) .. " seconds.")
        USQ:WaitForTimer(USQ.db.global.HealDelay)
        USQ.Debug(1, "Resetting USQ.AdvancedTeam to 1")
        USQ.AdvancedTeam = 1
        USQ.BattledSinceHeal = false
        USQ.Update()
    end
end

-- Button Functions

function USQ.ItemButton_OnEvent(button, eventName, ...)
    USQ.ItemButton_UpdateCooldown(button)
    USQ.ItemButton_UpdateCount(button)
    USQ.ItemButton_UpdateState(button)
end

function USQ.ItemButton_UpdateCooldown(button)
    USQ.Debug(3, "Cooldown: " .. tostring(button:GetName()))
    USQ.Debug(3, "Cooldown: type1: " .. tostring(button:GetAttribute("type1")) .. " item: " .. tostring(button:GetAttribute("item")) .. " toy: " .. tostring(button:GetAttribute("toy")) .. " spell: " .. tostring(button:GetAttribute("spell")))
    local cooldown = button.cooldown
    local type1 = button:GetAttribute("type1")
    local start, duration, enable, modRate
    if type1 == "item" or type1 == "toy" then
        start, duration, enable = GetItemCooldown(button.actionID)
    elseif type1 == "spell" then
        start, duration, enable, modRate = GetSpellCooldown(button.actionID)
    end

    USQ.Debug(3, "Cooldown: start: " .. tostring(start) .. " duration: " .. tostring(duration) .. " enable: " .. tostring(enable) .. " modRate: " .. tostring(modRate))
    if (cooldown and start and duration) then
        if (enable) then
            cooldown:Hide()
        else
            cooldown:Show()
        end
        CooldownFrame_Set(cooldown, start, duration, enable, false, modRate)
    else
        cooldown:Hide()
    end
end

function USQ.ItemButton_UpdateCount(button)
    USQ.Debug(3, "Count: " .. tostring(button:GetName()))
    USQ.Debug(3, "Count: type1: " .. tostring(button:GetAttribute("type1")) .. " item: " .. tostring(button:GetAttribute("item")) .. " toy: " .. tostring(button:GetAttribute("toy")) .. " spell: " .. tostring(button:GetAttribute("spell")))
    local itemID = button:GetAttribute("item")
    local type1 = button:GetAttribute("type1")
    if type1 == "item" then
        local count = GetItemCount(itemID, false)
        USQ.Debug(3, "Count: updating count to: " .. tostring(count))
        button.count = count
        if count > 0 then
            button.Count:SetText(AbbreviateNumbers(count))
            button.Count:SetTextColor(HIGHLIGHT_FONT_COLOR:GetRGB())
            button.Count:Show()
        else
            button.Count:Hide()
        end
    else
        USQ.Debug(3, "Count: type1 is not item - nothing to do")
    end
end

function USQ.ItemButton_UpdateState(button)
    USQ.Debug(3, "UpdateState: button: " .. tostring(button:GetName()))
    if USQ.db.global[button.autoCastOption] then
        AutoCastShine_AutoCastStart(button.Shine)
    else
        AutoCastShine_AutoCastStop(button.Shine)
    end

    -- ???????? can the glow colour be changed to red when the count is zero??
    if GetItemSpell(button.actionID) and USQ.db.global[button.autoCastOption] == true and button.autoCastAllowed == false and AuraUtil.FindAuraByName((GetItemSpell(button.actionID)), "player") == nil then
        ActionButton_ShowOverlayGlow(button)
    else
        ActionButton_HideOverlayGlow(button)
    end
end

function USQ.ItemButton_OnClick(button, buttonClicked, down)
    USQ.Debug(1, "button: " .. tostring(button:GetName()) .. " buttonClicked: " .. tostring(buttonClicked) .. " down: " .. tostring(down) .. " button.isTogglable: " .. tostring(button.isTogglable) .. " button.autoCastOption: " .. tostring(button.autoCastOption))
    local useKeyDownCvar = GetCVarBool("ActionButtonUseKeyDown")
    if (down == useKeyDownCvar) and buttonClicked == "RightButton" and button.isTogglable == true then
        USQ.db.global[button.autoCastOption] = not(USQ.db.global[button.autoCastOption])
		USQ.Debug(1, "Updating AutoCast.  USQ.db.global[button.autoCastOption] = " .. tostring(USQ.db.global[button.autoCastOption]))
    end
    USQ.ItemButton_UpdateState(button)
    USQ.Update()
end

function USQ.BandageHealPreClick(button, buttonClicked)
    USQ.Debug(1, "BandageHealPreClick: button: " .. tostring(button:GetName()) .. " buttonClicked: " .. tostring(buttonClicked))
    if not USQ:SlottedPetsHurt(#USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID] >= 1 and USQ.db.global.AdvancedTeamsList[USQ.BattleNPCID][USQ.AdvancedTeam].BattleHealingThreshold or USQ.db.global.BattleHealingThreshold[USQ.BattleNPCID]) then
        USQ.Debug(1, "Pets not damaged, temporarily disabling button.")
        button:SetAttribute("type1", nil)
    end
end

function USQ.BandageHealPostClick(button, buttonClicked)
    USQ.Debug(1, "BandageHealPostClick: button: " .. tostring(button:GetName()) .. " buttonClicked: " .. tostring(buttonClicked))
    if button:GetAttribute("type1") == nil then
        USQ.Debug(1, "button.type1 is nil - resetting to: " .. tostring(button.type1))
        button:SetAttribute("type1", button.type1)
    else
        USQ.Debug(1, "button.type1 is not nil - no action")
    end
end

function USQ.DarkmoonTopHatButtonPreClick(button, buttonClicked)
    USQ.Debug(1, "DarkmoonTopHatButtonPreClick: button: " .. tostring(button:GetName()) .. " buttonClicked: " .. tostring(buttonClicked))
    if not (AuraUtil.FindAuraByName((GetItemSpell(171364)), "player") == nil) then
        USQ.Debug(1, "Darkmoon Top Hat buff is not missing, temporarily disabling button.")
        button:SetAttribute("type1", nil)
    end
end

function USQ.DarkmoonTopHatButtonPostClick(button, buttonClicked)
    USQ.Debug(1, "DarkmoonTopHatButtonPostClick: button: " .. tostring(button:GetName()) .. " buttonClicked: " .. tostring(buttonClicked))
    if button:GetAttribute("type1") == nil then
        USQ.Debug(1, "button.type1 is nil - resetting to: " .. tostring(button.type1))
        button:SetAttribute("type1", button.type1)
    else
        USQ.Debug(1, "button.type1 is not nil - no action")
    end
end

-- ScrollingTable functions

function USQ:GenerateNPCInfoScrollingTableData()
    USQ.Debug(1, "Running GenerateNPCInfoScrollingTableData")
    local data = {}
    for npcID, npcDetails in pairs(USQ.npcInfo) do
        if npcDetails.canBattle then
            local QuestName
            QuestName = USQ:GetQuestName(npcDetails.questID)
            if QuestName then
                QuestName = "|n|cFFFFFFFF" .. QuestName .. "|r"
            end

            table.insert(data, {
                npcID, (USQ:GetNPCName(npcID) or tostring(npcID)) .. (QuestName or ""), USQ.db.global.AdvancedTeamsReviveEarly[npcID],
            })
        end
    end

    return data
end

-- /dump UltraSquirt.NPCInfoScrollingTableScheduleCalls, UltraSquirt.NPCInfoScrollingTableUpdateCalls
USQ.NPCInfoScrollingTableScheduleCalls = 0
USQ.NPCInfoScrollingTableUpdateCalls = 0

-- /script UltraSquirt:ScheduleUpdateNPCInfoScrollingTable(5)
-- Also run this when USQ.npcInfo or USQ.questName get updated (from USQ:GetNPCName() and USQ:GetQuestName())
function USQ:ScheduleUpdateNPCInfoScrollingTable(seconds)
    USQ.Debug(2, "Running ScheduleUpdateNPCInfoScrollingTable")
    USQ.NPCInfoScrollingTableScheduleCalls = USQ.NPCInfoScrollingTableScheduleCalls + 1
    local TimeRemaining = USQ:TimeLeft(USQ.NPCInfoSTTimer)
    if TimeRemaining > 0 then
        USQ.Debug(2, "NPCInfoSTTimer timer already running, with " .. tostring(TimeRemaining) .. "s left.  Resetting to start new run.")
        USQ:CancelTimer(USQ.NPCInfoSTTimer)
    end

    USQ.NPCInfoSTTimer = USQ:ScheduleTimer(USQ.UpdateNPCInfoScrollingTable, seconds)
    USQ.Debug(2, "NPCInfoSTTimer timer started for " .. tostring(seconds) .. "s.")
end

function USQ:UpdateNPCInfoScrollingTable()
    USQ.Debug(1, "Running UpdateNPCInfoScrollingTable")
    USQ.NPCInfoScrollingTableUpdateCalls = USQ.NPCInfoScrollingTableUpdateCalls + 1
    USQ.USQAdvancedTeamsFrame.NPCScrollFrame:SetData(USQ:GenerateNPCInfoScrollingTableData(), true)
end

function USQ:GenerateTeamsScrollingTableData(npcID)
    USQ.Debug(1, "Running GenerateTeamsScrollingTableData with npcID: " .. tostring(npcID))

    local data = {}
    local white = {["r"] = 1.0, ["g"] = 1.0, ["b"] = 1.0, ["a"] = 1.0,}
    local yellow = {["r"] = 1.0, ["g"] = 1.0, ["b"] = 0.0, ["a"] = 1.0,}
    -- local upnormal = "|TInterface\\Buttons\\UI-MicroStream-Green:25:25:0:0:32:32:0:32:32:0|t"
    -- local updesat = "|TInterface\\Buttons\\UI-MicroStream-Green:25:25:0:0:32:32:0:32:32:0:127:127:127|t"
    -- local downnormal = "|TInterface\\Buttons\\UI-MicroStream-Green:25:25:0:0:32:32:0:32:0:32|t"
    -- local downdesat  = "|TInterface\\Buttons\\UI-MicroStream-Green:25:25:0:0:32:32:0:32:0:32:127:127:127|t"
    -- local deletenormal = "|TInterface\\Buttons\\UI-Panel-MinimizeButton-Up:25:25:0:0:32:32:0:32:32:0|t"

    if npcID then
        for i, SavedTeam in pairs(USQ.db.global.AdvancedTeamsList[npcID]) do
            local SavedKey = SavedTeam.RematchTeamKey
            local SavedBattleHealingThreshold = SavedTeam.BattleHealingThreshold
            local TeamName
            local TeamInfo
            if Rematch.Start then
                -- Assuming Rematch 4
                TeamName = Rematch:GetTeamTitle(SavedKey, false) or SavedKey
            else
                -- Assuming Rematch 5
            end
            USQ.Debug(1, "npcID: " .. tostring(npcID) .. " SavedKey: " .. tostring(SavedKey) .. " type(SavedKey): " .. tostring(type(SavedKey)) .. " SavedBattleHealingThreshold:" .. tostring(SavedBattleHealingThreshold) .. " TeamName: " .. TeamName)
            table.insert(data, {
                ["cols"] = {
                    {
                        ["value"] = SavedKey,
                    },
                    {
                        ["value"] = i,
                    },
                    {
                        ["value"] = TeamName,
                        ["color"] = type(SavedKey) == "number" and white or yellow,
                    },
                    {
                        ["value"] = SavedBattleHealingThreshold,
                    },
                    {
                        -- ["value"] = i == 1 and updesat or upnormal, -- up
                    },
                    {
                        -- ["value"] = i == #USQ.db.global.AdvancedTeamsList[npcID] and downdesat or downnormal, -- down
                    },
                    {
                        -- ["value"] = deletenormal,
                    },
                },
            })
        end
    end

    return data
end

function USQ:UpdateTeamsScrollingTable(npcID)
    USQ.Debug(1, "Running UpdateTeamsScrollingTable with npcID: " .. tostring(npcID))
    -- local npcID = USQ.USQAdvancedTeamsFrame.NPCScrollFrame:GetSelection()
    local st, selected, rowdata, cell

    if npcID == nil then
        npcID = USQ:NPCInfoScrollingTableGetCurrentnpcID()
    end

    USQ.USQAdvancedTeamsFrame.TeamsScrollFrame:SetData(USQ:GenerateTeamsScrollingTableData(npcID), false)
    USQ.USQAdvancedTeamsFrame.TeamsScrollFrame:ClearSelection()
end

function USQ:NPCInfoScrollingTableGetCurrentnpcID()
    USQ.Debug(1, "Running NPCInfoScrollingTableGetCurrentnpcID")
    local npcID = nil
    local st, selected, rowdata, cell
    st = USQ.USQAdvancedTeamsFrame.NPCScrollFrame
    selected = st:GetSelection()
    if selected then
        rowdata = st:GetRow(selected)
        if rowdata then
            npcID = st:GetCell(rowdata, 1)
        end
    end

    return npcID
end