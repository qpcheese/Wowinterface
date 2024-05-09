-- Using the Bagnon way to retrieve names, namespaces and stuff
local MODULE, moduleData =  ...
local Addon = _G[MODULE:match("[^_]+")]
Bagnon:NewModule("RequiredLevel", Addon)

local Unfit = LibStub('Unfit-1.0')

-- Lua API
local _G = _G
local string_find = string.find
local string_gsub = string.gsub
local string_match = string.match
local tonumber = tonumber

-- WoW API
local CreateFrame = _G.CreateFrame
local GetItemInfo = _G.GetItemInfo
local GetSpellInfo = _G.GetSpellInfo
local GetProfessions = _G.GetProfessions
local GetProfessionInfo = _G.GetProfessionInfo
local UnitLevel = _G.UnitLevel

local SpellBook_GetSpellBookSlot = _G.SpellBook_GetSpellBookSlot


-- WoW Strings
local ITEM_MIN_SKILL = _G.ITEM_MIN_SKILL
local ITEM_SPELL_KNOWN = _G.ITEM_SPELL_KNOWN


local locale = GetLocale()




-- For pre-Cata there is no GetProfessions() so we have to scan the spell book for
-- spells indicating that a profession was learned.
local professionSpells = nil
if LE_EXPANSION_LEVEL_CURRENT < 3 then

  -- Very cool trick by MunkDev: https://www.wowinterface.com/forums/showthread.php?p=325688#post325688
  local function StopLastSound()
    -- Play some sound to get a handle.
    local _, handle = PlaySound(SOUNDKIT[next(SOUNDKIT)], "SFX", false)
    if handle then
      -- print("muting sound", handle)
      -- Stop this sound and the previous.
      StopSound(handle-1)
      StopSound(handle)
    end
  end


  -- For the SpellButton frames to be available even before the SpellBook has been opened by a player,
  -- I need to open it silently.
  local learnedSpellEventFrame = CreateFrame("Frame")
  learnedSpellEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
  -- Listening to LEARNED_SPELL_IN_TAB should not be necessary, because SpellBookFrame itself
  -- listens to it and calls SpellBookFrame_Update() then.
  learnedSpellEventFrame:SetScript("OnEvent", function()

    -- Calling SpellBookFrame_Update() would be enough, but it spreads taint over the spellbook.
    -- ToggleSpellBook() ToggleSpellBook() is also not possible for some reason.
    -- But SpellBookFrame:Show() SpellBookFrame:Hide() works.
    if not SpellBookFrame:IsShown() then
      SpellBookFrame:Show()
      StopLastSound()
      SpellBookFrame:Hide()
      StopLastSound()
    end

    -- -- For testing:
    -- for i = 1, 24 do
      -- if _G["SpellButton" .. i] then
        -- print(i, _G["SpellButton" .. i])
        -- local slot, slotType, slotID = SpellBook_GetSpellBookSlot(_G["SpellButton" .. i])
        -- if slot then
          -- print(slot, slotType, slotID)
        -- end
      -- end
    -- end

  end)

  -- This table maps spell IDs (as returned by SpellBook_GetSpellBookSlot())
  -- e.g. https://www.wowhead.com/classic/spell=818/basic-campfire
  -- or   https://www.wowhead.com/wotlk/spell=32549/leatherworking
  -- to profession subclassID (as returned by GetItemInfo()).
  -- https://warcraft.wiki.gg/wiki/ItemType#9:_Recipe
  -- Thus, you can check if the player knows a certain profession, which does not
  -- seem to be possible otherwise in Classic, where there is no GetProfessions().
  professionSpells = {

     [2108] = 1, -- Leatherworking Apprentice
     [3104] = 1, -- Leatherworking Journeyman
     [3811] = 1, -- Leatherworking Expert
    [10662] = 1, -- Leatherworking Artisan
    [32549] = 1, -- Leatherworking Master (BC)
    [51302] = 1, -- Leatherworking Grand Master (Wrath)

     [3908] = 2, -- Tailoring Apprentice
     [3909] = 2, -- Tailoring Journeyman
     [3910] = 2, -- Tailoring Expert
    [12180] = 2, -- Tailoring Artisan
    [26790] = 2, -- Tailoring Master (BC)
    [51309] = 2, -- Tailoring Grand Master (Wrath)

     [4036] = 3, -- Engineering Apprentice
     [4037] = 3, -- Engineering Journeyman
     [4038] = 3, -- Engineering Expert
    [12656] = 3, -- Engineering Artisan
    [30350] = 3, -- Engineering Master (BC)
    [51306] = 3, -- Engineering Grand Master (Wrath)

     [2018] = 4, -- Blacksmithing Apprentice
     [3100] = 4, -- Blacksmithing Journeyman
     [3538] = 4, -- Blacksmithing Expert
     [9785] = 4, -- Blacksmithing Artisan
    [29844] = 4, -- Blacksmithing Master (BC)
    [51300] = 4, -- Blacksmithing Grand Master (Wrath)

      [818] = 5, -- Basic Campfire (Cooking)

     [2259] = 6, -- Alchemy Apprentice
     [3101] = 6, -- Alchemy Journeyman
     [3464] = 6, -- Alchemy Expert
    [11611] = 6, -- Alchemy Artisan
    [28596] = 6, -- Alchemy Master (BC)
    [51304] = 6, -- Alchemy Grand Master (Wrath)

     [3273] = 7, -- First Aid Apprentice
     [3274] = 7, -- First Aid Journeyman
     [7924] = 7, -- First Aid Expert
    [10846] = 7, -- First Aid Artisan
    [27028] = 7, -- First Aid Master (BC)
    [45542] = 7, -- First Aid Grand Master (Wrath)

     [7411] = 8, -- Enchanting Apprentice
     [7412] = 8, -- Enchanting Journeyman
     [7413] = 8, -- Enchanting Expert
    [13920] = 8, -- Enchanting Artisan
    [28029] = 8, -- Enchanting Master (BC)
    [51313] = 8, -- Enchanting Grand Master (Wrath)

     [7620] = 9, -- Fishing Apprentice
     [7731] = 9, -- Fishing Journeyman
     [7732] = 9, -- Fishing Expert
    [18248] = 9, -- Fishing Artisan
    [33095] = 9, -- Fishing Master (BC)
    [51294] = 9, -- Fishing Grand Master (Wrath)

    -- Inscription since BC.
    [25229] = 10, -- Jewelcrafting Apprentice
    [25230] = 10, -- Jewelcrafting Journeyman
    [28894] = 10, -- Jewelcrafting Expert
    [28895] = 10, -- Jewelcrafting Artisan
    [28897] = 10, -- Jewelcrafting Master (BC)
    [51311] = 10, -- Jewelcrafting Grand Master (Wrath)

    -- Inscription since Wrath.
    [45357] = 11, -- Inscription Apprentice
    [45358] = 11, -- Inscription Journeyman
    [45359] = 11, -- Inscription Expert
    [45360] = 11, -- Inscription Artisan
    [45361] = 11, -- Inscription Master (BC)
    [45363] = 11, -- Inscription Grand Master (Wrath)

    -- We are only interested in professions with recipes
    -- so no gathering skills here!
  }

