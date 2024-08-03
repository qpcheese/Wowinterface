local _
-- global functions and variebles to locals to keep LINT happy
local assert = _G.assert
local LibStub = _G.LibStub; assert(LibStub ~= nil,'LibStub')
local BACKPACK_CONTAINER = _G.BACKPACK_CONTAINER; assert(BACKPACK_CONTAINER ~= nil,'BACKPACK_CONTAINER')
local C_PetJournal = _G.C_PetJournal; assert(C_PetJournal ~= nil,'C_PetJournal')
local format = _G.format; assert(format ~= nil,'format')
local GetContainerItemID = _G.GetContainerItemID or C_Container.GetContainerItemID; assert(GetContainerItemID ~= nil,'GetContainerItemID')
local GetContainerItemInfo = _G.GetContainerItemInfo or C_Container.GetContainerItemInfo; assert(GetContainerItemInfo ~= nil,'GetContainerItemInfo')
local GetContainerItemLink = _G.GetContainerItemLink or C_Container.GetContainerItemLink; assert(GetContainerItemLink ~= nil,'GetContainerItemLink')
local GetContainerNumSlots = _G.GetContainerNumSlots or C_Container.GetContainerNumSlots; assert(GetContainerNumSlots ~= nil,'GetContainerNumSlots')
local GetItemCount = _G.GetItemCount or _G.C_Item.GetItemCount; assert(GetItemCount ~= nil,'GetItemCount')
local GetItemInfo = _G.GetItemInfo or _G.C_Item.GetItemInfo; assert(GetItemInfo ~= nil,'GetItemInfo')
local GetItemSpell = _G.GetItemSpell or _G.C_Item.GetItemSpell; assert(GetItemSpell ~= nil,'GetItemSpell')
local GetTime = _G.GetTime; assert(GetTime ~= nil,'GetTime')
local LOCKED = _G.LOCKED; assert(LOCKED ~= nil,'LOCKED')
local math = _G.math; assert(math ~= nil,'math')
local NUM_TOTAL_EQUIPPED_BAG_SLOTS = _G.NUM_TOTAL_EQUIPPED_BAG_SLOTS; assert(NUM_TOTAL_EQUIPPED_BAG_SLOTS ~= nil,'NUM_TOTAL_EQUIPPED_BAG_SLOTS')
local pairs = _G.pairs; assert(pairs ~= nil,'pairs')
local strfind = _G.strfind; assert(strfind ~= nil,'strfind')
local string = _G.string; assert(string ~= nil,'string')
local tonumber = _G.tonumber; assert(tonumber ~= nil,'tonumber')
local type = _G.type; assert(type ~= nil,'type')
local unpack = _G.unpack; assert(unpack ~= nil,'unpack')
local wipe = _G.wipe; assert(wipe ~= nil,'wipe')
local GetItemCooldown = _G.GetItemCooldown or _G.C_Item.GetItemCooldown; assert(GetItemCooldown ~= nil,'GetItemCooldown')
local UnpackAuraData = AuraUtil.UnpackAuraData; assert(UnpackAuraData ~= nil,'UnpackAuraData')
local GetPlayerAuraBySpellID = C_UnitAuras.GetPlayerAuraBySpellID; assert(GetPlayerAuraBySpellID ~= nil,'GetPlayerAuraBySpellID')
-- local AddOn
local ADDON, P = ...
local NOP = LibStub("AceAddon-3.0"):GetAddon(ADDON)
--
local T_BAGS = P.T_BAGS; assert(T_BAGS ~= nil,'T_BAGS')
local T_PICK = P.T_PICK; assert(T_PICK ~= nil,'T_PICK')
local T_BLACKLIST = P.T_BLACKLIST; assert(T_BLACKLIST ~= nil,'T_BLACKLIST')
local T_CHECK = P.T_CHECK; assert(T_CHECK ~= nil,'T_CHECK')
local T_OPEN = P.T_OPEN; assert(T_OPEN ~= nil,'T_OPEN')
local T_RECIPES_FIND = P.T_RECIPES_FIND; assert(T_RECIPES_FIND ~= nil,'T_RECIPES_FIND')
local T_SPELL_FIND = P.T_SPELL_FIND; assert(T_SPELL_FIND ~= nil,'T_SPELL_FIND')
local T_USE = P.T_USE; assert(T_USE ~= nil,'T_USE')
local print = P.print; assert(print ~= nil,'print')
local TIMER_IDLE = P.TIMER_IDLE; assert(TIMER_IDLE ~= nil,'TIMER_IDLE')
--
function NOP:ItemIsBlacklisted(itemID) -- is item blacklisted?
  if not itemID then return true end
  if T_BLACKLIST and T_BLACKLIST[itemID] then -- temporary blacklist
    self:Verbose("ItemIsBlacklisted:","itemID",itemID,"is temporary blacklisted")
    return true
  elseif NOP.AceDB.profile["T_BLACKLIST"] and NOP.AceDB.profile.T_BLACKLIST[itemID] then -- Permanent blacklist
    self:Verbose("ItemIsBlacklisted:","itemID",itemID,"is permanently blacklisted")
    return true
  elseif P.BLACKLIST[itemID] then
    self:Verbose("ItemIsBlacklisted:","itemID",itemID,"build-in blacklisted")
    return true
  end
