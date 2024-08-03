local _AddonName, _EchoRaidTools = ...
local _ReadyCheck = _EchoRaidTools:NewModule("readyCheck")

local openRaidLib = LibStub:GetLibrary("LibOpenRaid-1.0")

function _ReadyCheck:ADDON_LOADED(addonName)
    if (addonName ~= _AddonName) or (_ReadyCheck.AddonLoaded) then return end
    EchoRaidToolsDB.ReadyCheck = EchoRaidToolsDB.ReadyCheck or {}
    local types = _ReadyCheck.types

    local ReadyCheckWindow = CreateFrame("FRAME", nil, UIParent, "EchoRaidTools_ReadyCheckWindow")
    ReadyCheckWindow:Hide()
    _ReadyCheck.ReadyCheckWindow = ReadyCheckWindow
    local resetFunc = function(self,line)
        line:Hide()
        line:ClearAllPoints()
        line:SetAlpha(1)
        line.unitInfo = nil
        line.class = nil
        line.classColor = nil
        line.name = nil
        line.colorName = nil
        line.Durability:Hide()
        line.RoleIcon:Hide()
        line.ClassIcon:Hide()
        line.SpecIcon:Hide()
        line.LeaderIcon:Hide()
        for _, keyName in pairs(types.raidBuffs) do
            line[keyName]:Hide()
        end
        line.Food:Hide()
        line.Phial:Hide()
        line.Vantus:Hide()
        line.Vantus:SetText("")
        line.Augment:Hide()
        line.Soulstone:Hide()
        line.Bloodlust:Hide()
        line.Weapon:Hide()
        line.Weapon2:Hide()
        line.outsideMember = false
    end
    local PlayerLinePool =  CreateFramePool("FRAME", ReadyCheckWindow, "EchoRaidTools_ReadyCheckPlayerLine", resetFunc)

    local UpdateUnitAuraInfoToLine = function(line, unit)
        for _, keyName in pairs(types.raidBuffs) do
            line[keyName]:Hide()
        end
        line.Food:Hide()
        line.Phial:Hide()
        line.Vantus:Hide()
        line.Augment:Hide()
        line.Soulstone:Hide()
        line.Bloodlust:Hide()
        AuraUtil.ForEachAura(unit, "HELPFUL", 40,
            function(name, icon, _, _, _, expirationTime, _, _, _, spellID, _,_,_,_,_,tier, tier2, tier3)
                if name == types.WellFed then
                    line.Food:SetIcon(icon)
                    line.Food:SetDuration(expirationTime)
                    return
                elseif types.Eating[name] then
                    line.Food:SetIcon(types.Eating[name])
                    line.Food:SetDuration(math.huge)
                    return
                end
                local flask = types.phials[spellID]
                if flask then
                    local phialTier = flask.tier[tier] or flask.tier2[tier2] or flask.tier3[tier3]
                    if not phialTier then
                        for value, t in pairs(flask.tier) do
                            if abs(tier - value) < 5 then
                                phialTier = t
                                break
                            end
                        end
                        if not phialTier then
                            for value, t in pairs(flask.tier2) do
                                if abs(tier2 - value) < 5 then
                                    phialTier = t
                                    break
                                end
                            end
                        end
                        if not phialTier then
                            for value, t in pairs(flask.tier3) do
                                if abs(tier3 - value) < 5 then
                                    phialTier = t
                                    break
                                end
                            end
                        end
                    end
                    line.Phial:SetQuality(phialTier or 1)
                    line.Phial:SetTooltip(name)
                    line.Phial:SetIcon(icon)
                    line.Phial:SetDuration(expirationTime)
                    return
                end
                local raidBuff = types.raidBuffs[spellID]
                if raidBuff then
                    line[raidBuff]:Show()
                    line[raidBuff]:SetDuration(expirationTime)
                    return
                end
                local vantus = types.vantus[spellID]
                if vantus then
                    line.Vantus:SetIcon(4555026)
                    line.Vantus:SetQuality(vantus.tier)
                    line.Vantus:SetText(vantus.name)
                    line.Vantus:SetTooltip((GetSpellInfo(spellID)))
                    return
                end
                local augment = types.augmentRune[spellID]
                if augment then
                    line.Augment:Show()
                    return
                end
                local soulstone = types.Soulstone[spellID]
                if soulstone then
                    line.Soulstone:Show()
                    line.Soulstone:SetDuration(expirationTime)
                    return
                end
            end
        )
        AuraUtil.ForEachAura(unit, "HARMFUL", 40,
            function(name, icon, _, _, _, expirationTime, _, _, _, spellID, _,_,_,_,_,tier, _, tier2)
                local bloodlust = types.BloodlustDebuffs[spellID]
                if bloodlust then
                    line.Bloodlust:Show()
                    line.Bloodlust:SetDuration(expirationTime)
                    return
                end
            end
        )
    end
    local UpdateUnitDurabilityInfoToLine = function(line, unit)
        local unitGear = openRaidLib.GetUnitGear(unit)
        if not unitGear then return end
        line.Durability:SetDurability(unitGear.durability or 100)
        line.Durability:Show()
        line.Weapon:Hide()
        line.Weapon2:Hide()
        if unitGear.mainHandEnchantId and unitGear.mainHandEnchantId > 0 then
            local weapon = types.WeaponEnchants[unitGear.mainHandEnchantId]
            if weapon then
                local name, icon
                if weapon.item then
                    name, _, _, _, _, _, _, _, _, icon = GetItemInfo(weapon.item)
                elseif weapon.spell then
                    name, _, icon = GetSpellInfo(weapon.spell)
                end
                line.Weapon:SetIcon(icon)
                line.Weapon:SetQuality(weapon.tier)
                line.Weapon:SetTooltip(name)
            end
        end
        if unitGear.offHandEnchantId and unitGear.offHandEnchantId > 0 then
            local weapon = types.WeaponEnchants[unitGear.offHandEnchantId]
            if weapon then
                local name, icon
                if weapon.item then
                    name, _, _, _, _, _, _, _, _, icon = GetItemInfo(weapon.item)
                elseif weapon.spell then
                    name, _, icon = GetSpellInfo(weapon.spell)
                end
                line.Weapon2:SetIcon(icon)
                line.Weapon2:SetQuality(weapon.tier)
                line.Weapon2:SetTooltip(name)
            end
        end
    end

    local SetUnitValuesToLine = function(line, unit)
        local unitInfo = openRaidLib.GetUnitInfo(unit)
        line.UnitInfo = unitInfo
        line.name = UnitNameUnmodified(unit)
        line.colorName = GetClassColoredTextForUnit(unit, _EchoRaidTools.Utf8Sub(line.name, 8))
        line.PlayerName:SetText(line.colorName)
        UpdateUnitAuraInfoToLine(line, unit)
        line.class = unitInfo and unitInfo.class and unitInfo.class ~= "" and unitInfo.class or select(2, UnitClass(unit))
        line.classColor = C_ClassColor.GetClassColor(line.class)
        line.lineBG:SetVertexColor(line.classColor:GetRGB())
        line.RoleIcon:SetRole(unitInfo and unitInfo.role or UnitGroupRolesAssigned(unit))
        line.ClassIcon:SetClass(unit)
        line.LeaderIcon:SetLeader(unit)
        if not unitInfo then return end
        line.SpecIcon:SetSpec(unitInfo.specId)
        UpdateUnitDurabilityInfoToLine(line, unit)
    end

    _ReadyCheck.UpdateUnitLine = function(unit)
        if ReadyCheckWindow:IsShown() and ReadyCheckWindow.units then
            if ReadyCheckWindow.units[unit] then
                SetUnitValuesToLine(ReadyCheckWindow.units[unit], unit)
            else
                for lineUnit, line in pairs(ReadyCheckWindow.units) do
                    if UnitIsUnit(unit, lineUnit) then
                        SetUnitValuesToLine(line, lineUnit)
                    end
                end
            end
        end
    end
    _ReadyCheck.UpdateUnitLineAuras = function(unit)
        if ReadyCheckWindow:IsShown() and ReadyCheckWindow.units then
            if ReadyCheckWindow.units[unit] then
                UpdateUnitAuraInfoToLine(ReadyCheckWindow.units[unit], unit)
            else
                for lineUnit, line in pairs(ReadyCheckWindow.units) do
                    if UnitIsUnit(unit, lineUnit) then
                        UpdateUnitAuraInfoToLine(line, lineUnit)
                    end
                end
            end
        end
    end
    _ReadyCheck.UpdateUnitLineDurability = function(unit)
        if ReadyCheckWindow:IsShown() and ReadyCheckWindow.units then
            if ReadyCheckWindow.units[unit] then
                UpdateUnitDurabilityInfoToLine(ReadyCheckWindow.units[unit], unit)
            else
                for lineUnit, line in pairs(ReadyCheckWindow.units) do
                    if UnitIsUnit(unit, lineUnit) then
                        UpdateUnitDurabilityInfoToLine(line, lineUnit)
                    end
                end
            end
        end
    end

    local difficultyGroups = {[14] = 6, [15] = 6, [16] = 4, [17] = 6}
    _ReadyCheck.ShowReadyCheckWindow = function(duration, name)
        ReadyCheckWindow:StopAnimations()
        local initiator
        local inRaid = IsInRaid()
        local diff = GetRaidDifficultyID()
        local useSubGroup = false
        if inRaid and difficultyGroups[diff] then
            useSubGroup = true
        end
        ReadyCheckWindow.isExample = false
        ReadyCheckWindow.units = {}
        ReadyCheckWindow.totalReady = GetNumGroupMembers()
        ReadyCheckWindow.currentReady = 0
        PlayerLinePool:ReleaseAll()
        ReadyCheckWindow.Header.PositiveCount:Reset()
        ReadyCheckWindow.Header.NegativeCount:Reset()
        ReadyCheckWindow.outsideMembers = false
        local lastLine
        local height = 0
        for unit in _EchoRaidTools.IterateGroupByRole("TANK", "HEALER", "DAMAGER") do
            if UnitIsUnit(name, unit) then
                initiator = unit
            end
            local line = PlayerLinePool:Acquire()
            line:Show()
            local offline = not UnitIsConnected(unit)
            local outsideMember = false
            if useSubGroup then
                local subGroup = select(3, GetRaidRosterInfo(UnitInRaid(unit))) or 1
                outsideMember = subGroup > difficultyGroups[diff]
                line.outsideMember = outsideMember
                if outsideMember then
                    ReadyCheckWindow.outsideMembers = true
                end
            end
            line:SetAlpha(1)
            if offline or line.outsideMember then
                line:SetAlpha(0.5)
            end
            ReadyCheckWindow.units[unit] = line
            line:ClearAllPoints()
            if lastLine then
                line:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, 0)
                line:SetPoint("TOPRIGHT", lastLine, "BOTTOMRIGHT", 0, 0)
            else
                line:SetPoint("TOPLEFT", ReadyCheckWindow.TopLine, "BOTTOMLEFT", 0, 0)
                line:SetPoint("TOPRIGHT", ReadyCheckWindow.TopLine, "BOTTOMRIGHT", 0, 0)
            end
            line:SetReady()

            SetUnitValuesToLine(line, unit)
            height = height + line:GetHeight()
            lastLine = line
        end
        ReadyCheckWindow:SetHeight(height + 52)

        ReadyCheckWindow.Header.TitleText:SetText("Ready Check - from "..name)
        ReadyCheckWindow.Header.ReadyCheckDuration:Show()
        ReadyCheckWindow.Header.ReadyCheckDuration:SetMinMaxValues(GetTime(), GetTime()+duration)
        ReadyCheckWindow.Header.ReadyCheckDuration:SetValue(GetTime())
        ReadyCheckWindow.Header.ReadyCheckDuration:SetScript("OnUpdate",
            function(self)
                local min, max = self:GetMinMaxValues()
                local remaining = max - GetTime()
                self:SetValue(min + remaining)
            end
        )
        ReadyCheckWindow:ClearAllPoints()
        ReadyCheckWindow:SetPoint("BOTTOMLEFT", UIParent, "CENTER", _ReadyCheck.GetWindowPosition())
        if ReadyCheckWindow.timer then ReadyCheckWindow.timer:Cancel() end
        ReadyCheckWindow.timer = C_Timer.NewTimer(duration, function() ReadyCheckWindow:HideWindow() end)
        ReadyCheckWindow:SetScale(_ReadyCheck.GetWindowScale()/100)
        ReadyCheckWindow:Show()

        _ReadyCheck.UpdateUnitReady(initiator, true)

        if _ReadyCheck.GetShowMinimisedWindow() ~= ReadyCheckWindow.minimised then
            ReadyCheckWindow:ToggleMinimised()
        end
    end

    _ReadyCheck.UpdateUnitReady = function(unit, isReady)
        if ReadyCheckWindow:IsShown() and ReadyCheckWindow.units and ReadyCheckWindow.units[unit] and ReadyCheckWindow.units[unit].isReady == nil then
            ReadyCheckWindow.units[unit]:SetReady(isReady)
            if isReady then
                ReadyCheckWindow.Header.PositiveCount:Increment()
                ReadyCheckWindow.currentReady = ReadyCheckWindow.currentReady + 1
            else
                ReadyCheckWindow.Header.NegativeCount:Increment()
            end
            if ReadyCheckWindow.outsideMembers then
                for _, line in pairs(ReadyCheckWindow.units) do
                    if line.isReady == nil and not line.outsideMember then
                        return
                    end
                end
                print(types.blizzGoldColor:WrapTextInColorCode("Everyone (inside the actual raid group) is Ready!"))
                ReadyCheckWindow:HideWindow(nil, true)
            end
        end
    end

    _ReadyCheck.ShowExample = function()
        if ReadyCheckWindow:IsShown() then
            return
        end
        ReadyCheckWindow.isExample = true
        ReadyCheckWindow.units = {}
        ReadyCheckWindow.totalReady = GetNumGroupMembers()
        ReadyCheckWindow.currentReady = 0
        PlayerLinePool:ReleaseAll()
        ReadyCheckWindow.Header.PositiveCount:Reset()
        ReadyCheckWindow.Header.NegativeCount:Reset()
        ReadyCheckWindow.outsideMembers = false
        local lastLine
        local height = 0
        for unit in _EchoRaidTools.IterateGroupByRole("TANK", "HEALER", "DAMAGER") do
            local line = PlayerLinePool:Acquire()
            line:Show()
            local offline = not UnitIsConnected(unit)
            local outsideMember = false
            line:SetAlpha(1)
            ReadyCheckWindow.units[unit] = line
            line:ClearAllPoints()
            if lastLine then
                line:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, 0)
                line:SetPoint("TOPRIGHT", lastLine, "BOTTOMRIGHT", 0, 0)
            else
                line:SetPoint("TOPLEFT", ReadyCheckWindow.TopLine, "BOTTOMLEFT", 0, 0)
                line:SetPoint("TOPRIGHT", ReadyCheckWindow.TopLine, "BOTTOMRIGHT", 0, 0)
            end
            line:SetReady()

            SetUnitValuesToLine(line, unit)
            height = height + line:GetHeight()
            lastLine = line
        end
        ReadyCheckWindow:SetHeight(height + 52)

        ReadyCheckWindow.Header.TitleText:SetText("EXAMPLE!")
        ReadyCheckWindow:ClearAllPoints()
        ReadyCheckWindow:SetPoint("BOTTOMLEFT", UIParent, "CENTER", _ReadyCheck.GetWindowPosition())
        ReadyCheckWindow:SetScale(_ReadyCheck.GetWindowScale()/100)
        ReadyCheckWindow:Show()

        if _ReadyCheck.GetShowMinimisedWindow() ~= ReadyCheckWindow.minimised then
            ReadyCheckWindow:ToggleMinimised()
        end
    end
    _ReadyCheck.HideExample = function()
        if ReadyCheckWindow:IsShown() and ReadyCheckWindow.isExample then
            ReadyCheckWindow:Hide()
        end
    end

    _ReadyCheck.UpdateScale = function()
        if ReadyCheckWindow:IsShown() and ReadyCheckWindow.isExample then
            ReadyCheckWindow:SetScale(_ReadyCheck.GetWindowScale()/100)
        end
    end

    _ReadyCheck:LoadSettings()
    _ReadyCheck:LoadEventHandling()

    _ReadyCheck.AddonLoaded = true
end

-- Add source of magic?
-- ignore subGroups outside difficulty
-- add weapons buffs
-- pots/HS in bags
-- test Movement buff IDs

-- lib 
--    weapon enchants
