local isDBMLoaded = IsAddOnLoaded("DBM-Core")
local isBigWigsLoaded = IsAddOnLoaded("BigWigs")
local ADDON_MESSAGE_PREFIX = "FojjiRangeAddon"
local PLAYER_NAME = UnitName("player")  -- Get your character's name
local lastRangeValue

if not isDBMLoaded and not isBigWigsLoaded then

local function sendRangeEvent(rangeValue)
    if rangeValue then
        C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, "_RANGE_SET:" .. rangeValue, "WHISPER", PLAYER_NAME)
    else
        C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, "_RANGE_CLEAR", "WHISPER", PLAYER_NAME)
    end
end

SLASH_FOJJIRANGE1 = "/range"
SlashCmdList["FOJJIRANGE"] = function(msg)
    local input = strtrim(msg)  -- Remove any leading/trailing spaces

    if input:match("^%d+$") then  -- Check if the input is just a number
        local rangeValue = tonumber(input)
        lastRangeValue = rangeValue
        sendRangeEvent(rangeValue)
    elseif input == "" then
        if lastRangeValue then
            -- If there's an active display, cancel it
            lastRangeValue = nil
            sendRangeEvent()
        else
            print("Please input a valid range value or use '/range cancel' to cancel an active display.")
        end
    elseif input == "cancel" then
        lastRangeValue = nil
        sendRangeEvent()
    else
        print("Invalid command. Use '/range X' where X is a number, or '/range cancel'.")
    end
end

C_ChatInfo.RegisterAddonMessagePrefix(ADDON_MESSAGE_PREFIX)
end
