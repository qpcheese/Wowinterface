-----------------------------------------------------------------------------------------------------------------------
--  Title:   RealmLanguageInfo                                                                                       --
--  Author:  Zaazu                                                                                                   --
--  Date:    January 2022                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that adds a realm language indicator in the chatbox and on tooltips.                        --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class RealmLanguageInfo : AceConsole, AceEvent
local RealmLanguageInfo = BTools:NewModule("RealmLanguageInfo", "AceConsole-3.0", "AceEvent-3.0")

---@type DBSettingsRealmLanguageInfo
local RealmLanguageInfoDB = nil

local HookGetColoredName = nil
local HookElvUIGetColoredName = nil

local Realms = nil
local RealmsUS = {
    -- Brazil
    ["Azralon"] = {prefix = "BR", language = "Brazil Portuguese", icon = BTools.Resources.textures.FlagBR},
    ["Gallywix"] = {prefix = "BR", language = "Brazil Portuguese", icon = BTools.Resources.textures.FlagBR},
    ["Goldrinn"] = {prefix = "BR", language = "Brazil Portuguese", icon = BTools.Resources.textures.FlagBR},
    ["Nemesis"] = {prefix = "BR", language = "Brazil Portuguese", icon = BTools.Resources.textures.FlagBR},
    ["TolBarad"] = {prefix = "BR", language = "Brazil Portuguese", icon = BTools.Resources.textures.FlagBR},

    -- Latin America
    ["Drakkari"] = {prefix = "ES", language = "Latin America Spanish", icon = BTools.Resources.textures.FlagMX},
    ["Quel'Thalas"] = {prefix = "ES", language = "Latin America Spanish", icon = BTools.Resources.textures.FlagMX},
    ["Ragnaros"] = {prefix = "ES", language = "Latin America Spanish", icon = BTools.Resources.textures.FlagMX},

    -- Oceanic
    ["Aman'Thul"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Barthilas"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Caelestrasz"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Dath'Remar"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Dreadmaul"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Frostmourne"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Gundrak"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Jubei'Thos"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Khaz'goroth"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Nagrand"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Saurfang"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},
    ["Thaurissan"] = {prefix = "EN", language = "Oceanic English", icon = BTools.Resources.textures.FlagAU},

    -- United States
    ["Aegwynn"] = {prefix = "EN", language = "United Stated English", icon = BTools.Resources.textures.FlagUS},
    ["AeriePeak"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Agamaggan"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Aggramar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Akama"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Alexstrasza"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Alleria"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["AltarofStorms"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["AlteracMountains"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Andorhal"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Anetheron"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Antonidas"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Anub'arak"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Anvilmar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Arathor"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Archimonde"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Area52"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["ArgentDawn"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Arthas"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Arygos"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Auchindoun"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Azgalor"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Azjol-Nerub"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Azshara"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Azuremyst"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Baelgun"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Balnazzar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["BlackDragonflight"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Blackhand"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Blackrock"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["BlackwaterRaiders"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["BlackwingLair"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Blade'sEdge"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Bladefist"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["BleedingHollow"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["BloodFurnace"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Bloodhoof"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Bloodscalp"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Bonechewer"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["BoreanTundra"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Boulderfist"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Bronzebeard"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["BurningBlade"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["BurningLegion"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Cairne"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["CenarionCircle"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Cenarius"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Cho'gall"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Chromaggus"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Coilfang"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Crushridge"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Daggerspine"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Dalaran"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Dalvengyr"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["DarkIron"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Darkspear"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Darrowmere"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Dawnbringer"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Deathwing"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["DemonSoul"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Dentarg"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Destromath"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Dethecus"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Detheroc"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Doomhammer"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Draenor"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Dragonblight"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Dragonmaw"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Drak'Tharon"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Drak'thul"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Draka"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Drenden"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Dunemaul"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Durotan"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Duskwood"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["EarthenRing"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["EchoIsles"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Eitrigg"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Eldre'Thalas"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Elune"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["EmeraldDream"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Eonar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Eredar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Executus"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Exodar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Farstriders"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Feathermoon"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Fenris"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Firetree"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Fizzcrank"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Frostmane"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Frostwolf"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Galakrond"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Garithos"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Garona"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Garrosh"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Ghostlands"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Gilneas"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Gnomeregan"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Gorefiend"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Gorgonnash"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Greymane"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["GrizzlyHills"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Gul'dan"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Gurubashi"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Hakkar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Haomarush"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Hellscream"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Hydraxis"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Hyjal"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Icecrown"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Illidan"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Jaedenar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Kael'thas"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Kalecgos"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Kargath"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Kel'Thuzad"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Khadgar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["KhazModan"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Kil'jaeden"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Kilrogg"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["KirinTor"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Korgath"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Korialstrasz"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["KulTiras"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["LaughingSkull"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Lethon"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Lightbringer"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Lightning'sBlade"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Lightninghoof"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Llane"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Lothar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Madoran"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Maelstrom"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Magtheridon"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Maiev"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Mal'Ganis"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Malfurion"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Malorne"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Malygos"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Mannoroth"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Medivh"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Misha"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Mok'Nathal"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["MoonGuard"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Moonrunner"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Mug'thol"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Muradin"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Nathrezim"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Nazgrel"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Nazjatar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Ner'zhul"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Nesingwary"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Nordrassil"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Norgannon"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Onyxia"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Perenolde"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Proudmoore"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Quel'dorei"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Ravencrest"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Ravenholdt"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Rexxar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Rivendare"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Runetotem"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Sargeras"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["ScarletCrusade"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Scilla"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Sen'jin"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Sentinels"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["ShadowCouncil"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Shadowmoon"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Shadowsong"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Shandris"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["ShatteredHalls"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["ShatteredHand"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Shu'halo"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["SilverHand"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Silvermoon"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["SistersofElune"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Skullcrusher"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Skywall"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Smolderthorn"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Spinebreaker"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Spirestone"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Staghelm"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["SteamwheedleCartel"] = {
        prefix = "EN",
        language = "United States English",
        icon = BTools.Resources.textures.FlagUS
    },
    ["Stonemaul"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Stormrage"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Stormreaver"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Stormscale"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Suramar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Tanaris"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Terenas"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Terokkar"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["TheForgottenCoast"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["TheScryers"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["TheUnderbog"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["TheVentureCo"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["ThoriumBrotherhood"] = {
        prefix = "EN",
        language = "United States English",
        icon = BTools.Resources.textures.FlagUS
    },
    ["Thrall"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Thunderhorn"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Thunderlord"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Tichondrius"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Tortheldrin"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Trollbane"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Turalyon"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["TwistingNether"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Uldaman"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Uldum"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Undermine"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Ursin"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Uther"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Vashj"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Vek'nilash"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Velen"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Warsong"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Whisperwind"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Wildhammer"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Windrunner"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Winterhoof"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["WyrmrestAccord"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Ysera"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Ysondre"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Zangarmarsh"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Zul'jin"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS},
    ["Zuluhed"] = {prefix = "EN", language = "United States English", icon = BTools.Resources.textures.FlagUS}

}
local RealmsEU = {
    -- English
    ["AeriePeak"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Agamaggan"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Aggramar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Ahn'Qiraj"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Al'Akir"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Alonsus"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Anachronos"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Arathor"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["ArgentDawn"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Aszune"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Auchindoun"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Azjol-Nerub"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Azuremyst"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Balnazzar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Blade'sEdge"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Bladefist"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Bloodfeather"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Bloodhoof"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Bloodscalp"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Boulderfist"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["BronzeDragonflight"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Bronzebeard"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["BurningBlade"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["BurningLegion"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["BurningSteppes"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["ChamberofAspects"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Chromaggus"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Crushridge"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Daggerspine"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["DarkmoonFaire"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Darksorrow"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Darkspear"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Deathwing"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["DefiasBrotherhood"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Dentarg"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Doomhammer"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Draenor"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Dragonblight"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Dragonmaw"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Drak'thul"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Dunemaul"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["EarthenRing"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["EmeraldDream"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Emeriss"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Eonar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Executus"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Frostmane"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Frostwhisper"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Genjuros"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Ghostlands"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["GrimBatol"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Hakkar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Haomarush"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Hellfire"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Hellscream"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Jaedenar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Karazhan"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Kazzak"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Khadgar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Kilrogg"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Kor'gall"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["KulTiras"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["LaughingSkull"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Lightbringer"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Lightning'sBlade"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Magtheridon"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Mazrigos"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Moonglade"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Nagrand"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Neptulon"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Nordrassil"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Outland"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Quel'Thalas"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Ragnaros"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Ravencrest"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Ravenholdt"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Runetotem"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Saurfang"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["ScarshieldLegion"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Shadowsong"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["ShatteredHalls"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["ShatteredHand"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Silvermoon"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Skullcrusher"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Spinebreaker"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Sporeggar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["SteamwheedleCartel"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Stormrage"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Stormreaver"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Stormscale"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Sunstrider"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Sylvanas"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Talnivarr"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["TarrenMill"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Terenas"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Terokkar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["TheMaelstrom"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["TheSha'tar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["TheVentureCo"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Thunderhorn"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Trollbane"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Turalyon"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Twilight'sHammer"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["TwistingNether"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Vashj"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Vek'nilash"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Wildhammer"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Xavius"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},
    ["Zenedar"] = {prefix = "EN", language = "English", icon = BTools.Resources.textures.FlagGB},

    -- German
    ["Aegwynn"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Alexstrasza"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Alleria"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Aman'thul"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Ambossar"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Anetheron"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Antonidas"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Anub'arak"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Area52"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Arthas"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Arygos"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Azshara"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Baelgun"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Blackhand"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Blackmoore"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Blackrock"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Blutkessel"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Dalvengyr"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DasKonsortium"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DasSyndikat"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DerMithrilorden"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DerRatvonDalaran"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DerabyssischeRat"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Destromath"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Dethecus"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DieAldor"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DieArguswacht"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DieNachtwache"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DieSilberneHand"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DieTodeskrallen"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DieewigeWacht"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["DunMorogh"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Durotan"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Echsenkessel"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Eredar"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["FestungderStürme"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Forscherliga"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Frostmourne"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Frostwolf"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Garrosh"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Gilneas"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Gorgonnash"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Gul'dan"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Kargath"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Kel'Thuzad"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Khaz'goroth"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Kil'jaeden"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Krag'jin"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["KultderVerdammten"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Lordaeron"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Lothar"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Madmortem"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Mal'Ganis"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Malfurion"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Malorne"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Malygos"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Mannoroth"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Mug'thol"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Nathrezim"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Nazjatar"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Nefarian"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Nera'thor"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Nethersturm"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Norgannon"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Nozdormu"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Onyxia"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Perenolde"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Proudmoore"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Rajaxx"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Rexxar"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Sen'jin"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Shattrath"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Taerar"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Teldrassil"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Terrordar"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Theradras"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Thrall"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Tichondrius"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Tirion"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Todeswache"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Ulduar"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Un'Goro"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Vek'lor"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Wrathbringer"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Ysera"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["ZirkeldesCenarius"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},
    ["Zuluhed"] = {prefix = "DE", language = "German", icon = BTools.Resources.textures.FlagDE},

    -- Spanish
    ["C'Thun"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["ColinasPardas"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["DunModr"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["Exodar"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["LosErrantes"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["Minahonda"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["Sanguino"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["Shen'dralar"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["Tyrande"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["Uldum"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},
    ["Zul'jin"] = {prefix = "ES", language = "Spanish", icon = BTools.Resources.textures.FlagES},

    -- French
    ["Arak-arahm"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Arathi"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Archimonde"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Chantséternels"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Cho'gall"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["ConfrérieduThorium"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["ConseildesOmbres"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["CultedelaRivenoire"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Dalaran"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Drek'Thar"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Eitrigg"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Eldre'Thalas"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Elune"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Garona"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Hyjal"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Illidan"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Kael'thas"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["KhazModan"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["KirinTor"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Krasus"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["LaCroisadeécarlate"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["LesClairvoyants"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["LesSentinelles"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["MarécagedeZangar"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Medivh"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Naxxramas"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Ner'zhul"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Rashgarroth"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Sargeras"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Sinstralis"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Suramar"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Templenoir"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Throk'Feroth"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Uldaman"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Varimathras"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Vol'jin"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},
    ["Ysondre"] = {prefix = "FR", language = "French", icon = BTools.Resources.textures.FlagFR},

    -- Italian
    ["Nemesis"] = {prefix = "IT", language = "Italian", icon = BTools.Resources.textures.FlagIT},
    ["Pozzodell'Eternità"] = {prefix = "IT", language = "Italian", icon = BTools.Resources.textures.FlagIT},

    -- Portuguese
    ["Aggra(Português)"] = {prefix = "PT", language = "Portuguese", icon = BTools.Resources.textures.FlagPT},

    -- Russian
    ["Азурегос"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Борейскаятундра"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["ВечнаяПесня"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Галакронд"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Голдринн"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Гордунни"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Гром"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Дракономор"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Король-лич"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["ПиратскаяБухта"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Подземье"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Разувий"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Ревущийфьорд"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["СвежевательДуш"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Седогрив"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["СтражСмерти"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Термоштепсель"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["ТкачСмерти"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["ЧерныйШрам"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU},
    ["Ясеневыйлес"] = {prefix = "RU", language = "Russian", icon = BTools.Resources.textures.FlagRU}
}

local function AppendRealmPrefix(playerName)
    local realmInfo = Realms[playerName:match("-(.*)")]

    if (realmInfo) then
        if (RealmLanguageInfoDB.prefixType == "Icon") then
            playerName = BTools.Resources.getFormattedTextureString(realmInfo.icon) .. playerName
        elseif (RealmLanguageInfoDB.prefixType == "Text") then
            playerName = "(" .. realmInfo.prefix .. ")" .. playerName
        end
    end

    return playerName
end

local function ChatFrameAddLanguage(event, msg, playerName, languageName, channelName, playerName2, ...)
    if (RealmLanguageInfoDB.chatEnable) then
        playerName = AppendRealmPrefix(playerName)
        playerName2 = AppendRealmPrefix(playerName2)
    end

    return HookGetColoredName(event, msg, playerName, languageName, channelName, playerName2, ...)
end

local function ElvUIAddLanguage(self, event, msg, playerName, languageName, channelName, playerName2, ...)
    if (RealmLanguageInfoDB.chatEnable) then
        playerName = AppendRealmPrefix(playerName)
        playerName2 = AppendRealmPrefix(playerName2)
    end

    return HookElvUIGetColoredName(self, event, msg, playerName, languageName, channelName, playerName2, ...)
end

-- local function PratAddLanguage(self, ...)
--     return AddLanguage(HookElvUIGetColoredName, self, ...)
-- end

function RealmLanguageInfo:OnEnable()
    ---@type DatabaseManager
    local DB = BTools:GetModule("DatabaseManager")
    RealmLanguageInfoDB = DB:GetRealmLanguageInfoSettingsTable()

    local regionID = GetCurrentRegion()
    if (regionID == 1) then
        -- US
        Realms = RealmsUS
    elseif (regionID == 2) then
        -- Korea
        Realms = {}
    elseif (regionID == 3) then
        -- EU
        Realms = RealmsEU
    elseif (regionID == 4) then
        -- Taiwan
        Realms = {}
    elseif (regionID == 5) then
        -- China
        Realms = {}
    end

    -- Blizzard Default Chat
    HookGetColoredName = GetColoredName
    GetColoredName = ChatFrameAddLanguage

    -- ElvUI Chat
    if (ElvUI) then
        local ElvUIChatModule = ElvUI[1]:GetModule("Chat", true)

        if (ElvUIChatModule) then
            HookElvUIGetColoredName = ElvUIChatModule.GetColoredName
            ElvUIChatModule.GetColoredName = ElvUIAddLanguage
        end
    end

    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, function(self)
        if (not RealmLanguageInfoDB.tooltipEnable) then
            return
        end

        local _, unit = self:GetUnit()
        if (not UnitIsPlayer(unit)) then
            return
        end

        local name, realm = UnitName(unit)
        local realmInfo = Realms[realm or GetNormalizedRealmName()]

        if (realmInfo) then
            if (RealmLanguageInfoDB.prefixType == "Icon") then
                self:AddLine(BTools.Resources.getFormattedTextureString(realmInfo.icon) .. " " .. realmInfo.language, 1,
                             1, 1)
            elseif (RealmLanguageInfoDB.prefixType == "Text") then
                self:AddLine("(" .. realmInfo.prefix .. ") " .. realmInfo.language, 1, 1, 1)
            end

        end
    end)
end
