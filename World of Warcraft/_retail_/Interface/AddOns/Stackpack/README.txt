===========.
 Stackpack :
==========='
 10.2.7 :
========'

=========.
 Install :
========='

    Unzip the contents of this file to your World of Warcraft directory.
    The contents will automatically be placed in the correct folder.
    Stackpack will automatically run when the game starts.

=======.
 Usage :
======='

    Stackpack is set to run automatically at each startup.  However,
    you may use the slash commands below to control it.

    /stackpack help                     - View all Stackpack commands
    /stackpack <on|off>                 - Toggle Stackpack on or off
    /stackpack <go|scan|start|stack>    - Manually run Stackpack once
    /stackpack toggle                   - Toggle Stackpack off momentarily
    /stackpack search [query]           - Open the inventory search dialog
    /stackpack searchhelp               - Display help for inventory searching
    /stackpack searchon                 - Turn on inventory searching
    /stackpack searchoff                - Turn off inventory searching
    /stackpack itemid(s)                - Toggle on/off item IDs in tooltips
    /stackpack itemid(s)on              - Turn on item IDs in tooltips
    /stackpack itemid(s)off             - Turn off item IDs in tooltips
    /stackpack ilvl(s)                  - Toggle on/off item levels in tooltips
    /stackpack ilvl(s)on                - Turn on item levels in tooltips
    /stackpack ilvl(s)off               - Turn off item levels in tooltips
    /stackpack stacksize(s)             - Toggle on/off stack sizes in tooltips
    /stackpack stacksize(s)on           - Turn on stack sizes in tooltips
    /stackpack stacksize(s)off          - Turn off stack sizes in tooltips
    /stackpack news [n]                 - Show [n most recent] What's New entries
    /stackguild <on|off>                - Toggle Guild bank stacking on or off
    /stackgb <on|off>                   - Toggle Guild bank stacking on or off

    You may also use "/stp" with the commands above instead of "/stackpack".

================.
 Updates 10.2.7 :
================'

    Made API changes for TWW prepatch compatibility
    Started Prep work to support Warbands bank - not stacked yet
    Updated TOC versions and changed Wrath Classic to Cata Classic

================.
 Updates 10.2.6 :
================'

    Updated TOC.

================.
 Updates 10.2.5 :
================'

    Updated TOC.

=================.
 Updates 10.2.0a :
================='

    Updated to work on Classic versions
    Added an optional parameter to the "search" command, to say what to search for
    Added a "news" command, to show the "What's New" popup any time
    Added a "%pet%" filter
    Added filters for "%bopx%" and "%boex%" for what items were when acquired
    Reorganized and cleaned up filtering code for greater maintainability
    Suppressed extraneneous calls to filtering code for better performance
    Performed code standardization and cleanup
    Improved internal debugging framework
    Made several bug fixes and enhancements

================.
 Updates 10.2.0 :
================'

    Overhauled item move logic for efficiency and to fix looping bug
    Added prompt on first time opening a guild bank before doing guild bank stacking
    Added code to capture and display debugging messages
    Fixed max bag size for filtering
    Fixed keybinding header
    Changed version tracking to track latest version globally, not per character
    Added some internal tunables
    Applied miscellaneous bug fixes and code cleanup

=================.
 Updates 10.0.2b :
================='

    Fixed bug in saving search button visibility setting.
    Fixed bug where Reagent Bag was not being searched.

=================.
 Updates 10.0.2a :
================='

    Made the search button movable.
    Added stacksize to tooltips (/stackpack stacksize [on|off]).
    Made internal fixes to:
	Stop leaking functions and settings into global namespace
	Standardize whitespace and eliminate (most of) the extraneous ";" in the code
	Consolidate option setting/display code
    Combined saved variables into a single StackpackSettings table.
    NOTE: this last change means all saved settings are now reset to defaults!

================.
 Updates 10.0.2 :
================'

    Updated for API changes in 10.0.2.
    Fixed searching for %boa% to work again.
    Added support for the Dragonflight reagent bag (and related bag numbering changes).
    Significantly improved handling of large numbers of restackings, for guild banks in particular.
    Added notification when Stackpack has a lot to consolidate.

=================.
 Updates 10.0.0c :
================='

    Fixed visibility and scaling of StackPack search button.
    Search button no longer adds extra space to top of first Action Bar during/after resizing it.

=================.
 Updates 10.0.0b :
================='

    Fixed "blocked from an action" issue trying to use items.

=================.
 Updates 10.0.0a :
================='

    Fixed guild bank stacking.

