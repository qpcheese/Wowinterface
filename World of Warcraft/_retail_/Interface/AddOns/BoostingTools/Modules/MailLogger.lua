-----------------------------------------------------------------------------------------------------------------------
--  Title:   MailLogger                                                                                              --
--  Author:  Zaazu                                                                                                   --
--  Date:    May 2021                                                                                                --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that handles mail logging.                                                                  --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class MailLogger : AceConsole, AceEvent
local MailLogger = BTools:NewModule("MailLogger", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

local MailLogDB = nil
local MailSettingsDB = nil

---Returns the current mail message table. If one doesn't exist, create one.
---@return table
function MailLogger:GetCurrentMailMessage()
    if (not self.mailMessageInfo) then

        self.mailMessageInfo = {
            id = nil,
            serverTime = 0,
            type = "Unknown", -- "Sent/Received"
            sender = "Unknown",
            receiver = "Unknown",
            subject = "Unknown",
            body = "Unknown",
            attachedItems = {},
            attachedMoney = 0,
            isCOD = false
        }
    end

    return self.mailMessageInfo
end

-- ---Attempts to fix any corrupted database entries
-- function MailLogger:CheckFixDatabase()
--     for _, v in pairs(self.mailLogDB) do
--         v.id = v.id or self:NextMailTableID()
--         v.serverTime = v.serverTime or 0
--         v.type = v.type or "Unknown"
--         v.sender = v.sender or "Unknown"
--         v.receiver = v.receiver or "Unknown"
--         v.subject = v.subject or "Unknown"
--         v.body = v.body or "Unknown"
--     end
-- end

---Reset mail message
function MailLogger:EndCurrentMailMessage()
    self.mailMessageInfo = nil
end

---Returns the next mail ID from the mail table
---@return number
function MailLogger:NextMailTableID()
    local id = 0

    for _, v in ipairs(MailLogDB) do
        if (v.id > id) then
            id = v.id
        end
    end

    return id + 1
end

---Saves the current mail message
function MailLogger:LogMailMessage()
    if (MailSettingsDB.logMail) then
        local currentMessage = self:GetCurrentMailMessage()
        currentMessage.id = self:NextMailTableID()
        currentMessage.serverTime = GetServerTime()

        table.insert(MailLogDB, currentMessage)

        self:EndCurrentMailMessage()
        self:SendMessage(BTools.AddonEvents.MailLogged)
    else
        self:EndCurrentMailMessage()
    end
end

---Events
---On mail sent successfully
function MailLogger:EventMailSendSuccess()
    -- self:Print("Event: MAIL_SEND_SUCCESS")
    self:LogMailMessage()
end

---On mail sent failed
function MailLogger:EventMailFailed()
    -- self:Print("Event: MAIL_FAILED")
    self:EndCurrentMailMessage()
end

---On mailbox update, store which mail has previously been opened
function MailLogger:EventMailInboxUpdate()
    -- self:Print("Event: MAIL_INBOX_UPDATE")
    self.readMail = {}

    local numItems = GetInboxNumItems()
    for i = 1, numItems do
        self.readMail[i] = select(9, GetInboxHeaderInfo(i))
    end
end

---Function Hooks
---When mail is sent, grab a copy of the sent mail contents
---@param receiver string
---@param subject string
---@param body string
function MailLogger:HookSendMail(receiver, subject, body)
    local mailMessageInfo = self:GetCurrentMailMessage()

    local playerName, playerRealm = UnitFullName("Player")

    -- If no hyphen, assume same realm as player
    if (not receiver:find("-", 1, true)) then
        receiver = receiver .. "-" .. playerRealm
    end

    mailMessageInfo.type = "Sent"
    mailMessageInfo.sender = playerName .. "-" .. playerRealm
    mailMessageInfo.receiver = receiver
    mailMessageInfo.subject = subject
    mailMessageInfo.body = body
    mailMessageInfo.attachedMoney = GetSendMailMoney()

    -- If the message is CoD
    local codValue = GetSendMailCOD()
    if (codValue > 0) then
        mailMessageInfo.attachedMoney = codValue
        mailMessageInfo.isCOD = true
    end

    -- Get attached items
    for i = 1, ATTACHMENTS_MAX_RECEIVE do
        local itemInfo = BTools.Utils.varArgsToTable({GetSendMailItem(i)}, "name", "itemID", "texture", "count",
                                                     "quality", "canUse")

        -- If no name, item slot must be empty
        if (not itemInfo.name) then
            mailMessageInfo.attachedItems[i] = nil
        else
            local item = {}

            item.name = itemInfo.name
            item.id = itemInfo.itemID
            item.texture = itemInfo.texture
            item.numItems = itemInfo.count
            item.quality = itemInfo.quality
            item.itemLink = GetSendMailItemLink(i)

            mailMessageInfo.attachedItems[i] = item
        end
    end
end

---When mail is read, log it
---@param index number
function MailLogger:HookGetInboxText(index)
    if (index > 0) then
        local headerInfo = BTools.Utils.varArgsToTable({GetInboxHeaderInfo(index)}, "packageIcon", "stationeryIcon",
                                                       "sender", "subject", "money", "CODAmount", "daysLeft", "hasItem",
                                                       "wasRead", "wasReturned", "textCreated", "canReply", "isGM")

        -- If the mail exists
        if (headerInfo.sender) then
            -- If the message wasn't previously read, but now is, log it.
            if (self.readMail[index] == false and headerInfo.wasRead == true) then
                self.readMail[index] = true
                local mailMessageInfo = self:GetCurrentMailMessage()

                local playerName, playerRealm = UnitFullName("Player")

                mailMessageInfo.type = "Received"
                mailMessageInfo.sender = headerInfo.sender
                mailMessageInfo.receiver = playerName .. "-" .. playerRealm
                mailMessageInfo.subject = headerInfo.subject
                mailMessageInfo.body = GetInboxText(index) or ""
                mailMessageInfo.attachedMoney = headerInfo.money

                -- If we can reply, sender must be a player
                if (headerInfo.canReply) then
                    -- If no hyphen, assume same realm as player
                    if (not mailMessageInfo.sender:find("-", 1, true)) then
                        mailMessageInfo.sender = mailMessageInfo.sender .. "-" .. playerRealm
                    end
                end

                -- If the message is CoD
                if (headerInfo.CODAmount > 0) then
                    mailMessageInfo.attachedMoney = headerInfo.CODAmount
                    mailMessageInfo.isCOD = true
                end

                local invoiceInfo = BTools.Utils.varArgsToTable({GetInboxInvoiceInfo(index)}, "invoiceType", "itemName",
                                                                "playerName", "bid", "buyout", "deposit", "consignment",
                                                                "moneyDelay", "etaHour", "etaMin", "count",
                                                                "commerceAuction")

                -- If the message is from the Auction House, build the message body
                if (invoiceInfo.invoiceType) then
                    -- If playerName is nil, must be multiple buyers/sellers
                    if (invoiceInfo.playerName == nil) then
                        invoiceInfo.playerName = (invoiceInfo.invoiceType == "buyer") and
                                                     AUCTION_HOUSE_MAIL_MULTIPLE_SELLERS or
                                                     AUCTION_HOUSE_MAIL_MULTIPLE_BUYERS
                    end

                    local multipleSale = invoiceInfo.count and invoiceInfo.count > 1
                    if (multipleSale) then
                        invoiceInfo.itemName = string.format(AUCTION_MAIL_ITEM_STACK, invoiceInfo.itemName,
                                                             invoiceInfo.count)
                    end

                    local body = nil
                    if (invoiceInfo.invoiceType == "buyer") then
                        body = string.format("%s %s\n%s %s\n\n%s\n%s", ITEM_PURCHASED_COLON, invoiceInfo.itemName,
                                             SOLD_BY_COLON, invoiceInfo.playerName, AMOUNT_PAID_COLON,
                                             StdUi.Util.formatMoney(invoiceInfo.bid))

                    elseif (invoiceInfo.invoiceType == "seller") then
                        body = string.format("%s %s\n%s %s\n\n%s\n%s%s\n%s\n%s\n%s\n%s\n\n%s\n%s", ITEM_SOLD_COLON,
                                             invoiceInfo.itemName, PURCHASED_BY_COLON, invoiceInfo.playerName,
                                             SALE_PRICE_COLON, StdUi.Util
                                                 .formatMoney(
                                                 multipleSale and (invoiceInfo.bid / invoiceInfo.count) or
                                                     invoiceInfo.bid),
                                             multipleSale and string.format(" (%d)", invoiceInfo.count) or "",
                                             DEPOSIT_COLON, StdUi.Util.formatMoney(invoiceInfo.deposit),
                                             AUCTION_HOUSE_CUT_COLON, StdUi.Util.formatMoney(invoiceInfo.consignment),
                                             AMOUNT_RECEIVED_COLON, StdUi.Util
                                                 .formatMoney(
                                                 invoiceInfo.bid + invoiceInfo.deposit - invoiceInfo.consignment))
                    end

                    mailMessageInfo.body = body or ""
                end

                -- Get attached items
                for i = 1, ATTACHMENTS_MAX_RECEIVE do
                    local itemInfo = BTools.Utils.varArgsToTable({GetInboxItem(index, i)}, "name", "itemID", "texture",
                                                                 "count", "quality", "canUse")

                    -- If no name, item slot must be empty
                    if (not itemInfo.name) then
                        mailMessageInfo.attachedItems[i] = nil
                    else
                        local item = {}

                        item.name = itemInfo.name
                        item.id = itemInfo.itemID
                        item.texture = itemInfo.texture
                        item.numItems = itemInfo.count
                        item.quality = itemInfo.quality
                        item.itemLink = GetInboxItemLink(index, i)

                        mailMessageInfo.attachedItems[i] = item
                    end
                end

                self:LogMailMessage()
            end
        end
    end
end

---When mail is looted, mark as read and log
function MailLogger:HookAutoLootMailItem(index)
    if (self.readMail[index] == false) then
        GetInboxText(index)
    end
end

---When mail is looted, mark as read and log
---@param index number
function MailLogger:HookTakeInboxMoney(index)
    if (self.readMail[index] == false) then
        GetInboxText(index)
    end
end

--- Called when the module is enabled
function MailLogger:OnEnable()
    StdUi = BTools:GetStdUiInstance()

    ---@type DatabaseManager
    local DB = BTools:GetModule("DatabaseManager")
    MailLogDB = DB:GetMailLogTable()
    MailSettingsDB = DB:GetMailSettingsTable()

    -- self:CheckFixDatabase()

    -- Function Hooks
    hooksecurefunc("SendMail", function(receiver, subject, body)
        MailLogger:HookSendMail(receiver, subject, body)
    end)
    hooksecurefunc("GetInboxText", function(index)
        MailLogger:HookGetInboxText(index)
    end)
    hooksecurefunc("AutoLootMailItem", function(index)
        MailLogger:HookAutoLootMailItem(index)
    end)
    hooksecurefunc("TakeInboxMoney", function(index)
        MailLogger:HookTakeInboxMoney(index)
    end)

    -- Blizzard events
    self:RegisterEvent("MAIL_SEND_SUCCESS", "EventMailSendSuccess")
    self:RegisterEvent("MAIL_FAILED", "EventMailFailed")

    self:RegisterEvent("MAIL_INBOX_UPDATE", "EventMailInboxUpdate")
end
