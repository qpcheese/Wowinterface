local _AddonName, _EchoRaidTools = ...
local _ReadyCheck = _EchoRaidTools:GetModule("readyCheck")

local displayResetFunc = function(self, control)
    control:ClearAllPoints()
    control:Hide()
end

_ReadyCheck.SetupControlPools = function(mainContainer)
    _ReadyCheck.controlPools = _ReadyCheck.controlPools or {}
    if not _ReadyCheck.controlPools["SLIDER"] then
        _ReadyCheck.controlPools["SLIDER"] = CreateFramePool("FRAME", mainContainer, "EchoRaidTools_BetterSlider", displayResetFunc)--"EchoRaidToolsConfig_Slider" EchoRaidTools_BetterSlider
    end
end

_ReadyCheck.RebuildConfig = function (mainContainer)
    for type, pool in pairs(_ReadyCheck.controlPools) do
        pool:ReleaseAll()
    end

    local control = _ReadyCheck.controlPools["SLIDER"]:Acquire()
    control.type = "SLIDER"
    control:SetParent(mainContainer)
    control.TopText:SetText("Scale %")
    control.TopText:Show()
    local tooltip = "Set the ReadyCheck window's overall scale"
    control.tooltip = tooltip
    control.Slider.tooltip = tooltip
    control.ValueEditbox.tooltip = tooltip
    control:Show()
    control:SetHeight(32)
    control:SetWidth(200)
    control:Setup(10, 200, 1, _ReadyCheck.GetWindowScale, _ReadyCheck.SetWindowScale, 10, 500)

    control:ClearAllPoints()
    control:SetPoint("TOPLEFT", 40, -40)
end

function _ReadyCheck:GetNavigationButtons()

end

function _ReadyCheck:GetReadyCheckConfig()
    if _EchoRaidTools.panels.readyCheck then
        return _EchoRaidTools.panels.readyCheck
    end

    --main panel creation
    local window = CreateFrame("FRAME", nil, _EchoRaidTools.panels.main, "EchoRaidToolsMainConfigWindow")
    window.Header.EnableModule.tooltip = "Enable/Disable the whole ReadyCheck addon module"
    window.Header.EnableModule:SetChecked(_ReadyCheck.GetModuleEnabled())
    window.Header.EnableModule:SetScript("OnClick", function(self)
        _ReadyCheck.ToggleModuleEnabled()
        self:SetChecked(_ReadyCheck.GetModuleEnabled())
    end)
    window.Header.HeaderText:SetText("Ready Check")

    local panel = CreateFrame("FRAME", nil, window, "EchoRaidToolsMainConfigPanel")
    window:SetScript("OnShow", function()
            _ReadyCheck.ShowExample()
        end
    )
    window:SetScript("OnHide", function()
            _ReadyCheck.HideExample()
        end
    )
    panel:SetPoint("TOPLEFT", window.Header, "BOTTOMLEFT")
    panel:SetPoint("BOTTOMRIGHT")
    local mainContainer = panel.ScrollFrame.ScrollingPanel
    _ReadyCheck.mainPanel = panel

    _ReadyCheck.controlParent = mainContainer
    _ReadyCheck.SetupControlPools()
    _ReadyCheck.RebuildConfig(mainContainer)
    panel.ScrollFrame:SetVerticalScroll(0)

    local Resize = function() end
    panel:SetScript("OnSizeChanged", Resize)

    _EchoRaidTools.panels.readyCheck = window
    _ReadyCheck.ShowExample()
    return window
end

function _ReadyCheck:GetButtonInfo()
    return "Ready Check",
    nil,
    function()
        return _ReadyCheck:GetReadyCheckConfig()
    end,
    _ReadyCheck:GetNavigationButtons(),
    2
end
