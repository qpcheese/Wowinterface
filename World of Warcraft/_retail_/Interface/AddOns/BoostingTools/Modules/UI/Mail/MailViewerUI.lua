-----------------------------------------------------------------------------------------------------------------------
--  Title:   MailViewerUI                                                                                            --
--  Author:  Zaazu                                                                                                   --
--  Date:    October 2021                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that handles Mail Viewer window.                                                            --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class MailViewerUI : AceConsole, AceEvent
local MailViewerUI = BTools:NewModule("MailViewerUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type Frame
local MailViewerWindow = nil

---@type GameTooltip
local Tooltip = nil

---Show the tooltip
---@param parent Frame
---@param item string
local function ShowTooltip(parent, item)
    Tooltip:SetOwner(parent, "TOPRIGHT")
    Tooltip:SetHyperlink(item)
    Tooltip:Show()
end

---Draw the Mail Viewer Window
local function DrawWindow()
    local windowSizeX = 380
    local windowSizeY = 450
    local borderPadding = 10
    local itemFrameSize = (windowSizeX - (borderPadding * 2)) / 8

    MailViewerWindow = StdUi:Window(UIParent, windowSizeX, windowSizeY)
    MailViewerWindow:Hide()
    MailViewerWindow:HookScript("OnShow", function(self)
        PlaySound(BTools.Resources.sounds.OpenWindow)
    end)
    MailViewerWindow:HookScript("OnHide", function(self)
        PlaySound(BTools.Resources.sounds.CloseWindow)
        self:ClearAllPoints()
        self:SetPoint("CENTER")
    end)
    MailViewerWindow:SetScale(BTools:GetScaleNormalized())
    MailViewerWindow:SetFrameLevel(15)
    MailViewerWindow:ClearAllPoints()
    MailViewerWindow:SetPoint("CENTER")

    -- Mail Sent/Received
    MailViewerWindow.mailHeader = StdUi:Header(MailViewerWindow, "Mail Sent/Received")
    StdUi:GlueTop(MailViewerWindow.mailHeader, MailViewerWindow, 0, -borderPadding, "CENTER")

    -- Sender
    MailViewerWindow.senderText = StdUi:Label(MailViewerWindow, "Sender: PlayerName-Realm")
    StdUi:GlueTop(MailViewerWindow.senderText, MailViewerWindow, borderPadding, -borderPadding - 30, "LEFT")

    -- Receiver
    MailViewerWindow.receiverText = StdUi:Label(MailViewerWindow, "Receiver: PlayerName-Realm")
    StdUi:GlueTop(MailViewerWindow.receiverText, MailViewerWindow, borderPadding, -borderPadding - 50, "LEFT")

    -- Subject
    MailViewerWindow.subjectText = StdUi:Label(MailViewerWindow, "Subject: Subject Here")
    StdUi:GlueTop(MailViewerWindow.subjectText, MailViewerWindow, borderPadding, -borderPadding - 70, "LEFT")

    -- Body
    MailViewerWindow.bodyText = StdUi:MultiLineBox(MailViewerWindow, (windowSizeX - borderPadding * 2), 200, "")
    MailViewerWindow.bodyText:Disable()
    StdUi:GlueTop(MailViewerWindow.bodyText, MailViewerWindow, borderPadding, -borderPadding - 90, "LEFT")

    -- Attachments:
    MailViewerWindow.attachmentsText = StdUi:Label(MailViewerWindow, "Attachments:")
    StdUi:GlueBottom(MailViewerWindow.attachmentsText, MailViewerWindow.bodyText, 0, -20, "LEFT")

    -- Money
    MailViewerWindow.moneyText = StdUi:Label(MailViewerWindow, "9999999g 99s 99c")
    StdUi:GlueBottom(MailViewerWindow.moneyText, MailViewerWindow.bodyText, 0, -20, "RIGHT")

    -- Mail Date
    MailViewerWindow.mailFooter = StdUi:Label(MailViewerWindow, "YYYY/MM/DD HH:MM:SS")
    StdUi:GlueBottom(MailViewerWindow.mailFooter, MailViewerWindow, 0, borderPadding, "CENTER")

    -- Item Frames
    MailViewerWindow.itemFrames = {}

    for i = 1, ATTACHMENTS_MAX do
        local itemFrame = {icon = nil, quantityText = nil, background = nil}

        itemFrame.background = StdUi:Panel(MailViewerWindow, itemFrameSize, itemFrameSize)
        itemFrame.background:SetScript("OnLeave", function(self)
            Tooltip:Hide()
        end)
        if (i == 1) then
            StdUi:GlueBottom(itemFrame.background, MailViewerWindow.attachmentsText, 0, -itemFrameSize - borderPadding,
                             "LEFT")
        elseif (i <= 8) then
            StdUi:GlueRight(itemFrame.background, MailViewerWindow.itemFrames[i - 1].background, itemFrameSize, 0,
                            "CENTER")
        else
            StdUi:GlueRight(itemFrame.background, MailViewerWindow.itemFrames[i - 8].background, 0, -itemFrameSize,
                            "CENTER")
        end

        itemFrame.icon = StdUi:Texture(itemFrame.background, itemFrameSize, itemFrameSize)
        itemFrame.icon:SetPoint("CENTER")

        itemFrame.quantityText = StdUi:Label(itemFrame.background, "9999", 16)
        StdUi:GlueBottom(itemFrame.quantityText, itemFrame.background, -2, 3, "RIGHT")

        table.insert(MailViewerWindow.itemFrames, itemFrame)
    end
end

---Update the Mail Viewer window with mail item data
---@param mailItem table
local function UpdateWindow(mailItem)
    MailViewerWindow.mailHeader:SetText("Mail " .. mailItem.type)

    MailViewerWindow.senderText:SetText("Sender: " .. mailItem.sender)
    MailViewerWindow.receiverText:SetText("Receiver: " .. mailItem.receiver)
    MailViewerWindow.subjectText:SetText("Subject: " .. mailItem.subject)
    MailViewerWindow.bodyText:SetText(mailItem.body)
    MailViewerWindow.moneyText:SetText((mailItem.isCOD and StdUi.Util.WrapTextInColor("[CoD] ", 1, 0, 0, 1) or "") ..
                                           StdUi.Util.formatMoney(mailItem.attachedMoney))

    MailViewerWindow.mailFooter:SetText(date("%Y/%m/%d %H:%M:%S (%a)", mailItem.serverTime))

    local itemFrames = MailViewerWindow.itemFrames

    for i = 1, ATTACHMENTS_MAX do
        if (mailItem.attachedItems[i]) then
            itemFrames[i].icon:SetTexture(mailItem.attachedItems[i].texture)
            itemFrames[i].quantityText:SetText(mailItem.attachedItems[i].numItems)

            itemFrames[i].background:SetScript("OnEnter", function(self)
                ShowTooltip(itemFrames[i].background, mailItem.attachedItems[i].itemLink)
            end)

            itemFrames[i].background:SetScript("OnMouseUp", function(self)
                if (IsShiftKeyDown()) then
                    DEFAULT_CHAT_FRAME.editBox:Insert(mailItem.attachedItems[i].itemLink)
                    DEFAULT_CHAT_FRAME.editBox:Show()
                    DEFAULT_CHAT_FRAME.editBox:SetFocus()
                end
            end)
        else
            itemFrames[i].icon:SetTexture(nil)
            itemFrames[i].quantityText:SetText(nil)

            itemFrames[i].background:SetScript("OnEnter", nil)
            itemFrames[i].background:SetScript("OnMouseUp", nil)
        end
    end
end

---Draw the Mail Viewer window if not initialised, then show
---@param mailItem table
local function ShowWindow(_, mailItem)
    if (not MailViewerWindow) then
        DrawWindow()
    end

    UpdateWindow(mailItem)

    MailViewerWindow:Show()
end

---Hide the window
local function HideWindow()
    if (not MailViewerWindow) then
        return
    end
    MailViewerWindow:Hide()
end

---Called when the module is enabled
function MailViewerUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()
    Tooltip = BTools:GetModule("TooltipUI"):GetRichTooltip()

    -- Custom Events
    self:RegisterMessage(BTools.AddonEvents.ShowMailViewerWindow, ShowWindow)
    self:RegisterMessage(BTools.AddonEvents.MailLogOnHide, HideWindow)
end