end
function NOP:ItemGetSpell(itemID) -- looking for usable item by spell attached to item
  local spell = GetItemSpell(itemID)
  if spell and T_SPELL_FIND[spell] then
    local c, z, m = unpack(T_SPELL_FIND[spell],1,3)
    self:Verbose("ItemGetSpell:","itemID",itemID,"spell",spell)
    return c[1], c[2], z, m
  end
end
function NOP:ItemGetItem(itemID) -- looking for usable item by itemID returns (count, 2, zone, map, aura) or nil
  local ref = NOP.T_ITEMS[itemID] or NOP.T_DISENCHANT_ITEMS[itemID]
  if not ref then return end
  local c,z,m,a = unpack(ref,1,4)
  if m and not m[self.mapID] then
    self:Verbose("ItemGetItem:","itemID",itemID,"rejected by map use")
    return 0
  end -- map lock reject
  if a then
    local hasAura = false
    local name, icon, countAura, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnpackAuraData(GetPlayerAuraBySpellID(a))
    if spellID and (spellID == math.abs(a)) then -- already has aura from that item
      if (spellID == P.AURA_MINERS_COFFEE) then -- extra handling for this aura
        if (countAura >= NOP.AceDB.profile.cofeeStacks) then -- it has enough of stacks?
          self:Verbose("ItemGetItem:","itemID",itemID,"rejected already have aura",name,"with",countAura,"stacks")
          return 0
        end
      else
        hasAura = true
      end
    end
    if a > 0 and hasAura then
      self:Verbose("ItemGetItem:","itemID",itemID,"rejected already have aura",name)
      return 0
    elseif a < 0 and not hasAura then
      self:Verbose("ItemGetItem:","itemID",itemID,"rejected missing aura",name)
      return 0
    end
  end
  self:Verbose("ItemGetItem:","itemID",itemID,"will be shown",name,"count",c[1],"prio",c[2])
  return c[1], c[2], z, m, a
