--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}

petbm.PetBattleMaster = LibStub("AceAddon-3.0"):NewAddon("PetBattleMaster", "AceEvent-3.0", "AceConsole-3.0", "AceHook-3.0")
local L = petbm.Locale.GetInstance()
local log = petbm.Debug:new("PetBattleMaster")

local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local dbIcon = LibStub("LibDBIcon-1.0")
local APP_NAME = "PetBattleMaster"

local order = 1

local SCREEN_HEIGHT = GetScreenHeight()
local SCREEN_WIDTH = GetScreenWidth()
local ICON = "Interface\\Icons\\Ability_Hunter_AspectoftheFox"

local MAX_ALWAY_UP_FRAMES = 6

local DEFAULT_CONFIG = {
    profile = {
        minimapButton = true,
        frames = {},
        teams = {},
        minimapIcon = {},
        teamViewAlpha = 0.7,
        teamViewBorderColor = { 214 / 255, 221 / 255, 23 / 255, 1 },
        autoOpenTeamView = true,
        teamManagerActive = true,
        petJournalMovable = false,
        showExtraBattleView = true,
        showCatchIndicator = true,
        tooltipAttachment = true
    }
}

local function _NextOrder()
    order = order + 1
    return order
end

local OPTIONS = {
    --name = APP_NAME,
    handler = petbm.PetBattleMaster,
    type = 'group',
    childGroups = "tab",
    args = {
        locked = {
            type = 'toggle',
            width = "half",
            name = L["Locked"],
            desc = L["Locks the views"],
            order = _NextOrder(),
            set = function(info, value) info.handler.db.profile.locked = value; end,
            get = function(info) return info.handler.db.profile.locked end,
        },
        test = {
            type = 'toggle',
            name = L["Minimap button"],
            desc = L["Activates the minimap button"],
            order = _NextOrder(),
            set = function(info, value) info.handler.db.profile.minimapButton = value; info.handler:ApplyConfig() end,
            get = function(info) return info.handler.db.profile.minimapButton end,
        },
        main = {
            type = "group",
            name = L["General"],
            order = _NextOrder(),
            args = {
                teamManagerActive = {
                    type = 'toggle',
                    name = L["Pet manager active"],
                    desc = L["Activates PetBattleMaster's team manager in the pet journal"],
                    width = "full",
                    order = _NextOrder(),
                    get = function(info) return info.handler.db.profile.teamManagerActive end,
                    set = function(info, value) info.handler.db.profile.teamManagerActive = value; info.handler:ApplyConfig() end
                },
                autoOpenTeamView = {
                    type = 'toggle',
                    name = L["Auto open team view"],
                    desc = L["Automatically opens the team view after a pet battle."],
                    width = "full",
                    order = _NextOrder(),
                    set = function(info, value) info.handler.db.profile.autoOpenTeamView = value; info.handler:ApplyConfig() end,
                    get = function(info) return info.handler.db.profile.autoOpenTeamView end
                },
                teamViewAlpha = {
                    type = 'range',
                    name = L["Team view alpha"],
                    desc = L["Alpha value for the background texture of the team view"],
                    order = _NextOrder(),
                    get = function(info) return info.handler.db.profile.teamViewAlpha end,
                    set = function(info, value) info.handler.db.profile.teamViewAlpha = value; info.handler:ApplyConfig() end,
                    min = 0,
                    max = 1,
                    step = 0.01
                },
                teamViewBorderColor = {
                    type = 'color',
                    name = L["Team view border color"],
                    desc = L["Color of the team view border"],
                    order = _NextOrder(),
                    get = function(info) return unpack(info.handler.db.profile.teamViewBorderColor) end,
                    set = function(info, ...) info.handler.db.profile.teamViewBorderColor = { ... }; info.handler:ApplyConfig() end,
                    hasAlpha = true
                },
                petJournalMovable = {
                    type = 'toggle',
                    name = L["Pet journal movable"],
                    desc = L["Makes the pet journal movable"],
                    width = "full",
                    order = _NextOrder(),
                    get = function(info) return info.handler.db.profile.petJournalMovable end,
                    set = function(info, value) info.handler.db.profile.petJournalMovable = value; info.handler:ApplyConfig() end
                },
                tooltipAttachment = {
                    type = 'toggle',
                    name = L["Tooltip attachment"],
                    desc = L["Adds some information to the tooltip, whether the corresponding pet is already owned by the player"],
                    width = "full",
                    order = _NextOrder(),
                    get = function(info) return info.handler.db.profile.tooltipAttachment end,
                    set = function(info, value) info.handler.db.profile.tooltipAttachment = value; info.handler:ApplyConfig() end
                }
            }
        },
        battleView = {
            type = "group",
            name = L["Battle"],
            order = _NextOrder(),
            args = {
                showExtraBattleView = {
                    type = 'toggle',
                    name = L["Extra info view"],
                    desc = L["Shows an extra view with helpful information during battles"],
                    order = _NextOrder(),
                    get = function(info) return info.handler.db.profile.showExtraBattleView end,
                    set = function(info, value) info.handler.db.profile.showExtraBattleView = value; info.handler:ApplyConfig() end
                },
                showCatchIndicator = {
                    type = 'toggle',
                    name = L["Catch indicator"],
                    desc = L["Shows a catch indicator on Blizzard's pet unit frames"],
                    order = _NextOrder(),
                    get = function(info) return info.handler.db.profile.showCatchIndicator end,
                    set = function(info, value) info.handler.db.profile.showCatchIndicator = value; info.handler:ApplyConfig() end
                }
            }
        }
    }
}

