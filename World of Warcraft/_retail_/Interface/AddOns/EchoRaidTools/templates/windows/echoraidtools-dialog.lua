local _AddonName, _EchoRaidTools = ...

--[[
Each module should have a :GetButtonInfo() method that returns 
moduleTitle, moduleIcon, getModuleFunc, moduleSubSettingsFrame 
- moduleTitle is a string
- Icon is optional
- getModuleFunc is the function that returns the Module's main panel frame
- moduleSubSettingsFrame is optional - it is a frame containing any SideBar navigation your module needs
    This frame should always carry a .height value of its current contents
]]

local CreateButton = function(buttonList, preferredIndex, parent, text, icon, func, isModule, moduleSubSettingsFrame)
    --[[
    if not buttonList[pos] then
        buttonList[pos] = CreateFrame("Button", nil, parent, "EchoRaidToolsMainMenuButtonTemplate")
    end
    local button = buttonList[pos] ]]
    local button = CreateFrame("Button", nil, parent, "EchoRaidToolsMainMenuButtonTemplate")
    button.Label:SetText(text)
    button:SetScript("OnClick", func)
    button.module = text
    button.moduleFunc = func

    if not moduleSubSettingsFrame then
        moduleSubSettingsFrame = moduleSubSettingsFrame or CreateFrame("FRAME", nil, parent)
    end

    button.moduleSubSettingsFrame = moduleSubSettingsFrame
    button.moduleSubSettingsFrame:SetParent(parent)
    button.moduleSubSettingsFrame:ClearAllPoints()
    button.moduleSubSettingsFrame:SetPoint("TOPLEFT", button, "BOTTOMLEFT")
    button.moduleSubSettingsFrame:SetPoint("TOPRIGHT", button, "BOTTOMRIGHT")
    button.moduleSubSettingsFrame:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 0, 0)
    button.moduleSubSettingsFrame:Hide()

    if preferredIndex and preferredIndex >= #buttonList then
        table.insert(buttonList, preferredIndex, button)
    else
        table.insert(buttonList, button)
    end
end

local ShowContentWidget = function(widget, moduleTitle)
    if _EchoRaidTools.panels.main.currentContent then
        _EchoRaidTools.panels.main.currentContent:Hide()
        _EchoRaidTools.panels.main.currentContent = nil
    end
    for _, button in pairs(_EchoRaidTools.moduleButtons) do
        if button.module == moduleTitle then
            button.moduleSubSettingsFrame:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 0, -(button.moduleSubSettingsFrame.height or 0))
            button.moduleSubSettingsFrame:Show()
            button:SetSelected(true)
        else
            button.moduleSubSettingsFrame:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 0, 0)
            button.moduleSubSettingsFrame:Hide()
            button:SetSelected(false)
        end
    end

    if not widget then
        return
    end

    widget:ClearAllPoints()
    widget:SetPoint("TOPLEFT", _EchoRaidTools.panels.main.MainMenu, "TOPRIGHT", 0, 0)
    widget:SetPoint("BOTTOMRIGHT", _EchoRaidTools.panels.main.NineSlice.BottomRightCorner, "BOTTOMRIGHT", -10, 28)
    widget:Show()

    _EchoRaidTools.panels.main.currentContentTitle = moduleTitle
    _EchoRaidTools.panels.main.currentContent = widget
end

