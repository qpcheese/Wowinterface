-- icons to display opponent's active abilities and their cooldown state

local _,t = ...
t.abilities = CreateFrame("Frame",nil,UIParent,BackdropTemplateMixin and "BackdropTemplate")

t.abilities.vulnerabilities = {{4,5},{1,3},{6,8},{5,2},{8,7},{2,9},{9,10},{10,1},{3,4},{7,6}} -- for hints
t.abilities.buttons = {} -- the ability buttons displayed in the window
 
-- indexed by petIndex of enemy and then abilityIndex, the abilityIDs of the enemy pets
t.abilities.enemyAbilities = {{{},{},{}},{{},{},{}},{{},{},{}}}

local abilityList = {}
local levelList = {}

function t.abilities:Setup()
    self:Hide()
    -- setup the visible window
    self:SetSize(172,68)
    self:SetPoint("BOTTOM",PetBattleFrame.BottomFrame,"TOP",0,8)
    -- set up the 3 main ability buttons and the 3 extra buttons when an ability isn't certain (pvp)
    for i=1,6 do
        self.buttons[i] = t.abilities:CreateAbilityButton()
        t.abilities:SetButtonHalfHeight(self.buttons[i],false)
        if i<=3 then
            self.buttons[i]:SetPoint("TOPLEFT",(i-1)*51+8,-8)
            self.buttons[i]:SetID(i)
        else -- bottom row of ability buttons for when the ability of an opponent is undetermined
            self.buttons[i]:SetPoint("TOPLEFT",self.buttons[i-3],"BOTTOMLEFT")
            self.buttons[i]:SetID(i-3)
            self.buttons[i]:Hide()
            self:SetButtonHalfHeight(self.buttons[i],true) -- these bottom row will always be half height
        end
    end

    -- when pets are swapping, move the abilities frame to the top of the screen
    hooksecurefunc("PetBattlePetSelectionFrame_Show",function() self:ClearAllPoints() self:SetPoint("TOP",PetBattleFrame.TopVersus,"BOTTOM",0,-24) end)
    hooksecurefunc("PetBattlePetSelectionFrame_Hide",function() self:ClearAllPoints() self:SetPoint("BOTTOM",PetBattleFrame.BottomFrame,"TOP",0,8) end)

    -- if in a pet battle, this setup was during a /reload; show the frame
    self:UpdateEnabled()
end

-- at start of battle, at end of each round, and when pets change, update the abilities displayed
function t.abilities:Update()
    local petIndex = C_PetBattles.GetActivePet(Enum.BattlePetOwner.Enemy)
    -- update abilties based on t.abilities.enemyAbilities
    for abilityIndex=1,3 do
        local button = self.buttons[abilityIndex]
        local altButton = self.buttons[abilityIndex+3]
        local abilities = self.enemyAbilities[petIndex][abilityIndex]
        self:FillAbilityButton(button,abilities[1])
        if #abilities>1 then -- if this ability slot has two potential abilities (undetermined pvp ability slot) display both
            self:SetButtonHalfHeight(button,true)
            self:FillAbilityCooldown(button,true,0,0,0) -- hide any cooldown if one was present
            self:FillAbilityButton(altButton,abilities[2])
            altButton:Show()
        else
            self:SetButtonHalfHeight(button,false)
            self:FillAbilityCooldown(button,C_PetBattles.GetAbilityState(Enum.BattlePetOwner.Enemy,petIndex,abilityIndex))
            altButton:Hide()
        end
    end            
end

-- create a generic ability button
function t.abilities:CreateAbilityButton()
    local button = CreateFrame("Button",nil,self)
    --button:SetSize(52,52)
    button:SetSize(52,52)

    button.back = button:CreateTexture(nil,"BACKGROUND")
    button.back:SetAllPoints(true)
    --button.back:SetTexture("Interface\\ItemSocketingFrame\\Sockets")
    --button.back:SetTexCoord(0.447265625,0.53125,0.38671875,0.5546875)
    button.back:SetTexture("Interface\\ItemSocketingFrame\\UI-EngineeringSockets")
    button.back:SetTexCoord(0.015625,0.6875,0.412109375,0.49609375)


    button.icon = button:CreateTexture(nil,"BORDER")
    button.icon:SetPoint("TOPLEFT",6,-6)
    button.icon:SetPoint("BOTTOMRIGHT",-6,6)
    button.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    button.icon:SetTexCoord(0.0725,0.9275,0.0725,0.9275)

    button.hint = button:CreateTexture(nil,"ARTWORK")
    button.hint:SetSize(20,20)
    button.hint:SetPoint("BOTTOMRIGHT")
    button.hint:SetTexture("Interface\\PetBattles\\BattleBar-AbilityBadge-Strong")

    button.cooldown = button:CreateFontString(nil,"ARTWORK","GameFont_Gigantic")
    button.cooldown:SetPoint("CENTER")

    button.highlight = button:CreateTexture(nil,"HIGHLIGHT")
    button.highlight:SetPoint("TOPLEFT")
    button.highlight:SetPoint("BOTTOMRIGHT")
    button.highlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
    button.highlight:SetBlendMode("ADD")

    button:SetScript("OnEnter",t.abilities.ShowTooltip)
    button:SetScript("OnLeave",t.abilities.HideTooltip)

    return button