end




-- Cache of our own RequiredLevel labels for quick access.
local cachedRequiredLevelLabels = {}
local GetRequiredLevelLabel = function(bagnonItem)

  if not cachedRequiredLevelLabels[bagnonItem] then

    -- Storing frames globally. Not sure why this is done, but I trust Goldpaw who does it like that.
    local requiredLevelFrameName = bagnonItem:GetName() .. "RequiredLevelFrame"
    local requiredLevelFrame = _G[requiredLevelFrameName]
    if (not requiredLevelFrame) then
      -- Adding an extra layer to get it above glow and border textures.
      requiredLevelFrame = CreateFrame("Frame", requiredLevelFrameName, bagnonItem)
      requiredLevelFrame:SetAllPoints()
    end

     -- Using standard blizzard fonts here
    local requiredLevelFrameString = requiredLevelFrame:CreateFontString()
    requiredLevelFrameString:SetDrawLayer("ARTWORK", 1)
    requiredLevelFrameString:SetPoint("BOTTOMLEFT", 2, 2)
    requiredLevelFrameString:SetTextColor(.95, .95, .95)

    cachedRequiredLevelLabels[bagnonItem] = requiredLevelFrameString
  end

  return cachedRequiredLevelLabels[bagnonItem]
end




-- Cache of Goldpaw's ItemBind labels for quick access.
-- Because we want to hide them when we show our RequiredLevel labels.
local cachedItemBindLabels = {}
local GetItemBindLabel = function(bagnonItem)
  if not cachedItemBindLabels[bagnonItem] then
    local goldpawFrame = _G[bagnonItem:GetName().."ExtraInfoFrame"]
    if goldpawFrame then
      for _, child in ipairs({goldpawFrame:GetRegions()}) do
        if child:IsObjectType("FontString") then
          local text = child:GetText()
          if text == "BoE" or text == "BoU" then
            cachedItemBindLabels[bagnonItem] = child
          end
        end
      end
    end
  end
  return cachedItemBindLabels[bagnonItem]
