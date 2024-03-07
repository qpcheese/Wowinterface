local _AddonName, _EchoRaidTools = ...;

local _PermaMarks = _EchoRaidTools:NewModule("perma-marks")

function _PermaMarks:GetButtonInfo()
    return "Perma Marks", nil, function()
        return _PermaMarks:GetEditor()
    end
end

function _PermaMarks:GetEditor()
    if not _PermaMarks.editor then
        _PermaMarks.editor = CreateFrame("Frame", "EchoRaidToolsPermaMarksOptions", _EchoRaidTools.panels.main, "EchoRaidTools_PermaMarks_Options")
        _PermaMarks.editor.Header.HeaderText:SetText("Perma Marks")

        for i=1,8 do
            local row = _PermaMarks.editor["rt"..i]
            if row then
                row.Icon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_" .. i)
            end

            row.Wizard:SetScript("OnClick", function()
                _PermaMarks:ShowWizard(i)
            end)
        end
    end

    return _PermaMarks.editor
end

function _PermaMarks:GetWizard()
    if not _PermaMarks.wizard then
        _PermaMarks.wizard = CreateFrame("Frame", "EchoRaidToolsPermaMarksWizard", _EchoRaidTools.panels.main, "EchoRaidTools_PermaMarks_Wizard")

        -- local color = RAID_CLASS_COLORS["MONK"]
        -- _PermaMarks.wizard.test.Bg:SetVertexColor(color.r, color.g, color.b, 1)
        -- _PermaMarks.wizard.test.Text:SetText(color:WrapTextInColorCode("Monk"))
    end
    
    return _PermaMarks.wizard
end

function _PermaMarks:ShowWizard(markerIndex)
    local wizard = _PermaMarks:GetWizard()
    wizard.Marker:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_" .. (markerIndex or 1))
    _EchoRaidTools:ShowContent(wizard)
end

function _PermaMarks:ShowOptions()
    _EchoRaidTools:ShowContent(_PermaMarks:GetEditor())
end

