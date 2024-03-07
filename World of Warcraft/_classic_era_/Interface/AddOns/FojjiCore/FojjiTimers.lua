local ADDON_MESSAGE_PREFIX = "FojjiTimerAddon"
local isDBMLoaded = IsAddOnLoaded("DBM-Core")
local isBigWigsLoaded = IsAddOnLoaded("BigWigs")

if not FojjiTimersSavedVars then
    FojjiTimersSavedVars = {}
end

if not FojjiTimersSavedVars.breakEndTime then
    FojjiTimersSavedVars.breakEndTime = nil
end

if not FojjiTimersSavedVars.pullEndTime then
    FojjiTimersSavedVars.pullEndTime = nil
end

if not isDBMLoaded and not isBigWigsLoaded then

local function chatMessage(type, playerName, duration)
    if type == "BREAK" then
        print(string.format("%s started a break timer for %d minutes!", playerName, duration/60))
    elseif type == "BREAK_CANCEL" then
        print(string.format("%s cancelled the break timer!", playerName))
    elseif type == "PULL" then
        print(string.format("%s started a pull timer for %d seconds!", playerName, duration))
    elseif type == "PULL_CANCEL" then
        print(string.format("%s cancelled the pull timer!", playerName))
    end
end

local isClassic = WOW_PROJECT_ID == (WOW_PROJECT_CLASSIC or 2)
local isWrath = WOW_PROJECT_ID == (WOW_PROJECT_WRATH_CLASSIC or 11)

local DBMPrefix = isClassic and "D5C" or isWrath and "D5WC" or "D5"
local DBMSyncProtocol = 1

local function SendMessage(cmd, timeValue)
    local message = cmd .. ":" .. (timeValue or "") .. ":" .. UnitName("player")
    local currentTime = GetTime()

    if cmd == "BREAK" then
        FojjiTimersSavedVars.breakEndTime = currentTime + timeValue
    elseif cmd == "BREAK_CANCEL" then
        FojjiTimersSavedVars.breakEndTime = nil
    elseif cmd == "PULL" then
        FojjiTimersSavedVars.pullEndTime = currentTime + timeValue
    elseif cmd == "PULL_CANCEL" then
        FojjiTimersSavedVars.pullEndTime = nil
    end

    if IsInRaid() then
        C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, message, "RAID")
    elseif IsInGroup() then
        C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, message, "PARTY")
    else
        C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, message, "WHISPER", UnitName("player"))
        print("Timer started!")
    end

if IsInRaid() then -- Send DBM Message out for DBM users
        local prefix
        if cmd == "BREAK" then
            prefix = "BT"
        elseif cmd == "BREAK_CANCEL" then
            prefix, timeValue = "BT", 0
        elseif cmd == "PULL" then
            prefix = "PT"
        elseif cmd == "PULL_CANCEL" then
            prefix, timeValue = "PT", 0
        end
        if prefix then
            local name, realm = UnitFullName("player")
            local dbmMessage = ("%s-%s\t%d\t%s\t%s"):format(name, realm, DBMSyncProtocol, prefix, timeValue)
            C_ChatInfo.SendAddonMessage(DBMPrefix, dbmMessage, "RAID")
        end
    end
end

