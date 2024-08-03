-----------------------------------------------------------------------------------------------------------------------
--  Title:   MailLogUI                                                                                               --
--  Author:  Zaazu                                                                                                   --
--  Date:    May 2021                                                                                                --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that handles drawing the Mail Log window.                                                   --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class MailLogUI : AceConsole, AceEvent
local MailLogUI = BTools:NewModule("MailLogUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type DBMailLog
local MailLogDB = nil
---@type DBSettingsMail
local MailSettingsDB = nil

---@type Frame
local MailLogWindow = nil

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
        Tooltip:AddLine((body.isCOD and "[CoD] " or "") .. StdUi.Util.formatMoney(body.money), bodyFontColor.r,
                        bodyFontColor.g, bodyFontColor.b)

        for _, v in ipairs(body.items) do
            Tooltip:AddLine(v.itemLink .. "x" .. v.numItems, bodyFontColor.r, bodyFontColor.g, bodyFontColor.b)
        end
    else
        Tooltip:AddLine(body, bodyFontColor.r, bodyFontColor.g, bodyFontColor.b)
    end

    Tooltip:Show()
end

---Filters the MailLog database and updates the mailTable view
local function FilterMailTable()
    -- If the window isn't initialised, no need to filter
    if (not MailLogWindow) then
        return
    end

    local name, realm = UnitFullName("Player")

    -- Lowercase, remove trailing/leading spaces
    local query = MailLogWindow.searchBox:GetText():lower():match("^%s*(.-)%s*$")

    -- Separate query string into space separated filters
    local filters = {""}
    for substring in query:gmatch("%S+") do
        table.insert(filters, substring)
    end

    local count = 0
    local results = {}
    -- For every entry in the database
    for _, v in pairs(MailLogDB) do
        local allFound = true
        count = count + 1

        -- For every filter
        -- LuaFormatter off
        for i = 1, #filters do
            -- If not found
            if (not ((v.serverTime and
                (not MailSettingsDB.logShowOnlyPastDay or v.serverTime >= (GetServerTime() - 86400))) and -- Only past 24 hours (86400 Seconds)
                ((v.sender and(not MailSettingsDB.logShowOnlyThisCharacter or v.sender:find(name .. "-" .. realm, 1, true))) or -- Only this character as sender
                (v.receiver and(not MailSettingsDB.logShowOnlyThisCharacter or v.receiver:find(name .. "-" .. realm, 1, true)))) and -- Only this character as receiver
                (v.type and (not MailSettingsDB.logShowOnlySent or v.type:find("Sent", 1, true))) and -- Only Sent
                ((v.serverTime and date("%Y/%m/%d %H:%M:%S (%a)", v.serverTime):find(filters[i], 1, true)) or -- Server Time
                    (v.type and v.type:lower():find(filters[i], 1, true)) or -- Type
                    (v.sender and v.sender:lower():find(filters[i], 1, true)) or -- Sender
                    (v.receiver and v.receiver:lower():find(filters[i], 1, true)) or -- Receiver
                    (v.subject and v.subject:lower():find(filters[i], 1, true)) or -- Subject
                    (v.body and v.body:lower():find(filters[i], 1, true)) or -- Body
                    (v.attachedMoney and tostring(v.attachedMoney):find(filters[i], 1, true)) or
                    (v.attachedItems and tostring(#v.attachedItems):find(filters[i], 1, true)) or
                    (v.attachedItems and (function() -- Player Item Name/Quantity
                        for _, v in pairs(v.attachedItems) do -- Attached Item Name/Quantity
                            if (v.name:lower():find(filters[i], 1, true) or
                                tostring(v.numItems):find(filters[i], 1, true)) then
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

    MailLogWindow.numSearchResultsLabel:SetText("Showing " .. #results .. " of " .. count .. " entries")
    MailLogWindow.mailTable:SetData(results)
    MailLogWindow.mailTable:SortData(2)
end

---Deletes entry at specified id, refresh mail table
local function DeleteEntry(id)
    for k, v in pairs(MailLogDB) do
        if (v.id == id) then
            table.remove(MailLogDB, k)
            FilterMailTable()
            break
        end
    end
end

---Deletes all entries, refresh mail table
local function DeleteAllData()
    for k, _ in pairs(MailLogDB) do
        MailLogDB[k] = nil
    end
    FilterMailTable()
end

---Convert Mail Log entries into CSV, send to export data window
local function ExportData()
    local data = {}
    local keys = {
        "Server Time",
        "Type",
        "Sender",
        "Receiver",
        "Subject",
        "Body",
        "COD?",
        "Attached Copper",
        "Number of Attached Items",
        "Attached Items"
    }

    for _, v in pairs(MailLogDB) do
        local items = {}
        for i = 1, ATTACHMENTS_MAX_RECEIVE do
            local item = v.attachedItems[i]

            if (item) then
                table.insert(items, "[" .. (item.name or "") .. "(" .. (item.id or "") .. ")]x" .. (item.numItems or ""))
            end
        end

        local entry = {
            [keys[1]] = date("%Y/%m/%d %H:%M (%a)", v.serverTime),
            [keys[2]] = v.type,
            [keys[3]] = v.sender,
            [keys[4]] = v.receiver,
            [keys[5]] = v.subject,
            [keys[6]] = v.body,
            [keys[7]] = (v.isCOD and "True") or "False",
            [keys[8]] = v.attachedMoney or 0,
            [keys[9]] = #items,
            [keys[10]] = table.concat(items, ", ")
        }

        table.insert(data, entry)
    end

    MailLogUI:SendMessage(BTools.AddonEvents.ShowExportDataWindow,
                          [[Mail Log Data. ([Format: 'CSV'] [Delimiter: ','] [Text Quantifier: '"'])]],
                          BTools.Utils.encodeCSV(keys, data))
end

---Draws the Mail Log Window
local function DrawWindow()
    MailLogWindow = StdUi:Window(UIParent, 1400, 685, "Boosting Tools: Mail Log")
    MailLogWindow:Hide()

    StdUi:MakeResizable(MailLogWindow, "BOTTOMRIGHT")
    StdUi:MakeResizable(MailLogWindow, "TOPLEFT")
    MailLogWindow:SetResizeBounds(950, 300, 1400, 685)

    MailLogWindow:HookScript("OnShow", function(self)
        PlaySound(BTools.Resources.sounds.OpenWindow)
        MailLogUI:SendMessage(BTools.AddonEvents.MailLogOnShow)
        self:ClearAllPoints()
        self:SetPoint("CENTER")
    end)
    MailLogWindow:HookScript("OnHide", function(self)
        PlaySound(BTools.Resources.sounds.CloseWindow)
        MailLogUI:SendMessage(BTools.AddonEvents.MailLogOnHide)
    end)
    MailLogWindow:HookScript("OnSizeChanged", function(self)
        local tableWidth = self.mailTable:GetWidth()
        local tableHeight = self.mailTable:GetHeight()

        -- Total number of columns
        local totalColWidth = 0
        for i = 1, #self.mailTable.columns do
            totalColWidth = totalColWidth + self.mailTable.columns[i].width
        end

        -- Adjust width
        for i = 1, #self.mailTable.columns do
            self.mailTable.columns[i]:SetWidth((self.mailTable.columns[i].width / totalColWidth) * (tableWidth - 30))
        end

        -- Adjust num visible rows
        self.mailTable:SetDisplayRows(math.floor(tableHeight / self.mailTable.rowHeight), self.mailTable.rowHeight)
    end)

    MailLogWindow:SetScale(BTools:GetScaleNormalized())
    MailLogWindow:SetFrameLevel(10)

    -- Register to close on escape
    _G["BTOOLS_MailLogWindow"] = MailLogWindow
    table.insert(UISpecialFrames, "BTOOLS_MailLogWindow")

    -- Logo
    MailLogWindow.logoFrame = StdUi:Frame(MailLogWindow, 96, 96)
    MailLogWindow.logoFrame:SetScript("OnMouseUp", function(self)
        PlaySound(BTools.Resources.sounds.EasterEgg, "MASTER", true)
    end)

    MailLogWindow.logoFrame.texture = StdUi:Texture(MailLogWindow.logoFrame, 96, 96, BTools.Resources.textures.Logo)

    StdUi:GlueTop(MailLogWindow.logoFrame, MailLogWindow, -300, -30, "RIGHT")
    MailLogWindow.logoFrame.texture:SetPoint("CENTER", 0, 0)

    -- Logo Title
    MailLogWindow.titleFrame = StdUi:Frame(MailLogWindow, 256, 128)
    MailLogWindow.titleFrame.texture =
        StdUi:Texture(MailLogWindow.titleFrame, 256, 128, BTools.Resources.textures.Title)
    StdUi:GlueRight(MailLogWindow.titleFrame.texture, MailLogWindow.titleFrame, 0, 0)
    StdUi:GlueRight(MailLogWindow.titleFrame, MailLogWindow.logoFrame, 10, 0, "CENTER")

    -- Actions
    MailLogWindow.actionsLabel = StdUi:Label(MailLogWindow, "Actions:")
    StdUi:GlueTop(MailLogWindow.actionsLabel, MailLogWindow, 15, -30, "LEFT")

    -- Export Data
    MailLogWindow.exportDataButton = StdUi:Button(MailLogWindow, 150, 28, "Export to CSV")
    MailLogWindow.exportDataButton:HookScript("OnClick", function()
        ExportData()
    end)
    StdUi:GlueBelow(MailLogWindow.exportDataButton, MailLogWindow.actionsLabel, 0, 0, "LEFT")

    -- Delete Data
    MailLogWindow.clearDataButton = StdUi:Button(MailLogWindow, 150, 28, "Delete All Data")
    MailLogWindow.clearDataButton:HookScript("OnClick", function()
        local confirmDialog = StdUi:Confirm("Delete All Data?",
                                            "Are you sure you wish to PERMANENTLY delete all Mail Log data?", {
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
        }, 200)
        confirmDialog:ClearAllPoints()
        confirmDialog:SetPoint("CENTER")
    end)
    MailLogWindow.clearDataButton:HookScript("OnEnter", function(self)
        self:SetText(StdUi.Util.WrapTextInColor(StdUi.Util.stripColors(self:GetText()), 1, 0, 0, 1))
    end)
    MailLogWindow.clearDataButton:HookScript("OnLeave", function(self)
        self:SetText(StdUi.Util.WrapTextInColor(StdUi.Util.stripColors(self:GetText()), 1, 1, 1, 1))
    end)
    StdUi:GlueAfter(MailLogWindow.clearDataButton, MailLogWindow.exportDataButton, 15, 0, "RIGHT")

    -- Filter Results
    MailLogWindow.filterResultsLabel = StdUi:Label(MailLogWindow, "Filter Data:")
    StdUi:GlueBelow(MailLogWindow.filterResultsLabel, MailLogWindow.actionsLabel, 0, -45, "LEFT")

    -- Search Box
    MailLogWindow.searchBox = StdUi:SearchEditBox(MailLogWindow, 400, 28, "Search")
    MailLogWindow.searchBox:HookScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)
    MailLogWindow.searchBox:HookScript("OnTextChanged", function()
        FilterMailTable()
    end)
    StdUi:GlueBelow(MailLogWindow.searchBox, MailLogWindow.filterResultsLabel, 0, 0, "LEFT")

    -- Clear Search Box Button
    MailLogWindow.clearSearchButton = StdUi:Button(MailLogWindow, 100, 28, "Clear Search")
    MailLogWindow.clearSearchButton:SetScript("OnClick", function()
        MailLogWindow.searchBox:SetText("")
    end)
    StdUi:GlueAfter(MailLogWindow.clearSearchButton, MailLogWindow.searchBox, 0, 0, "RIGHT")

    -- Search Results
    MailLogWindow.numSearchResultsLabel = StdUi:Label(MailLogWindow, "Current Results:")
    StdUi:GlueAbove(MailLogWindow.numSearchResultsLabel, MailLogWindow.searchBox, 0, 0, "RIGHT")

    -- Checkboxes
    MailLogWindow.onlyPastDayCheckbox = StdUi:Checkbox(MailLogWindow, "Last 24 hours only")
    MailLogWindow.onlyPastDayCheckbox:SetChecked(MailSettingsDB.logShowOnlyPastDay)
    MailLogWindow.onlyPastDayCheckbox:HookScript("OnClick", function(self)
        MailSettingsDB.logShowOnlyPastDay = self:GetChecked()
        FilterMailTable()
    end)
    StdUi:GlueBelow(MailLogWindow.onlyPastDayCheckbox, MailLogWindow.searchBox, 0, 0, "LEFT")

    MailLogWindow.onlyThisCharacterCheckbox = StdUi:Checkbox(MailLogWindow, "This character only")
    MailLogWindow.onlyThisCharacterCheckbox:SetChecked(MailSettingsDB.logShowOnlyThisCharacter)
    MailLogWindow.onlyThisCharacterCheckbox:HookScript("OnClick", function(self)
        MailSettingsDB.logShowOnlyThisCharacter = self:GetChecked()
        FilterMailTable()
    end)
    StdUi:GlueAfter(MailLogWindow.onlyThisCharacterCheckbox, MailLogWindow.onlyPastDayCheckbox, 0, 0, "CENTER")

    MailLogWindow.onlySentCheckbox = StdUi:Checkbox(MailLogWindow, "Sent mail only")
    MailLogWindow.onlySentCheckbox:SetChecked(MailSettingsDB.logShowOnlySent)
    MailLogWindow.onlySentCheckbox:HookScript("OnClick", function(self)
        MailSettingsDB.logShowOnlySent = self:GetChecked()
        FilterMailTable()
    end)
    StdUi:GlueAfter(MailLogWindow.onlySentCheckbox, MailLogWindow.onlyThisCharacterCheckbox, 0, 0, "CENTER")

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
                        }, 201)

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
                    MailLogUI:SendMessage(BTools.AddonEvents.ShowMailViewerWindow, rowData)
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
            name = "Type",
            align = "LEFT",
            width = 100,
            index = "type",
            format = "string",
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    MailLogUI:SendMessage(BTools.AddonEvents.ShowMailViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, rowData.type)
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Sender",
            align = "LEFT",
            width = 180,
            index = "sender",
            format = "string",
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    MailLogUI:SendMessage(BTools.AddonEvents.ShowMailViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, rowData.sender)
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Receiver",
            align = "LEFT",
            width = 180,
            index = "receiver",
            format = "string",
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    MailLogUI:SendMessage(BTools.AddonEvents.ShowMailViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, rowData.receiver)
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Subject",
            align = "LEFT",
            width = 220,
            index = "subject",
            format = "string",
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    MailLogUI:SendMessage(BTools.AddonEvents.ShowMailViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, rowData.subject)
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Body",
            align = "LEFT",
            width = 220,
            index = "body",
            format = "string",
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    MailLogUI:SendMessage(BTools.AddonEvents.ShowMailViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name, rowData.body)
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        },
        {
            name = "Attachments",
            align = "LEFT",
            width = 200,
            index = "attachedMoney",
            format = function(value, rowData, columnData)
                return string.format("%s x%02d %s %s%s",
                                     BTools.Resources.getFormattedTextureString(BTools.Resources.textures.LootBag, 16),
                                     #rowData.attachedItems, BTools.Resources
                                         .getFormattedTextureString(BTools.Resources.textures.CoinStack, 16),
                                     rowData.isCOD and StdUi.Util.WrapTextInColor("[CoD] ", 1, 0, 0, 1) or "",
                                     StdUi.Util.formatMoney(value))
            end,
            events = {
                OnClick = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    MailLogUI:SendMessage(BTools.AddonEvents.ShowMailViewerWindow, rowData)
                end,
                OnEnter = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    ShowTooltip(cellFrame, columnData.name,
                                {money = rowData.attachedMoney, items = rowData.attachedItems, isCOD = rowData.isCOD})
                end,
                OnLeave = function(table, cellFrame, rowFrame, rowData, columnData, rowIndex)
                    Tooltip:Hide()
                end
            }
        }
    }

    MailLogWindow.mailTable = StdUi:ScrollTable(MailLogWindow, cols, nil, 22)
    MailLogWindow.mailTable:EnableSelection(false)
    -- Hack: Stop the remove column from sorting
    MailLogWindow.mailTable.head.columns[1]:SetScript("OnClick", function()
    end)
    StdUi:GlueAcross(MailLogWindow.mailTable, MailLogWindow, 10, -180, -10, 10)

    FilterMailTable()
end

--- Draw the Mail Log Window if not initialised, then show
local function ShowWindow()
    if (not MailLogWindow) then
        DrawWindow()
    end
    MailLogWindow:Show()
end

---Hide the Mail Log Window
local function HideWindow()
    if (not MailLogWindow) then
        return
    end
    MailLogWindow:Hide()
end

---Called when the module is enabled
function MailLogUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()

    ---@type DatabaseManager
    local DB = BTools:GetModule("DatabaseManager")
    MailLogDB = DB:GetMailLogTable()
    MailSettingsDB = DB:GetMailSettingsTable()

    Tooltip = BTools:GetModule("TooltipUI"):GetFrameTooltip()

    -- Custom Events
    ---On mail Logged, update the table
    self:RegisterMessage(BTools.AddonEvents.MailLogged, FilterMailTable)

    self:RegisterMessage(BTools.AddonEvents.ShowMailLogWindow, ShowWindow)
    self:RegisterMessage(BTools.AddonEvents.TradeLogOnShow, HideWindow)
end
