-----------------------------------------------------------------------------------------------------------------------
--  Title:   TradeViewerUI                                                                                           --
--  Author:  Zaazu                                                                                                   --
--  Date:    October 2021                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that handles Trade Viewer window.                                                           --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class TradeViewerUI : AceConsole, AceEvent
local TradeViewerUI = BTools:NewModule("TradeViewerUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type Frame
local TradeViewerWindow = nil

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

---Draw the Trade Viewer Window
local function DrawWindow()
    local borderPadding = 10
    local boxPadding = 2
    local boxWidth = 48
    local boxHeight = 48
    local maxItems = 6

    -- Window
    TradeViewerWindow = StdUi:Window(UIParent, ((boxWidth * 4 + borderPadding) + (boxPadding * 3)) * 2,
                                     (((boxHeight + boxPadding) * maxItems) + borderPadding * 2) + 90)
    TradeViewerWindow:Hide()
    TradeViewerWindow:HookScript("OnShow", function(self)
        PlaySound(BTools.Resources.sounds.OpenWindow)
    end)
    TradeViewerWindow:HookScript("OnHide", function(self)
        PlaySound(BTools.Resources.sounds.CloseWindow)
        self:ClearAllPoints()
        self:SetPoint("CENTER")
    end)
    TradeViewerWindow:SetScale(BTools:GetScaleNormalized())
    TradeViewerWindow:SetFrameLevel(1000)
    TradeViewerWindow:ClearAllPoints()
    TradeViewerWindow:SetPoint("CENTER")

    -- Trade Completed/Cancelled!
    TradeViewerWindow.tradeHeader = StdUi:Header(TradeViewerWindow, "Trade Completed/Cancelled!")
    StdUi:GlueTop(TradeViewerWindow.tradeHeader, TradeViewerWindow, 0, -borderPadding, "CENTER")

    -- Player Name
    TradeViewerWindow.playerNameText = StdUi:Label(TradeViewerWindow, "PlayerName-Realm")
    StdUi:GlueTop(TradeViewerWindow.playerNameText, TradeViewerWindow, borderPadding, -borderPadding - 30, "LEFT")

    -- Player Money
    TradeViewerWindow.playerMoneyText = StdUi:Label(TradeViewerWindow, "9999999g 99s 99c")
    StdUi:GlueTop(TradeViewerWindow.playerMoneyText, TradeViewerWindow, borderPadding, -borderPadding - 50, "LEFT")

    -- Target Name
    TradeViewerWindow.targetNameText = StdUi:Label(TradeViewerWindow, "TargetName-Realm")
    StdUi:GlueTop(TradeViewerWindow.targetNameText, TradeViewerWindow, -borderPadding, -borderPadding - 30, "RIGHT")

    -- Target Money
    TradeViewerWindow.targetMoneyText = StdUi:Label(TradeViewerWindow, "9999999g 99s 99c")
    StdUi:GlueTop(TradeViewerWindow.targetMoneyText, TradeViewerWindow, -borderPadding, -borderPadding - 50, "RIGHT")

    -- Trade Date
    TradeViewerWindow.tradeFooter = StdUi:Label(TradeViewerWindow, "YYYY/MM/DD HH:MM:SS")
    StdUi:GlueBottom(TradeViewerWindow.tradeFooter, TradeViewerWindow, 0, borderPadding, "CENTER")

    -- Item Frames
    TradeViewerWindow.playerItemFrames = {}
    TradeViewerWindow.targetItemFrames = {}

    for i = 1, maxItems * 2 do
        local itemFrame = {
            itemBox = {icon = nil, quantityText = nil, background = nil},
            itemText = {text = nil, background = nil}
        }

        -- Item Box
        itemFrame.itemBox.background = StdUi:Panel(TradeViewerWindow, boxWidth, boxHeight)
        itemFrame.itemBox.background:SetScript("OnLeave", function(self)
            Tooltip:Hide()
        end)

        -- Left Column
        if (i == 1) then
            StdUi:GlueTop(itemFrame.itemBox.background, TradeViewerWindow, borderPadding, -borderPadding - 70, "LEFT")
        elseif (i <= maxItems) then
            StdUi:GlueBottom(itemFrame.itemBox.background, TradeViewerWindow.playerItemFrames[i - 1].itemBox.background,
                             0, (-boxHeight - boxPadding), "CENTER")
            -- Right Column
        elseif (i == maxItems + 1) then
            StdUi:GlueTop(itemFrame.itemBox.background, TradeViewerWindow, (boxWidth * 4 + borderPadding * 2),
                          -borderPadding - 70, "LEFT")
        else
            StdUi:GlueBottom(itemFrame.itemBox.background,
                             TradeViewerWindow.targetItemFrames[(i - maxItems) - 1].itemBox.background, 0,
                             (-boxHeight - boxPadding), "CENTER")
        end

        itemFrame.itemBox.icon = StdUi:Texture(itemFrame.itemBox.background, boxWidth, boxHeight)
        itemFrame.itemBox.icon:SetPoint("CENTER")

        itemFrame.itemBox.quantityText = StdUi:Label(itemFrame.itemBox.background, "9999", 16)
        StdUi:GlueBottom(itemFrame.itemBox.quantityText, itemFrame.itemBox.background, -2, 3, "RIGHT")

        -- Item Text
        itemFrame.itemText.background = StdUi:Panel(itemFrame.itemBox.background, boxWidth * 3, boxHeight)
        itemFrame.itemText.background:SetScript("OnLeave", function(self)
            Tooltip:Hide()
        end)
        StdUi:GlueRight(itemFrame.itemText.background, itemFrame.itemBox.background, boxPadding, 0)

        itemFrame.itemText.text = StdUi:Label(itemFrame.itemText.background, "Item Name", nil, nil, (boxWidth * 3) - 4,
                                              boxHeight)
        StdUi:GlueLeft(itemFrame.itemText.text, itemFrame.itemText.background, 2, 0, "RIGHT")

        if (i <= maxItems) then
            table.insert(TradeViewerWindow.playerItemFrames, itemFrame)
        else
            table.insert(TradeViewerWindow.targetItemFrames, itemFrame)
        end
    end
end

---Update the Trade Viewer window with trade data
---@param tradeData table
local function UpdateWindow(tradeData)
    TradeViewerWindow.tradeHeader:SetText("Trade " .. tradeData.result)

    TradeViewerWindow.playerNameText:SetText(tradeData.playerName)
    TradeViewerWindow.playerMoneyText:SetText(StdUi.Util.formatMoney(tradeData.playerMoney))

    TradeViewerWindow.targetNameText:SetText(tradeData.targetName)
    TradeViewerWindow.targetMoneyText:SetText(StdUi.Util.formatMoney(tradeData.targetMoney))

    TradeViewerWindow.tradeFooter:SetText(date("%Y/%m/%d %H:%M:%S (%a)", tradeData.serverTime))

    -- For the player and the target
    for i = 1, 2 do
        local itemFrames = nil
        local items = nil

        if (i == 1) then
            itemFrames = TradeViewerWindow.playerItemFrames
            items = tradeData.playerItems
        else
            itemFrames = TradeViewerWindow.targetItemFrames
            items = tradeData.targetItems
        end

        for j = 1, #itemFrames do
            if (items[j]) then
                itemFrames[j].itemBox.icon:SetTexture(items[j].texture)
                itemFrames[j].itemBox.quantityText:SetText(items[j].numItems)
                itemFrames[j].itemText.text:SetText(items[j].itemLink)

                itemFrames[j].itemBox.background:SetScript("OnEnter", function(self)
                    ShowTooltip(itemFrames[j].itemBox.background, items[j].itemLink)
                end)
                itemFrames[j].itemText.background:SetScript("OnEnter", function(self)
                    ShowTooltip(itemFrames[j].itemText.background, items[j].itemLink)
                end)

                itemFrames[j].itemBox.background:SetScript("OnMouseUp", function(self)
                    if (IsShiftKeyDown()) then
                        DEFAULT_CHAT_FRAME.editBox:Insert(items[j].itemLink)
                        DEFAULT_CHAT_FRAME.editBox:Show()
                        DEFAULT_CHAT_FRAME.editBox:SetFocus()
                    end
                end)

                itemFrames[j].itemText.background:SetScript("OnMouseUp", function(self)
                    if (IsShiftKeyDown()) then
                        DEFAULT_CHAT_FRAME.editBox:Insert(items[j].itemLink)
                        DEFAULT_CHAT_FRAME.editBox:Show()
                        DEFAULT_CHAT_FRAME.editBox:SetFocus()
                    end
                end)
            else
                itemFrames[j].itemBox.icon:SetTexture(nil)
                itemFrames[j].itemBox.quantityText:SetText(nil)
                itemFrames[j].itemText.text:SetText(nil)

                itemFrames[j].itemBox.background:SetScript("OnEnter", nil)
                itemFrames[j].itemText.background:SetScript("OnEnter", nil)

                itemFrames[j].itemBox.background:SetScript("OnMouseUp", nil)
                itemFrames[j].itemText.background:SetScript("OnMouseUp", nil)
            end
        end
    end
end

---Draw the Trade Viewer window if not initialised, then show
local function ShowWindow(_, tradeData)
    if (not TradeViewerWindow) then
        DrawWindow()
    end

    UpdateWindow(tradeData)

    TradeViewerWindow:Show()
end

---Hide the window
local function HideWindow()
    if (not TradeViewerWindow) then
        return
    end
    TradeViewerWindow:Hide()
end

---Called when the module is enabled
function TradeViewerUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()
    Tooltip = BTools:GetModule("TooltipUI"):GetRichTooltip()

    -- Custom Events
    self:RegisterMessage(BTools.AddonEvents.ShowTradeViewerWindow, ShowWindow)
    self:RegisterMessage(BTools.AddonEvents.TradeLogOnHide, HideWindow)
end
