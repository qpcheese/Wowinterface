local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local LibSharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")

local noop = function() end

local spacing = 2
local configBuilt = false
local types = _Cooldowns.types

_Cooldowns.controlPools = {}
_Cooldowns.controls = {}
_Cooldowns.sections = {}
_Cooldowns.preSettings = {lines = {}}
_Cooldowns.RefreshAllSettings = function()
    if not _Cooldowns.mainWindow then return end
    if not _Cooldowns.GetCurrentGroupIndex() or _Cooldowns.GetCurrentGroupIndex() == 0 then
        _Cooldowns.mainWindow.Header.HeaderSubText:SetText("")
        _Cooldowns.mainWindow.currentPanel:Hide()
        return
    end
    if not configBuilt then _Cooldowns.RebuildConfig() end
    _Cooldowns.mainWindow.Header.HeaderSubText:SetText(_Cooldowns.GetCurrentGroupName())
    _Cooldowns.sectionBuilders.StatesSettingsConfigSection()
    --_Cooldowns.sectionBuilders.FilterConfigSection()
    --[[for i, lineDetails in ipairs(_Cooldowns.preSettings.lines) do
        for ii, control in ipairs(lineDetails.controls) do
            control:Update()
        end
        lineDetails.line:Update()
    end]]
    for i, sectionDetails in ipairs(_Cooldowns.sections) do
        for ii, lineDetails in ipairs(sectionDetails.lines) do
            for iii, control in ipairs(lineDetails.controls) do
                control:Update()
            end
            lineDetails.line:Update()
            if lineDetails.line.type == "line" and not lineDetails.line.IsHidden then
            end
        end
        sectionDetails.section:Update()
    end

end
_Cooldowns.RefreshSections = function()
    for i, section in ipairs(_Cooldowns.sections) do
        section.section:Update()
    end
end

local ScrollInToView = function(id)
    local frameToShow = _Cooldowns.NavigationButtons:GetFrameByID(id, true)
    if frameToShow then
        local value = frameToShow:GetBottom()
        local top = _EchoRaidTools.moduleButtons[1]:GetTop()
        if value and top then
            RunNextFrame(function()
                _EchoRaidTools.panels.main.MainMenu.ScrollFrame:ScrollFrameIntoView(value, top)
            end)
        end
    end
end

local displayResetFunc = function(pool, control)
    control:ClearAllPoints()
    control:Hide()
    control.Update = noop
    control.tooltip = nil
    if control.Enable then control:Enable() end
    if control.type == "CHECKBUTTON" then
        control.CheckButton:SetScript("OnClick", nil)
    elseif control.type == "SLIDER" then
        control.Slider:SetScript("OnValueChanged", nil)
        control.ValueEditbox:SetScript("OnEnterPressed", nil)
    elseif control.type == "TEXTEDIT" then
        control:SetGetter(nil)
        control:SetSetter(nil)
    elseif control.type == "BUTTON" then
        control.Button:SetScript("OnClick", nil)
    elseif control.type == "EDITBOX" then
        control.Editbox:SetScript("OnEnterPressed", nil)
    elseif control.type == "LONGEDITBOX" then
        control.Editbox:SetScript("OnEnterPressed", nil)
    elseif control.type == "SECTION" then
        --if control.Button.Expanded then
        --    control.Button:Toggle()
            control.Button.contentHeight = nil
        --end
    elseif control.type == "DROPDOWN" then
        control:ClearSelections()
    elseif control.type == "COLOR" then
        control:ClearAll()
    elseif control.type == "LINE" then
        control.textRight = nil
        control.info:Hide()
        control.info.tooltip = nil
    elseif control.type == "SubButton" then
        control:SetOnClick(noop)
        control:SetSelected(false)
        control:SetLoaded(true)
        --control:SetGroupDisabled(false)
        control.filterIndex = nil
        control.groupIndex = nil
        control:SetSetter(noop)
        control:SetGetter(noop)
        control:SetUseCheckButton(false)
        control:SetDeleteFunc(noop)
        control:SetCopyFunc(noop)
        control:SetCheckButtonSetter(noop)
        control:SetCheckButtonGetter(noop)
    elseif control.type == "SEPARATOR" then
    end
end


