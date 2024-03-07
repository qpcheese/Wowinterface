local _AddonName, _EchoRaidTools = ...

-- local L = LibStub ("AceLocale-3.0"):GetLocale ( "EchoRaidTools" )
local DF = DetailsFramework
local button_tab_template = DF.table.copy ({}, DF:GetTemplate ("button", "OPTIONS_BUTTON_TEMPLATE"))
--button_tab_template.backdropbordercolor = nil

local CreateButton = function(buttonList, pos, parent, text, icon, func)
    if buttonList[pos] then
        -- Reuse old button
        local button = buttonList[pos]
        button:SetText(text)
        button:SetScript("OnClick", func)
    else
        -- Create new button
        buttonList[pos] = DF:CreateButton (
                parent,
                func,
                120,
                20,
                text,
                nil,
                nil,
                "Interface\\Buttons\\grad1C"
        )
    end

    local button  = buttonList[pos]
    button.button.text:ClearAllPoints()
    button.button.text:SetPoint("TOPLEFT", button.button, "TOPLEFT", 5, -5)
    button.button.text:SetPoint("BOTTOMRIGHT", button.button, "BOTTOMRIGHT", -5, 5)
    button.button.text:SetJustifyH("RIGHT")
    local fontName = button.button.text:GetFont()
    button.button.text:SetFont(fontName, 12)
end

local ShowContentWidget = function(widget)
    if _EchoRaidTools.panels.main.currentContent then
        _EchoRaidTools.panels.main.currentContent:Hide()
        _EchoRaidTools.panels.main.currentContent = nil
    end

    if not widget then
        return
    end

    widget:ClearAllPoints()
    widget:SetPoint("TOPLEFT", _EchoRaidTools.panels.main.TitleBar, "BOTTOMLEFT", 145, -10)
    widget:SetPoint("BOTTOMRIGHT", _EchoRaidTools.panels.main, "BOTTOMRIGHT", -10, 10)
    widget:Show()

    _EchoRaidTools.panels.main.currentContent = widget
end

local GenerateButtonList = function()
    local count = 0
    _EchoRaidTools.moduleButtons = _EchoRaidTools.moduleButtons or {}

    -- Run over modules
    for _, module in ipairs(_EchoRaidTools.modules or {}) do
        if module["GetButtonInfo"] then
            count = count + 1

            local text, icon, func = module["GetButtonInfo"](module)
            CreateButton(
                    _EchoRaidTools.moduleButtons,
                    count,
                    _EchoRaidTools.panels.main,
                    text,
                    icon,
                    function(self)
                        print("Displaying", module.name)
                        if func then
                            for _, button in ipairs(_EchoRaidTools.moduleButtons or {}) do
                                button:UnlockHighlight()
                            end
                            self:LockHighlight()
                            ShowContentWidget(func())
                        else
                            print("No widget function for module " .. module.name .. " defined")
                        end
                    end
            )
        end
    end
    --count = count + 1

    -- Setup buttons
    for index, button in ipairs(_EchoRaidTools.moduleButtons or {}) do
        if index == 1 then
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", _EchoRaidTools.panels.main.TitleBar, "BOTTOMLEFT", 0, -10)
            button:Show()
        else
            button:ClearAllPoints()

            local previous = _EchoRaidTools.moduleButtons[index - 1]
            button:SetPoint("TOP", previous, "BOTTOM", 0, -2)
        end
    end
end

function _EchoRaidTools:OpenPanel()
    -- Ensure we have a panel list
    _EchoRaidTools.panels = _EchoRaidTools.panels or {}

    if _EchoRaidTools.panels.main then
        GenerateButtonList()
        _EchoRaidTools.panels.main:Show()
        return
    end

    -- We need to create our panel first
    _EchoRaidTools.panels.main = DF:CreateSimplePanel (
            UIParent,
            1000,
            600,
            "Echo Raid Tools",
            "EchoRaidToolsFrame",
            {UseScaleBar = true},
            {} -- Should be DB
    )
    _EchoRaidTools.panels.main:SetFrameStrata("HIGH")

    DF:CreateResizeGrips(_EchoRaidTools.panels.main)
    GenerateButtonList()
    _EchoRaidTools.panels.main:Show()
end

