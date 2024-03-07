local Loc = LibStub("AceLocale-3.0"):NewLocale("Details_EncounterDetails", "enUS", true) 

if (not Loc) then
	return 
end 

Loc ["STRING_PLUGIN_NAME"] = "Encounter Breakdown"
Loc ["STRING_WINDOW_TITLE"] = "Details! Encounter Breakdown"
Loc ["STRING_TOTAL_DAMAGE"] = "Total Damage"
Loc ["STRING_TOTAL_HEAL"] = "Total Heal"
Loc ["STRING_SHOW_ALL_DATA"] = "Show overall data"
Loc ["STRING_SHOW_PHASE_DATA"] = "Show details for this phase"
Loc ["STRING_NOT IMPLEMENTED"] = "Not implemented yet"
Loc ["STRING_DIED"] = "died"
Loc ["STRING_MELEE_DAMAGE"] = "melee damage"
Loc ["STRING_DAMAGE_TAKEN_REPORT"] = "Damage taken by"
Loc ["STRING_ABILITY_DAMAGE"] = "Ability damage"
Loc ["STRING_DAMAGE_TAKEN"] = "Damage Taken"
Loc ["STRING_TOOK_DAMAGE_FROM"] = "Took damage from"
Loc ["STRING_INTERRUPT_BY"] = "interrupted by"
Loc ["STRING_DISPELLED_BY"] = "dispelled by"
Loc ["STRING_DEAD_LOG"] = "last seconds of"
Loc ["STRING_CURRENT"] = "Current"
Loc ["STRING_TRY"] = "Fight"
Loc ["STRING_DAMAGE_AT"] = "Damage Taken"
Loc ["STRING_INFLICTED_BY"] = "Damage inflicted by"
Loc ["STRING_INFLICTED"] = "Damage inflicted"
Loc ["STRING_ADDS"] = "Adds"
Loc ["STRING_INTERRUPTS"] = "Interrupts"
Loc ["STRING_INTERRUPTS_OF"] = "Interrupts of"
Loc ["STRING_DISPELLS_OF"] = "dispells of"
Loc ["STRING_DISPELLS"] = "Dispells"
Loc ["STRING_DEATH_LOG"] = "Death Log"
Loc ["STRING_FIGHT_SUMMARY"] = "Encounter Summary"
Loc ["STRING_FIGHT_GRAPHIC"] = "Encounter Charts and Phases"
Loc ["STRING_FIGHT_EMOTES"] = "Encounter Emotes"
Loc ["STRING_FIGHT_SPELLS"] = "Encounter Spells and Auras"
Loc ["STRING_TOOLTIP"] = "Show Encounter Details Window"
Loc ["STRING_LAST_COOLDOWN"] = "last cooldown used"
Loc ["STRING_NOLAST_COOLDOWN"] = "no cooldown used"

Loc ["STRING_BOSS_NOT_REGISTRED"] = "This encounter isn't registred on Details!\nMake sure this raid is enabled over addon control panel on the character selection screen."

Loc ["STRING_HOLDSHIFT"] = "SHIFT For Spell Description"

Loc ["STRING_ADDS_HELP"] = "Mouse over |cFF00FF00Arrow Up|r\nfor dmg received, |cFFFF0000Arrow\n|cFFFF0000Down|r for dmg dealt. |cFFFFFF00Click\n|cFFFFFF00Arrow|r: Report the data\nshown on tooltip."
Loc ["STRING_INTERRIPT_HELP"] = " |cFFFFFF00Click|r on a bar:\nopen report window.\nIn the right we have the\namount interrupted against\nthe total times casted."
Loc ["STRING_DISPELL_HELP"] = " \n|cFFFFFF00Click|r on a bar:\nopen report window."
Loc ["STRING_DEATHS_HELP"] = " \n|cFFFFFF00Click|r on a bar:\nopen report window."

--mechanic types
Loc ["STRING_HEAL"] = "heal"
Loc ["STRING_LOWDPS"] = "lowdps"
Loc ["STRING_LOWHEAL"] = "lowheal"
Loc ["STRING_VOIDZONE"] = "voidzone"
Loc ["STRING_DISPELL"] = "dispell"
Loc ["STRING_INTERRUPT"] = "interrupt"
Loc ["STRING_POSITIONING"] = "positioning"
Loc ["STRING_RUNAWAY"] = "runaway"
Loc ["STRING_TANKSWITCH"] = "tankswitch"
Loc ["STRING_MECHANIC"] = "mechanic"
Loc ["STRING_CROWDCONTROL"] = "cc"
Loc ["STRING_TANKCOOLDOWN"] = "tankcooldown"
Loc ["STRING_KILLADD"] = "killadd"
Loc ["STRING_SPREADOUT"] = "spreadout"
Loc ["STRING_STOPCAST"] = "stopcast"
Loc ["STRING_FACING"] = "facing"
Loc ["STRING_STACK"] = "stack"