================.
 Updates 10.0.0 :
================'

    Updated for MenuBar frame changes in 10.0.0.

===============.
 Updates 9.2.7 :
==============='

    Updated TOC.

===============.
 Updates 9.1.5 :
==============='

    Updated for API changes in 9.1.5.

===============.
 Updates 9.1.0 :
==============='

    Changed shortcut slash command to  /stp

===============.
 Updates 8.3.0 :
==============='

    Added option to display item levels in item tooltips.

===============.
 Updates 8.1.0 :
==============='

    Updated for 8.1:
        Stack Split button API changed slightly, causing manually split
        stacks to be instantly recombined (i.e. reverted 2.9.2). Fixed.
    Now uses AddonLoader.

===============.
 Updates 8.0.0 :
==============='

    Updated for BfA
    The reagent bank is now supported
    Includes updates to work with 8.0 API/UI changes
    Can now use filter   %ilvl%   in search field
        - ilvl also supports comparisons, so you can do   %ilvl>200%
        - You can use  <=  >=  <  >  for their usual meanings
        - You can use any of  !=  ~=  <>  to mean "does not equal"
        - You can use  ==  or  =   to mean "equals"
    Many filters have new aliases; see /stackpack searchhelp for details
    Search filters can now be preceded by  !  or  ~  to negate them
    Fixed bug with  %bop%  filter not always finding soulbound items

===============.
 Updates 6.2.0 :
==============='

    Updated for 6.2.
    Includes updates to work with 6.0 API changes
    Can now use filter   %bop%   in search field (identical to %soulbound%)
    Fixed bug with Stackpack blocking the tooltips for caged pets
    New versioning scheme

=============.
 Updates 3.2 :
============='

    Fixed errors when running Stackpack alongside Bagnon.

=============.
 Updates 3.1 :
============='

    Moved the inventory search icon to the right of your inventory bags.
        NOTE: Inventory search is still ENABLED by default.
              To turn it off (and hide the icon), please use
              /sp searchoff

    Your guild bank should no longer be stacked when the option is disabled.

    Pressing the "Stack Entire Bank" button will now stack all tabs in the
    guild bank even if you've turned off stacking with the /stackgb off
    option. This means you can keep automatic stacking disabled and still
    do it manually without having to toggle the option back on and then
    off again every time.

===============.
 Updates 3.0.2 :
==============='

    Changed TOC version back to 40000.

===============.
 Updates 3.0.1 :
==============='

    Changed /sp search to initialize an inventory search rather than
    toggle the search button on/off.  I was prompted to make this
    change after reading many user complaints on Curse.

=============.
 Updates 3.0 :
============='

    Updated some old code that probably crippled the inventory search
        for users running many addons.

    Fixed an issue where inventory searches were not being updated correctly.

    Inventory searches will now show the total number of results in the popup.

    Added the /sp searchhelp command for help with inventory searching.

    Pressing the Escape key in the inventory search window will now close it.

    Changed the inventory organization system to use container/item families.
    This change drastically improved inventory organization.  If you have
    special container(s) equipped (e.g. Tackle Box), all item(s) that can
    be placed into those containers will be moved there.

    Added new filters to the inventory search: boe (or bindonequip) and
    soulbound (works in bags, bank and guild bank!)

===============.
 Updates 2.9.2 :
==============='

    Items will no longer re-stack after splitting them. The next inventory
    change will be stacked.

    Fixed /sp toggle

===============.
 Updates 2.9.1 :
==============='

    Fixed an issue where Stackpack was not processing the ADDON_LOADED event.

=============.
 Updates 2.9 :
============='

    Updated for Cataclysm.

    Added exception lists for tradeskill bags to prevent certain items from
    trying to be placed in them.

=============.
 Updates 2.8 :
============='

    Weapon Vellum, Weapon Vellum II and Weapon Vellum III will now be placed
    in Enchanting bags, if possible.

    Item ID's can now be shown in tooltips, if desired.  This is mainly to
    assist in submitting items that are not disenchantable, but appear to be
    in your %disenchant% searches.  You can turn this functionality on/off
    with /stackpack itemid.  By default this feature is OFF.

    Added a new command to toggle inventory searching on/off -
        /stackpack search - as a convenience.

    Added some items to the list of non-enchantables.

=============.
 Updates 2.7 :