end

-- when we don't know which abilities are slotted for an opponent (pvp) display two abilities in
-- the same space by making them half height
function t.abilities:SetButtonHalfHeight(button,isHalf)
    if isHalf then
        button:SetHeight(26)
        button.icon:SetPoint("TOPLEFT",6,-3)
        button.icon:SetPoint("BOTTOMRIGHT",-6,3)
        button.icon:SetTexCoord(0.0725,0.9275,0.0725+0.25,0.9275-0.25)
    else
        button:SetHeight(52)
        button.icon:SetPoint("TOPLEFT",6,-6)
        button.icon:SetPoint("BOTTOMRIGHT",-6,6)
        button.icon:SetTexCoord(0.0725,0.9275,0.0725,0.9275)
    end
end

-- OnEnter of ability buttons will build a tooltip from the frontline enemy pet
function t.abilities:ShowTooltip()
    local tooltip = PetBattlePrimaryAbilityTooltip
    if self.abilityID then
        PetBattleAbilityTooltip_SetAbilityByID(Enum.BattlePetOwner.Enemy,C_PetBattles.GetActivePet(Enum.BattlePetOwner.Enemy),self.abilityID)
        tooltip:ClearAllPoints()
        if PetBattleFrame.BottomFrame.PetSelectionFrame:IsVisible() then
            tooltip:SetPoint("TOP",self,"BOTTOM",0,0)
        else
            tooltip:SetPoint("BOTTOM",self,"TOP",0,0)
        end
        tooltip:Show()
    end
end

-- OnLeave of ability buttons hide the tooltip
function t.abilities:HideTooltip()
    PetBattlePrimaryAbilityTooltip:Hide()
end

-- updates usability/cooldown state of a button (isUsable,currentEtc are returns of C_PetBattles.GetAbilityState)
function t.abilities:FillAbilityCooldown(button,isUsable,currentCooldown,currentLockdown)
    button.cooldown:Hide()
    if isUsable then
        button.icon:SetDesaturated(false)
        button.icon:SetVertexColor(1,1,1)
    else
        button.icon:SetDesaturated(true)
        button.icon:SetVertexColor(0.4,0.4,0.4)
        local cooldown = max(currentCooldown or 0,currentLockdown or 0)
        if cooldown>0 then
            button.cooldown:SetText(cooldown)
            button.cooldown:Show()
        end
    end
end

-- sets the icon and strong/weak hint for the given button with the given abilityID
function t.abilities:FillAbilityButton(button,abilityID)
    button.abilityID = abilityID
    if abilityID then
        local _,_,icon,_,_,_,petType,noHints = C_PetBattles.GetAbilityInfoByID(abilityID)
        button.icon:SetTexture(icon)
        button.icon:Show()
        -- if this ability is potentially strong or weak to the current ally frontline pet, show the up/down arrow in corner of ability
        button.hint:Hide()
        if not noHints then
            local myPetType = C_PetBattles.GetPetType(Enum.BattlePetOwner.Ally,C_PetBattles.GetActivePet(Enum.BattlePetOwner.Ally))
            if self.vulnerabilities[myPetType][1]==petType then
                button.hint:SetTexture("Interface\\PetBattles\\BattleBar-AbilityBadge-Strong")
                button.hint:Show()
            elseif self.vulnerabilities[myPetType][2]==petType then
                button.hint:SetTexture("Interface\\PetBattles\\BattleBar-AbilityBadge-Weak")
                button.hint:Show()
            end
        end
    else
        button.icon:Hide()
        button.hint:Hide()
    end
end