end






-- Tooltip used for scanning.
local scannerTooltip = CreateFrame("GameTooltip", "BagnonRequiredLevelScannerTooltip", nil, "GameTooltipTemplate")
scannerTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

local bankButtonIdOffset = BankButtonIDToInvSlotID(1) - 1

-- Function to set the tooltip to the current item.
local SetTooltip = function(bagnonItem)

  if not bagnonItem:IsCached() then

    scannerTooltip:ClearLines()
    if bagnonItem:GetBag() == -1 then
      -- SetBagItem() does not work for bank slots. So we use this instead.
      -- (Thanks to p3lim: https://www.wowinterface.com/forums/showthread.php?p=331883)
      scannerTooltip:SetInventoryItem('player', bagnonItem:GetID() + bankButtonIdOffset)
    else
      scannerTooltip:SetBagItem(bagnonItem:GetBag(), bagnonItem:GetID())
    end

    -- If the above fails for some reason, we fall back to the cached variant below.
    if scannerTooltip:NumLines() > 0 then return end

  end

  scannerTooltip:ClearLines()
  scannerTooltip:SetItemByID(bagnonItem.info.itemID)

end



local ItemNeedsLockpicking = function(bagnonItem)

  SetTooltip(bagnonItem)

  -- Get the localised name for Lockpicking.
  local localisedLockpicking = GetSpellInfo(1809)

  -- https://www.lua.org/pil/20.2.html
  -- "%s?%%.-s%s" matches both " %s " (EN), "%s " (FR) and " %1$s " (DE) in ITEM_MIN_SKILL.
  -- "%(%%.-d%)%s?" matches both "(%d)" (EN), "(%d) " (FR) and "(%2$d)" (DE) in ITEM_MIN_SKILL.
  searchPattern = string_gsub(string_gsub("^" .. ITEM_MIN_SKILL .. "$", "%s?%%.-s%s", ".-" .. localisedLockpicking .. ".-%%s"), "%(%%.-d%)%s?", "%%((%%d+)%%)%%s?")

  -- Tooltip and scanning by Phanx (https://www.wowinterface.com/forums/showthread.php?p=270331#post270331)
  for i = scannerTooltip:NumLines(), 2, -1 do
    local line = _G[scannerTooltip:GetName().."TextLeft"..i]
    if line then
      local msg = line:GetText()
      if msg then
        if string_find(msg, searchPattern) then
          local requiredSkill = string_match(msg, searchPattern)
          local _, g = line:GetTextColor()
          return true, (tonumber(g) < 0.2), requiredSkill
        end
      end
    end
  end

end



-- Function to return if the character has a certain profession.
-- For "Book" recipes we have to scan the tooltip
-- in order to extract and return the profession name.
--
-- The second argument is just for testing, where we allow the function call
-- with itemId only and bagnonItem == nil.
local CharacterHasProfession = function(bagnonItem, itemId)

  if not itemId then
    itemId = bagnonItem.info.itemID
  end

  local _, _, _, _, _, _, itemSubType, _, _, _, _, _, itemSubTypeId = GetItemInfo(itemId)


  -- For pre-Cata there is no GetProfessions() so we have to scan the spell book for
  -- spells indicating that a profession was learned.
  if LE_EXPANSION_LEVEL_CURRENT < 3 then

    for i = 1, 24 do
      if _G["SpellButton" .. i] then
        local slot, slotType, slotID = SpellBook_GetSpellBookSlot(_G["SpellButton" .. i])
        if slot then
          -- print(slot, slotType, slotID, GetSpellBookItemName(slot, SpellBookFrame.bookType))
          if professionSpells[slotID] == itemSubTypeId then
            return true, itemSubType
          end
        end
      end
    end

    return false, nil
  end


  -- "Design: Mass Prospect Empyrium" (152726) is falsely identified with itemSubType == "Inscription".
  -- And for books we cannot get the profession at all, which is why we have to scan the tooltip.
  if itemId == 152726 or itemSubTypeId == Enum.ItemRecipeSubclass.Book then

    if bagnonItem then
      SetTooltip(bagnonItem)
    else
      -- If this was called for testing with itemId only.
      scannerTooltip:ClearLines()
      scannerTooltip:SetItemByID(itemId)
    end

    -- Cannot do "for .. in ipairs", because if one profession is missing,
    -- the iteration would stop...
    local professionList = {}
    professionList[1], professionList[2], professionList[3], professionList[4], professionList[5] = GetProfessions()
    for i = 1, 5 do
      if professionList[i] then

        local professionName = GetProfessionInfo(professionList[i])

        -- https://www.lua.org/pil/20.2.html
        -- "%s?%%.-s%s" matches both " %s " (EN), "%s " (FR) and " %1$s " (DE) in ITEM_MIN_SKILL.
        -- "%(%%.-d%)%s?" matches both "(%d)" (EN), "(%d) " (FR) and "(%2$d)" (DE) in ITEM_MIN_SKILL.
        searchPattern = string_gsub(string_gsub("^" .. ITEM_MIN_SKILL .. "$", "%s?%%.-s%s", ".-" .. professionName .. ".-%%s"), "%(%%.-d%)%s?", ".-")

        -- Tooltip and scanning by Phanx (https://www.wowinterface.com/forums/showthread.php?p=270331#post270331)
        for i = scannerTooltip:NumLines(), 2, -1 do
          local line = _G[scannerTooltip:GetName().."TextLeft"..i]
          if line then
            local msg = line:GetText()
            if msg then
              if string_find(msg, searchPattern) then
                return true, professionName
              end
            end
          end
        end

      end
    end

    -- Check if this is a book without any profession.
    -- Like e.g. "Rockin' Rollin' Racer Pack" (187560).
    -- (searchPattern is the same as above but with .- instead of professionName)
    searchPattern = string_gsub(string_gsub("^" .. ITEM_MIN_SKILL .. "$", "%s?%%.-s%s", ".-%%s"), "%(%%.-d%)%s?", ".-")
    for i = scannerTooltip:NumLines(), 2, -1 do
      local line = _G[scannerTooltip:GetName().."TextLeft"..i]
      if line then
        local msg = line:GetText()
        if msg then
          -- This book actually has a profession, which the character does not know.
          if string_find(msg, searchPattern) then
            return false, nil
          end
        end
      end
    end

    -- This book has no profession.
    return true, nil

  -- For all other recipes, itemSubType is also the profession name.
  else
    -- Cannot do "for .. in ipairs", because if one profession is missing,
    -- the iteration would stop...
    local professionList = {}
    professionList[1], professionList[2], professionList[3], professionList[4], professionList[5] = GetProfessions()
    for i = 1, 5 do
      if professionList[i] then
        if itemSubType == GetProfessionInfo(professionList[i]) then
          return true, itemSubType
        end
      end
    end

    return false, nil
  end

end



-- expansionPrefixes:
-- Define here what should be printed before the skill level of recipes.
moduleData.EP_VANILLA =  "1"
moduleData.EP_BC =       "2"
moduleData.EP_WRATH =    "3"
moduleData.EP_CATA =     "4"
moduleData.EP_PANDARIA = "5"
moduleData.EP_WOD =      "6"
moduleData.EP_LEGION =   "7"
moduleData.EP_BFA =      "8"
moduleData.EP_SL =       "9"
moduleData.EP_DF =       "10"



-- Input:   professionName  : The localised profession name to search for.
--          bagnonItem        : The current bagnonItem; needed to set tooltip.
-- Output:  alreadyKnown    : True if recipe is already known.
--          notEnoughSkill  : True if character does not have enough profession skill.
--          expansionPrefix : Prefix depending on the recipe's WoW expansion.
--          requiredSkill   : Required profession skill to learn recipe.
local ReadRecipeTooltip = function(professionName, bagnonItem)

  SetTooltip(bagnonItem)

  -- https://www.lua.org/pil/20.2.html
  local searchPattern = nil
  local searchOnlySkillPattern = nil

  -- If the locale is not known, just search for the required skill and ignore the expansion.
  -- The same, if we are in Classic, because there were no expansion specific profession levels then.
  if not moduleData.itemMinSkillString[locale] or not moduleData.expansionIdentifierToVersionNumber[locale]
      or WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE then
    searchOnlySkillPattern = "^.*%((%d+)%).*$"
  else
    -- ITEM_MIN_SKILL = "Requires %s (%d)"
    -- ...must be turned into: "^Requires%s(.*)%s?" .. localisedItemMinSkill .. "%s%((%d+)%)$"
    -- But watch out: For different locales the order of words is different (see below)!

    -- Need %%%%s here, because this string will be inserted twice.
    local localisedItemMinSkill = string_gsub(string_gsub(string_gsub(moduleData.itemMinSkillString[locale], " ", "%%%%s?"), "e", "(.*)"), "p", professionName)

    -- "%s?%%.-s%s" matches both " %s " (EN), "%s " (FR) and " %1$s " (DE) in ITEM_MIN_SKILL.
    -- "%(%%.-d%)%s?" matches both "(%d)" (EN), "(%d) " (FR) and "(%2$d)" (DE) in ITEM_MIN_SKILL.
    searchPattern = string_gsub(string_gsub("^" .. ITEM_MIN_SKILL .. "$", "%s?%%.-s%s", "%%s?" .. localisedItemMinSkill .. "%%s"), "%(%%.-d%)%s?", "%%((%%d+)%%)%%s?")
  end

  -- Tooltip and scanning by Phanx (https://www.wowinterface.com/forums/showthread.php?p=270331#post270331)

  -- In classic we have to search from top to bottom, because the "Requires ingredients (amount)" line
  -- is further below, which also matches our regular expression.
  local start = scannerTooltip:NumLines()
  local stop = 2
  local incr = -1
  if WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE then
    start = 2
    stop = scannerTooltip:NumLines()
    incr = 1
  end

  for i = start, stop, incr do
    local line = _G[scannerTooltip:GetName().."TextLeft"..i]
    if line then
      local msg = line:GetText()
      if msg then

        if msg == ITEM_SPELL_KNOWN then
          -- If the recipe is already known, we are not interested in its required skill level!
          return true, nil, nil, nil

        elseif searchPattern then

          local expansionIdentifier, requiredSkill = nil, nil
          if string_find(msg, searchPattern) then
            expansionIdentifier, requiredSkill = string_match(msg, searchPattern)

          -- It may happen that the order of profession name and expansion identifier are opposite (e.g. "Klassische ..." in German).
          -- So if we do not find it, we check the other way around as well (swapped "p" and "e").
          else
            local localisedItemMinSkillInverse = string_gsub(string_gsub(string_gsub(moduleData.itemMinSkillString[locale], " ", "%%%%s?"), "p", "(.*)"), "e", professionName)
            local searchPatternInverse = string_gsub(string_gsub("^" .. ITEM_MIN_SKILL .. "$", "%s?%%.-s%s", "%%s?" .. localisedItemMinSkillInverse .. "%%s"), "%(%%.-d%)%s?", "%%((%%d+)%%)%%s?")
            if string_find(msg, searchPatternInverse) then
              expansionIdentifier, requiredSkill = string_match(msg, searchPatternInverse)
            end
          end

          if expansionIdentifier ~= nil and requiredSkill ~= nil then
            -- print(expansionIdentifier, requiredSkill)

            -- Trim trailing blank space if any.
            expansionIdentifier = string_gsub(expansionIdentifier, "^(.-)%s$", "%1")

            -- To check if recipe can be learned, i.e. text is not red.
            local _, g = line:GetTextColor()

            -- Check if the expansionIdentifier is actually known.
            local expansionPrefix = moduleData.expansionIdentifierToVersionNumber[locale][expansionIdentifier]
            if not expansionPrefix then
              print ("Bagnon_RequiredLevel (ERROR): Could not find", expansionIdentifier, "for", locale)
              expansionPrefix = "?"
            end

            return false, (tonumber(g) < 0.2), expansionPrefix .. ".", requiredSkill
          end

        elseif searchOnlySkillPattern and string_find(msg, searchOnlySkillPattern) then
          local requiredSkill = string_match(msg, searchOnlySkillPattern)
          -- Check if recipe can be learned, i.e. text is not red.
          local _, g = line:GetTextColor()
          return false, (tonumber(g) < 0.2), "", requiredSkill
        end
      end
    end
  end

  -- We may actually reach here if a non-recipe item swaps slots with a recipe item.
  return nil, nil, nil, nil

end



local PostUpdateButton = function(bagnonItem)

  if bagnonItem and bagnonItem.info and bagnonItem.info.itemID and bagnonItem.info.hyperlink then

    local item = Item:CreateFromItemID(bagnonItem.info.itemID)
    if not item:IsItemEmpty() then
      item:ContinueOnItemLoad(function()

        -- Locked items should always be greyed out.
        if bagnonItem.info.locked then
          local buttonIconTexture = _G[bagnonItem:GetName().."IconTexture"]
          buttonIconTexture:SetVertexColor(1,1,1)
          buttonIconTexture:SetDesaturated(1)
        end


        local requiredLevelLabel = GetRequiredLevelLabel(bagnonItem)
        -- Got to set a default font.
        requiredLevelLabel:SetFont("Fonts\\ARIALN.TTF", 14, "OUTLINE")

        -- Get some blizzard info about the current item.
        -- Got to use bagnonItem.info.hyperlink instead of bagnonItem.info.itemID,
        -- because the latter may return the item with a default itemMinLevel.
        local _, _, _, _, itemMinLevel, _, itemSubType, _, _, _, _, itemTypeId, itemSubTypeId = GetItemInfo(bagnonItem.info.hyperlink)

        -- Get Goldpaw's "BoE" text and hide it, if it exists.
        -- It will be shown later if not replaced by "required level" text.
        local itemBindLabel = GetItemBindLabel(bagnonItem)
        if itemBindLabel then itemBindLabel:Hide() end


        -- Check for Junkboxes and Lockboxes (Miscellaneous Junk).
        if itemTypeId == 15 and itemSubTypeId == 0 then
          local itemNeedsLockpicking, notEnoughSkill, requiredSkill = ItemNeedsLockpicking(bagnonItem)

          if itemNeedsLockpicking then
            if notEnoughSkill then

              requiredLevelLabel:SetFont("Fonts\\ARIALN.TTF", 12, "OUTLINE")
              requiredLevelLabel:SetText(requiredSkill)

              if not bagnonItem.info.locked then
                local buttonIconTexture = _G[bagnonItem:GetName().."IconTexture"]
                buttonIconTexture:SetVertexColor(1,.3,.3)
                buttonIconTexture:SetDesaturated(1)
              end
              return
            end
          end
        end


        if itemMinLevel and itemMinLevel > UnitLevel("player") then
          if not Unfit:IsItemUnusable(bagnonItem.info.itemID) then
            requiredLevelLabel:SetText(itemMinLevel)
            if not bagnonItem.info.locked then
              local buttonIconTexture = _G[bagnonItem:GetName().."IconTexture"]
              buttonIconTexture:SetVertexColor(1,.3,.3)
              buttonIconTexture:SetDesaturated(1)
            end
          else
            if itemBindLabel then itemBindLabel:Show() end
          end
          return
        end

        if itemTypeId == Enum.ItemClass.Recipe then

          -- For almost all recipes, itemSubType is also the profession name.
          -- https://warcraft.wiki.gg/wiki/ItemType
          -- However, for "Book" recipes we have to extract the profession name from
          -- the tooltip. We do this at the same time as checking if the player has
          -- the profession at all. Thus, we only have to scan the tooltip for the professions
          -- the player has.
          local hasProfession, professionName = CharacterHasProfession(bagnonItem)

          if not hasProfession then
            if itemBindLabel then itemBindLabel:Show() end
            requiredLevelLabel:SetText("")

            if Addon.sets.glowUnusable then
              r, g, b = RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b
              bagnonItem.IconBorder:SetTexture(id and C_ArtifactUI.GetRelicInfoByItemID(id) and 'Interface\\Artifacts\\RelicIconFrame' or 'Interface\\Common\\WhiteIconFrame')
              bagnonItem.IconBorder:SetVertexColor(r, g, b)
              bagnonItem.IconBorder:SetShown(r)
              bagnonItem.IconGlow:SetVertexColor(r, g, b, Addon.sets.glowAlpha)
              bagnonItem.IconGlow:SetShown(r)
            end
            return
          end

          if not professionName then
            -- print("This was a book without profession!")
            return
          end

          -- Scan tooltip. (Not checking for itemSubTypeId != Enum.ItemRecipeSubclass.Book here because of efficiency.)
          local alreadyKnown, notEnoughSkill, expansionPrefix, requiredSkill = ReadRecipeTooltip(professionName, bagnonItem)

          if alreadyKnown then
            if itemBindLabel then itemBindLabel:Show() end
            requiredLevelLabel:SetText("")
            if not bagnonItem.info.locked then
              local buttonIconTexture = _G[bagnonItem:GetName().."IconTexture"]
              buttonIconTexture:SetVertexColor(.4,.4,.4)
              buttonIconTexture:SetDesaturated(1)
            end
            return
          end

          if notEnoughSkill then

            requiredLevelLabel:SetFont("Fonts\\ARIALN.TTF", 12, "OUTLINE")
            requiredLevelLabel:SetText(expansionPrefix .. requiredSkill)

            if not bagnonItem.info.locked then
              local buttonIconTexture = _G[bagnonItem:GetName().."IconTexture"]
              buttonIconTexture:SetVertexColor(1,.3,.3)
              buttonIconTexture:SetDesaturated(1)
            end
            return
          end

          -- Recipe is actually learnable.
          if itemBindLabel then itemBindLabel:Show() end
          requiredLevelLabel:SetText("")
          if not bagnonItem.info.locked then
            local buttonIconTexture = _G[bagnonItem:GetName().."IconTexture"]
            buttonIconTexture:SetVertexColor(1,1,1)
            buttonIconTexture:SetDesaturated(nil)
          end
          return
        end

        -- Any other item.
        if itemBindLabel then itemBindLabel:Show() end
        requiredLevelLabel:SetText("")
        if not bagnonItem.info.locked then
          local buttonIconTexture = _G[bagnonItem:GetName().."IconTexture"]
          buttonIconTexture:SetVertexColor(1,1,1)
          buttonIconTexture:SetDesaturated(nil)
        end
      end)
    end
  else
    -- Need to unset the label, when there is no item in an item slot any more.
    if cachedRequiredLevelLabels[bagnonItem] then
      cachedRequiredLevelLabels[bagnonItem]:SetText("")
    end
  end
end



local PostUpdateButtonWrapper = function(bagnonItem)

  -- Hide the goldpawFrame until after PostUpdateButton has had a chance
  -- to hide the "BoE" text in it.
  local goldpawFrame = _G[bagnonItem:GetName().."ExtraInfoFrame"]
  if goldpawFrame then goldpawFrame:Hide() end
  PostUpdateButton(bagnonItem)
  if goldpawFrame then goldpawFrame:Show() end

end







-- - Bagnon.ContainerItem is for retail. If I use Bagnon.Item instead,
--   there are no UpdateCooldown and UpdateLocked functions to hook,
--   which I need to keep my colour modifications of the icons.
local item = Bagnon.ContainerItem

if item then

  if item.Update then
    hooksecurefunc(item, "Update", PostUpdateButtonWrapper)
  end

  -- -- Needed because otherwise UpdateUpgradeIcon will reset the VertexColor.
  if item.UpdateUpgradeIcon then
    hooksecurefunc(item, "UpdateUpgradeIcon", PostUpdateButtonWrapper)
  end

  -- -- Needed to set the VertexColor in time, when BAG_UPDATE_COOLDOWN is triggered.
  if item.UpdateCooldown then
    hooksecurefunc(item, "UpdateCooldown", PostUpdateButtonWrapper)
  end

  -- Needed to keep the desaturation.
  if item.UpdateLocked then
    hooksecurefunc(item, "UpdateLocked", PostUpdateButtonWrapper)
  end

end






-- -- To test CharacterHasProfession() on items by item id:
-- local testframe1 = CreateFrame("Frame", _, UIParent, BackdropTemplateMixin and "BackdropTemplate")
-- testframe1:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                      -- edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
                      -- tile = true, tileSize = 16, edgeSize = 16,
                      -- insets = { left = 4, right = 4, top = 4, bottom = 4 }})
-- testframe1:SetBackdropColor(0.0, 0.0, 0.0, 1.0)
-- testframe1:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

-- testframe1:SetWidth(300)
-- testframe1:SetHeight(100)

-- testframe1:SetMovable(true)
-- testframe1:EnableMouse(true)
-- testframe1:RegisterForDrag("LeftButton")
-- testframe1:SetScript("OnDragStart", testframe1.StartMoving)
-- testframe1:SetScript("OnDragStop", testframe1.StopMovingOrSizing)
-- testframe1:SetClampedToScreen(true)

-- testframe1:SetScript("OnEnter", function()

  -- local itemId = 34109    -- Weather-Beaten Journal (Fishing book).
  -- -- local itemId = 45912    -- Book of Glyph Mastery (Inscription book).
  -- -- local itemId = 187560   -- Rockin' Rollin' Racer Pack (book without profession).

  -- print(CharacterHasProfession(nil, itemId))

  -- -- Just for visual inspection of the tooltip.
  -- GameTooltip:SetOwner(testframe1, "ANCHOR_TOPLEFT")
  -- GameTooltip:SetItemByID(itemId)
  -- GameTooltip:Show()

-- end )



