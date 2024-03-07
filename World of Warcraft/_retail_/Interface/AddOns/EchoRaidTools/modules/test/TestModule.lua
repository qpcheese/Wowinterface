local _AddonName, _EchoRaidTools = ...;
local _TestModule = _EchoRaidTools:NewModule("TestModule")

-- TURN THIS MODULE OFF BY COMMENTING OUT THE TEST MODULE LINE IN THE TOC FILE

function _TestModule:ADDON_LOADED(addonName)
    if addonName ~= _AddonName then return end

    function _TestModule:GetNavigationButtons()
        if _TestModule.Navigation then
            return _TestModule.Navigation
        end
        local exampleTable = {
            {
                type = "node",
                title = "Node1",
                icon = 236709,
                template = "EchoRaidTools_TestNodeFrame",
                addButtonClick = function() print("add button clicked") end,
                addButtonTooltip = "test test",
                children = {
                    {
                        type = "button",
                        title = "child button1",
                        clickFunc = function() print("child button1 clicked") end,
                        template = "EchoRaidTools_TestButtonFrame",
                        Getter = function() return true end,
                        Setter = function(self) print(self:GetChecked()) end,
                    },
                    {
                        type = "node",
                        title = "Node2",
                        children = {
                            {
                                type = "button",
                                title = "child child button1",
                                clickFunc = function() print("child child button1 clicked") end,
                            },
                            {
                                type = "button",
                                title = "child child button2",
                                clickFunc = function() print("child child button2 clicked") end,
                            },
                        }
                    },
                    {
                        type = "button",
                        title = "child button2",
                        clickFunc = function() print("child button2 clicked") end,
                    },
                }
            },
            {
                type = "node",
                title = "Node1",
                children = {
                    {
                        type = "button",
                        title = "child button1",
                        clickFunc = function() print("child button1 clicked") end,
                    },
                    {
                        type = "node",
                        title = "Node2",
                        children = {
                            {
                                type = "button",
                                title = "child child button1",
                                clickFunc = function() print("child child button1 clicked") end,
                            },
                            {
                                type = "button",
                                title = "child child button2",
                                clickFunc = function() print("child child button2 clicked") end,
                            },
                        }
                    },
                    {
                        type = "button",
                        title = "child button2",
                        clickFunc = function() print("child button2 clicked") end,
                    },
                }
            },
            {
                type = "button",
                title = "test button1",
                clickFunc = function() print("test button1 clicked") end,
            },
            {
                type = "button",
                title = "test button2",
                clickFunc = function() print("test button2 clicked") end,
            },
            {
                type = "node",
                title = "Node1",
                children = {
                    {
                        type = "button",
                        title = "child button1",
                        clickFunc = function() print("child button1 clicked") end,
                    },
                    {
                        type = "node",
                        title = "Node2",
                        children = {
                            {
                                type = "button",
                                title = "child child button1",
                                clickFunc = function() print("child child button1 clicked") end,
                                icon = 236709,
                            },
                            {
                                type = "button",
                                title = "child child button2",
                                clickFunc = function() print("child child button2 clicked") end,
                                icon = 236709,
                            },
                        }
                    },
                    {
                        type = "button",
                        title = "child button2",
                        clickFunc = function() print("child button2 clicked") end,
                        icon = 236709,
                    },
                }
            }
        }

        local tree = _EchoRaidTools:CreateTreeView(_EchoRaidTools.panels.main.MainMenu, exampleTable, 10)
        _TestModule.Navigation = tree
        return _TestModule.Navigation
    end

    function _TestModule:GetConfig()
        if _EchoRaidTools.panels.testModule then
            return _EchoRaidTools.panels.testModule
        end

        --main panel creation
        --main panel creation
        local window = CreateFrame("FRAME", nil, _EchoRaidTools.panels.main, "EchoRaidToolsMainConfigWindow")
        window.Header.EnableModule:Hide()
        window.Header.HeaderText:ClearAllPoints()
        window.Header.HeaderText:SetPoint("LEFT", 10, 0)
        window.Header.HeaderText:SetText("Test Module")

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
        _TestModule.controlParent = mainContainer
        _TestModule.mainWindow = window
        _TestModule.mainPanel = panel
        _TestModule.mainWindow.currentPanel = panel


        panel.ScrollFrame:SetVerticalScroll(0)
        local Resize = function() end
        panel:SetScript("OnSizeChanged", Resize)

        _EchoRaidTools.panels.TestModule = window

        local ScrollingPanel = CreateFrame("Frame", nil, mainContainer, "EchoRaidToolsMainConfigPanel")
        ScrollingPanel:SetAllPoints()
        ScrollingPanel:Show()
        local tabControl = CreateFrame("Frame", nil, ScrollingPanel, "EchoRaidTools_TabMainPanel")
        tabControl:ClearAllPoints()
        tabControl:SetPoint("TOPLEFT", 5, -5)
        tabControl:SetPoint("TOPRIGHT", -5, -5)
        tabControl:SetHeight(700)
        local tabs = {"Test1", "Test2", "Much Longer Test3"}
        local panels = tabControl:SetTabs(tabs)
        for i, contentPanel in ipairs(panels) do
            local testButton = CreateFrame("FRAME", nil, contentPanel, "EchoRaidToolsConfig_Button")
            testButton:SetPoint("TOPLEFT", 10, i * -20)
            testButton.Button:SetText("Button"..i)
            testButton:SetSize(200, 30)
            testButton:Show()
        end
        tabControl:Show()
        panel.tabControl = tabControl

        return window
    end
    function _TestModule:GetButtonInfo()
        return "Test Module",
        nil,
        function()
            return _TestModule:GetConfig()
        end,
        _TestModule:GetNavigationButtons()
    end
end
