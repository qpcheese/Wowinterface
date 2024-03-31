# AllTheThings

## [DF-3.9.12](https://github.com/DFortun81/AllTheThings/tree/DF-3.9.12) (2024-03-17)
[Full Changelog](https://github.com/DFortun81/AllTheThings/compare/DF-3.9.11...DF-3.9.12) [Previous Releases](https://github.com/DFortun81/AllTheThings/releases)

- parsing  
- -- BFA Engi  
    -- Profession Cleanup  
    -- EF Cleanup  
- Archaeology not able to cache  
- Partial completion for Blasted Lands. Not feeling good, gonna nap.  
- Added few more missing quests for retail.  
- Added Un'goro Crater missing vanilla quests for retail.  
- The Charger achievement can be detected in classic.  
- temporary? fix  
- Elixir of Waterwalking wasn't available until 2.4.0.  
- Copied over classic timeline data for Fishing Achievements.  
- Adjusted providers and objectives for the Badlands.  
- Adjusted providers and objectives for Arathi Highlands.  
- Some Ember Court HQT I tripped over  
- Adjusted providers and objectives for Silvermoon City.  
- Retail: Tooltip Sources should match your Settings for visibility outside of Unobtainables  
    Retail: Fixed some Unobtainable sources showing for Things whose parent group is not actually flagged Unobtainable as well  
- Retail: Source abbreviations now only applied on the final set of sources shown in the tooltip  
- Better cost debugging comments  
- Fixed any Quest linked to maxreputation ALWAYS being treated as a Cost  
- Adjusted the Dark Iron Mole Machines to utilize a helper function. Also added a note for future adjustments.  
- Fixed a preprocessor in Onyxia's Lair.  
- Me Brother, Nipsy cost -> provider.  
- Adds required LW skill level to 'The Journey Has Just Begun' (Onyxia Scale Cloak).  
- Added objects to Eversong Woods and cleaned up some missing timeline data. (pretty sure this file was being worked on just as we were figuring out what we wanted with timelines)  
- Added objects to Sunstrider Isle.  
- Added objects to Ghostlands and cleaned up some missing timeline data. (pretty sure this file was being worked on just as we were figuring out what we wanted with timelines)  
- Added a second loop for non-insane elements  
- Cata: Some adjustments to Elwynn Forest quests.  
- Cata: Fixed some objectives on playthrough.  
- Retail: Object tooltips now use SearchForObject to get baked-in filtering-prioritization of search results  
- Cata: Updated Redridge Mountains to utilize objectives!  
- Debug comment  
- Retail: Adjusted Object tooltip logic so that unmapped objects can still show in tooltips  
- Retail: Removed some unnecessary provider double-caching  
- Added some search protection for Cost calculations since there are now non-Items being cached for Items currently :weary:  
- Cata: Westfall and Redridge Mountains now use the sourceQuests method for displaying their quests when right clicking the achievement.  
- Classic: GetBestObjectIDForName now accounts for accessibility to find the best objectID.  
- Apparently that didn't take out the description...  
- Classic: Spell Descriptions are only necessary in Classic Era/SOD.  
- Hero's Call: Redridge Mountains! is actually level 14.  
- Moved the Redridge Hero's Call quest to Redridge.  
- Added Warchief's Command Board headers in their respective zones.  
- Made a symlink for the Hero's Call Board and Warchief's Command Board.  
    Added the Hero's Call Board to SW, IF, Darn, Exodar, and Dalaran with the symlink attached. (more work in progress)  
- Gold Broke Parsing :<  
- swap some exclude order  
- tagged rare as removed due 10250  
    added 2nd backup quest for none-partysync able quests  
- Cata: Updated quest objectives for Westfall.  
- updated tuskarr chest items + parser  
- Removed  Thaldraszus Zone Rewards & sourced them into Zone Drop/Titan Chests  
    Added the Titan Chest  
    Cleaned up AtA Cache  
    Cleaned up Treasure Flood Chest  
- Added Keg of Thunderbrew Lager to Kegs in the Ember Court and added back the timeline to the original source. (TODO: Someone else add the coordinate please, not sure what I'm looking at!)  
- Removed  Waking Shore Zone Rewards & sourced them into Zone Drop/Djaradin Cache  
    Added the Djaradin Cache  
- updated ohn ahran plains "clan chest"  
    water chest remains symlinked (prolly displays too many items tho)  
    removed zone rewards and moved them into Zone Drops  
- updated AtA rewards  
    Removed  Azure Span Zone Rewards & sourced them into Zone Drop/DCC  
    Added the Decay Covered Chest  
- Cata: Westfall Quests criteria not available until later.  
- Elemental Shatter - DF Enchanting items  
- Classic: GetBestObjectIDForName now works with all object tooltips. (Please report tooltips that aren't working correctly!)  
- Fixed an issue with item/currency tooltips on objectives involving providers.  
    Cata: Added a couple more objectives to Elwynn Forest.  
- Cata: Adjusted some quest objectives in Elwynn Forest.  
- Couple improvements for performance tracking  
- Cata: Updated coordinates in Northshire Valley, which did not become its own standalone map until MOP.  
- Player Coordinates now function for any map, so that you can see the precise location of the player relative to that map. (So if you're in Northshire Valley, it'll show the exact coordinate on Northshire Valley, Elwynn Forest, and Eastern Kingdoms!)  
- Classic: Adjusted the Accessibility tooltip calculation so that it only shows the most accessible phase and unobtainable data.  
    Adjusted a bunch of quest rewards for Cataclysm based on changes that occurred after Cataclysm was over.  
- Retail: Spell info in tooltips is now only attached for clicked chat-linked spells (i.e. Recipes, etc.)  
- Classic: Now using the Vanilla toc postfix.  
- Accessibility sort now takes relative u values as well.  
- Updated quest objectives for Northshire Valley.  
- Added provider for Charging into Battle.  
- Dark Letter might be a HQT.  
- Couple data bits for Logotyrapy  
- Cata: Fixed the Echo Isles.  
- Cata: Eastern Plaguelands Quests doesn't have criteria yet.  
- Cata: Fixed Taking the Show on the Road.  
- Whimsical Skull Mask wasn't until MOP.  
- Cata: Fixed map data for Scholomance, Scarlet Monastery, New Tinkertown, Deeprun Tram, and Blackrock Mountain.  
    Cata: Fixed the map assignment for Darkmoon Faire.  
    Adjusted a couple quests on Kezan and The Lost Isles.  
- MoP QI's  
- Temporarily using Wrath's Item DB for Cataclysm.  
- Updated the format of Battleground Meta Achievements.  
- Cleaned up a lot of string-based table access into named-key access for simplicity  
- Updated Rated Battleground header in Cataclysm.  
    Reparsed retail to remove unused localization.  
- Cataclysmic Gladiator items are no longer nested inside of an ensemble.  
- Ruthless Gladiator section is no longer nested in a bunch of Ensembles.  
- Vicious Gladiator section is no longer nested in the ensembles themselves.  
- Added classic phase data for Cataclysm Arena Seasons.  
- Cata: Removed some Archaeology items that get added with MOP.  
- Fixed Archeaology's header.  
- Key to the Planes and other cataclysm crafted inscription items were not added until later.  
- Added icons to the Molten Front and Tol Barad.  
- Cata: Marked the Molten Front as Phase 3.  
    Cata: Marked End Time, Hour of Twilight, and Well of Eternity as Phase 2.  
- Cata: Bounty of a Sundered Land wasn't added until later.  
- Do a Barrel Roll! had the wrong achievement criteria.  
- Cata: Shifted phases 2 and 3 by one phase id for Zul'Aman and Zul'Gurub.  
- Cata: Updated timeline data for Throne of the Four Winds, Firelands, and Dragon Soul.  
- Cata: Updated timeline data for Baradin Hold, Blackwing Descent, and Bastion of Twilight.  
- Cata: Fixed Burgy Blackheart's Handsome Hat, Black Ice, and Fandral's Seed Pouch.  
- Cata: Fixed some timelines for achievements and mounts that aren't available yet.  
- Cata: Illusions are now properly timelined.  
    Patch 7.3.0 converted into constants.  
- Cata: Baradin Hold & World Bosses updated.  
    Music Rolls are now properly timelined.  
    Converted string-based 6.1.0 timelines into constant.  
- Faceless Minion now has a proper timeline.  
    Classic: Battle Pets now fall through to their item names.  
- Doti update.  
- Whoops @Darkal  
- Added phase checkmarks for Cataclsym Classic. (guess, really)  
- Uldum now has an icon.  
    Cata: Fixed the Maelstrom loremaster criterias.  
- Cata: All Kalimdor and Eastern Kingdoms loremaster achievements no longer have broken criteria attached to them.  
- Cata: Updated the loremaster achievements for a couple Kalimdor zones so they stop throwing errors.  
- Moved cataclysm TOC from my stash to the repo. GL Beta testers! It's broken!  
- Spdersilk Drape - timeline correction  
- No longer showing Criteria For on a criteria that's relative to its achievement.  
- Retail: Titles no longer show an additional "known on character" line. This is already evident by the circle checkmark at the top.  
- Updated localization formatters for the min/max reputation tooltip strings.  
- Adjusted faction tooltips again.  
- Adjusted Renown tooltip to show the remaining total to the maximum renown for the faction.  
- Renown Faction tooltips now display the correct amount.  
- Retail: Dynamic Categories no longer prevent "title" from populating.  
- Classic now supports the Faction class.  
    The Faction class no longer chains API calls, instead, each sub class handles its own data format.  
- Added a simpler link method for simply print a search link in chat for a group  
- Removed some unused minilist functions due to other removals  
- Fixed recipe harvesting to not cache unlearned NYI recipes reagents  
- Fixed Bartered Dig Map being considered a character unlock  
    Fixed Parser warning to make Items character unlocks when they're repeatable in some way  
- Small fix for repeated objects also repeating their repeated content repeatedly in minilists  
- Moves Spidersilk Drape from WotLK to Classic Crafted Items  
- Faction class externals are now referenced at the bottom of the file.  
    Faction Bonus items now use a variant. (though it looks like Parser is ignoring them)  
- Whoops  
- Comment block for WithRenown. (Crieve got Cata Beta and ain't got time for this now!)  
- Don't need fallback strings for these, they're in the classic locales now.  
- Little bit of a temp workaround for GarrisonBuildings being Cached by one key and Tracked by another :weary: (should fix Account-Wide Garrison Buildings when tracking Recipes)  
- The creatureID fallback wasn't being used anymore for Faction names.  
- Moved the Required Reputation tooltip elements to the information type class.  
- tooltipInfo for consistency.  
- Adds pet names to Sprite Darter Egg and Tiny Crimson Whelpling  
- Added the "AsFriend" sub class for the faction class.  
- The faction class no longer supports achievements directly attached to a faction. (it didn't have any references anyways)  
- Killed support for AltAchievements.  
- Modules.Faction was empty, removing that.  
- Classic: Now using the Dragonflight class file.  
- Classic: Conduit and Runeforge Legendaries have their own source file now.  
- Last card  
- Some more Unsorted  
- Protector Breastplate  
- Cleaned up Warlords expansion file using expected cache functions and event handling and reduced indentation (GarrisonBuildings didn't seem to be properly cached for the Account, so it may be required to relog characters to properly update collection statuses for Account-Wide collection)  
- Moved more Item functionality into respective files  
- Moved CostItem logic into Item file  
- SOD: Added some missing Gnomer quests.  
- Retail: Added Dragonflight expansion file  
    Moved DrakewatcherManuscripts to Dragonflight expansion file  
- Reduced indentation of the Transmog file  
- SOD/Era: Fixed the phase detection for SOD.  
- Migrated Conduits/Runeforge Legendaries to Shadowlands Expansion file  
- HS Preparation HQT  
- SOD: Fixed a logic bug with the normal mode of BFD and Gnomer.  
- SOD: Added the loot table for Grubbis.  
- SOD: Added the loot table for Viscous Fallout.  
- Update Unsorted.lua  
- Hearthstone Event  
    Grovetender Card HQT  
- HS HQT  
- Retail: Using ItemWithAppearance class from Transmog file  
- SOD: Added the loot table for Electrocutioner 6000.  
- Retail: Quick rip-out of Retail's Item class into its own class file  
    Retail: Adjusted a lot of methods defined in Item context  
- Fix for incredibly niche error when ATT attempts to utilize data of a deleted character (tbh maybe all this logic isn't really needed at this point? ...)  
- SOD: Adjusted some Gnomer quests.  
- Hearthstone Updates  
    Cough.. Gold its SW\_CITY!  
- SOD: Added the loot table for Crowd Pummeler 9-60.  
- HS HQT  
    Revert Bartering change for now  
- SOD: Added the loot table for Mechanical Menagerie.  
- Prepped a little Ensembles Item class for future work  
- SOD: Added Thermaplugg's loot table.  
- tagged loamm niffen profession items as uncollectible as they are hidden quests.  
    maybe undo  
- cata groupfinder item tagged as removed  
- Melrache's Cape  
- Fixed a repeatable rare to be daily since it used to be 'isWorldQuest' which now means nothing for an NPC type  
- SOD: Gnomer part 2 (of like 10)  
- SOD: Gnomer data part one.  