end
function NOP:ItemGetLockPattern(itemID, lines) -- test tooltip for locked item
  if NOP.AceDB.profile.profession and self.pickLockLevel and (#lines > 2) then -- rogue picklock in use
    local locked = -1 
    if string.match(lines[2].leftText,"^" .. LOCKED .. "$") then locked = 3 end -- LOCKED is Blizzard's UI global variable and is localized text of Locked, it must be at start of 2dn line in tooltip
    if string.match(lines[3].leftText,"^" .. LOCKED .. "$") then locked = 4 end -- color-blind mode adds extra line
    if locked > 0 then 
      local lockLevel = tonumber(string.match(lines[locked].leftText,"%d+")) -- this line must contain unlock level
      if lockLevel and (self.pickLockLevel >= lockLevel) then -- I can picklock this!
        self:Verbose("ItemGetLockPattern:",itemID,"LockeLevel",lockLevel)
        T_PICK[itemID] = true
        return 1, P.PRI_OPEN
      end
    end
  end
end
function NOP:ItemGetPattern(itemID,bag,slot) -- looking for usable item via pattern in tooltip returns (count, 2, zone, map) or nil
  local lines = NOP:GetTooltipLinesByBagItem(bag, slot)
  if (#lines < 1) then -- bug, all items should have tooltip!
    --self.scanFrame = self:TooltipCreate(P.TOOLTIP_SCAN) -- workaround for this obscure bug is reset parent for tooltip
    --self.scanFrame:ClearLines() -- clean tooltip frame
    print(format("|cFFFF0000Error|r broken tooltip for |cFFFF0000%s|r itemID(%d)",GetItemInfo(itemID) or "unknown",itemID))
    return -- invalid tooltip
  end
  local itemType, itemSubType, _, _, _, _, classID, subclassID = select(6, GetItemInfo(itemID))
  if classID == Enum.ItemClass.Miscellaneous and subclassID == Enum.ItemMiscellaneousSubclass.Mount then
    self:Verbose("ItemGetPattern:","itemID",itemID,name,"will be shown as MOUNT")
    return 1, P.PRIO_OPEN --fallback for mounts
  end
  local n, p = self:ItemGetLockPattern(itemID, lines)
  if n and n > 0 then return n, p end
  for i=1,#lines do -- scan all lines in tooltip
    local heading = lines[i] and lines[i].leftText
    if heading and heading ~= "" then
      if heading == ITEM_COSMETIC then
        if not NOP:ItemIsAppearanceCollected(lines) then
          self:Verbose("ItemGetPattern:","itemID",itemID,name,"will be shown as COSMETIC")
          return 1, P.PRI_OPEN
        else
          return 0
        end
      end
      if heading == TOY then
        if not NOP:ItemIsToyCollected(lines) then
          self:Verbose("ItemGetPattern:","itemID",itemID,name,"will be shown as TOY")
          return 1, P.PRI_OPEN
        else
          return 0
        end
      end
      --if classID ~= Enum.ItemClass.Weapon and classID ~= Enum.ItemClass.Armor then -- we want to check armor tokens, but illusions can trigger this... needs to be mitigated.
      if not self:IsTransmogColor(lines[i].leftColor:GetRGBAAsBytes()) then
        for key, data in pairs(T_RECIPES_FIND) do -- /run for k,v in pairs(NOP.private.T_RECIPES_FIND) do print(k,'"',unpack(v,2,2),'"') end
          local c, pattern, z, m, faction = unpack(data,1,5)
          if strfind(heading,pattern,1,true) then
            if faction then -- faction tokens can be skipped when exalted or when paragon reward pending
              local level, top, value, reward = self:GetReputation(heading)
              if (level and (level > 7) and NOP.AceDB.profile.SkipExalted) or reward then return end -- already exalted with faction for this token or have reward pending
            end
            self:Verbose("ItemGetPattern:","itemID",itemID,name,"will be shown as RECIPE")
            return c[1], c[2], z, m
          end
        end
      end
      for key, data in pairs(T_OPEN) do
        if strfind(heading,key,1,true) then
          local c, z, m = unpack(data,1,3)
          self:Verbose("ItemGetPattern:","itemID",itemID,name,"will be shown as OPEN")
          return c[1], c[2], z, m
        end
      end
    end
  end
  return 0 -- test OK but nothing found
end
local offset = 0
function NOP:ItemToUse(itemID,count,prio,zone,map,aura,source) -- store item into table
  self:Verbose("ItemToUse:","itemID",itemID,"count",count,"prio",prio,"zone",zone,"map",map,"aura",aura,"source",source)
  local pt = T_USE[itemID]
  if not pt then -- new item
    if (self.BF and self.BF.showID == nil) and (itemID == self.AceDB.char.itemID) then -- first time looking for item then get last item from last session
      T_USE[itemID] = {count, prio, zone, map, aura, GetTime()+1.0, GetItemCount(itemID)}
    else
      T_USE[itemID] = {count, prio, zone, map, aura, GetTime()+offset, GetItemCount(itemID)} -- seed with time
      offset = offset + 0.001
    end
    pt = T_USE[itemID]
  else -- update item
    if pt[7] and count and (pt[7] < count) and (GetItemCount(itemID) >= count) then pt[6] = GetTime() end -- trigger is rise count above limit
    pt[1] = count
    pt[2] = prio
    if pt[3] == nil then pt[3] = zone end
    if pt[4] == nil then pt[4] = map end
    if pt[5] == nil then pt[5] = aura end
    pt[7] = GetItemCount(itemID)
  end
end
function NOP:ItemScan() -- /run NOP:ItemScan(); foreach(T_USE,print)
  wipe(T_BAGS)
  for bag = BACKPACK_CONTAINER, NUM_TOTAL_EQUIPPED_BAG_SLOTS, 1 do
    for slot = 1, GetContainerNumSlots(bag), 1 do
      local itemID = GetContainerItemID(bag,slot)
      if (itemID ~= nil) then
        local itemLink = GetContainerItemLink(bag,slot) -- create link from slot, it will have type of item in bags
        T_BAGS[itemID] = {bag,slot,itemLink} -- index it for later use in macro and clear check table
      end
    end
  end
  for key in pairs(T_CHECK) do if not T_BAGS[key] then T_CHECK[key] = nil end end -- cleanup check table
  for key in pairs(T_USE) do if not T_BAGS[key] then T_USE[key] = nil end end  -- cleanup item table
  for itemID, data in pairs(T_BAGS) do
    if not T_CHECK[itemID] then -- not checked before
      T_CHECK[itemID] = true -- stop checking it except later T_USE will reset it
      if not self:ItemIsBlacklisted(itemID) then
        local bag, slot, itemLink = unpack(data)
        if itemLink then
          local _, _, linkColor, linkType, linkID = string.find(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):")
          if linkType == P.ITEM_TYPE_BATTLE_PET then
            local numCollected, limit = C_PetJournal.GetNumCollectedInfo(linkID)
            if (numCollected < limit) then
              self:ItemToUse(itemID, 1, P.PRI_OPEN, nil, nil, "PET")
            else
              self:Verbose("ItemScan:","Pet",itemID,"have more than limit",limit)
              T_USE[itemID] = nil
            end
          elseif linkType == P.ITEM_TYPE_ITEM then
            local count, prio, zone, map, aura = self:ItemGetSpell(itemID) -- 1st lookup by spell
            if count then 
              if (count > 0) then self:ItemToUse(itemID, count, prio, zone, map, aura, "SPELL") else T_USE[itemID] = nil end
            else
              count, prio, zone, map, aura = self:ItemGetItem(itemID) -- 2nd direct by itemID
              if count then 
                if (count > 0) then self:ItemToUse(itemID, count, prio, zone, map, aura, "ITEMID") else T_USE[itemID] = nil end
              else
                count, prio, zone, map, aura = self:ItemGetPattern(itemID,bag,slot) -- 3rd lookup by tooltip text
                if count then
                  if (count > 0) then self:ItemToUse(itemID, count, prio, zone, map, aura, "TOOLTIP") else T_USE[itemID] = nil end
                else
                  T_CHECK[itemID] = nil
                  T_USE[itemID] = nil
                end
              end
            end
          end
        else
          self:Verbose("ItemScan:","itemID",itemID,"don't return itemLink")
          T_USE[itemID] = nil
        end
      else
        self:Verbose("ItemScan:","itemID",itemID,"is blacklisted")
        T_USE[itemID] = nil
      end
    end
  end
end
function NOP:ItemIsUnusable(Red, Green, Blue, Alpha) -- test red color
  return (Red == 255 and Green == 32 and Blue == 32 and Alpha == 255)
end
function NOP:IsTransmogColor(Red, Green, Blue, Alpha) -- test pink color
  return (Red == 255 and Green == 128 and Blue == 255 and Alpha == 255)
end
function NOP:ItemIsAppearanceCollected(lines)
  if not lines then return false end
  local collected = true
  for i=1,#lines do
    if (lines[i] and lines[i].leftText) == TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN then
      collected = false
      break
    end
  end
  return collected
end
function NOP:ItemIsToyCollected(lines)
  if not lines then return false end
  local collected = false
  for i=1,#lines do
    if (lines[i] and lines[i].leftText) == ITEM_SPELL_KNOWN then
      --collected = true
      break
    end
  end
  return collected
end
function NOP:ItemIsUsable(itemID) -- look in tooltip if there is no red text
  if not T_BAGS[itemID] then return end -- don't have item
  local bag,slot,itemLink = unpack(T_BAGS[itemID])
  if itemLink then
    local _, _, linkColor, linkType, linkID = string.find(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):")
    if linkType == P.ITEM_TYPE_BATTLE_PET then return true end
  end
  local lines = NOP:GetTooltipLinesByBagItem(bag, slot)
  if (#lines < 1) then -- bug, all items should have tooltip!
    self:Verbose("ItemIsUsable:","itemID",itemID,"Empty tooltip!")
    --self.scanFrame = self:TooltipCreate(P.TOOLTIP_SCAN) -- workaround for this obscure bug is reset parent for tooltip
    --self.scanFrame:SetBagItem(bag, slot) -- fill up tooltip
  end
  if #lines > 0 then
    for i=1,#lines do -- scan all lines in tooltip
      if lines[i] and lines[i].leftText then
        local text = lines[i].leftText
        if text and text ~= "" then
          if self:ItemIsUnusable(lines[i].leftColor:GetRGBAAsBytes()) then 
            self:Verbose("itemID",itemID,"has red text in tooltip!",text)
            return false
          end
          if i == 1 then -- all faction tokens should be checked
            local level, top, value, reward = self:GetReputation(text)
            if level then
              if ((level > 7) and NOP.AceDB.profile.SkipExalted) or reward then return false end -- already exalted or paragon reward
              if self:ItemCD(itemID) then return false end -- CD other tokens can be used then
            end
          end
        end
      end
      if lines[i] and lines[i].rightText then
        local text = lines[i].rightText
        if text and text ~= "" then
          if self:ItemIsUnusable(lines[i].rightColor:GetRGBAAsBytes()) then 
            self:Verbose("itemID",itemID,"has red text in tooltip!",text)
            return false
          end
        end
      end
    end
    return true
  end
  self:Verbose("ItemIsUsable:","itemID",itemID,"Empty tooltip!")
  return false
end
function NOP:ItemToPicklock(itemID) -- need to find which item really need to unlock, locked and unlocked items have same itemID
  if not itemID then return end
  for bag = BACKPACK_CONTAINER, NUM_TOTAL_EQUIPPED_BAG_SLOTS, 1 do
    for slot = 1, GetContainerNumSlots(bag), 1 do
      local id = GetContainerItemID(bag,slot)
      if (id == itemID) then
        local lines = NOP:GetTooltipLinesByBagItem(bag, slot)
        if (#lines < 1) then -- bug, all items should have tooltip!
          self:Verbose("Broken tooltip on " .. id)
          --self.scanFrame = self:TooltipCreate(P.TOOLTIP_SCAN) -- workaround for this obscure bug is reset parent for tooltip
          --self.scanFrame:ClearLines() -- clean tooltip frame
          --self.scanFrame:SetBagItem(bag, slot) -- fill up tooltip
        end
        if self:ItemGetLockPattern(id, lines) then
          self:Verbose("ItemToPicklock:","Locked item",id,"bag",bag,"slot",slot)
          return bag, slot
        end
      end
    end
  end
end
function NOP:ItemShowRestart() -- new round?
  if self:BlacklistClear() then -- no more items to show, may be some are just temporary blacklisted
    print(P.L["RESTARTED_LOOKUP"])
    self:BAG_UPDATE() -- restart process
  else 
    self.AceDB.char.itemID = nil
    self:ButtonHide() -- hide button
  end
end
function NOP:ItemShow(itemID,prio) -- add item to button
  local bt = self.BF
  if not bt then return end
  if not itemID then self:ItemShowRestart(); return; end
  local bagID, slotID = unpack(T_BAGS[itemID])
  if not (bagID and slotID) then -- not in correct place
    self:BlacklistItem(false,itemID)
    self:ItemShowRestart()
    return
  end
  local isGlow = (prio == P.PRI_POPUP) or nil
  local itemCount = GetItemCount(itemID)
  local itemTexture = GetContainerItemInfo(bagID, slotID)
  if not itemTexture then -- not valid item info
    self:BlacklistItem(false,itemID)
    self:ItemShowRestart()
    return
  end
  if type(itemTexture) == "table" then
    itemTexture = itemTexture.iconFileID
  end
  --local mtext = format(P.MACRO_ACTIVE,itemID)
  --local mtarget = format("%d",itemID)
  local mtarget = format("item:%d", itemID)
  local mtargetitem = nil
  local mtype = "item"
  local mspell = nil
  if T_PICK[itemID] then -- item has picklock in tooltip
    local bag, slot = self:ItemToPicklock(itemID) -- find where in bags is item which still with unlock because same itemID can be unlocked or locked it depends on state of item
    if bag and slot then
      bagID = bag
      slotID = slot
      isGlow = true
      --mtext = format(P.MACRO_PICKLOCK,self.pickLockSpell,bagID,slotID) -- this one needs unlock
      mtype = "spell"
      mspell = self.pickLockSpell
      mtarget = nil
      mtargetitem = format("item:%d", itemID) --format("%d %d" ,bagID,slotID) -- this one needs unlock
    else
      T_PICK[itemID] = nil -- it not require lockpick anymore
    end
  elseif NOP.T_DISENCHANT_ITEMS[itemID] then
    isGlow = true
    --mtext = format(P.MACRO_DISENCHANT,itemID) -- disenchant this
    mtype = "spell"
    mspell = "Disenchant"
    mtarget = nil
    mtargetitem =  format("item:%d", itemID) --format("%d %d" ,bagID,slotID) -- disenchant this
  end
  if (bt.itemCount ~= itemCount) or (bt.itemID ~= itemID) or (bt.isGlow ~= isGlow) or (bt.mtext ~= mtext) or (bt.mtype ~= mtype) or (bt.mspell ~= mspell) or (bt.mtarget ~= mtarget) or (bt.mtargetitem ~= mtargetitem) then
    bt.prio = prio
    bt.showID = itemID
    bt.itemID = itemID
    bt.isGlow = isGlow
    --bt.mtext = mtext
    bt.mtype = mtype
    bt.mspell = mspell
    bt.mtarget = mtarget
    bt.mtargetitem = mtargetitem
    bt.bagID = bagID
    bt.slotID = slotID
    bt.itemCount = itemCount
    bt.itemTexture = itemTexture
    self.AceDB.char.itemID = itemID
    self:ButtonShow() -- show or refresh button
  end
end
function NOP:ItemCD(itemID) -- if item is on CD let's look for another
  local startTime, duration, enable = GetItemCooldown(itemID)
  return not (startTime == 0)
end
function NOP:ItemShowNew() -- check bags for usable item and place it on button
  self.preClick = nil -- from now error won't blacklist item on button
  if self:inCombat() or not (self.spellLoad and self.itemLoad) then self:TimerFire("ItemShowNew", P.TIMER_IDLE); return end
  self:Profile(true)
  self:ItemScan() -- rescan bags
  local toShow, prio, stamp = nil, 0, 0 -- item for use on button
  for itemID, data in pairs(T_USE) do
    local c, p, z, m, a, t = unpack(data,1,6)
    local inZone = not z
    if z then -- zone table can be {"sub-Zone","sub-Zone",...} | zoneID | {zoneID,zoneID,...}
      if type(z) == "table" then
        for i = 1, #z do
          if type(z[i]) == "string" then -- sub-zone string name
            if z[i] == self.Zone then
              inZone = true
            end
          end
        end
      end
      if inZone then
        p = P.PRI_POPUP
      else
        if NOP.AceDB.profile.zoneUnlock and not a then
          p = p + P.PRI_SKIP -- shift priority behind items not zone locked
          inZone = true
        else
          p = nil
        end
      end -- zone items outside zone have lowest priority else maximal priority
    end
    if a and (not inZone or not self:ItemGetItem(itemID)) then p = nil end -- zone items with buff only shown in proper zone and when no buff with defined stacks is on
    if z and (not inZone) then p = nil end -- rush orders shipyard have special handling
    if m and not m[self.mapID] then
      -- if itemID == 122594 then print(self.mapID); for k, v in pairs(m) do print(k,v) end; end
      p = nil
    end -- map lock
    self:Verbose("ItemShowNew:","itemID",itemID,"Zone",(inZone and "yes" or "no"),"Priority",((type(p) == "number") and p or "disabled"),"Stamp",t)
    if (type(p) == "number") and self:ItemIsUsable(itemID) and (GetItemCount(itemID) >= c) then -- have priority defined so it is candidate for button
      if (prio == 0) then -- 1st usable item set values to compare with
        toShow = itemID; prio = p; stamp = t
      else 
        if (p < prio) then -- higher priority
          toShow = itemID; prio = p; stamp = t
        else 
          if (p == prio) and (t > stamp) then -- same priority then compate by time
            toShow = itemID; prio = p; stamp = t
          end
        end
      end
    end
  end
  self:ItemShow(toShow,prio)
  self:Profile(false)
end
function NOP:ItemTimer() -- slow backpack recheck
  if self:inCombat() or not (self.spellLoad and self.itemLoad) then return end -- still loading or in combat
  wipe(T_CHECK) -- wipe cache
  self:ZONE_CHANGED() -- set map and reset cache
end