local hasReceivedBreakStatus = false
local hasReceivedPullStatus = false

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:RegisterEvent("GROUP_JOINED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(3, function()
            C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, "REQUEST_TIMER_STATUS", "RAID")
            hasReceivedBreakStatus = false
            hasReceivedPullStatus = false
        end)
    elseif event == "CHAT_MSG_ADDON" then
        local prefix, content, channel, sender = ...
			if (prefix == DBMPrefix) and channel == "RAID" then
				local playerName, _, timerType, timerValue = strsplit("\t", content)
			if timerType == "BT" and tonumber(timerValue) == 0 then
				FojjiTimersSavedVars.breakEndTime = nil
				WeakAuras.ScanEvents("WA_FOJJI_TIMER_BREAK_RECHECK", 0)
			elseif timerType == "PT" and tonumber(timerValue) == 0 then
				FojjiTimersSavedVars.pullEndTime = nil
				WeakAuras.ScanEvents("WA_FOJJI_TIMER_PULL_RECHECK", 0)
			end
		end
        if prefix == ADDON_MESSAGE_PREFIX and channel == "RAID" then
            local cmd, timeValue, playerName = strsplit(":", content)
            local playerNameFull = UnitName("player") .. "-" .. GetRealmName()
            
            if cmd == "REQUEST_TIMER_STATUS" and sender ~= playerNameFull then
                if FojjiTimersSavedVars.breakEndTime and FojjiTimersSavedVars.breakEndTime > GetTime() then
                    local remainingTime = FojjiTimersSavedVars.breakEndTime - GetTime()
                    local response = "BREAK_STATUS:" .. remainingTime
                    C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, response, "RAID")
                else
                    C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, "NO_BREAK_TIMER", "RAID")
                end

                if FojjiTimersSavedVars.pullEndTime and FojjiTimersSavedVars.pullEndTime > GetTime() then
                    local remainingTime = FojjiTimersSavedVars.pullEndTime - GetTime()
                    local response = "PULL_STATUS:" .. remainingTime
                    C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, response, "RAID")
                else
                    C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, "NO_PULL_TIMER", "RAID")
                end

            elseif cmd == "NO_BREAK_TIMER" then
                FojjiTimersSavedVars.breakEndTime = nil
                WeakAuras.ScanEvents("WA_FOJJI_TIMER_BREAK_RECHECK", 0)

            elseif cmd == "NO_PULL_TIMER" then
                FojjiTimersSavedVars.pullEndTime = nil
                WeakAuras.ScanEvents("WA_FOJJI_TIMER_PULL_RECHECK", 0)

            elseif cmd == "BREAK_STATUS" then
                local remainingTime = tonumber(timeValue)
                if remainingTime then
                    FojjiTimersSavedVars.breakEndTime = GetTime() + remainingTime
                    hasReceivedBreakStatus = true
                end

            elseif cmd == "PULL_STATUS" then
                local remainingTime = tonumber(timeValue)
                if remainingTime then
                    FojjiTimersSavedVars.pullEndTime = GetTime() + remainingTime
                    hasReceivedPullStatus = true
                end

            elseif cmd == "BREAK" or cmd == "BREAK_CANCEL" or cmd == "PULL" or cmd == "PULL_CANCEL" then
                chatMessage(cmd, playerName, tonumber(timeValue or "0"))
            end
        end
    elseif event == "GROUP_JOINED" then
        FojjiTimersSavedVars.pullEndTime = nil
        FojjiTimersSavedVars.breakEndTime = nil
        WeakAuras.ScanEvents("WA_FOJJI_TIMER_PULL_RECHECK", 0)
        WeakAuras.ScanEvents("WA_FOJJI_TIMER_BREAK_RECHECK", 0)
    end
end)

SLASH_FOJJIPULL1 = "/pull"
SLASH_FOJJIBREAK1 = "/break"

SlashCmdList["FOJJIPULL"] = function(msg)
    local timeValue = tonumber(msg)
    
    --if InCombatLockdown() then
    --    print("Cannot initiate timer while in combat.")
    --    return
    --end

    if IsInGroup() and not (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) then
        print("You do not have permission.")
        return
    end

    if msg == "cancel" then
        SendMessage("PULL_CANCEL")
        return
    end
    
    if timeValue then
        SendMessage("PULL", timeValue)
    else
        print("Invalid pull time specified.")
    end
end

SlashCmdList["FOJJIBREAK"] = function(msg)
    local timeValue = tonumber(msg)
    
    --if InCombatLockdown() then
    --    print("Cannot initiate timer while in combat.")
    --    return
    --end

    if IsInGroup() and not (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) then
        print("You do not have permission.")
        return
    end

    if msg == "cancel" then
        SendMessage("BREAK_CANCEL")
        return
    end
    
    if timeValue then
        timeValue = timeValue * 60
        SendMessage("BREAK", timeValue)
    else
        print("Invalid break time specified.")
    end
end


C_ChatInfo.RegisterAddonMessagePrefix(ADDON_MESSAGE_PREFIX)
end