-- called at the start of a battle, fills t.abilities.enemyAbilities with all of the abilities the enemy
-- can potentially cast. for pve this is just one ability per abilityIndex. for pvp this can be one of
-- two choices (if high enough level). this will store those choices and CHAT_MSG_PET_BATTLE_COMBAT_LOG will
-- watch for one of the undetermined ones to be case and remove the other.
function t.abilities:FillEnemyAbilities()
    -- wipe enemyAbilities
    for petIndex=1,3 do
        for abilityIndex=1,3 do
            wipe(self.enemyAbilities[petIndex][abilityIndex])
        end
    end
    -- fill enemyAbilities
    for petIndex=1,3 do
        local speciesID = C_PetBattles.GetPetSpeciesID(Enum.BattlePetOwner.Enemy,petIndex)
        if speciesID then -- if a pet is at petIndex
            -- fill abilityList and levelList with all abilities for a speciesID
            C_PetJournal.GetPetAbilityList(speciesID,abilityList,levelList)
            for abilityIndex=1,3 do
                local abilityID = C_PetBattles.GetAbilityInfo(Enum.BattlePetOwner.Enemy,petIndex,abilityIndex)
                if abilityID then -- if an ability found, it's the only ability
                    tinsert(self.enemyAbilities[petIndex][abilityIndex],abilityID)
                else -- ability not found, likely pvp and specific ability unknown yet
                    local level = C_PetBattles.GetLevel(Enum.BattlePetOwner.Enemy,petIndex)
                    for listOffset = 0,3,3 do -- insert both possible abilties for this abilityIndex
                        local abilityID = abilityList[abilityIndex+listOffset]
                        local abilityLevel = levelList[abilityIndex+listOffset]
                        if abilityID and abilityLevel and abilityLevel<=level then -- for low level pets, there may be only one valid ability
                            tinsert(self.enemyAbilities[petIndex][abilityIndex],abilityID)
                        end
                    end
                end
            end
        end
    end
end

-- returns true if all enemy abilities are known; there are no undetermined abilities
function t.abilities:IsAllAbilitiesKnown()
    for petIndex=1,3 do
        for abilityIndex=1,3 do
            if #self.enemyAbilities[petIndex][abilityIndex]>1 then
                return false
            end
        end
    end
    return true
end

-- when PET_BATTLE_OPENING_DONE fires or during setup on a /reload, prepare the abilities frame
function t.abilities:ShowFrame()
    self:FillEnemyAbilities() -- once per battle, must be called before Update
    self:Update() -- updates the visual elements in the frame
    self:Show()
end

-- when PET_BATTLE_CLOSE fires, hide the abilities frame
function t.abilities:HideFrame()
    self:Hide()
end

-- in pvp we need to watch the combat log for enemy abilities (which is ridiculous imho) to determine which ability the enemy has slotted.
-- if we make a determination, it will remove the alternate ability, narrowing down the options
function t.abilities:WatchEnemyCasts(msg)
    if self:IsAllAbilitiesKnown() then
        return -- if all abilities are known; no need to do anything
    end
    -- if we reached here, at least one ability is undetermined (can be one of two choices for at least one ability slot)
    local petIndex = C_PetBattles.GetActivePet(Enum.BattlePetOwner.Enemy)
    for abilityIndex=1,3 do
        if #self.enemyAbilities[petIndex][abilityIndex]>1 then -- if this enemy has more than one abilityID for this abilityIndex, we've not seen it cast one
            for undeterminedIndex,abilityID in ipairs(self.enemyAbilities[petIndex][abilityIndex]) do
                local health = C_PetBattles.GetHealth(Enum.BattlePetOwner.Enemy,petIndex)
                local power = C_PetBattles.GetPower(Enum.BattlePetOwner.Enemy,petIndex)
                local speed = C_PetBattles.GetSpeed(Enum.BattlePetOwner.Enemy,petIndex)
                local link = format("\124HbattlePetAbil:%d:%d:%d:%d\124h",abilityID,health,power,speed)
                if msg:match(link) then -- if enemy just cast one of their undetermined abilities, we know the other can't be used
                    tremove(self.enemyAbilities[petIndex][abilityIndex],3-undeterminedIndex)
                end
            end
        end
    end
end

-- updates enabled state (called during setup and when option changes)
function t.abilities:UpdateEnabled()
    local isEnabled = BattlePetBattleUITweaksSettings.EnemyAbilities
    if isEnabled then
        t.main:AddEvent("abilities","PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE",t.abilities.Update)
        t.main:AddEvent("abilities","PET_BATTLE_CLOSE",t.abilities.HideFrame)
        t.main:AddEvent("abilities","PET_BATTLE_PET_CHANGED",t.abilities.Update)
        t.main:AddEvent("abilities","PET_BATTLE_OPENING_DONE",t.abilities.ShowFrame)
        t.main:AddEvent("abilities","CHAT_MSG_PET_BATTLE_COMBAT_LOG",t.abilities.WatchEnemyCasts)
        if not self:IsVisible() and C_PetBattles.IsInBattle() then
            self:ShowFrame()
        end
    else
        t.main:RemoveEvent("abilities","PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE")
        t.main:RemoveEvent("abilities","PET_BATTLE_CLOSE")
        t.main:RemoveEvent("abilities","PET_BATTLE_PET_CHANGED")
        t.main:RemoveEvent("abilities","PET_BATTLE_OPENING_DONE")
        t.main:RemoveEvent("abilities","CHAT_MSG_PET_BATTLE_COMBAT_LOG")
        self:HideFrame()
    end
end

t.main:RunWithBattleUILoad("abilities",t.abilities.Setup)