local function _Open(self)
    log:Debug("_Open")
    if (self.view and self.db.profile.showExtraBattleView) then
        self.view:Open()
        self.view:PetChanged()
    end
    log:Debug("_Open exit")
end

local function _UpdateInfoView(self)
    if (self.inBattle and self.view) then
        self.view:Update()
    end
end

function petbm.PetBattleMaster:OnInitialize()
    self.blizzardCollectionsAvailable = false
    self.db = LibStub("AceDB-3.0"):New("PetBattleMasterDb", DEFAULT_CONFIG, "Default")
    OPTIONS.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)

    self.db.RegisterCallback(self, "OnProfileChanged", "ProfileUpdate")
    self.db.RegisterCallback(self, "OnProfileCopied", "ProfileUpdate")
    self.db.RegisterCallback(self, "OnProfileReset", "ProfileUpdate")

    -- cleanup old database
    local oldDb = petbm.PetBattleMaster.db:RegisterNamespace("PetTeamManager", { profile = {} })
    oldDb.profile.teams = nil
    self:RegisterEvent("PLAYER_LOGIN")
end

function petbm.PetBattleMaster:OnEnable()
    log:Debug("OnEnable")
    log:ClearHistory()
    self.view = petbm.PetInfoView.New()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(APP_NAME, OPTIONS)
    self.configFrame = AceConfigDialog:AddToBlizOptions(APP_NAME)
    self:RegisterChatCommand("petbm", "ChatCommand")

    self:RegisterEvent("PET_BATTLE_PET_CHANGED")
    self:RegisterEvent("PET_BATTLE_OPENING_START")
    self:RegisterEvent("PET_BATTLE_OPENING_DONE")
    self:RegisterEvent("PET_BATTLE_MAX_HEALTH_CHANGED")
    self:RegisterEvent("PET_BATTLE_HEALTH_CHANGED")
    self:RegisterEvent("PET_BATTLE_XP_CHANGED")
    self:RegisterEvent("PET_BATTLE_CLOSE")

    self:SecureHook(C_PetJournal, "SetSearchFilter")

    -- libdatabroker integration
    self.ldb = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("PetBattleMaster", {
        type = "launcher",
        icon = ICON,
        label = "PetBattleMaster",
        OnClick = function(clickedframe, button)
            log:Debug("button [%s]", button)
            if (button == "LeftButton") then
                petbm.PetTeamView:ToggleView()
            elseif (button == "RightButton") then
                InterfaceOptionsFrame_OpenToCategory(petbm.PetBattleMaster.configFrame)
            end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:AddLine(HIGHLIGHT_FONT_COLOR_CODE .. APP_NAME .. FONT_COLOR_CODE_CLOSE)
            tooltip:AddLine(L["%sLeft-click%s to open pet team view"]:format(YELLOW_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE))
            tooltip:AddLine(L["%sRight-click%s to open configuration"]:format(YELLOW_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE))
        end
    })

    -- perhaps we are still in combat
    if (C_PetBattles.IsInBattle()) then
        _Open(self)
    end

    self:ApplyConfig()
