Overview

This is a simple quality of life addon, intended to further simplify the process of using tdBattlePetScript and Rematch to level up your pets with Squirt in the WoD Garrison, or using the repeatable pet battles from the Legion world quests.

This addon adds automatic healing and NPC interaction to the mix.  By use of macros and temporary key binds it will target and interact with the NPCs to start the pet battles, and while fighting in your Garrison will use the nearby Stable Master NPC to heal.  Outside of the Garrison it will use Revive Battle Pets and Battle Pet Bandages as needed.  (Bandages are disabled by default - right click the button to toggle this.  See Buffing and Bandage Options below for details.)

To enable the functions, just use the console command "/ultra".  The Space key is assigned by default to run the addon functions while the window is open.  To return to normal, simply close the window, either by clicking the close button or type "/ultra" again.

Each action requires a hardware input from the player, i.e. a key press (Space by default) or mouse button.


Quick Start

Be sure to have Rematch set up with a team ready for power levelling battle pets with Squirt, and make sure the pet team is loaded. You can find more information on this over at Xu-Fu's: https://www.wow-petguide.com/index.php?m=Powerleveling

Add any pets you would like to level to the Rematch levelling queue.

Make sure tdBattlePetScript is set with the appropriate script (again see Xu-Fu's for details).  You should make sure that this works to complete the desired battle.

Type /ultra to open the UltraSquirt window.

Squirt is set as the intended NPC to battle by default.  To change this, target the desired NPC and click the crosshairs button.  (This is limited to Squirt and the repeatable pet fights from Legion.)

Press the Space key to take the next action.


Key Binding

By default, the Space key is used to take the next action.  You can change this from the addons options menu (Escape > Interface > Addons tab > UltraSquirt).  Note that a hotkey must be configured to use the addon.  You can also access the same option by typing "/ultra config".

The current hotkey can be seen on the UltraSquirt window.


Reset Window and Settings

If needed, you can reset the addon to the default settings by typing "/ultra reset".  This will reset the window position, the key bind, any buffing options, the target NPC, and the target NPC's healing threshold.


Buffing and Bandage Options

There are additional buttons on the UltraSquirt window for the Safari Hat, Lesser and regular Pet Treats, Revive Battle Pets, and Battle Pet Bandages.

By default, the Safari Hat toy will automatically be used if your account has it and the buff is missing.  Revive Battle Pets will be automatically used when the pets are damaged and require healing between battles, and it is off cooldown.

The status of the buttons is based on the Pet Action Bar that a Warlock or Hunter would have.  Right click to toggle each button - the light sparkles around each button will show whether it is enabled.  The four markers in each corner of a button shows that the addon will use this item/ability automatically if enabled.  Where these markers are missing (i.e. on the two Pet Treats), it is not possible to cast this automatically - instead when the buff is missing the button will have a bright glow to remind you to recast the buff (the same glow animation you see on your Action Bars when a spell procs).

Note that when fighting Squirt in the WoD Garrison the addon will automatically use the nearby Stable Master NPC to heal, allowing you to save on bandages.  Enabling the automatic use of Bandages will override this (until you run out of bandages).

The priority order for healing is: Revive Battle Pets >> Battle Pet Bandage >> Stable Master (for Squirt only).


Healing Threshold

Certain repeatable fights, it is not necessary to heal your pets after every battle.  Drag the slider in the UltraSquirt window to the desired level.  Pets will not be healed until at least one slotted pet is below this threshold.

For example, fighting Odrogg (Snail Fight!) in Highmountain with a Teroclaw Hatchling you can comfortably set this to 80% without any risk of the fight failing.  https://www.wow-petguide.com/?Strategy=835

Note that this option is saved to the currently selected NPC.


Rematch Healthiest Pets Option

Rematch has an experimental option that will automatically switch your slotted pets to the healthiest available if you have duplicates.  To enable this in Rematch, go to Rematch >> Options >> Team Options.  Tick the checkboxes beside the options "Load Healthiest Pets" and "After Pet Battles Too".  Typically, you should not use the option "Allow Any Version" as many pet battle teams have specific breed or stat requirements.

UltraSquirt will detect that both options are enabled and will pause for a few moments after each pet battle completes to allow Rematch to update the pets.

This can work very well in combination with the Healing Threshold option above, and in many cases means you can continuously fight using very few, if any, bandages.


Localisations

All locales have now been added.  This was done using Azure Cognitive Services Translator.  Unfortunately, this does not include a separate option for esMX - Spanish (Mexico), so this is currently a copy of esES - Spanish (Spain).

Please let me know if the translations to your language have any issues.


Additional Notes

If regular combat is detected, the addon window will close automatically.

The addon functions by using a combination of macros and temporary key binds to run.  Each action required user interaction.

To interact with NPCs, the addon uses Interact With Target and the Click-to-Move options.  These are built into Warcraft - the addon simply takes advantage of them.

When fighting Squirt, your character can sometimes be caught on the fenceposts around the pet battle arena.  If this happens just hit a strafe key to adjust your path, and then continue as normal.

When fighting NPCs other than Squirt, you can sometimes reach a point where pets are too damaged to battle, and healing from Revive Battle Pets or Battle Pet Bandages is unavailable due to being on cooldown, disabled, or there being no bandages left in your character's inventory.  The addon will do nothing until this is resolved (usually when the Revive Battle Pets cooldown runs out).  The addon will run a "/target player" macro in this situation.


To-Do List

Add tooltips to the action buttons.

Update Spanish (Mexico) translations from Google (Azure does not have this as an option).

Add ability to add a specific NPC to the list of accepted targets (for future use, or niche cases).  Currently only Squirt and the repeatable Legion tamers are allowed, and this will give an error message if another target is selected.

Add element to UI to show what the current action is, especially relevant where no action is being taken.