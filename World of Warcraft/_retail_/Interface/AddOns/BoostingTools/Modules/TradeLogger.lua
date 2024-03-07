-----------------------------------------------------------------------------------------------------------------------
--  Title:   TradeLogger                                                                                             --
--  Author:  Zaazu                                                                                                   --
--  Date:    May 2021                                                                                                --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that handles trade logging and announcing.                                                  --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class TradeLogger : AceConsole, AceEvent
local TradeLogger = BTools:NewModule("TradeLogger", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

local TradeLogDB = nil
local TradeSettingsDB = nil

-- --- Attempts to fix any corrupted database entries
-- function TradeLogger:CheckFixDatabase()
--     for _, v in pairs(self.tradeLogDB) do
--         v.id = v.id or self:NextTradeTableID()
--         v.serverTime = v.serverTime or 0
--         v.location = v.location or "Unknown"
--         v.target = v.target or "Unknown"
--         v.result = v.result or "Unknown"
--     end
-- end

--- Returns the current trade table. If one doesn't exist, create one.
function TradeLogger:GetCurrentTrade()
    if (not self.tradeTransactionInfo) then
        local name, realm = UnitFullName("Player")

        self.tradeTransactionInfo = {
            id = nil,
            serverTime = 0,
            location = "Unknown",
            player = name .. "-" .. realm,
            target = "Unknown",
            playerMoney = 0,
            targetMoney = 0,
            playerItems = {},
            targetItems = {},
            result = "Unknown"
        }
    end

    return self.tradeTransactionInfo
end

--- Reset Trade
function TradeLogger:EndCurrentTrade()
    self.tradeTransactionInfo = nil
end

--- Returns the next trade ID from the trade table
function TradeLogger:NextTradeTableID()
    local id = 0

    for _, v in ipairs(TradeLogDB) do
        if (v.id > id) then
            id = v.id
        end
    end

    return id + 1
end

--- Keeps track of the item which that unit has in a given slot index
function TradeLogger:UpdateTradeItems(items, unit, slotIndex)
    local itemInfo = nil
    if (unit == "Player") then
        itemInfo = BTools.Utils.varArgsToTable({GetTradePlayerItemInfo(slotIndex)}, "name", "texture", "quantity",
                                               "quality", "enchant")
    else
        itemInfo = BTools.Utils.varArgsToTable({GetTradeTargetItemInfo(slotIndex)}, "name", "texture", "quantity",
                                               "quality", "isUsable", "enchant")
    end

    -- If no itemInfo, tradeslot must be blank
    if (not itemInfo.name) then
        items[slotIndex] = nil
    else
        local item = {}

        item.name = itemInfo.name
        item.texture = itemInfo.texture
        item.numItems = itemInfo.quantity
        item.quality = itemInfo.quality
        item.isUsable = itemInfo.isUsable
        item.enchantment = itemInfo.enchant

        if (unit == "Player") then
            item.itemLink = GetTradePlayerItemLink(slotIndex)
        else
            item.itemLink = GetTradeTargetItemLink(slotIndex)
        end

        items[slotIndex] = item
    end
end

--- Updates both player and target trade money
function TradeLogger:UpdateTradeMoney()
    local currentTrade = self:GetCurrentTrade()
    currentTrade.playerMoney = GetPlayerTradeMoney()
    currentTrade.targetMoney = GetTargetTradeMoney()
end

--- Saves the current trade to the database, announces the trade and updates the table contents
function TradeLogger:LogTrade(result)
    if (TradeSettingsDB.logTrades) then
        local currentTrade = self:GetCurrentTrade()

        currentTrade.id = self:NextTradeTableID()
        currentTrade.serverTime = GetServerTime()
        currentTrade.location = GetRealZoneText()
        currentTrade.result = result

        table.insert(TradeLogDB, currentTrade)

        self:AnnounceTrade()
        self:EndCurrentTrade()
        self:SendMessage(BTools.AddonEvents.TradeLogged)
    else
        self:EndCurrentTrade()
    end
end

--- Announces the trade to the selected channel
--- COMPLETED/CANCELLED trade with name-server!. - I gave: 100g [Item 1]x1 [Item 2]x1 - I received: 100g [Item 1]x1 [Item 2]x1
function TradeLogger:AnnounceTrade()
    if (TradeSettingsDB.announceTrade) then
        local currentTrade = self:GetCurrentTrade()

        local messages = {}
        local msgIndex = 1

        messages[msgIndex] = string.format("%s trade with %s.", currentTrade.result, currentTrade.target)

        if (currentTrade.result == "Completed") then

            -- For both players
            for i = 1, 2 do
                local prefix = nil
                local gold = nil
                local items = nil

                if (i == 1) then
                    prefix = "I gave:"
                    gold = currentTrade.playerMoney
                    items = currentTrade.playerItems
                else
                    prefix = "I received:"
                    gold = currentTrade.targetMoney
                    items = currentTrade.targetItems
                end

                local numItems = BTools.Utils.getTableLength(items)
                -- If items or gold
                if (gold > 0 or numItems > 0) then
                    local nextMsg = " - " .. prefix

                    if (gold > 0) then
                        nextMsg = string.format("%s %s", nextMsg, StdUi.Util.stripColors(StdUi.Util.formatMoney(gold)))
                    end

                    -- If max characters, move onto next line
                    if (#messages[msgIndex] + #nextMsg > 255) then
                        msgIndex = msgIndex + 1
                    end

                    messages[msgIndex] = (messages[msgIndex] or "") .. nextMsg

                    if (numItems > 0) then
                        for _, v in pairs(items) do
                            nextMsg = string.format(" %sx%s", v.itemLink, v.numItems)

                            -- If max characters, move onto next line
                            if (#messages[msgIndex] + #nextMsg > 255) then
                                msgIndex = msgIndex + 1
                            end

                            messages[msgIndex] = (messages[msgIndex] or "") .. nextMsg
                        end
                    end
                end
            end
        end

        -- Send message
        for i = 1, #messages do
            if (TradeSettingsDB.announceChannel == "Console") then
                self:Print(messages[i])
            elseif (TradeSettingsDB.announceChannel == "Whisper") then
                SendChatMessage(messages[i], "WHISPER", nil, currentTrade.target)
            elseif (TradeSettingsDB.announceChannel == "Group") then
                -- Instance > Raid > Party > None
                local channel = (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT") or
                                    (UnitInRaid("player") and "RAID") or (UnitInParty("player") and "PARTY") or nil

                if (channel) then
                    SendChatMessage(messages[i], channel)
                end
            end
        end
    end
end

--- Generates random tradelog entry for testing purposes
function TradeLogger:DEBUGGenerateDummyTrade()
    local currentTrade = self:GetCurrentTrade()

    -- For 2 players
    for i = 1, 2 do
        local allItems = {}
        local numItems = math.random(1, 6)

        for j = 1, numItems do
            local item = {name = nil, itemLink = nil, quality = nil, texture = nil, numItems = nil}

            -- Generate Random Item, quantity
            while (not item.name) do
                local itemInfo = {GetItemInfo(math.random(17, 188000))}
                item.name = itemInfo[1]
                item.itemLink = itemInfo[2]
                item.quality = itemInfo[3]
                item.texture = itemInfo[10]
                item.numItems = math.random(1, 20)
            end

            table.insert(allItems, item)
        end

        if (i == 1) then
            currentTrade.playerItems = allItems
        else
            currentTrade.targetItems = allItems
        end
    end

    currentTrade.target = RandomVariable(math.random(3, 7)) .. "-" .. RandomVariable(math.random(3, 7))
    currentTrade.playerMoney = math.random(0, 999999900)
    currentTrade.targetMoney = math.random(0, 999999900)

    currentTrade.id = self:NextTradeTableID()
    currentTrade.serverTime = GetServerTime() - math.random(0, 100000000)
    currentTrade.location = GetRealZoneText()

    if (math.random(0, 1) == 1) then
        currentTrade.result = "Completed"
    else
        currentTrade.result = "Cancelled"
    end

    table.insert(TradeLogDB, currentTrade)

    self:EndCurrentTrade()
end

--- Blizzard Events
--- On Trade Window Open
function TradeLogger:EventTradeShow()
    -- Target name-realm
    local name, realm = UnitFullName("NPC")

    -- If realm is nil, assume same realm as player
    if (not realm) then
        realm = GetNormalizedRealmName()
    end

    if (name) then
        self:GetCurrentTrade().target = name .. "-" .. realm
    end
end

--- On any money changed
function TradeLogger:EventTradeMoneyChanged()
    self:UpdateTradeMoney()
end

--- On player item added/removed
function TradeLogger:EventPlayerItemChanged(_, slotIndex)
    self:UpdateTradeItems(self:GetCurrentTrade().playerItems, "Player", slotIndex)
end

--- On target item added/removed
function TradeLogger:EventTargetItemChanged(_, slotIndex)
    self:UpdateTradeItems(self:GetCurrentTrade().targetItems, "Target", slotIndex)
end

--- On player or target accept trade
function TradeLogger:EventTradeAcceptUpdate()
    local currentTrade = self:GetCurrentTrade()
    -- For each trade itemSlot
    for i = 1, 7 do
        self:UpdateTradeItems(currentTrade.playerItems, "Player", i)
        self:UpdateTradeItems(currentTrade.targetItems, "Target", i)
    end

    self:UpdateTradeMoney()
end

--- On trade failed
function TradeLogger:EventUIErrorMessage(_, _, message)
    if (message == ERR_TRADE_BAG_FULL or message == ERR_TRADE_TARGET_BAG_FULL or message == ERR_TRADE_MAX_COUNT_EXCEEDED or
        message == ERR_TRADE_TARGET_MAX_COUNT_EXCEEDED) then
        self:LogTrade("Cancelled")
    end
end

--- On trade completed or cancelled
function TradeLogger:EventUIInfoMessage(_, _, message)
    if (message == ERR_TRADE_COMPLETE) then
        self:LogTrade("Completed")

    elseif (message == ERR_TRADE_CANCELLED) then
        self:LogTrade("Cancelled")
    end
end

--- Called when the module is enabled
function TradeLogger:OnEnable()
    StdUi = BTools:GetStdUiInstance()
    
    ---@type DatabaseManager
    local DB = BTools:GetModule("DatabaseManager")
    TradeLogDB = DB:GetTradeLogTable()
    TradeSettingsDB = DB:GetTradeSettingsTable()

    --self:CheckFixDatabase()

    -- if (not self.tradeLogSettings) then
    --     self:DefaultSettings()
    -- end

    self:RegisterEvent("TRADE_PLAYER_ITEM_CHANGED", "EventPlayerItemChanged")
    self:RegisterEvent("TRADE_TARGET_ITEM_CHANGED", "EventTargetItemChanged")
    self:RegisterEvent("TRADE_MONEY_CHANGED", "EventTradeMoneyChanged")
    self:RegisterEvent("TRADE_ACCEPT_UPDATE", "EventTradeAcceptUpdate")
    self:RegisterEvent("TRADE_SHOW", "EventTradeShow")

    self:RegisterEvent("UI_ERROR_MESSAGE", "EventUIErrorMessage")
    self:RegisterEvent("UI_INFO_MESSAGE", "EventUIInfoMessage")
end
