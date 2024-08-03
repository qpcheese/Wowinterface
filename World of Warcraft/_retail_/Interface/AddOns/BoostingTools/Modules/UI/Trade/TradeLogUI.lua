-----------------------------------------------------------------------------------------------------------------------
--  Title:   TradeLogUI                                                                                              --
--  Author:  Zaazu                                                                                                   --
--  Date:    May 2021                                                                                                --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that handles drawing the Trade Log window.                                                  --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class TradeLogUI : AceConsole, AceEvent
local TradeLogUI = BTools:NewModule("TradeLogUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type DBTradeLog
local TradeLogDB = nil
---@type DBSettingsTrade
local TradeSettingsDB = nil

---@type Frame
local TradeLogWindow = nil

---@type Frame
local Tooltip = nil

---Shows the tooltip
---@param parent Frame
---@param title string
---@param body string | table
local function ShowTooltip(parent, title, body)
    local headerFontColor = StdUi.config.font.color.header
    local bodyFontColor = StdUi.config.font.color.normal

    Tooltip.owner = parent
    Tooltip.anchor = "TOP"

    Tooltip:SetText(title, headerFontColor.r, headerFontColor.g, headerFontColor.b)
    Tooltip:AddLine("")

    if (type(body) == "table") then
        Tooltip:AddLine(StdUi.Util.formatMoney(body.money), bodyFontColor.r, bodyFontColor.g, bodyFontColor.b)

        for _, v in ipairs(body.items) do
            Tooltip:AddLine(v.itemLink .. "x" .. v.numItems, bodyFontColor.r, bodyFontColor.g, bodyFontColor.b)
        end
    else
        Tooltip:AddLine(body, bodyFontColor.r, bodyFontColor.g, bodyFontColor.b)
    end

    Tooltip:Show()
end

---Filters the Trade Log database and updates the tradeTable view
local function FilterTradeTable()
    -- If the window isn't initialised, no need to filter
    if (not TradeLogWindow) then
        return
    end

    local name, realm = UnitFullName("Player")

    -- Lowercase, remove trailing/leading spaces
    local query = TradeLogWindow.searchBox:GetText():lower():match("^%s*(.-)%s*$")

    -- Separate query string into space separated filters
    local filters = {""}
    for substring in query:gmatch("%S+") do
        table.insert(filters, substring)
    end

    local count = 0
    local results = {}
    for _, v in pairs(TradeLogDB) do
        local allFound = true
        count = count + 1

        -- For every filter
        -- LuaFormatter off
        for i = 1, #filters do
            if (not ((v.serverTime and (not TradeSettingsDB.logShowOnlyPastDay or v.serverTime >= (GetServerTime() - 86400))) and -- Only past 24 hours (86400 Seconds)
                (v.player and (not TradeSettingsDB.logShowOnlyThisCharacter or v.player:find(name .. "-" .. realm, 1, true))) and -- Only this character
                (v.result and (not TradeSettingsDB.logShowOnlyCompleted or v.result:find("Completed", 1, true))) and -- Only Completed Trades
                ((v.serverTime and date("%Y/%m/%d %H:%M:%S", v.serverTime):find(filters[i], 1, true)) or -- Server Time
                    (v.location and v.location:lower():find(filters[i], 1, true)) or -- Location
                    (v.player and v.player:lower():find(filters[i], 1, true)) or -- Player Name
                    (v.target and v.target:lower():find(filters[i], 1, true)) or -- Target Name
                    (v.playerMoney and tostring(v.playerMoney):find(filters[i], 1, true)) or -- Player Money
                    (v.targetMoney and tostring(v.targetMoney):find(filters[i], 1, true)) or -- Target Money
                    (v.playerItems and tostring(#v.playerItems):find(filters[i], 1, true)) or -- Number of Player Items
                    (v.targetItems and tostring(#v.targetItems):find(filters[i], 1, true)) or -- Number of Target Items
                    (v.result and v.result:lower():find(filters[i], 1, true)) or -- Result
                    (v.playerItems and (function() -- Player Item Name/Quantity
                        for _, v2 in pairs(v.playerItems) do
                            if (v2.name:lower():find(filters[i], 1, true) or
                                tostring(v2.numItems):find(filters[i], 1, true)) then
                                return true
                            end
                        end
                        return false
                    end)()) or (v.targetItems and (function() -- Target Item Name/Quantity
                    for _, v2 in pairs(v.targetItems) do
                        if (v2.name:lower():find(filters[i], 1, true) or tostring(v2.numItems):find(filters[i], 1, true)) then
                            return true
                        end
                    end
                    return false
                end)())))) then
                allFound = false

                -- No need to cotinue, all filters need to be matched
                i = #filters
            end
        end
        -- LuaFormatter on

        if (allFound) then
            table.insert(results, v)
        end
    end

    TradeLogWindow.numSearchResultsLabel:SetText("Showing " .. #results .. " of " .. count .. " entries")
    TradeLogWindow.tradeTable:SetData(results)
    TradeLogWindow.tradeTable:SortData(2)
end

---Deletes entry at specified id, refresh trade table
local function DeleteEntry(id)
    for k, v in pairs(TradeLogDB) do
        if (v.id == id) then
            table.remove(TradeLogDB, k)
            FilterTradeTable()
            break
        end
    end
end

---Deletes all entries, refresh trade table
local function DeleteAllData()
    for k, _ in pairs(TradeLogDB) do
        TradeLogDB[k] = nil
    end
    FilterTradeTable()
end

---Convert Trade Log entries into CSV, send to export data window
local function ExportData()
    local data = {}
    local keys = {
        "Server Time",
        "Location",
        "You",
        "Target",
        "You Offer Copper",
        "You Offer Number of Items",
        "You Offer Items",
        "Target Offer Copper",
        "Target Offer Number of Items",
        "Target Offer Items",
        "Status"
    }

    for _, v in pairs(TradeLogDB) do
        local playerItems = {}
        local targetItems = {}
        for i = 1, 6 do
            local playerItem = v.playerItems[i]
            local targetItem = v.playerItems[i]

            if (playerItem) then
                table.insert(playerItems, "[" .. (playerItem.name or "") .. "(" .. (playerItem.itemLink:match("item:(%d+):") or "") ..
                                ")]x" .. (playerItem.numItems or ""))
            end

            if (targetItem) then
                table.insert(targetItems, "[" .. (targetItem.name or "") .. "(" .. (targetItem.itemLink:match("item:(%d+):") or "") ..
                                 ")]x" .. (targetItem.numItems or ""))
            end
        end

        local entry = {
            [keys[1]] = date("%Y/%m/%d %H:%M (%a)", v.serverTime),
            [keys[2]] = v.location,
            [keys[3]] = v.player,
            [keys[4]] = v.target,
            [keys[5]] = v.playerMoney,
            [keys[6]] = #playerItems,
            [keys[7]] = table.concat(playerItems, ", "),
            [keys[8]] = v.targetMoney,
            [keys[9]] = #targetItems,
            [keys[10]] = table.concat(targetItems, ", "),
            [keys[11]] = v.result
        }

        table.insert(data, entry)
    end

    TradeLogUI:SendMessage(BTools.AddonEvents.ShowExportDataWindow,
                           [[Trade Log Data. ([Format: 'CSV'] [Delimiter: ','] [Text Quantifier: '"'])]],
                           BTools.Utils.encodeCSV(keys, data))
end

---Draws the Trade Log Window
local function DrawWindow()
    TradeLogWindow = StdUi:Window(UIParent, 1400, 685, "Boosting Tools: Trade Log")
    TradeLogWindow:Hide()

    StdUi:MakeResizable(TradeLogWindow, "BOTTOMRIGHT")
    StdUi:MakeResizable(TradeLogWindow, "TOPLEFT")
    TradeLogWindow:SetResizeBounds(950, 300, 1400, 685)

    TradeLogWindow:HookScript("OnShow", function(self)
        PlaySound(BTools.Resources.sounds.OpenWindow)
        TradeLogUI:SendMessage(BTools.AddonEvents.TradeLogOnShow)
        self:ClearAllPoints()
        self:SetPoint("CENTER")
    end)
    TradeLogWindow:HookScript("OnHide", function(self)
        PlaySound(BTools.Resources.sounds.CloseWindow)
        TradeLogUI:SendMessage(BTools.AddonEvents.TradeLogOnHide)
    end)
    TradeLogWindow:HookScript("OnSizeChanged", function(self)
        local tableWidth = self.tradeTable:GetWidth()
        local tableHeight = self.tradeTable:GetHeight()

        -- Total number of columns
        local totalColWidth = 0
        for i = 1, #self.tradeTable.columns do
            totalColWidth = totalColWidth + self.tradeTable.columns[i].width
        end

        -- Adjust width
        for i = 1, #self.tradeTable.columns do
            self.tradeTable.columns[i]:SetWidth((self.tradeTable.columns[i].width / totalColWidth) * (tableWidth - 30))
        end

        -- Adjust num visible rows
        self.tradeTable:SetDisplayRows(math.floor(tableHeight / self.tradeTable.rowHeight), self.tradeTable.rowHeight)
    end)

    TradeLogWindow:SetScale(BTools:GetScaleNormalized())
    TradeLogWindow:SetFrameLevel(10)

    -- Register to close on escape
    _G["TradeLogWindow"] = TradeLogWindow
    table.insert(UISpecialFrames, "TradeLogWindow")

    -- Logo
    TradeLogWindow.logoFrame = StdUi:Frame(TradeLogWindow, 96, 96)
    TradeLogWindow.logoFrame:SetScript("OnMouseUp", function(self)
        PlaySound(BTools.Resources.sounds.EasterEgg, "MASTER", true)
    end)

    TradeLogWindow.logoFrame.texture = StdUi:Texture(TradeLogWindow.logoFrame, 96, 96, BTools.Resources.textures.Logo)

    StdUi:GlueTop(TradeLogWindow.logoFrame, TradeLogWindow, -300, -30, "RIGHT")
    TradeLogWindow.logoFrame.texture:SetPoint("CENTER", 0, 0)

    -- Logo Title
    TradeLogWindow.titleFrame = StdUi:Frame(TradeLogWindow, 256, 128)
    TradeLogWindow.titleFrame.texture = StdUi:Texture(TradeLogWindow.titleFrame, 256, 128,
                                                      BTools.Resources.textures.Title)
    StdUi:GlueRight(TradeLogWindow.titleFrame.texture, TradeLogWindow.titleFrame, 0, 0)
    StdUi:GlueRight(TradeLogWindow.titleFrame, TradeLogWindow.logoFrame, 10, 0, "CENTER")

    -- Actions
    TradeLogWindow.actionsLabel = StdUi:Label(TradeLogWindow, "Actions:")
    StdUi:GlueTop(TradeLogWindow.actionsLabel, TradeLogWindow, 15, -30, "LEFT")

    -- Export Data
    TradeLogWindow.exportDataButton = StdUi:Button(TradeLogWindow, 150, 28, "Export to CSV")
    TradeLogWindow.exportDataButton:HookScript("OnClick", function()
        ExportData()
    end)
    StdUi:GlueBelow(TradeLogWindow.exportDataButton, TradeLogWindow.actionsLabel, 0, 0, "LEFT")

    -- Delete Data
    TradeLogWindow.clearDataButton = StdUi:Button(TradeLogWindow, 150, 28, "Delete All Data")
    TradeLogWindow.clearDataButton:HookScript("OnClick", function()
        local confirmDialog = StdUi:Confirm("Delete All Data?",
                                            "Are you sure you wish to PERMANENTLY delete all Trade Log data?", {
            {
                text = "Delete Data",
                onClick = function(btn)
                    DeleteAllData()
                    btn.window:Hide()
                end
            },
            {
                text = "Cancel",
                onClick = function(btn)
                    btn.window:Hide()
                end
            }
        }, 100)
        confirmDialog:ClearAllPoints()
        confirmDialog:SetPoint("CENTER")
    end)
    TradeLogWindow.clearDataButton:HookScript("OnEnter", function(self)
        self:SetText(StdUi.Util.WrapTextInColor(StdUi.Util.stripColors(self:GetText()), 1, 0, 0, 1))
    end)
    TradeLogWindow.clearDataButton:HookScript("OnLeave", function(self)
        self:SetText(StdUi.Util.WrapTextInColor(StdUi.Util.stripColors(self:GetText()), 1, 1, 1, 1))
    end)
    StdUi:GlueAfter(TradeLogWindow.clearDataButton, TradeLogWindow.exportDataButton, 15, 0, "RIGHT")

    -- Filter Results
    TradeLogWindow.filterResultsLabel = StdUi:Label(TradeLogWindow, "Filter Data:")
    StdUi:GlueBelow(TradeLogWindow.filterResultsLabel, TradeLogWindow.actionsLabel, 0, -45, "LEFT")

    -- Search Box
    TradeLogWindow.searchBox = StdUi:SearchEditBox(TradeLogWindow, 400, 28, "Search")
    TradeLogWindow.searchBox:HookScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)
    TradeLogWindow.searchBox:HookScript("OnTextChanged", function()
        FilterTradeTable()
    end)
    StdUi:GlueBelow(TradeLogWindow.searchBox, TradeLogWindow.filterResultsLabel, 0, 0, "LEFT")

    -- Clear Search Box Button
    TradeLogWindow.clearSearchButton = StdUi:Button(TradeLogWindow, 100, 28, "Clear Search")
    TradeLogWindow.clearSearchButton:SetScript("OnClick", function()
        TradeLogWindow.searchBox:SetText("")
    end)
    StdUi:GlueAfter(TradeLogWindow.clearSearchButton, TradeLogWindow.searchBox, 0, 0, "RIGHT")

    -- Search Results
    TradeLogWindow.numSearchResultsLabel = StdUi:Label(TradeLogWindow, "Current Results:")
    StdUi:GlueAbove(TradeLogWindow.numSearchResultsLabel, TradeLogWindow.searchBox, 0, 0, "RIGHT")

    -- Checkboxes
    TradeLogWindow.onlyPastDayCheckbox = StdUi:Checkbox(TradeLogWindow, "Last 24 hours only")
    TradeLogWindow.onlyPastDayCheckbox:SetChecked(TradeSettingsDB.logShowOnlyPastDay)
    TradeLogWindow.onlyPastDayCheckbox:HookScript("OnClick", function(self)
        TradeSettingsDB.logShowOnlyPastDay = self:GetChecked()
        FilterTradeTable()
    end)
    StdUi:GlueBelow(TradeLogWindow.onlyPastDayCheckbox, TradeLogWindow.searchBox, 0, 0, "LEFT")

    TradeLogWindow.onlyThisCharacterCheckbox = StdUi:Checkbox(TradeLogWindow, "This character only")
    TradeLogWindow.onlyThisCharacterCheckbox:SetChecked(TradeSettingsDB.logShowOnlyThisCharacter)
    TradeLogWindow.onlyThisCharacterCheckbox:HookScript("OnClick", function(self)
        TradeSettingsDB.logShowOnlyThisCharacter = self:GetChecked()
        FilterTradeTable()
    end)
    StdUi:GlueAfter(TradeLogWindow.onlyThisCharacterCheckbox, TradeLogWindow.onlyPastDayCheckbox, 0, 0, "CENTER")

    TradeLogWindow.onlyCompletedCheckbox = StdUi:Checkbox(TradeLogWindow, "Completed trades only")
    TradeLogWindow.onlyCompletedCheckbox:SetChecked(TradeSettingsDB.logShowOnlyCompleted)
    TradeLogWindow.onlyCompletedCheckbox:HookScript("OnClick", function(self)
        TradeSettingsDB.logShowOnlyCompleted = self:GetChecked()
        FilterTradeTable()
    end)
    StdUi:GlueAfter(TradeLogWindow.onlyCompletedCheckbox, TradeLogWindow.onlyThisCharacterCheckbox, 0, 0, "CENTER")

    -- Scroll Table
    local cols = {
        {
            name = "",
            align = "CENTER",
            sortable = false,
            width = 40,
            format = function(value, rowData, columnData)
                return BTools.Resources.getFormattedTextureString(BTools.Resources.textures.Trash, 16)
            end,
            events = {
                OnClick = function(_, cellFrame, rowFrame, rowData, columnData, rowIndex, button)
                    if (not IsShiftKeyDown()) then
                        local confirmDialog = StdUi:Confirm("Delete Entry?",
                                                            "Are you sure you wish to PERMANENTLY delete this entry?\nTip: Shift + Click to skip this confirmation box.",
                                                            {
                            {
                                text = "Delete Entry",
                                onClick = function(btn)
                                    DeleteEntry(rowData.id)
                                    btn.window:Hide()
                                end
                            },
                            {
                                text = "Cancel",
                                onClick = function(btn)
                                    btn.window:Hide()
                                end
                            }
                        }, 101)

                        confirmDialog:ClearAllPoints();
                        confirmDialog:SetPoint("CENTER");
                    else
                        DeleteEntry(rowData.id)
                    end
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    cellFrame.text:SetText(BTools.Resources.getFormattedTextureString(BTools.Resources.textures.Trash,
                                                                                      16, 255, 0, 0))
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    cellFrame.text:SetText(BTools.Resources.getFormattedTextureString(BTools.Resources.textures.Trash,
                                                                                      16, 255, 255, 255))
                end
            }
        },
        {
            name = "Server Time",
            align = "LEFT",
            width = 180,
            index = "serverTime",
            format = function(value, rowData, columnData)
                return date("%Y/%m/%d %H:%M (%a)", value)
            end,
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    -- TradeLogUI:ShowTransactionViewerWindow(true, TradeLogWindow, rowData.serverTime, rowData.result,
                    --                                        rowData.player, rowData.playerMoney, rowData.playerItems,
                    --                                        rowData.target, rowData.targetMoney, rowData.targetItems)
                    TradeLogUI:SendMessage(BTools.AddonEvents.ShowTradeViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, date("%Y/%m/%d %H:%M:%S (%a)", rowData.serverTime))
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Location",
            align = "LEFT",
            width = 180,
            index = "location",
            format = "string",
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    TradeLogUI:SendMessage(BTools.AddonEvents.ShowTradeViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, rowData.location)
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "You",
            align = "LEFT",
            width = 180,
            index = "player",
            format = "string",
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    TradeLogUI:SendMessage(BTools.AddonEvents.ShowTradeViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, rowData.player)
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Target",
            align = "LEFT",
            width = 180,
            index = "target",
            format = "string",
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    TradeLogUI:SendMessage(BTools.AddonEvents.ShowTradeViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, rowData.target)
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Your Offer(Give)",
            align = "LEFT",
            width = 180,
            index = "playerMoney",
            format = function(value, rowData, columnData)
                return string.format("%s x%d %s %s",
                                     BTools.Resources.getFormattedTextureString(BTools.Resources.textures.LootBag, 16),
                                     #rowData.playerItems, BTools.Resources
                                         .getFormattedTextureString(BTools.Resources.textures.CoinStack, 16),
                                     StdUi.Util.formatMoney(value))
            end,
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    TradeLogUI:SendMessage(BTools.AddonEvents.ShowTradeViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, {money = rowData.playerMoney, items = rowData.playerItems})
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Target Offer(Receive)",
            align = "LEFT",
            width = 180,
            index = "targetMoney",
            format = function(value, rowData, columnData)
                return string.format("%s x%d %s %s",
                                     BTools.Resources.getFormattedTextureString(BTools.Resources.textures.LootBag, 16),
                                     #rowData.targetItems, BTools.Resources
                                         .getFormattedTextureString(BTools.Resources.textures.CoinStack, 16),
                                     StdUi.Util.formatMoney(value))
            end,
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    TradeLogUI:SendMessage(BTools.AddonEvents.ShowTradeViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, {money = rowData.targetMoney, items = rowData.targetItems})

                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Status",
            align = "LEFT",
            width = 120,
            index = "result",
            format = "string",
            color = function(table, value)
                local color = {r = 0, g = 0, b = 0, a = 1}

                if (value == "Completed") then
                    color.g = 1
                else
                    color.r = 1
                end

                return color
            end,
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    TradeLogUI:SendMessage(BTools.AddonEvents.ShowTradeViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, rowData.result)
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        }
    }

    TradeLogWindow.tradeTable = StdUi:ScrollTable(TradeLogWindow, cols, nil, 22)
    TradeLogWindow.tradeTable:EnableSelection(false)
    -- Hack: Stop the remove column from sorting
    TradeLogWindow.tradeTable.head.columns[1]:SetScript("OnClick", function()
    end)
    StdUi:GlueAcross(TradeLogWindow.tradeTable, TradeLogWindow, 10, -180, -10, 10)

    FilterTradeTable()
end

--- Draw the Trade Log Window if not initialised, then show
local function ShowWindow()
    if (not TradeLogWindow) then
        DrawWindow()
    end
    TradeLogWindow:Show()
end

---Hide the Trade Log Window
local function HideWindow()
    if (not TradeLogWindow) then
        return
    end
    TradeLogWindow:Hide()
end

---Called when the module is enabled
function TradeLogUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()

    ---@type DatabaseManager
    local DB = BTools:GetModule("DatabaseManager")
    TradeLogDB = DB:GetTradeLogTable()
    TradeSettingsDB = DB:GetTradeSettingsTable()

    Tooltip = BTools:GetModule("TooltipUI"):GetFrameTooltip()

    -- Custom Events
    ---On trade Logged, update the table
    self:RegisterMessage(BTools.AddonEvents.TradeLogged, FilterTradeTable)

    self:RegisterMessage(BTools.AddonEvents.ShowTradeLogWindow, ShowWindow)
    self:RegisterMessage(BTools.AddonEvents.MailLogOnShow, HideWindow)
end