============='

    Stackpack will now try to stack after the loot frame is closed (if it is
    enabled).  This is mainly to ensure stacking happens after Prospecting.

    Added new search filters for all searches. Search filters should be
    enclosed in percent (%) signs.  Search filters can be used with or without
    search text. Do not add spaces before or after search filters.
    The filters can be typed before, after or in-between search text;
    their location in the search box doesn't matter.

        Example 1: %epic%%weapon%Needle <== Would return Surgeon's Needle
                                                         (and perhaps others)
        Example 2: %epic%%weapon% <== Would return all epic weapons
        Example 3: %weapon% <== Would return all weapons

        Filters:
            gray,junk,vendor,trash         Returns "gray" quality items
            white,common                   Returns "white" quality items
            green,uncommon                 Returns "green" quality items
            blue,rare                      Returns "blue" quality items
            purple,epic                    Returns "purple" quality items
            disenchant,disenchantable      Returns disenchantable items
            de,deable                      Returns disenchantable items
            weapon,weapons                 Returns weapons
            armor                          Returns armor

    Moved search result numbers to the center of their respective bags.
    This was done mainly because the number of results will greatly increase
    if searching with filters alone.

===============.
 Updates 2.6.2 :
==============='

    Added an option to turn on/off inventory searching.

===============.
 Updates 2.6.1 :
==============='

    Fixed a minor annoyance that caused dimmed search results to sometimes
    become highlighted again.

=============.
 Updates 2.6 :
============='

    Updated help text.

    Rearranged some elements of the personal bank frame. This was mainly done
    for users who do not have all extra bank bag slots purchased, as there was
    text and pricing information overlapping the search box and results text.

    Added a Search feature for regular inventory. The search button is located
    in place of the Keyring button, and the Keyring button has been moved left
    slightly. Clicking the search button will open a search dialog.
    NOTE: The search dialog is currently a static popup. This will be replaced
    by an advanced search frame in the next release.

===============.
 Updates 2.5.1 :
==============='

    Fixed an issue with searched items not staying highlighted when moved.

    Added/corrected some mistakes with items being placed into special bags.

=============.
 Updates 2.5 :
============='

    Crystallized <Air|Earth|Fire|Life|Water> will now be placed in
    tradeskill bags.

    Armor Vellum, Armor Vellum II and Armor Vellum III will now be placed in
    Enchanting bags.

    Changed /stackguildbank command to /stackgb.

    Added a Search feature to the personal bank window. You may now search
    your personal bank for items matching the specified text. Note that this
    is a loose search, so searching for "fire" would return both "Firebloom"
    and "Essence of Fire", for example.

    Added a Search feature to the Guild bank window. You may now search your
    entire guild bank for items matching the specified text. Note that this
    is a loose search, so searching for "fire" would return both "Firebloom"
    and "Essence of Fire", for example.

=============.
 Updates 2.4 :
============='

    Fixed stacking to work properly in WoTLK.

=============.
 Updates 2.3 :
============='

    Your personal bank will now indicate how many free slots are available
    in the title bar.

=============.
 Updates 2.2 :
============='

    Added the "/stackguild" command to toggle Guild bank stacking on or off.
    Default is ON.

    NOTE: This setting is saved PER CHARACTER.

=============.
 Updates 2.1 :
============='

    Fixed an issue that was preventing items from being stacked.

    Primal Life will now be placed inside Herb bags.

    Stacking across all bank tabs has been reverted. Stackpack will now stack
    items only in your current guild bank tab. A button has been added for
    users who want to stack across all bank tabs.

=============.
 Updates 2.0 :
============='

    Added a list of "special" items and the bags that they can be placed in.
    For example, Mote of Life is specified as type "Elemental", so it would
    not be placed into your Herb bag. With the new list in place, this item
    will now be placed into the Herb bag, if possible.

    Fixed a bug where splitting a stack and placing the partial stack into
    the backpack would not temporarily disable Stackpack as intended.

    Fixed a bug where splitting a stack would temporarily disable Stackpack
    while the bank or guild bank was open.

    Guild Banks will now be stacked across all tabs.

=============.
 Updates 1.9 :
============='

    Stackpack will now toggle itself off momentarily when you split a stack.
    It will continue to stack your items after you've placed the split stack
    into your inventory.

=============.
 Updates 1.8 :
============='

    Soul Shards will now be automatically moved into Soul Bags.

=============.
 Updates 1.7 :
============='

    Users with less than 5 bags should no longer experience errors.

=============.
 Updates 1.6 :
============='

    Stackpack should no longer play musical bags when you have more than 1 type
    of tradeskill bag equipped.

=============.
 Updates 1.5 :
