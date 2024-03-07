-----------------------------------------------------------------------------------------------------------------------
--  Title:   CommandManager                                                                                          --
--  Author:  Zaazu                                                                                                   --
--  Date:    December 2021                                                                                           --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module initializes and manages addon slash commands.                                               --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class CommandManager : AceConsole, AceEvent
local CommandManager = BTools:NewModule("CommandManager", "AceConsole-3.0", "AceEvent-3.0")

---@type StdUi
local StdUi = nil

-- Default list of slash commands
local Commands = {
    ---@class SlashCommand
    ---Mail Log
    {
        enabled = true,
        hidden = false,
        command = {"MailLog", "Mail"},
        description = "Opens the Mail Log window",
        execute = function()
            BTools:SendMessage(BTools.AddonEvents.ShowMailLogWindow)
        end
    },
    ---@type SlashCommand
    ---Trade Log
    {
        enabled = true,
        hidden = false,
        command = {"TradeLog", "Trade"},
        description = "Opens the Trade Log window",
        execute = function()
            BTools:SendMessage(BTools.AddonEvents.ShowTradeLogWindow)
        end
    },
    ---@type SlashCommand
    ---Character Info
    {
        enabled = true,
        hidden = false,
        command = {"CharacterInfo", "CharInfo", "Info"},
        description = "Shows the Character Info window",
        execute = function()
            BTools:SendMessage(BTools.AddonEvents.ShowCharacterInfoWindow)
        end
    },
    ---@type SlashCommand
    ---Toggle Minimap Icon
    {
        enabled = true,
        hidden = false,
        command = {"Minimap"},
        description = "Toggles the Minimap Button",
        execute = function()
            BTools:SendMessage(BTools.AddonEvents.ToggleMinimapIcon)
        end
    },
    ---@type SlashCommand
    ---Debug
    {
        enabled = true,
        hidden = true,
        command = {"debug"},
        description = "An illusion what are you hiding...",
        execute = function()
            BTools:SendMessage(BTools.AddonEvents.ShowExportDataWindow, "Debug Data", "Debug Data here...")
        end
    }
}

---Slash Command
---@param input string
local function ExecuteSlashCommand(input)
    local inputCommand = nil
    local inputArgs = {}

    input = input or ""
    input = input:lower():trim()

    for word in input:gmatch("%S+") do
        -- first word is the command, the rest are args
        if (not inputCommand) then
            inputCommand = word
        else
            table.insert(inputArgs, word)
        end
    end

    inputCommand = inputCommand or ""

    -- for every command, if enabled check if input matches one of the command names, if matched then execute
    local found = false
    for _, v in ipairs(Commands) do
        if (v.enabled) then
            for _, v2 in ipairs(v.command) do
                if (inputCommand == v2:lower()) then
                    v.execute()
                    found = true
                    break
                end
            end
            if (found) then
                break
            end
        end
    end

    -- if not found, print help message
    if (not found) then
        BTools:Print("Usage: /btools " .. StdUi.Util.WrapTextInColor("command", 1, 1, 0, 1))

        for _, v in ipairs(Commands) do
            if (v.enabled and not v.hidden) then
                local commands = ""
                for _, v2 in ipairs(v.command) do
                    commands = commands .. v2 .. " / "
                end
                --Remove last /
                commands = commands:sub(1, #commands - 3)
                
                BTools:Print(StdUi.Util.WrapTextInColor(commands, 1, 1, 0, 1) .. " => " .. v.description)
            end
        end
    end
end

---Add alias to activate slash command
---eg. /btools
---@param alias string Without leading "/"
function CommandManager:AddCommandAlias(alias)
    self:RegisterChatCommand(alias, ExecuteSlashCommand)
end

---Add slash command to the Commands table
---@param command SlashCommand
function CommandManager:AddCommand(command)
    table.insert(Commands, command)
end

function CommandManager:OnInitialize()
    StdUi = BTools:GetStdUiInstance()

    self:RegisterChatCommand("boost", ExecuteSlashCommand)
    self:RegisterChatCommand("btools", ExecuteSlashCommand)
    self:RegisterChatCommand("boostingtools", ExecuteSlashCommand)
end
