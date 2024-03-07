local _AddonName, _EchoRaidTools = ...;
local _Profiles = _EchoRaidTools:NewModule("profiles")

-- TURN THIS MODULE OFF BY COMMENTING OUT THE TEST MODULE LINE IN THE TOC FILE

function _Profiles:ADDON_LOADED(addonName)
    if addonName ~= _AddonName then return end

    function _Profiles.BuildNavigationTable()
        local navTable = {}
        for _, module in ipairs(_EchoRaidTools.modules or {}) do
            if module.HasProfiles and module:HasProfiles() then
                local name,_,_,_,preferredIndex = module:GetButtonInfo()
                local child = {
                    type = "button",
                    title = name,
                    template = "EchoRaidTools_ProfilesNavigationSelectableButtonFrame",
                    isSelected = function() return _Profiles.mainWindow and _Profiles.mainWindow.currentModuleName == module.name end,
                    clickFunc = function()
                        if _Profiles.mainWindow.currentPanel then
                            _Profiles.mainWindow.currentPanel:Hide()
                            _Profiles.mainWindow.currentPanel = nil
                            _Profiles.mainWindow.currentModuleName = nil
                        end
                        local panel = module:GetProfilePanel(_Profiles.mainWindow)
                        panel:Show()
                        _Profiles.mainWindow.currentModuleName = module.name
                        _Profiles.mainWindow.currentPanel = panel
                        _Profiles.mainWindow.Header.HeaderSubText:SetText(name)

                        _Profiles.UpdateNavigation()
                    end,
                }
                if preferredIndex and preferredIndex >= #navTable then
                    table.insert(navTable, preferredIndex, child)
                else
                    table.insert(navTable, child)
                end
            end
        end
        return navTable
    end
    function _Profiles.UpdateNavigation(full)
        local navTable
        if full or not _Profiles.currentNavTable then
            navTable = _Profiles.BuildNavigationTable()
        else
            navTable = _Profiles.currentNavTable
        end
        _Profiles.currentNavTable = navTable
        _Profiles.NavigationButtons:ProcessItemTable(navTable, full)
    end
    function _Profiles:GetNavigationButtons()
        if _Profiles.NavigationButtons then
            return _Profiles.NavigationButtons
        end
        local navTable = _Profiles.BuildNavigationTable()
        _Profiles.currentNavTable = navTable
        local tree = _EchoRaidTools:CreateTreeView(_EchoRaidTools.panels.main.MainMenu, navTable, 20)
        tree:ProcessItemTable(navTable, true)
        _Profiles.NavigationButtons = tree
        return _Profiles.NavigationButtons
    end

    function _Profiles:GetConfig()
        if _EchoRaidTools.panels.profiles then
            return _EchoRaidTools.panels.profiles
        end

        --main panel creation
        local window = CreateFrame("FRAME", nil, _EchoRaidTools.panels.main, "EchoRaidToolsMainConfigWindow")
        window.Header.EnableModule:Hide()
        window.Header.HeaderText:ClearAllPoints()
        window.Header.HeaderText:SetPoint("LEFT", 10, 0)
        window.Header.HeaderText:SetText("Import/Export")

        local panel = CreateFrame("FRAME", nil, window, "EchoRaidToolsMainConfigPanel")
        window:SetScript("OnShow", function()
            end
        )
        window:SetScript("OnHide", function()
            end
        )
        panel:SetPoint("TOPLEFT", window.Header, "BOTTOMLEFT")
        panel:SetPoint("BOTTOMRIGHT")
        local mainContainer = panel.ScrollFrame.ScrollingPanel
        _Profiles.controlParent = mainContainer
        _Profiles.mainWindow = window
        _Profiles.mainPanel = panel
        _Profiles.mainWindow.currentPanel = panel


        panel.ScrollFrame:SetVerticalScroll(0)
        local Resize = function() end
        panel:SetScript("OnSizeChanged", Resize)

        _EchoRaidTools.panels.profiles = window
        return window
    end
    function _Profiles:GetButtonInfo()
        return "Import/Export",
        nil,
        function()
            return _Profiles:GetConfig()
        end,
        _Profiles:GetNavigationButtons(),
        3
    end
end
