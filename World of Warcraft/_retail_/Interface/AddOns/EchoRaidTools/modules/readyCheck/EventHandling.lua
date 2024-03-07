local _AddonName, _EchoRaidTools = ...
local _ReadyCheck = _EchoRaidTools:GetModule("readyCheck")

local openRaidLib = LibStub:GetLibrary("LibOpenRaid-1.0")

function _ReadyCheck:LoadEventHandling()
    local eventFrame = CreateFrame("FRAME")
    _ReadyCheck.EventFrame = eventFrame

    _ReadyCheck.watchingUpdates = false
    function _ReadyCheck.OnGearDurabilityUpdate(unit, durability, unitGear, allUnitsGear)
        if _ReadyCheck.watchingUpdates then
            _ReadyCheck.UpdateUnitLineDurability(unit)
        end
    end
    openRaidLib.RegisterCallback(_ReadyCheck, "GearDurabilityUpdate", "OnGearDurabilityUpdate")

    function _ReadyCheck.OnUnitUpdate(unit, unitInfo, allUnitsInfo)
        if _ReadyCheck.watchingUpdates then
            _ReadyCheck.UpdateUnitLine(unit)
        end
    end
    openRaidLib.RegisterCallback(_ReadyCheck, "UnitInfoUpdate", "OnUnitUpdate")

    local HandleUnitEvent = function(self, event, unit, ...)
        if event == "UNIT_AURA" then
            local update = ...
            if update.isFullUpdate then
                _ReadyCheck.UpdateUnitLine(unit)
            else
                if update.addedAuras then
                    for _, auraInfo in pairs(update.addedAuras) do
                        if _ReadyCheck.IsRelevantSpellID(auraInfo.spellId) then
                            _ReadyCheck.UpdateUnitLineAuras(unit)
                            return
                        end
                    end
                end
                if update.removedAuraInstanceIDs then
                    _ReadyCheck.UpdateUnitLineAuras(unit)
                end
            end
        end
    end

    local SetupUnitEvents = function()
        _ReadyCheck.UnitEventFrames = _ReadyCheck.UnitEventFrames or {}
        do
            _ReadyCheck.UnitEventFrames["player"] = _ReadyCheck.UnitEventFrames["player"] or CreateFrame("FRAME")
            _ReadyCheck.UnitEventFrames["player"]:RegisterUnitEvent("UNIT_AURA", "player")
            _ReadyCheck.UnitEventFrames["player"]:RegisterEvent("UPDATE_INVENTORY_DURABILITY")
            _ReadyCheck.UnitEventFrames["player"]:SetScript("OnEvent", HandleUnitEvent)
        end
        for i = 1, 4 do
            local unit = "party"..i
            _ReadyCheck.UnitEventFrames[unit] = _ReadyCheck.UnitEventFrames[unit] or CreateFrame("FRAME")
            _ReadyCheck.UnitEventFrames[unit]:RegisterUnitEvent("UNIT_AURA", unit)
            _ReadyCheck.UnitEventFrames[unit]:SetScript("OnEvent", HandleUnitEvent)
        end
        for i = 1, 40 do
            local unit = "raid"..i
            _ReadyCheck.UnitEventFrames[unit] = _ReadyCheck.UnitEventFrames[unit] or CreateFrame("FRAME")
            _ReadyCheck.UnitEventFrames[unit]:RegisterUnitEvent("UNIT_AURA", unit)
            _ReadyCheck.UnitEventFrames[unit]:SetScript("OnEvent", HandleUnitEvent)
        end
    end
    local StopAllUnitEvents = function()
        if _ReadyCheck.UnitEventFrames then
            for unit, frame in pairs(_ReadyCheck.UnitEventFrames) do
                frame:UnregisterAllEvents()
            end
        end
    end
    _ReadyCheck.StopAllUnitEvents = StopAllUnitEvents

    local delayedSend
    _ReadyCheck.SetupEvents = function()
        eventFrame:RegisterEvent("READY_CHECK")-- initiatorName, readyCheckTimeLeft
        eventFrame:RegisterEvent("READY_CHECK_CONFIRM")-- unitTarget, isReady
        eventFrame:RegisterEvent("READY_CHECK_FINISHED")-- preempted
        eventFrame:RegisterEvent("UPDATE_INVENTORY_DURABILITY")
        eventFrame:RegisterEvent("ENCOUNTER_START")
        eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
        eventFrame:SetScript("OnEvent", function(self, event, ...)
            if event == "READY_CHECK" then
                local initiatorName, readyCheckTimeLeft = ...
                if _ReadyCheck.GetModuleEnabled() then
                    SetupUnitEvents()
                    --openRaidLib.GearManager.GetPlayerFullGearInfo()
                    --openRaidLib.GearManager.SendDurability()
                    openRaidLib.UnitInfoManager.GetPlayerFullInfo()
                    openRaidLib.UnitInfoManager.SendAllPlayerInfo()
                    openRaidLib.GearManager.SendAllGearInfo()
                    openRaidLib.RequestAllData()
                    _ReadyCheck.watchingUpdates = true
                    _ReadyCheck.ShowReadyCheckWindow(readyCheckTimeLeft, initiatorName)
                end
            elseif event == "READY_CHECK_CONFIRM" then
                local unit, isReady = ...

                if _ReadyCheck.GetModuleEnabled() then
                    _ReadyCheck.UpdateUnitReady(unit,isReady)
                end
            elseif event == "READY_CHECK_FINISHED" then
                local preempted = ...
                if _ReadyCheck.ReadyCheckWindow:IsShown() then
                    _ReadyCheck.ReadyCheckWindow:HideWindow()
                    --_ReadyCheck.ReportToChat()
                end
            elseif event == "UPDATE_INVENTORY_DURABILITY" then
                if _ReadyCheck.watchingUpdates then
                    if not delayedSend then
                        delayedSend = true
                        RunNextFrame(function()
                            --openRaidLib.GearManager.SendDurability()
                            --openRaidLib.GearManager.GetPlayerFullGearInfo()
                            openRaidLib.GearManager.SendAllGearInfo()
                            delayedSend = nil
                            _ReadyCheck.UpdateUnitLineDurability("player")
                        end)
                    end
                end
            elseif event == "ENCOUNTER_START" or event == "PLAYER_REGEN_DISABLED" then
                if _ReadyCheck.ReadyCheckWindow:IsShown() then
                    _ReadyCheck.ReadyCheckWindow:HideWindow(true)
                end
            end
        end)
    end

    _ReadyCheck.UnregisterEvents = function()
        eventFrame:UnregisterAllEvents()
    end

    if _ReadyCheck.GetModuleEnabled() then
        _ReadyCheck.SetupEvents()
    end

end