local BuildControlTypeCreators = function()
    local mainContainer = _Cooldowns.controlParent
    _Cooldowns.controlTypesCreators = {
        ["CHECKBUTTON"] = function(details, parent)
            if not _Cooldowns.controlPools["CHECKBUTTON"] then
                _Cooldowns.controlPools["CHECKBUTTON"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_CheckButton", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["CHECKBUTTON"]:Acquire()
            control.type = "CHECKBUTTON"
            control:SetParent(parent)
            control:Show()
            control:SetHeight(32)
            control:SetWidth(details.width or 32)
            control.TopText:SetText(details.text)
            if details.useTopText then
                control.TopText:Show()
            else
                control.TopText:Hide()
            end
            control.CheckButton:SetScript("OnClick", details.onClick)
            control.CheckButton:SetChecked(details.valueFunc())
            control.tooltip = details.tooltip
            control.CheckButton.tooltip = details.tooltip
            function control:Update()
                control.CheckButton:SetChecked(details.valueFunc())
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["DROPDOWN"] = function(details, parent, index)
            if not _Cooldowns.controlPools["DROPDOWN"] then
                _Cooldowns.controlPools["DROPDOWN"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_Dropdown", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["DROPDOWN"]:Acquire()
            control.type = "DROPDOWN"
            control:SetParent(parent)
            control.tooltip = details.tooltip
            control.TopText:SetText(details.text)
            if details.useTopText then
                control.TopText:Show()
            else
                control.TopText:Hide()
            end
            if details.width then
                control:SetWidth(max(150,details.width))
            else
                control:SetWidth(200)
            end
            control:Show()
            --local items = details.items()
            --control:SetupSelections(items, details.valueFunc())

            function control:Update()
                local items = details.items()
                local selected = details.valueFunc()
                control:SetupSelections(items, selected)
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["SLIDER"] = function(details, parent, index)
            if not _Cooldowns.controlPools["SLIDER"] then
                _Cooldowns.controlPools["SLIDER"] = CreateFramePool("FRAME", mainContainer, "EchoRaidTools_BetterSlider", displayResetFunc)--"EchoRaidToolsConfig_Slider" EchoRaidTools_BetterSlider
            end
            local control = _Cooldowns.controlPools["SLIDER"]:Acquire()
            control.type = "SLIDER"
            control:SetParent(parent)
            control.TopText:SetText(details.text)
            if details.useTopText then
                control.TopText:Show()
            else
                control.TopText:Hide()
            end
            control.tooltip = details.tooltip
            control.Slider.tooltip = details.tooltip
            control.ValueEditbox.tooltip = details.tooltip
            control:Show()
            control:SetHeight(32)
            control:SetWidth(details.width or 200)
            control:Setup(details.min, details.max, details.step, details.valueFunc, details.func, details.hardMin, details.hardMax)

            function control:Update()
                control:UpdateValues()
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["COLOR"] = function(details, parent, index)
            if not _Cooldowns.controlPools["COLOR"] then
                _Cooldowns.controlPools["COLOR"] = CreateFramePool("BUTTON", mainContainer, "EchoRaidToolsConfig_NewColorPicker", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["COLOR"]:Acquire()
            control.type = "COLOR"
            control:SetParent(parent)
            control:Show()
            control:SetWidth(details.width or 80)
            control.tooltip = details.tooltip
            local col = details.GetColor()
            local r,g,b,a = col:GetRGBA()
            control:SetupInteraction(details.SetColor, r,g,b,a, nil, nil, details.useOpacity)
            if details.useTopText then
                control.TopText:Show()
            else
                control.TopText:Hide()
            end
            function control:Update()
              local col = details.GetColor()
              local r,g,b,a = col:GetRGBA()
                control:SetupInteraction(details.SetColor, r,g,b,a, nil, nil, details.useOpacity)
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["TEXT"] = function(details, parent, index)
            if not _Cooldowns.controlPools["TEXT"] then
                _Cooldowns.controlPools["TEXT"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_TextOnly", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["TEXT"]:Acquire()
            control.type = "TEXT"
            control:SetParent(parent)
            control:Show()
            control.Text:SetText(details.text)
            control:SetWidth(control.Text:GetWidth())
            control:SetHeight(control.Text:GetHeight())
            control.tooltip = details.tooltip
            function control:Update()
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["TEXTEDIT"] = function(details, parent, index)
            if not _Cooldowns.controlPools["TEXTEDIT"] then
                _Cooldowns.controlPools["TEXTEDIT"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_EditableText", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["TEXTEDIT"]:Acquire()
            control.type = "TEXTEDIT"
            control:SetParent(parent)
            control:Show()
            control:SetHeight(32)
            local width = details.width or 200
            control:SetWidth(max(width, 100))
            control.Button:SetText(details.valueFunc())
            control.Button:Show()
            control:SetGetter(details.valueFunc)
            control:SetSetter(details.setterFunc)
            control.TopText:SetText(details.text)
            if details.useTopText then
                control.TopText:Show()
            else
                control.TopText:Hide()
            end
            control.tooltip = details.tooltip
            control.Button.tooltip = details.tooltip
            control.EditBox.tooltip = details.tooltip
            function control:Update()
                control.Button:SetText(details.valueFunc())
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["BUTTON"] = function(details, parent, index)
            if not _Cooldowns.controlPools["BUTTON"] then
                _Cooldowns.controlPools["BUTTON"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_Button", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["BUTTON"]:Acquire()
            control.type = "BUTTON"
            control:SetParent(parent)
            control:Show()
            control:SetHeight(32)
            control:SetWidth(details.width or 200)
            control.Button:SetText(details.textFunc and details.textFunc() or details.text or "")
            control.Button:Show()
            control.Button:SetScript("OnClick", details.onClick)
            control.TopText:SetText(details.text)
            if details.color then
                control.Button:GetHighlightTexture():SetVertexColor(details.color.r,details.color.g,details.color.b,details.color.a)
            end
            if details.useTopText then
                control.TopText:Show()
            else
                control.TopText:Hide()
            end
            control.tooltip = details.tooltip
            control.Button.tooltip = details.tooltip
            function control:Update()
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["EDITBOX"] = function(details, parent, index)
            if not _Cooldowns.controlPools["EDITBOX"] then
                _Cooldowns.controlPools["EDITBOX"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_EditBox", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["EDITBOX"]:Acquire()
            control.type = "EDITBOX"
            control:SetParent(parent)
            control.TopText:SetText(details.text)
            if details.useTopText then
                control.TopText:Show()
            else
                control.TopText:Hide()
            end
            control.tooltip = details.tooltip
            control.Editbox.tooltip = details.tooltip
            control:Show()
            control.Editbox:SetMaxLetters(details.maxLetters or 0)
            control:SetHeight(32)
            control:SetWidth(details.width or 80)
            control.Editbox:SetText(details.valueFunc())
            control.Editbox:SetScript("OnEnterPressed", function(self)
                local textValue = self:GetText()
                details.func(self, textValue)
            end)
            function control:Update()
                control.Editbox:SetText(details.valueFunc())
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["EXPORTBOX"] = function(details, parent, index)
            if not _Cooldowns.controlPools["EXPORTBOX"] then
                _Cooldowns.controlPools["EXPORTBOX"] = CreateFramePool("EditBox", mainContainer, "EchoRaidToolsConfig_ExportBox", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["EXPORTBOX"]:Acquire()
            control.type = "EXPORTBOX"
            control:SetParent(parent)
            control.tooltip = details.tooltip
            control:Show()
            control:SetHeight(32)
            control:SetWidth(details.width or 400)
            control:SetText(details.valueFunc())
            function control:Update()
                control:SetText(details.valueFunc())
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["IMPORTBOX"] = function(details, parent, index)
            if not _Cooldowns.controlPools["IMPORTBOX"] then
                _Cooldowns.controlPools["IMPORTBOX"] = CreateFramePool("Frame", mainContainer, "EchoRaidToolsConfig_ImportBox", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["IMPORTBOX"]:Acquire()
            control.type = "IMPORTBOX"
            control:SetParent(parent)
            control.tooltip = details.tooltip
            control.tooltip = details.tooltip
            control:Show()
            control:SetHeight(32)
            control:SetWidth(details.width or 400)
            control.onClick = details.onClick
            function control:Update()
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["LINE"] = function(details, parent, index)
            if not _Cooldowns.controlPools["LINE"] then
                _Cooldowns.controlPools["LINE"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_LineTitle", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["LINE"]:Acquire()
            control:SetParent(parent)
            control:Show()
            control.Text:SetText(type(details.lineTitle) == "function" and details.lineTitle() or details.lineTitle)
            control:SetWidth(200)
            if details.textRight then
                control.Text:SetJustifyH("RIGHT")
            end
            if details.tooltip then
                control.Info:Show()
                control.Info.tooltip = details.tooltip
            else
                control.Info.tooltip = nil
                control.Info:Hide()
            end
            control.tooltip = details.tooltip
            function control:Update()
                control.Text:SetText(type(details.lineTitle) == "function" and details.lineTitle() or details.lineTitle)
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                else
                    control:Enable()
                end
                if details.SetHidden then
                    control:SetHidden(details.SetHidden())
                else
                    control:SetHidden(false)
                end
            end
            control:Update()
            control.type = "line"
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["ANCHORDEMO"] = function(details, parent, index)
            if not _Cooldowns.controlPools["ANCHORDEMO"] then
                _Cooldowns.controlPools["ANCHORDEMO"] = CreateFramePool("FRAME", mainContainer, "EchoRaidTools_TextAnchorDemo", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["ANCHORDEMO"]:Acquire()
            control.type = "ANCHORDEMO"
            control:SetParent(parent)
            control:Show()
            control:Anchor(details.GetAnchorDetails())
            --control:Setup(details.displayType)
            function control:Update()
                control:Anchor(details.GetAnchorDetails())
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["SPELLBUTTON"] = function(details, parent, index)
            if not _Cooldowns.controlPools["SPELLBUTTON"] then
                _Cooldowns.controlPools["SPELLBUTTON"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_FilterSpellButton", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["SPELLBUTTON"]:Acquire()
            control.type = "SPELLBUTTON"
            control:SetParent(parent)
            control:Show()
            control:SetText(details.spellName)
            control:SetClass(details.class)
            control:SetupClick(details.onClick)
            control:SetIcon(details.icon)

            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["SEARCHBOX"] = function(details, parent, index)
            if not _Cooldowns.controlPools["SEARCHBOX"] then
                _Cooldowns.controlPools["SEARCHBOX"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_Cooldowns_SpellSearchBox", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["SEARCHBOX"]:Acquire()
            control.type = "SEARCHBOX"
            control:SetParent(parent)
            control:Show()
            control.tooltip = details.tooltip
            control:SetWidth(details.width or 200)

            function control:Update()
                control:SetFuncs(details.func)
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["INFO"] = function(details, parent, index)
            if not _Cooldowns.controlPools["INFO"] then
                _Cooldowns.controlPools["INFO"] = CreateFramePool("FRAME", mainContainer, "EchoRaidTools_InfoButton", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["INFO"]:Acquire()
            control.type = "INFO"
            if details.color then
                local c = details.color
                control.Texture:SetDesaturated(true)
                control.Texture:SetVertexColor(c.r, c.g, c.b, c.a)
            else
                control.Texture:SetDesaturated(false)
                control.Texture:SetVertexColor(1,1,1,1)
            end
            control:SetParent(parent)
            control:Show()
            control.tooltip = details.tooltip
            function control:Update()
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
        ["SEPARATOR"] = function(details, parent, index)
            if not _Cooldowns.controlPools["SEPARATOR"] then
                _Cooldowns.controlPools["SEPARATOR"] = CreateFramePool("FRAME", mainContainer, "EchoRaidToolsConfig_Separator", displayResetFunc)
            end
            local control = _Cooldowns.controlPools["SEPARATOR"]:Acquire()
            control.type = "SEPARATOR"
            control:SetParent(parent)
            control:Show()
            function control:Update()
                if details.SetDisabled then
                    if details.SetDisabled() then
                        control:Disable()
                    else
                        control:Enable()
                    end
                end
                if details.SetHidden then
                    if details.SetHidden() then
                        control:Hide()
                    else
                        control:Show()
                    end
                end
            end
            control:Update()
            _Cooldowns.controls[details.name] = control
            return control
        end,
    }
end


_Cooldowns.sectionBuilders = _Cooldowns.sectionBuilders or {}
_Cooldowns.RebuildConfig = function()
    if not _Cooldowns.GetCurrentGroupIndex() or _Cooldowns.GetCurrentGroupIndex() == 0 then return end
    local controlTypesCreators = _Cooldowns.controlTypesCreators
    for _, pool in pairs(_Cooldowns.controlPools) do
        pool:ReleaseAll()
    end
    wipe(_Cooldowns.controls)
    wipe(_Cooldowns.sections)
    wipe(_Cooldowns.preSettings.lines)
    local mainContainer = _Cooldowns.controlParent
    _Cooldowns.panels = _Cooldowns.panels or {}

    _Cooldowns.SectionButtons = _Cooldowns.SectionButtons or {}

    local lastSection = nil
    --for _, containerSettings in ipairs(_Cooldowns.settings) do
    for i, sectionInfo in ipairs(types.configSections) do
        if sectionInfo.name == "FilterConfigSection" then
            local section = _Cooldowns.panels[sectionInfo.name] or CreateFrame("FRAME", nil, _Cooldowns.mainWindow, "EchoRaidTools_Cooldowns_SpellSelectionPanel")
            _Cooldowns.panels[sectionInfo.name] = section
            section:SetAllPoints()
            section:Hide()
            _Cooldowns.sectionBuilders[sectionInfo.name] = _Cooldowns.sectionBuilders[sectionInfo.name] or function()
                section:Update()
            end
        else

            local sectionDetails = _Cooldowns["Get"..sectionInfo.name]()
            local section = _Cooldowns.panels[sectionDetails.name] or CreateFrame("FRAME", nil, _Cooldowns.mainWindow, "EchoRaidTools_CooldownsPanel")
            _Cooldowns.panels[sectionInfo.name] = section
            section:SetPoint("TOPLEFT", _Cooldowns.mainWindow.Header, "BOTTOMLEFT")
            section:SetPoint("BOTTOMRIGHT")
            section:Hide()
            table.insert(_Cooldowns.sections, {section = section, lines = {}})
            local sectionTable = _Cooldowns.sections[#_Cooldowns.sections]
            _Cooldowns.SectionButtons[sectionInfo.name] = section
            section.Update = function() end

            -- Tab Control setup
            if sectionDetails.useTabControl then
                _Cooldowns.sectionBuilders[sectionInfo.name] = _Cooldowns.sectionBuilders[sectionInfo.name] or function()
                    for i, lineDetails in ipairs(sectionTable.lines) do
                        for j, control in ipairs(lineDetails.controls) do
                            _Cooldowns.controlPools[control.type]:Release(control)
                        end
                        _Cooldowns.controlPools["LINE"]:Release(lineDetails.line)
                    end
                    wipe(sectionTable.lines)
                    local sectionDetails = _Cooldowns["Get"..sectionInfo.name]()

                    local tabInfo = {}
                    for i, tab in ipairs(sectionDetails.contents) do
                        if tab.tabTitle then
                            table.insert(tabInfo, tab.tabTitle)
                        end
                    end
                    sectionTable.tabControl = sectionTable.tabControl or CreateFrame("Frame", nil, section.ScrollFrame.ScrollingPanel, "EchoRaidTools_TabMainPanel")
                    local tabControl = sectionTable.tabControl
                    tabControl:ClearAllPoints()
                    tabControl:SetPoint("TOPLEFT", 5, -5)
                    tabControl:SetPoint("TOPRIGHT", -5, -5)
                    --tabControl:SetPoint("BOTTOMRIGHT", -5, 5)
                    --tabControl:SetHeight(700)
                    local panels = tabControl:SetTabs(tabInfo)

                    local maxTabHeight = 0
                    for i, tabDetails in ipairs(sectionDetails.contents) do
                        local thisTabHeight = 0
                        local lastLine = nil
                        local thisTabPanel = panels[i]
                        for ii, lineDetails in ipairs(tabDetails.contents) do
                            local newLine = controlTypesCreators["LINE"](lineDetails, thisTabPanel, i)
                            newLine.name = lineDetails.name
                            --section.ContentPanel[lineDetails.name] = newLine
                            table.insert(sectionTable.lines, {line = newLine, controls = {}})
                            local lineTable = sectionTable.lines[#sectionTable.lines]
                            if lastLine then
                                newLine:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, 0)
                            else
                                newLine:SetPoint("TOPLEFT", thisTabPanel, 25, -25)
                            end
                            lastLine = newLine

                            local lineAvailableWidth = 650
                            local currentLineWidth = 0
                            local multiLineHeight = 0
                            local lineHeight = 0
                            local lastControl
                            for j, controlDetails in ipairs(lineDetails.contents) do
                                local control = controlTypesCreators[controlDetails.type](controlDetails, lastLine, j)
                                control.name = controlDetails.name
                                table.insert(lineTable.controls, control)
                                local controlHeight = control:GetHeight()
                                controlHeight = controlDetails.useTopText and controlHeight + 6 or controlHeight
                                if currentLineWidth + control:GetWidth() > lineAvailableWidth then
                                    currentLineWidth = 0
                                    multiLineHeight = multiLineHeight + lineHeight
                                    lineHeight = 0
                                    control:SetPoint("TOPLEFT", lastLine, "TOPRIGHT", 20,  - multiLineHeight)
                                    currentLineWidth = control:GetWidth()
                                elseif lastControl then
                                    control:SetPoint("LEFT", lastControl, "RIGHT", controlDetails.padding or 20, 0)
                                else
                                    control:SetPoint("TOPLEFT", lastLine, "TOPRIGHT", 20, 0)--16)
                                end
                                currentLineWidth = currentLineWidth + control:GetWidth() + (controlDetails.padding or 20)

                                lineHeight = max(lineHeight, controlHeight)
                                lastControl = control
                            end
                            newLine:SetHeight(lineHeight + multiLineHeight + (lineDetails.padding or 12))
                            newLine:Update()
                            thisTabHeight = thisTabHeight + lineHeight + (lineDetails.padding or 12)
                        end
                        maxTabHeight = max(maxTabHeight, thisTabHeight)
                    end
                    tabControl:SetHeight(maxTabHeight + 50)
                end
            else    
                _Cooldowns.sectionBuilders[sectionInfo.name] = _Cooldowns.sectionBuilders[sectionInfo.name] or function()
                    local thisSection = section
                    for i, lineDetails in ipairs(sectionTable.lines) do
                        for j, control in ipairs(lineDetails.controls) do
                            _Cooldowns.controlPools[control.type]:Release(control)
                        end
                        _Cooldowns.controlPools["LINE"]:Release(lineDetails.line)
                    end
                    wipe(sectionTable.lines)
                    local sectionDetails = _Cooldowns["Get"..sectionInfo.name]()

                    local lastLine = nil
                    for i, lineDetails in ipairs(sectionDetails.contents) do
                        local newLine = controlTypesCreators["LINE"](lineDetails, thisSection.ScrollFrame.ScrollingPanel, i)
                        newLine.name = lineDetails.name
                        --section.ContentPanel[lineDetails.name] = newLine
                        table.insert(sectionTable.lines, {line = newLine, controls = {}})
                        local lineTable = sectionTable.lines[#sectionTable.lines]
                        if lastLine then
                            newLine:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, 0)
                        else
                            newLine:SetPoint("TOPLEFT", thisSection.ScrollFrame.ScrollingPanel, 25, -25)
                        end
                        lastLine = newLine

                        local lineAvailableWidth = 650
                        local currentLineWidth = 0
                        local multiLineHeight = 0
                        local lineHeight = 0
                        local lastControl
                        for j, controlDetails in ipairs(lineDetails.contents) do
                            local control = controlTypesCreators[controlDetails.type](controlDetails, lastLine, j)
                            control.name = controlDetails.name
                            table.insert(lineTable.controls, control)
                            local controlHeight = control:GetHeight()
                            controlHeight = controlDetails.useTopText and controlHeight + 6 or controlHeight
                            if currentLineWidth + control:GetWidth() > lineAvailableWidth then
                                currentLineWidth = 0
                                multiLineHeight = multiLineHeight + lineHeight
                                lineHeight = 0
                                control:SetPoint("TOPLEFT", lastLine, "TOPRIGHT", 20,  - multiLineHeight)
                                currentLineWidth = control:GetWidth()
                            elseif lastControl then
                                control:SetPoint("LEFT", lastControl, "RIGHT", controlDetails.padding or 20, 0)
                            else
                                control:SetPoint("TOPLEFT", lastLine, "TOPRIGHT", 20, 0)--16)
                            end
                            currentLineWidth = currentLineWidth + control:GetWidth() + (controlDetails.padding or 20)

                            lineHeight = max(lineHeight, controlHeight)
                            lastControl = control
                        end
                        newLine:SetHeight(lineHeight + multiLineHeight + (lineDetails.padding or 12))
                        newLine:Update()
                    end
                end
            end
        end
        --_Cooldowns.sectionBuilders[sectionInfo.name]()
    end
    configBuilt = true
    _Cooldowns.RefreshAllSettings()

    --mainContainer.preSettings = _Cooldowns.preSettings
    mainContainer.sections = _Cooldowns.sections
end
function _Cooldowns.ShowGeneralSection()
    if not _Cooldowns.mainWindow then return end
    
    if _Cooldowns.GetCurrentGroupIndex() > 0 then
        if not configBuilt then
            _Cooldowns.RebuildConfig()
        end
        if _Cooldowns.mainWindow.currentPanel then
            _Cooldowns.mainWindow.currentPanel:Hide()
            _Cooldowns.mainWindow.currentPanel = nil
        end
        _Cooldowns.sectionBuilders["GeneralConfigSection"]()
        _Cooldowns.panels["GeneralConfigSection"]:Show()
        _Cooldowns.mainWindow.Header.HeaderSubText:SetText(format("%s - %s",_Cooldowns.GetCurrentGroupName(), "General Settings"))
        _Cooldowns.mainWindow.currentPanel = _Cooldowns.panels["GeneralConfigSection"]
        --_Cooldowns.UpdateNavigation()
    end
end

function _Cooldowns:GetCooldownsConfig()
    if _EchoRaidTools.panels.cooldowns then
        return _EchoRaidTools.panels.cooldowns
    end

    --main panel creation
    local window = CreateFrame("FRAME", nil, _EchoRaidTools.panels.main, "EchoRaidTools_CooldownsWindow")
    window.Header.EnableModule.tooltip = "Enable/Disable the whole Cooldowns addon module"
    window.Header.EnableModule:SetChecked(_Cooldowns.GetModuleEnabled())
    window.Header.EnableModule:SetScript("OnClick", function(self)
        _Cooldowns.ToggleModuleEnabled()
        self:SetChecked(_Cooldowns.GetModuleEnabled())
    end)
    window.Header.HeaderText:SetText("Cooldowns")
    _Cooldowns.mainWindow = window

    local panel = CreateFrame("FRAME", nil, window, "EchoRaidTools_CooldownsPanel")
    panel:SetPoint("TOPLEFT", window.Header, "BOTTOMLEFT")
    panel:SetPoint("BOTTOMRIGHT")
    panel:Show()
    window.currentPanel = panel
    local mainContainer = panel.ScrollFrame.ScrollingPanel
    _Cooldowns.mainPanel = panel

    _Cooldowns.controlParent = mainContainer
    if not _Cooldowns.controlTypesCreators then
        BuildControlTypeCreators()
    end

    _Cooldowns.RebuildConfig()
    panel.ScrollFrame:SetVerticalScroll(0)

    local Resize = function() end
    panel:SetScript("OnSizeChanged", Resize)

    _EchoRaidTools.panels.cooldowns = window

    _Cooldowns.mainWindow.currentPanel:Hide()
    if _Cooldowns.GetCurrentGroupIndex() > 0 then
        _Cooldowns.sectionBuilders["GeneralConfigSection"]()
        _Cooldowns.panels["GeneralConfigSection"]:Show()
        _Cooldowns.mainWindow.Header.HeaderSubText:SetText(format("%s - %s",_Cooldowns.GetCurrentGroupName(), "General Settings"))
        _Cooldowns.mainWindow.currentPanel = _Cooldowns.panels["GeneralConfigSection"]

        _Cooldowns.UpdateNavigation()
    end
    return window
end

function _Cooldowns.BuildNavigationItemTable(newIndex)
    local items = {}
    items[1] = {
        type = "node",
        title = "Groups",
        id = "groupsNode",
        template = "EchoRaidTools_CooldownsNavigation_NodeFrame",
        addButtonClick = function()
            _Cooldowns.AddNewGroup()
            ScrollInToView("groupsNode")
        end,
        addButtonTooltip = "Add",
        children = {},
        defaultOpen = true,
    }
    for groupIndex, details in ipairs(EchoRaidToolsDB.Cooldowns.groups) do
        local groupButton = {
            type = "node",
            title = details.name,
            id = details.name.."node",
            template = "EchoRaidTools_CooldownsNavigationGroupNodeFrame",
            NameGetter = function() return _Cooldowns.GetGroupName(groupIndex) end,
            NameSetter = function(text) _Cooldowns.RenameGroup(text, groupIndex) end,
            DeleteFunc = function()
                _Cooldowns.DeleteGroup(groupIndex)
                --_Cooldowns.RefreshAllSettings()
                --_Cooldowns.UpdateNavigation()
            end,
            CopyFunc = function()
                _Cooldowns.CopyGroup(groupIndex)
                ScrollInToView("groupsNode")
            end,
            GetSelected = function()
                return _Cooldowns.GetCurrentGroupIndex() == groupIndex
                and _Cooldowns.mainWindow and _Cooldowns.mainWindow:IsShown()
            end,
            GetLoaded = function() return _Cooldowns.IsGroupLoaded(groupIndex) end,
            GetTooltip = function()
                local ret = ""
                if not _Cooldowns.IsGroupLoaded(groupIndex) then
                    ret = format("%s%s%s", ret, ret ~= "" and "\n" or "", "Not currently loaded")
                end
                return ret
            end,
            CheckButtonSetter = function() _Cooldowns.ToggleGroup(groupIndex) end,
            CheckButtonGetter = function() return _Cooldowns.IsGroupActive(groupIndex) end,
            CheckButtonTooltip = "Toggle group's active status",
            UseCheckButton = true,
            children = {}
        }
        if newIndex == groupIndex then
            groupButton.defaultOpen = true
        end
        for i, section in ipairs(types.configSections) do
            groupButton.children[i] = {
                type = "button",
                title = section.label,
                template = "EchoRaidTools_CooldownsNavigationSelectableButtonFrame",
                isSelected = function() return _Cooldowns.GetCurrentGroupIndex() == groupIndex and _Cooldowns.panels and _Cooldowns.panels[section.name] and _Cooldowns.panels[section.name]:IsShown() end,
                clickFunc = function()
                    -- _Cooldowns.panels
                    if (_Cooldowns.GetCurrentGroupIndex() ~= groupIndex) or (not _Cooldowns.panels[section.name]:IsShown()) then
                        _Cooldowns.SetCurrentGroup(groupIndex)
                        _Cooldowns.mainWindow.currentPanel:Hide()
                        _Cooldowns.sectionBuilders[section.name]()
                        _Cooldowns.panels[section.name]:Show()
                        _Cooldowns.mainWindow.Header.HeaderSubText:SetText(format("%s - %s",_Cooldowns.GetGroupName(groupIndex), section.label))
                        _Cooldowns.mainWindow.currentPanel = _Cooldowns.panels[section.name]
                    end
                    _Cooldowns.UpdateNavigation()
                end,
            }
        end
        table.insert(items[1].children, groupButton)
    end
    return items
end

function _Cooldowns.UpdateNavigation(newIndex)
    local buttonFrame = _Cooldowns.NavigationButtons
    if not buttonFrame then return end
    buttonFrame:ProcessItemTable(_Cooldowns.BuildNavigationItemTable(newIndex))
end

function _Cooldowns.CreateNavigationButtons()
    if _Cooldowns.NavigationButtons then
        return _Cooldowns.NavigationButtons
    end
    local itemTable = _Cooldowns.BuildNavigationItemTable()
    local tree = _EchoRaidTools:CreateTreeView(_EchoRaidTools.panels.main.MainMenu, itemTable, 20)
    tree:ProcessItemTable(_Cooldowns.BuildNavigationItemTable(), true)
    _Cooldowns.NavigationButtons = tree
    return _Cooldowns.NavigationButtons
end

function _Cooldowns:GetButtonInfo()
    return "Cooldowns",
    nil,
    function()
        return _Cooldowns:GetCooldownsConfig()
    end,
    _Cooldowns.CreateNavigationButtons(),
    1
end
