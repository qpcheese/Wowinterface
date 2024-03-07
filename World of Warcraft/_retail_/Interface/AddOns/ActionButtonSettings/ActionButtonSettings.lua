--[[
    Created by Slothpala 
--]]
ActionButtonSettings = LibStub("AceAddon-3.0"):NewAddon("ActionButtonSettings")
local AC   = LibStub("AceConfig-3.0")
local ACD  = LibStub("AceConfigDialog-3.0")

local defaults = {
    profile = {
        events = {
            UNIT_SPELLCAST_START = true,
            UNIT_SPELLCAST_INTERRUPTED = true,
            UNIT_SPELLCAST_FAILED = true,
            UNIT_SPELLCAST_CHANNEL_START = true,
            UNIT_SPELLCAST_RETICLE_TARGET = true,
        }
    }
}

local options = {
    name = "ActionButtonSettings",
    handler = ActionButtonSettings,
    type = "group",
    childGroups = "tab",
    args = {
        events = {
            order = 1,
            name = "Unregister Events",
            type = "group", 
            args = {
                UNIT_SPELLCAST_START = {
                    order = 1,
                    type = "toggle",
                    desc = "UNIT_SPELLCAST_START",
                    name = "Hide Castbar",
                    get = "GetStatus",
                    set = "SetStatus",
                },
                UNIT_SPELLCAST_INTERRUPTED = {
                    order = 2,
                    type = "toggle",
                    desc = "UNIT_SPELLCAST_INTERRUPTED",
                    name = "Hide Cast interrupted",
                    get = "GetStatus",
                    set = "SetStatus",
                },
                UNIT_SPELLCAST_FAILED = {
                    order = 3,
                    type = "toggle",
                    desc = "UNIT_SPELLCAST_FAILED",
                    name = "Hide Cast failed",
                    get = "GetStatus",
                    set = "SetStatus",
                },
                UNIT_SPELLCAST_CHANNEL_START = {
                    order = 4,
                    type = "toggle",
                    desc = "UNIT_SPELLCAST_CHANNEL_START",
                    name = "Hide Channel",
                    get = "GetStatus",
                    set = "SetStatus",
                },
                UNIT_SPELLCAST_RETICLE_TARGET = {
                    order = 5,
                    type = "toggle",
                    desc = "UNIT_SPELLCAST_RETICLE_TARGET",
                    name = "Hide Reticle",
                    get = "GetStatus",
                    set = "SetStatus",
                },
            },
        },
    },
}

function ActionButtonSettings:GetStatus(info)
    return self.db.profile[info[#info-1]][info[#info]]
end
function ActionButtonSettings:SetStatus(info,value)
    self.db.profile[info[#info-1]][info[#info]] = value
    self:LoadConfig()
end

function ActionButtonSettings:OnEnable()
    self.db = LibStub("AceDB-3.0"):New("ActionButtonSettingsDB", defaults, true) 
    AC:RegisterOptionsTable("ActionButtonSettings_options", options) 
    self.optionsFrame = ACD:AddToBlizOptions("ActionButtonSettings_options", "ActionButtonSettings")
    self:LoadConfig()
end

function ActionButtonSettings:LoadConfig()  
    for k,v in pairs(self.db.profile.events) do    
        if v == true then
            ActionBarActionEventsFrame:UnregisterEvent(k)
        end
    end
end