============='

    Items should now stack a little faster in your guild bank.
    Users with "special" bag types (e.g. Herb Bag, Mining Bag, Quiver) will
    have the "special" items automatically placed into the bag, should it be
    in a standard bag.

        For example, you are carrying an Herb Bag that has 4 free slots left.
        You have 5 herbs scattered about your normal bags.
        Stackpack will take 4 of those herbs and put them into your Herb Bag,
        freeing up 4 slots in your general inventory.

    Bullets and Arrows will now be automatically stacked.

=============.
 Updates 1.4 :
============='

    Fixed a typo that caused 1.3 not to fix guild bank stacking.

=============.
 Updates 1.3 :
============='

    Stackpack will once again work with guild banks.
    Updated the version numbers to actually match the current version (doh!).

=============.
 Updates 1.2 :
============='

    Updated TOC for 2.4.

=============.
 Updates 1.1 :
============='

    Stackpack now supports Guild Banks for players who aren't the GM :)

=============.
 Updates 1.0 :
============='

    Stackpack now supports Guild Banks.

    Fixed an issue that would sometimes prevent Stackpack from stacking
    on slower machines.

==============.
 Updates 0.9c :
=============='

    Fixed the same problem in 0.9b concerning staggered bags, but for the bank.

==============.
 Updates 0.9b :
=============='

    Fixed a problem where items would not be stacked if the bags were not
    placed next to each other.

        For example, if you had 3 bags and they were placed in the 3
        right-most slots, Stackpack would work fine.  However, if you
        were to space those bags out - perhaps to slots 1, 3 and 5 -
        Stackpack would not stack all of your bags.  ( Until now :| )

    Fixed a problem with the toggle key.

==============.
 Updates 0.9a :
=============='

    Stackpack now supports users of the CT_MailMod addon, and will not stack
    items while the Send Mail or Mass Mail windows are open.

=============.
 Updates 0.9 :
============='

    Stackpack now fully supports ALL bag modification addons.

==============.
 Updates 0.8a :
=============='

    Stackpack now fully supports users of vBagnon.

=============.
 Updates 0.8 :
============='

    Stackpack now fully supports users of the OneBank/OneBag/OneView suite.

    The bindable "toggle" key works again - Whoops!

    Fixed an issue where pressing the bound "toggle" key for the first time
    would attempt to resume stacking rather than ignore it.

==============.
 Updates 0.7a :
=============='

    Stackpack will now continue to stack items while the bank window is open.
    To temporarily stop stacking, you may bind a key to the "toggle" feature
    or type /sp toggle.

=============.
 Updates 0.7 :
============='

    Bank slots and bank bags will now have their items stacked.

    Stackpack will no longer stack items while the bank window is open.

=============.
 Updates 0.6 :
============='

    Stackpack's method of stacking items is now completely controlled.
    You will no longer have trouble stacking multiple items at once.

    Stackpack will no longer stack items while the trade window is open.

    Stackpack will no longer stack items while the SEND mail window is open.

    Stackpack will no longer stack items while the auction window is open.

    You may bind a key to toggle Stackpack off momentarily. Once your
    inventory changes, Stackpack will turn itself back on. This is useful
    for turning Stackpack off briefly so you can split an item. If you
    toggle Stackpack off and your inventory does not change, Stackpack
    will remain off until it changes, or you may press the key again to
    toggle Stackpack back on.  You may also use /sp toggle.

=============.
 Updates 0.5 :
============='

    Updated to work with WoW 2.0.

==============.
 Updates 0.4b :
=============='

    Fixed an issue that would skip stacking if only 1 item was in the queue.

==============.
 Updates 0.4a :
=============='

    People with 1 bag will now be able to use Stackpack.  Oops.. ;\

=============.
 Updates 0.4 :
============='

    This update fixes numerous bugs, including one which prevented items
    with the same count from stacking.

    Added a little help menu, triggered by /stackpack help.

    I am aware of the bug that prevents items from stacking when they are
    being stacked from 3 or more bags.  I will resolve this issue soon,
    however the bugs that were fixed in this version demanded a release.

=============.
 Updates 0.3 :
============='

    Fixed bug that thought quest items and unique items were always stackable.

=============.
 Updates 0.2 :
============='

    There is a major bug with the SplitContainerItem() API which may actually
    destroy your items.  This bug occurs if Stackpack attempts to split more
    from a stack than exists, and has been fixed in this update.

=============.
 Updates 0.1 :
============='

    First release.

=======.
 Notes :
======='

    Created by JuiCe ( boxjuice@gmail.com )
    http://www.bosscube.com

    Current maintainer:  Rubio  ( rubio9 at curse.com )
