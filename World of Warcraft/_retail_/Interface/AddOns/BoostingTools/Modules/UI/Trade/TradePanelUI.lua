-----------------------------------------------------------------------------------------------------------------------
--  Title:   TradePanelUI                                                                                            --
--  Author:  Zaazu                                                                                                   --
--  Date:    November 2021                                                                                           --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that handles the Trade Panel drawn when the trade frame is open.                            --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class TradePanelUI : AceConsole, AceEvent
local TradePanelUI = BTools:NewModule("TradePanelUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type DBTradeLog
local TradeLogDB = nil
---@type DBSettingsTrade
local TradeSettingsDB = nil

---@type Frame
local TradeSidePanel = nil
---@type Frame
local TradeBottomPanel = nil

---Filters the TradeLog database and updates the Trade Panel
local function FilterTradeTable()
    -- If the panel isn't initialisd, stop
    if (not TradeSidePanel) then
        return
    end

    -- Player name-realm
    local playerName, playerRealm = UnitFullName("Player")

    -- Target name-realm
    local targetName, targetRealm = UnitFullName("NPC")

    -- If realm is nil, assume same realm as player
    if (not targetRealm) then
        targetRealm = GetNormalizedRealmName()
    end

    local data = {}
    -- LuaFormatter off
    for _, v in pairs(TradeLogDB) do
        if ((v.player and (not TradeSettingsDB.panelShowOnlyCharacter or v.player:find(playerName .. "-" .. playerRealm, 1, true))) and -- Only this character
            (v.result and (not TradeSettingsDB.panelShowOnlyCompleted or v.result:find("Completed", 1, true))) and -- Only Completed Trades
            v.target:find(targetName .. "-" .. targetRealm, 1, true)) then
            local tradeGivenSummary = string.format("%s%sx%d %s%s",
                BTools.Resources.getFormattedTextureString(BTools.Resources.textures.TradeGive, 16, 255, 0, 0),
                BTools.Resources.getFormattedTextureString(BTools.Resources.textures.LootBag, 16), #v.playerItems,
                BTools.Resources.getFormattedTextureString(BTools.Resources.textures.CoinStack, 16), StdUi.Util.formatMoney(v.playerMoney))

            local tradeReceivedSummary = string.format("%s%sx%d %s%s",
                BTools.Resources.getFormattedTextureString(BTools.Resources.textures.TradeReceive, 16, 0, 255, 0),
                BTools.Resources.getFormattedTextureString(BTools.Resources.textures.LootBag, 16), #v.targetItems,
                BTools.Resources.getFormattedTextureString(BTools.Resources.textures.CoinStack, 16), StdUi.Util.formatMoney(v.targetMoney))

            local result = nil
            if (v.result == "Completed") then
                result = StdUi.Util.WrapTextInColor("Trade " .. v.result, 0, 1, 0, 1)
            else
                result = StdUi.Util.WrapTextInColor("Trade " .. v.result, 1, 0, 0, 1)
            end

            local buttonText = string.format("%s\n%s\n%s\n%s", result, date("%Y/%m/%d %H:%M:%S (%a)", v.serverTime),
                tradeGivenSummary, tradeReceivedSummary)

            table.insert(data, {
                text = buttonText,
                tradeData = v
            })
        end
    end
    -- LuaFormatter on

    -- Sort by time descending
    table.sort(data, function(a, b)
        return a.tradeData.serverTime > b.tradeData.serverTime
    end)

    TradeSidePanel.tradesWithText:SetText(string.format("Showing all %d trades with:\n%s", #data,
                                                        targetName .. "-" .. targetRealm))

    TradeSidePanel.scrollFrame:CreateItems(data, "HighlightButton", function(parent, btn, data)
        btn:SetText(data.text)
        btn.tradeData = data.tradeData

        local fs = btn:GetFontString()
        fs:SetJustifyH("LEFT")
        fs:SetJustifyV("TOP")

        btn:SetPoint("RIGHT")
        btn:SetPoint("LEFT")

        btn:SetHeight(60)

        btn:SetScript("OnClick", function(self)
            TradePanelUI:SendMessage(BTools.AddonEvents.ShowTradeViewerWindow, data.tradeData)
        end)

        return btn
    end, 5)
end

---Draw the Side Trade Panel
local function DrawSidePanel()
    -- RecentTradesPanel
    TradeSidePanel = StdUi:PanelWithTitle(TradeFrame, 250, TradeFrame:GetHeight(), "Boosting Tools: Trades")
    StdUi:GlueAfter(TradeSidePanel, TradeFrame, 0, 0, "CENTER")

    -- Showing trades with
    TradeSidePanel.tradesWithText = StdUi:Label(TradeSidePanel, "Showing trades with...")
    StdUi:GlueTop(TradeSidePanel.tradesWithText, TradeSidePanel, 5, -35, "LEFT")

    -- Only this character
    TradeSidePanel.onlyThisCharacterCheckbox = StdUi:Checkbox(TradeSidePanel, "Only show this character")
    TradeSidePanel.onlyThisCharacterCheckbox:SetChecked(TradeSettingsDB.panelShowOnlyCharacter)
    TradeSidePanel.onlyThisCharacterCheckbox:HookScript("OnClick", function(self)
        TradeSettingsDB.panelShowOnlyCharacter = self:GetChecked()
        FilterTradeTable()
    end)
    StdUi:GlueBelow(TradeSidePanel.onlyThisCharacterCheckbox, TradeSidePanel.tradesWithText, 0, -5, "LEFT")

    -- Only completed
    TradeSidePanel.onlyCompletedCheckbox = StdUi:Checkbox(TradeSidePanel, "Only show completed trades")
    TradeSidePanel.onlyCompletedCheckbox:SetChecked(TradeSettingsDB.panelShowOnlyCompleted)
    TradeSidePanel.onlyCompletedCheckbox:HookScript("OnClick", function(self)
        TradeSettingsDB.panelShowOnlyCompleted = self:GetChecked()
        FilterTradeTable()
    end)
    StdUi:GlueBelow(TradeSidePanel.onlyCompletedCheckbox, TradeSidePanel.onlyThisCharacterCheckbox, 0, 0, "LEFT")

    TradeSidePanel.scrollFrame = StdUi:HybridScrollFrame(TradeSidePanel, TradeSidePanel:GetWidth() - 10,
                                                         TradeSidePanel:GetHeight() - 115)
    TradeSidePanel.scrollFrame:SetScrollStep(61)
    TradeSidePanel.scrollFrame:SetDoNotHideScrollBar(true)
    StdUi:GlueBottom(TradeSidePanel.scrollFrame, TradeSidePanel, 0, 5, "CENTER")
end

---Draw the Bottom Trade Panel
local function DrawBottomPanel()
    -- TradePanel
    TradeBottomPanel = StdUi:Panel(TradeFrame, TradeFrame:GetWidth(), 40)
    StdUi:GlueBelow(TradeBottomPanel, TradeFrame, 0, 0, "CENTER")

    -- Checkboxes
    TradeBottomPanel.logTradeCheckbox = StdUi:Checkbox(TradeBottomPanel, "Log trade.")
    TradeBottomPanel.logTradeCheckbox:SetChecked(TradeSettingsDB.logTrades)
    TradeBottomPanel.logTradeCheckbox:HookScript("OnClick", function(self)
        if (self:GetChecked()) then
            TradeSettingsDB.logTrades = true
            TradeBottomPanel.announceCheckbox:Enable()
            TradeBottomPanel.announceChannelDropdown:Enable()
        else
            TradeSettingsDB.logTrades = false
            TradeBottomPanel.announceCheckbox:Disable()
            TradeBottomPanel.announceChannelDropdown:Disable()
        end
    end)
    StdUi:GlueTop(TradeBottomPanel.logTradeCheckbox, TradeBottomPanel, 10, -10, "LEFT")

    TradeBottomPanel.announceCheckbox = StdUi:Checkbox(TradeBottomPanel, "Announce in:")
    TradeBottomPanel.announceCheckbox:SetChecked(TradeSettingsDB.announceTrade)
    TradeBottomPanel.announceCheckbox:HookScript("OnClick", function(self)
        TradeSettingsDB.announceTrade = self:GetChecked()
    end)
    StdUi:GlueAfter(TradeBottomPanel.announceCheckbox, TradeBottomPanel.logTradeCheckbox, 0, 0, "LEFT")

    -- Dropdown
    local options = {
        {text = "Console", value = "Console"},
        {text = "Whisper", value = "Whisper"},
        {text = "Group", value = "Group"}
    }

    TradeBottomPanel.announceChannelDropdown = StdUi:Dropdown(TradeBottomPanel.announceCheckbox, 100, 18, options)
    TradeBottomPanel.announceChannelDropdown:SetValue(TradeSettingsDB.announceChannel)
    TradeBottomPanel.announceChannelDropdown.OnValueChanged = function(self, value)
        TradeSettingsDB.announceChannel = value
    end
    StdUi:GlueRight(TradeBottomPanel.announceChannelDropdown, TradeBottomPanel.announceCheckbox, 95, 0, "LEFT")

    if (not TradeSettingsDB.logTrades) then
        TradeBottomPanel.announceCheckbox:Disable()
        TradeBottomPanel.announceChannelDropdown:Disable()
    end
end

---Update the Trade Panel
local function UpdatePanel()
    FilterTradeTable()
end

---Draw the Trade Panel if not initialised, then show
local function ShowPanel()
    if (not TradeSidePanel) then
        DrawSidePanel()
    end

    if (not TradeBottomPanel) then
        DrawBottomPanel()
    end

    UpdatePanel()

    TradeSidePanel:Show()
    TradeBottomPanel:Show()
end

---Called when the module is enabled
function TradePanelUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()

    ---@type DatabaseManager
    local DB = BTools:GetModule("DatabaseManager")
    TradeLogDB = DB:GetTradeLogTable()
    TradeSettingsDB = DB:GetTradeSettingsTable()

    -- Blizzard Events
    self:RegisterEvent("TRADE_SHOW", ShowPanel)
end