end

function petbm.PetBattleMaster:OnShowPetJournal()
    log:Debug("OnShowPetJournal")
    if (CollectionsJournal and CollectionsJournal.RestoreWindowPosition) then
        CollectionsJournal:RestoreWindowPosition()
    end
    petbm.PetTeamManager:Update()
end

function petbm.PetBattleMaster:ProfileUpdate(event)
    log:Debug("ProfileUpdate event [%s]", event)
    self:ApplyConfig()
end

function petbm.PetBattleMaster:ChatCommand(msg)
    log:Debug("msg [%s]", msg)
    if ("debug" == msg) then
        if (log:IsDebugging()) then
            print("Turning off debugging")
            log:SetDebugging(nil)
        else
            print("Turning on debugging")
            log:SetDebugging(true)
        end
    elseif ("history" == msg) then
        print("Printing history")
        log:PrintHistory()
    elseif ("clear" == msg) then
        print("Clearing history")
        log:ClearHistory()
    else
        petbm.PetTeamView:ToggleView()
    end
end

function petbm.PetBattleMaster.Print(self, msg)
    print("|cFF3DDEFF" .. msg .. "|r")
end

function petbm.PetBattleMaster:PET_BATTLE_PET_CHANGED()
    log:Debug("PET_BATTLE_PET_CHANGED")
    if (self.view) then
        self.view:PetChanged()
    end
end

function petbm.PetBattleMaster:PET_BATTLE_OPENING_START()
    log:Debug("PET_BATTLE_OPENING_START")
    self.inBattle = true
end

function petbm.PetBattleMaster:PET_BATTLE_OPENING_DONE()
    log:Debug("PET_BATTLE_OPENING_DONE")
    _Open(self)
end

function petbm.PetBattleMaster:PET_BATTLE_CLOSE()
    log:Debug("PET_BATTLE_CLOSE")
    if (self.view) then
        self.view:Close()
    end
    self.inBattle = nil
end

function petbm.PetBattleMaster:PET_BATTLE_MAX_HEALTH_CHANGED()
    _UpdateInfoView(self)
end

function petbm.PetBattleMaster:PET_BATTLE_HEALTH_CHANGED()
    _UpdateInfoView(self)
end

function petbm.PetBattleMaster:PET_BATTLE_XP_CHANGED()
    _UpdateInfoView(self)
end

function petbm.PetBattleMaster:EnsureBlizzardCollections()
    log:Debug("EnsureBlizzardCollections")
    if (not MountJournal_OnLoad) then
        UIParentLoadAddOn('Blizzard_Collections')
    end
    self.blizzardCollectionsAvailable = true
end

function petbm.PetBattleMaster:PLAYER_LOGIN()
    log:Debug("PLAYER_LOGIN")
    self:EnsureBlizzardCollections();
    petbm.PetTeamManager:Init()
    petbm.PetTeamView:Init()
    self:ApplyConfig()
end

function petbm.PetBattleMaster:SetSearchFilter(text)
    log:Debug("SetSearchFilter text [%s]", text)
    self.searchText = text
end

function petbm.PetBattleMaster:ApplyConfig()
    if (self.db.profile.minimapButton) then
        log:Debug("Show minimap button")
        if (dbIcon:IsRegistered("PetBattleMaster")) then
            dbIcon:Show("PetBattleMaster")
        else
            dbIcon:Register("PetBattleMaster", self.ldb, self.db.profile.minimapIcon)
        end
    elseif (dbIcon:IsRegistered("PetBattleMaster")) then
        log:Debug("Hide minimap button")
        dbIcon:Hide("PetBattleMaster")
    end

    if (self.blizzardCollectionsAvailable) then
        if (self.db.profile.petJournalMovable and not CollectionsJournal:IsMovable()) then
            petbm.MovingView.RegisterFrame(CollectionsJournal)
            self:SecureHookScript(CollectionsJournal, "OnShow", "OnShowPetJournal")
        elseif (not self.db.profile.petJournalMovable and CollectionsJournal:IsMovable()) then
            petbm.MovingView.UnregisterFrame(CollectionsJournal)
            self:Unhook(CollectionsJournal, "OnShow")
        end
        petbm.PetTeamManager:ProfileUpdate()
    end

    petbm.BattleInfo:ApplyConfig()
    petbm.TooltipHook:ApplyConfig()
end