local GenerateButtonList = function()
    _EchoRaidTools.moduleButtons = _EchoRaidTools.moduleButtons or {}

    -- Run over modules
    for _, module in ipairs(_EchoRaidTools.modules or {}) do
        if module.GetButtonInfo then
            local moduleTitle, moduleIcon, getModuleFunc, moduleSubSettingsFrame, preferredIndex = module:GetButtonInfo()
            if moduleTitle then
                CreateButton(
                    _EchoRaidTools.moduleButtons,
                    preferredIndex,
                    _EchoRaidTools.panels.main.MainMenu.ScrollFrame.Content,
                    moduleTitle,
                    moduleIcon,
                    function(self)
                        if getModuleFunc then
                            ShowContentWidget(getModuleFunc(), moduleTitle)
                        else
                            print("No widget function for module " .. module.name .. " defined")
                        end
                    end,
                    nil,
                    moduleSubSettingsFrame
                )
            end
        end
    end

    -- add the Boss WA button at the end
    CreateButton(
            _EchoRaidTools.moduleButtons,
            nil,
            _EchoRaidTools.panels.main.MainMenu.ScrollFrame.Content,
            "Echo WeakAuras",
            nil,
            function(self)
                if ( not EncounterJournal ) then
                    EncounterJournal_LoadUI();
                end
                ShowUIPanel(EncounterJournal)
                EJ_ContentTab_Select(EncounterJournal.raidsTab:GetID())
                EncounterJournal_DisplayInstance(1207) -- Amir
                EncounterJournal_SetTab(5)
                _EchoRaidTools.panels.main:Hide()
            end
    )

    -- Setup buttons
    _EchoRaidTools.panels.main.MainMenu.ScrollFrame.Content.buttons = EchoRaidTools.moduleButtons
    for index, button in ipairs(_EchoRaidTools.moduleButtons or {}) do
        if index == 1 then
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", _EchoRaidTools.panels.main.MainMenu.ScrollFrame.Content, "TOPLEFT", 5, -23)
            button:SetPoint("BOTTOMRIGHT", _EchoRaidTools.panels.main.MainMenu.ScrollFrame.Content, "TOPRIGHT", 0, -53)
            button:Show()
        else
            button:ClearAllPoints()
            local previous = _EchoRaidTools.moduleButtons[index - 1]
            button:SetPoint("TOPLEFT", previous.moduleSubSettingsFrame, "BOTTOMLEFT", 0, -1)
            button:SetPoint("TOPRIGHT", previous.moduleSubSettingsFrame, "BOTTOMRIGHT", 0, -1)
            button:SetHeight(30)
            button:Show()
        end
    end

end

function _EchoRaidTools:OpenNewPanel()
    -- Ensure we have a panel list
    _EchoRaidTools.panels = _EchoRaidTools.panels or {}

    if _EchoRaidTools.panels.main then
        if _EchoRaidTools.panels.main:IsShown() then
            return
        end
        --GenerateButtonList()
        _EchoRaidTools.panels.main:Show()
        return
    end

    -- We need to create our panel first
    _EchoRaidTools.panels.main = CreateFrame("Frame", "EchoRaidToolsMainFrame", UIParent, "EchoRaidToolsTemplate")
    tinsert(UISpecialFrames, "EchoRaidToolsMainFrame")
    GenerateButtonList()
    _EchoRaidTools.panels.main:Show()
    _EchoRaidTools.moduleButtons[1].moduleFunc()
end

EchoRaidTools_Toggle = function()
    if _EchoRaidTools and _EchoRaidTools.panels and _EchoRaidTools.panels.main and _EchoRaidTools.panels.main:IsShown() then
        _EchoRaidTools.panels.main:Hide()
    else
        _EchoRaidTools:OpenNewPanel()
    end
end

function _EchoRaidTools:ShowContent(widget, moduleTitle)
    ShowContentWidget(widget, moduleTitle)
end

local timer
function _EchoRaidTools:SetStatus(text, duration) -- optional duration
    if _EchoRaidTools.panels and _EchoRaidTools.panels.main then
        local returnText = _EchoRaidTools.panels.main.status:GetText()
        if timer then
            timer:Cancel()
            timer = nil
            returnText = ""
        end
        if duration then
            timer = C_Timer.NewTimer(duration,
                function()
                    _EchoRaidTools.panels.main.status:SetText(returnText)
                end
            )
        end
        _EchoRaidTools.panels.main.status:SetText(text)
    end
end

EchoRaidToolsTemplate_MainMenu_ScrollFrameMixin = {}
function EchoRaidToolsTemplate_MainMenu_ScrollFrameMixin:OnSizeChanged()
    self.Content:ClearAllPoints()
    self.Content:SetPoint("TOPLEFT")
    self.Content:SetWidth(self:GetWidth())
    local vert = self:GetVerticalScroll()
    self.ScrollBar:SetValue(vert+1)
    self.ScrollBar:SetValue(vert)

    self.Content:SetWidth(self.Content:GetWidth())
end
function EchoRaidToolsTemplate_MainMenu_ScrollFrameMixin:OnLoad()
    self.ScrollBar:SetWidth(7)
end
function EchoRaidToolsTemplate_MainMenu_ScrollFrameMixin:ScrollFrameIntoView(value, top)
    local total = self:GetVerticalScrollRange()
    local frameTop = value
    if total > 0 then
        self.ScrollBar:SetValue(top - frameTop + (total/2))
    end
end