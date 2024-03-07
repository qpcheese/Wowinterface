local LibDeflate = LibStub:GetLibrary("LibDeflate")
local LibSerialize = LibStub("LibSerialize")
local AceComm = LibStub:GetLibrary("AceComm-3.0")

local MESSAGE_PREFIX = "WA_SYNC_EVENTS"
local ALLOWED_CHANNELS = {
    ["PARTY"] = true,
    ["RAID"] = true,
    ["INSTANCE_CHAT"] = true,
    ["GUILD"] = true,
    ["OFFICER"] = true,
}

function _G.SyncEvents(channel, target, event, ...)
    local data = {
        event = event,
        payload = {...},
    }
    local serialized = LibSerialize:Serialize(data)
    local compressed = LibDeflate:CompressDeflate(serialized)
    local encoded = LibDeflate:EncodeForWoWAddonChannel(compressed)
    AceComm:SendCommMessage(MESSAGE_PREFIX, encoded, channel, target)
end

local function receiveSyncEvent(prefix, encoded, channel, sender)
    if not ALLOWED_CHANNELS[channel] then
        return false
    end
    local compressed = LibDeflate:DecodeForWoWAddonChannel(encoded)
    if not compressed then
        return
    end
    local serialized = LibDeflate:DecompressDeflate(compressed)
    if not serialized then
        return
    end
    local success, data = LibSerialize:Deserialize(serialized)
    if not success then
        return
    end
    WeakAuras.ScanEvents(data["event"], unpack(data["payload"]))
end

AceComm:RegisterComm(MESSAGE_PREFIX, receiveSyncEvent)