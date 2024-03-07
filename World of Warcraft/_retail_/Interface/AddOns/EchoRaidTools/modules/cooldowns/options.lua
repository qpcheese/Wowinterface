local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local LibSharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")

local types = _Cooldowns.types

function _Cooldowns:LoadOptions()
    local data = EchoRaidToolsDB.Cooldowns

    local paths = _Cooldowns.dataPaths

    _Cooldowns.currentTextSettings = "SpellNameText"
    _Cooldowns.currentStateSettings = "UnitDead"

    local TextureArray
    local BuildTextureArray = function()
        if not TextureArray then
            TextureArray = {}
            local textures = LibSharedMedia:HashTable("statusbar")
            for name, texturePath in pairs (textures) do
                table.insert(TextureArray, {value = name, label = name, statusbar = texturePath})
            end
            table.sort(TextureArray, function (t1, t2) return t1.label < t2.label end)
            return TextureArray
        else
            return TextureArray
        end
    end
    local BuildDropDownTextureList = function(onClick)
        local TexArray = BuildTextureArray()
        local mylist = tDClone(TexArray)
        for i, array in pairs(mylist) do
            array.onclick = onClick
        end
        return mylist
    end
    local GetSelectedTextureIndex = function(current)
        local TexArray = BuildTextureArray()
        for i, v in ipairs(TexArray) do
            if v.label == current then
                return i
            end
        end
    end

    local FontArray
    local BuildfontArray = function()
        if not FontArray then
            FontArray = {}
            local fonts = LibSharedMedia:HashTable("font")
            for name, fontPath in pairs (fonts) do
                table.insert(FontArray, {value = name, label = name, font = fontPath})
            end
            table.sort(FontArray, function (t1, t2) return t1.label < t2.label end)
            return FontArray
        else
            return FontArray
        end
    end
    local BuildDropDownFontList = function(onClick)
        local fonts = BuildfontArray()
        local mylist = tDClone(fonts)
        for i, array in pairs(mylist) do
            array.onclick = onClick
        end
        return mylist
    end
    local GetSelectedFontIndex = function(current)
        local fonts = BuildfontArray()
        for i, v in ipairs(fonts) do
            if v.label == current then
                return i
            end
        end
    end
    local BorderArray
    local BuildBorderArray = function()
        if not BorderArray then
            BorderArray = {}
            local borders = LibSharedMedia:HashTable("border")
            for name, borderPath in pairs (borders) do
                table.insert(BorderArray, {value = name, label = name, border = borderPath})
            end
            table.sort(BorderArray, function (t1, t2) return t1.label < t2.label end)
            return BorderArray
        else
            return BorderArray
        end
    end
    local BuildDropDownBorderList = function(onClick)
        local borders = BuildBorderArray()
        local mylist = tDClone(borders)
        for i, array in pairs(mylist) do
            array.onclick = onClick
        end
        return mylist
    end
    local GetSelectedBorderIndex = function(current)
        local borders = BuildBorderArray()
        for i, v in ipairs(borders) do
            if v.label == current then
                return i
            end
        end
    end

    local noop = function() end

    _Cooldowns.GetGeneralConfigSection = function()
     -- start of General section
        local generalConfigSection = {
            label = "General Settings",
            name = "GeneralConfigSection",
            contents = {}
        }

        local line = {
            type = "LINE",
            lineTitle = "Show CD Uptime",
            name = "UptimeLine",
            contents = {
                {
                    name = "DisplayUptime",
                    text = "Display Uptime",
                    type = "CHECKBUTTON",
                    onClick = function()
                        _Cooldowns.ToggleEnableUptimes()
                    end,
                    valueFunc = function() return _Cooldowns.GetEnableUptimes() end,
                },
                {
                    type = "INFO",
                    name = "CooldownNumbersInfo",
                    tooltip = [==[Show the uptime of the effect triggered by the spell used, not only the cooldown]==]
                }
            }
        }
        table.insert(generalConfigSection.contents, line)

        local line = {
            type = "LINE",
            lineTitle = "",
            name = "GeneralSeparatorLine1",
            contents = {
                {
                    name = "GeneralSeparator1",
                    type = "SEPARATOR",
                }
            }
        }
        table.insert(generalConfigSection.contents, line)

        local line = {
            type = "LINE",
            lineTitle = "Ignore Self",
            name = "IgnoreSelfLine",
            --tooltip = "When enabled this setting prevent the player's own CDs from displaying in this Group.",
            contents = {
                {
                    name = "IgnoreSelf",
                    text = "Ignore Self",
                    type = "CHECKBUTTON",
                    onClick = function(self, button, down)
                        _Cooldowns.ToggleIgnoreSelf()
                    end,
                    valueFunc = function() return _Cooldowns.GetIgnoreSelf() end,
                    tooltip = "When enabled this setting prevent the player's own CDs from displaying in this Group.",
                },
            }
        }
        table.insert(generalConfigSection.contents, line)

        local line = {
            type = "LINE",
            lineTitle = "Show Roles",
            name = "ShowRolesLine",
            --tooltip = "",
            contents = {
                {
                    name = "ShowTanks",
                    text = "Show Tanks",
                    type = "CHECKBUTTON",
                    onClick = function(self, button, down)
                        _Cooldowns.ToggleShowTanks()
                        _Cooldowns.controls["ShowRolesInfo"]:Update()
                    end,
                    useTopText = true,
                    width = 80,
                    valueFunc = function() return _Cooldowns.GetShowTanks() end,
                    tooltip = "Toggle whether this group displays CDs for Ttanks in your party/raid.",
                },
                {
                    name = "ShowHealers",
                    text = "Show Healers",
                    type = "CHECKBUTTON",
                    onClick = function(self, button, down)
                        _Cooldowns.ToggleShowHealers()
                        _Cooldowns.controls["ShowRolesInfo"]:Update()
                    end,
                    useTopText = true,
                    width = 80,
                    valueFunc = function() return _Cooldowns.GetShowHealers() end,
                    tooltip = "Toggle whether this group displays CDs for Healers in your party/raid.",
                },
                {
                    name = "ShowDPS",
                    text = "Show DPS",
                    type = "CHECKBUTTON",
                    onClick = function(self, button, down)
                        _Cooldowns.ToggleShowDPS()
                        _Cooldowns.controls["ShowRolesInfo"]:Update()
                    end,
                    useTopText = true,
                    width = 50,
                    valueFunc = function() return _Cooldowns.GetShowDPS() end,
                    tooltip = "Toggle whether this group displays CDs for DPS in your party/raid.",
                },
                {
                    type = "INFO",
                    name = "ShowRolesInfo",
                    tooltip = [[With no Roles selected no Displays will be shown.]],
                    color = {r=1,g=0,b=0,a=1},
                    SetHidden = function() return _Cooldowns.GetShowDPS() or _Cooldowns.GetShowHealers() or _Cooldowns.GetShowTanks() end,
                },
            }
        }
        table.insert(generalConfigSection.contents, line)

        local line = {
            type = "LINE",
            lineTitle = "Show Units in Groups",
            name = "ShowUnitsInGroups",
            tooltip = [[Use these settings to show/hide units in those sub-groups of the raid. 
Useful if you raid Mythic with players outside the instance but in the raid group.]],
            extraHeight = true,
            contents = {
            }
        }
        for i = 1, 8 do
            local control = {
                name = "LoadG"..i,
                text = tostring(i),
                width = 30,
                useTopText = true,
                type = "CHECKBUTTON",
                onClick = function() _Cooldowns.ToggleGroupSetting(i) end,
                valueFunc = function() return _Cooldowns.GetGroupSetting(i) end,
            }
            table.insert(line.contents, control)
        end
        table.insert(generalConfigSection.contents, line)

        local line = {
            type = "LINE",
            lineTitle = "",
            name = "GeneralSeparatorLine2",
            contents = {
                {
                    name = "GeneralSeparator2",
                    type = "SEPARATOR",
                }
            }
        }
        table.insert(generalConfigSection.contents, line)

        local line = {
            type = "LINE",
            lineTitle = "Mouseover Tooltips",
            name = "UseMouseoverTooltipsLine",
            tooltip = "Enable tooltips for the spells when mousing over the Cooldown Display.",
            contents = {
                {
                        name = "UseMouseoverTooltips",
                        text = "Enable Mouseover Tooltips",
                        type = "CHECKBUTTON",
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleMouseoverTooltips()
                            self:SetChecked(_Cooldowns.GetMouseoverTooltips())
                        end,
                        valueFunc = function() return _Cooldowns.GetMouseoverTooltips() end,
                        useTopText = false,
                },
            },
        }
        table.insert(generalConfigSection.contents, line)

        local line = {
            type = "LINE",
            lineTitle = "",
            name = "GeneralSeparatorLine3",
            contents = {
                {
                    name = "GeneralSeparator3",
                    type = "SEPARATOR",
                }
            }
        }
        table.insert(generalConfigSection.contents, line)

        local line = {
            type = "LINE",
            lineTitle = "Hide Other Anchors",
            name = "hideOtherAnchorsLine",
            --tooltip = "Hide the other anchors, showing only the currently selected Group's anchor.\nUseful if you need to reposition overlapping Groups. ",
            contents = {
                {
                    name = "hideOtherAnchors",
                    type = "CHECKBUTTON",
                    text = "Toggle",
                    valueFunc = function() return _Cooldowns.GetHideOtherAnchors() end,
                    onClick = function(self, button)
                        _Cooldowns.ToggleHideOtherAnchors()
                    end,
                    tooltip = "Hide the anchors for other groups so only this one is visible.",
                    SetDisabled = function() return _Cooldowns.GetAnchorToUnitframes() end,
                },
                {
                    type = "INFO",
                    name = "locateAnchorInfo",
                    tooltip = [[This Group is anchored to unit frames.]],
                    SetHidden = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                },
                --[[{
                    name = "locateAnchor",
                    type = "BUTTON",
                    text = "Locate",
                    onClick = function(self, button)
                        _Cooldowns.LocateAnchor()
                    end,
                    tooltip = _Cooldowns.GetAnchorToUnitframes() and "Group anchored to UnitFrames" or "Locate this group's anchor on the screen.",
                    SetHidden = function() return _Cooldowns.GetAnchorToUnitframes() end,
                    width = 80,
                },]]
            },
        }
        table.insert(generalConfigSection.contents, line)

        local line = {
            type = "LINE",
            lineTitle = "Show Test Displays",
            name = "showTestDisplaysLine",
            tooltip = "Add a number of test displays to the current Group, showing some random classes and spells.\n(These are also limited by the Group's Display Limit, in Layout Settings)",
            contents = {
                {
                    name = "showTestDisplays",
                    type = "CHECKBUTTON",
                    text = "Toggle",
                    valueFunc = function() return _Cooldowns.GetTestDisplays() end,
                    onClick = function(self, button)
                        _Cooldowns.ToggleTestDisplays(not _Cooldowns.GetTestDisplays())
                        _Cooldowns.controls["numTestDisplays"]:Update()
                    end,
                    tooltip = "Show some example displays in this group",
                    SetDisabled = function() return not _Cooldowns.IsGroupActive() end,
                },
                {
                    name = "numTestDisplays",
                    text = "Number",
                    type = "SLIDER",
                    tooltip = "Set number of test displays to show",
                    func = function(value)
                        _Cooldowns.SetNumTestDisplays(value)
                    end,
                    valueFunc = function()
                        return _Cooldowns.GetNumTestDisplays()
                    end,
                    SetDisabled = function() return not _Cooldowns.GetTestDisplays() end,
                    min = 1,
                    max = 30,
                    hardMin = 1,
                    hardMax = 50,
                    step = 1,
                    useTopText = true,
                },
            },
        }
        table.insert(generalConfigSection.contents, line)

        --table.insert(_Cooldowns.settings, generalConfigSection)

        return generalConfigSection
    -- end of General section
    end

    do -- start layout config section
        _Cooldowns.GetLayoutConfigSection = function()
            local layoutConfigSection = {
                label = "Layout Settings",
                name = "LayoutConfigSection",
                contents = {}
            }

            local line = {
                type = "LINE",
                lineTitle = "Anchor to Unitframes",
                name = "AnchorToFramesLine",
                --extraHeight = true,
                tooltip = [[When enabled this setting will separate the Cooldown Group out per unit anchoring each set to the appropriate Unitframe.

When Auto Anchoring is toggled off you can use the dropdown to select which addon frames to prioritise when anchoring.
If the selected addon frames aren't found for a given unit then the rest of the list is checked as normal.]],
                contents = {
                    {
                        name = "AnchorToUnitframes",
                        text = "Anchor to Unitframes",
                        type = "CHECKBUTTON",
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleAnchorToUnitframes()
                            if _Cooldowns.GetHideOtherAnchors() then
                                _Cooldowns.ToggleHideOtherAnchors()
                            end
                            _Cooldowns.RefreshAllSettings()
                        end,
                        valueFunc = function() return _Cooldowns.GetAnchorToUnitframes() end,
                        tooltip = "Anchor displays to their unit's raid frame",
                        --useTopText = true,
                    },
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "UnitFrame Addon Selection",
                name = "AutoAnchorLine",
                SetDisabled = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                extraHeight = true,
                contents = {
                    {
                        name = "OverrideAnchor",
                        text = "Use Auto Anchoring",
                        type = "CHECKBUTTON",
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleAutoAnchor()
                            
                            _Cooldowns.controls["PrioritiseAnchor"]:Update()
                        end,
                        valueFunc = function() return _Cooldowns.GetAutoAnchor() end,
                        tooltip = "Let EchoRaidTools find the best match Unit Frames to anchor to.",
                        useTopText = true,
                        width = 200,
                        SetDisabled = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                    },
                    {
                        type = "DROPDOWN",
                        text = "Prioritise This addon",
                        name = "PrioritiseAnchor",
                        tooltip = "Select a UnitFrame addon to prioritise over the rest",
                        items = function()
                            local t = {}
                            for i, pattern in ipairs(types.UFpriorities) do
                                local item = {
                                    label = types.UFPrioritiesLabels[pattern] or pattern,
                                    value = pattern,
                                    onclick = function()
                                        _Cooldowns.SetAnchorPrio(pattern)
                                    end,
                                    --desc = "",
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetAnchorPrio()
                        end,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                        SetHidden = function() return _Cooldowns.GetAutoAnchor() end,
                    },
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Anchor Settings",
                name = "UnitFrameAnchorSettings1",
                SetDisabled = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                extraHeight = true,
                contents = {
                    {
                        type = "DROPDOWN",
                        text = "Anchor point",
                        name = "DisplayAnchorPoint",
                        tooltip = "Select the Display anchor point",
                        items = function()
                            local t = {}
                            for i, point in ipairs(types.AnchorPoints) do
                                local item = {
                                    label = point,
                                    value = point,
                                    onclick = function()
                                        _Cooldowns.SetDisplayAnchorPoint(point)
                                    end,
                                    desc = "Set the Display anchor point",
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetDisplayAnchorPoint()
                        end,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                    },
                    {
                        type = "DROPDOWN",
                        text = "Unitframe Point",
                        name = "UnitframePoint",
                        tooltip = "Select the Unitframe anchor point",
                        --width = 150,
                        items = function()
                            local t = {}
                            for i, point in ipairs(types.AnchorPoints) do
                                local item = {
                                    label = point,
                                    value = point,
                                    onclick = function()
                                        _Cooldowns.SetUnitframeAnchorPoint(point)
                                    end,
                                    desc = "Set the Unitframe anchor point",
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetUnitframeAnchorPoint()
                        end,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                    },
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "UnitFrameAnchorSettings2",
                SetDisabled = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                extraHeight = true,
                contents = {
                    {
                        name = "UnitFrameAnchorOffsetX",
                        text = "X offset",
                        type = "SLIDER",
                        tooltip = "Set the display group's horizontal offset",
                        func = function(value)
                            _Cooldowns.SetUnitFrameAnchorOffsetX(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetUnitFrameAnchorOffsetX()
                        end,
                        min = -30,
                        max = 30,
                        hardMin = -500,
                        hardMax = 500,
                        step = 1,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                    },
                    {
                        name = "UnitFrameAnchorOffsetY",
                        text = "Y offset",
                        type = "SLIDER",
                        tooltip = "Set the display group's vertical offset",
                        func = function(value)
                            _Cooldowns.SetUnitFrameAnchorOffsetY(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetUnitFrameAnchorOffsetY()
                        end,
                        min = -30,
                        max = 30,
                        hardMin = -500,
                        hardMax = 500,
                        step = 1,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetAnchorToUnitframes() end,
                    },
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Group Position",
                name = "GroupPositionLine",
                tooltip = "Set the Group's position\n(or Drag the Anchor)",
                SetDisabled = function() return _Cooldowns.GetAnchorToUnitframes() end,
                extraHeight = true,
                contents = {
                    {
                        name = "MainOffsetX",
                        text = "X",
                        type = "EDITBOX",
                        func = function(self,value)
                            local value = tonumber(value)
                            local x, y = _Cooldowns.GetAnchorOffsets()
                            if value and value ~= x then
                                _Cooldowns.SetAnchorOffsetX(value)
                            else
                                self:SetText(x)
                            end
                            self:ClearFocus()
                        end,
                        valueFunc = function()
                            local x, y = _Cooldowns.GetAnchorOffsets()
                            return x
                        end,
                        tooltip = "Set the X offset manually",
                        useTopText = true,
                        maxLetters = 5,
                        SetDisabled = function() return _Cooldowns.GetAnchorToUnitframes() end,
                    },
                    {
                        name = "MainOffsetY",
                        text = "Y",
                        type = "EDITBOX",
                        func = function(self,value)
                            local value = tonumber(value)
                            local x, y = _Cooldowns.GetAnchorOffsets()
                            if value and value ~= y then
                                _Cooldowns.SetAnchorOffsetY(value)
                            else
                                self:SetText(y)
                            end
                            self:ClearFocus()
                        end,
                        valueFunc = function()
                            local x, y = _Cooldowns.GetAnchorOffsets()
                            return y
                        end,
                        tooltip = "Set the Y offset manually",
                        useTopText = true,
                        maxLetters = 5,
                        SetDisabled = function() return _Cooldowns.GetAnchorToUnitframes() end,
                    },
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Override Strata",
                name = "OverrideStrataLine",
                extraHeight = true,
                contents = {
                    {
                        name = "OverrideStrataToggle",
                        text = "Override",
                        type = "CHECKBUTTON",
                        width = 100,
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleOverrideStrata()
                            _Cooldowns.controls["OverrideStrataSelect"]:Update()
                        end,
                        valueFunc = function() return _Cooldowns.GetOverrideStrata() end,
                        tooltip = "Override the default Frame Strata",
                        useTopText = true,
                    },
                    {
                        name = "OverrideStrataSelect",
                        text = "Strata",
                        textRight = true,
                        type = "DROPDOWN",
                        items = function()
                            local t = {}
                            for value, text in ipairs(types.StrataList) do
                                local item = {
                                    label = text,
                                    value = value,
                                    onclick = function()
                                        _Cooldowns.SetStrata(value)
                                    end,
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetStrata()
                        end,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetOverrideStrata() end
                    }
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Set Layout Directions",
                name = "GrowDirectionLine",
                extraHeight = true,
                contents = {
                    {
                        name = "GrowDirectionPrimary",
                        text = "Grow",
                        textRight = true,
                        type = "DROPDOWN",
                        tooltip = "Set the primary growth direction used on for the Cooldown layout",
                        items = function()
                            local t = {}
                            for value, text in pairs(types.primaryGrowDirections) do
                                local item = {
                                    label = text,
                                    value = value,
                                    onclick = function()
                                        _Cooldowns.SetPrimaryGrowthDirection(value)
                                        _Cooldowns.SetSecondaryGrowthDirection()
                                        _Cooldowns.controls["GrowDirectionSecondary"]:Update()
                                    end,
                                    desc = 'Use "'..text..'" as the primary grow direction.',
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetPrimaryGrowthDirection()
                        end,
                        useTopText = true
                    },
                    {
                        name = "GrowNumberSlider",
                        text = "...For",
                        type = "SLIDER",
                        textRight = true,
                        tooltip = "Set number of displays grown in the primary direction before using secondary\n(Use 0 to space all displays in the primary direction)",
                        func = function(value)
                            _Cooldowns.SetGrowNumber(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetGrowNumber()
                        end,
                        min = 0,
                        max = 20,
                        hardMin = 0,
                        hardMax = 100,
                        step = 1,
                        useTopText = true
                    },
                    {
                        name = "GrowDirectionSecondary",
                        text = "...Then",
                        textRight = true,
                        type = "DROPDOWN",
                        tooltip = "Set the secondary growth direction used on for the Cooldown layout",
                        items = function()
                            local t = {}
                            local itemSet = types.secondaryGrowDirections[_Cooldowns.GetPrimaryGrowthDirection()]
                            for value, text in pairs(itemSet) do
                                local item = {
                                    label = text,
                                    value = value,
                                    onclick = function()
                                        _Cooldowns.SetSecondaryGrowthDirection(value)
                                    end,
                                    desc = 'Use "'..text..'" as the secondary grow direction.',
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetSecondaryGrowthDirection()
                        end,
                        useTopText = true
                    }
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Layout Options",
                name = "CenteredLayoutsLine",
                extraHeight = true,
                contents = {
                    {
                        name = "CenterHorizontal",
                        text = "Center Horizontal",
                        type = "CHECKBUTTON",
                        width = 100,
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleCenterHorizontal()
                        end,
                        valueFunc = function() return _Cooldowns.GetCenterHorizontal() end,
                        tooltip = "Position the display so the anchor point is centered horizontally.",
                        useTopText = true,
                    },
                    {
                        name = "CenterVertical",
                        text = "Center Vertical",
                        type = "CHECKBUTTON",
                        width = 100,
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleCenterVertical()
                        end,
                        valueFunc = function() return _Cooldowns.GetCenterVertical() end,
                        tooltip = "Position the display so the anchor point is centered Vertically.",
                        useTopText = true,
                    },
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Set Spacing",
                name = "SetSpacingLine",
                extraHeight = true,
                contents = {
                    {
                        name = "SpacingSliderX",
                        text = "Horizontal",
                        type = "SLIDER",
                        tooltip = "Set the horizontal spacing between displays",
                        func = function(value)
                            _Cooldowns.SetXSpacing(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetXSpacing()
                        end,
                        min = 0,
                        max = 20,
                        hardMin = -10,
                        hardMax = 100,
                        step = 1,
                        useTopText = true,
                    },
                    {
                        name = "SpacingSliderY",
                        text = "Vertical",
                        type = "SLIDER",
                        tooltip = "Set the vertical spacing between displays",
                        func = function(value)
                            _Cooldowns.SetYSpacing(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetYSpacing()
                        end,
                        min = 0,
                        max = 20,
                        hardMin = -10,
                        hardMax = 100,
                        step = 1,
                        useTopText = true,
                    },
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Display Limit",
                name = "DisplayLimitLine",
                extraHeight = true,
                contents = {
                    {
                        name = "DisplayLimit",
                        text = "Max Displays",
                        type = "SLIDER",
                        tooltip = "Set a maximum limit for the number of displays shown\nUse 0 for unlimited",
                        func = function(value)
                            _Cooldowns.SetDisplayLimit(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetDisplayLimit()
                        end,
                        min = 0,
                        max = 30,
                        hardMin = 0,
                        hardMax = 500,
                        step = 1,
                        useTopText = true,
                    },
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "LayoutSeparatorLine1",
                contents = {
                    {
                        name = "LayoutSeparator1",
                        type = "SEPARATOR",
                    }
                }
            }
            table.insert(layoutConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Select Sorting Method",
                name = "PrimarySortMethodLine",
                tooltip = [[These settings handle how the displays in the Cooldown Group are sorted.
    "Primary" being the main sort with "Secondary" used when displays have identical Primary values]],
                extraHeight = true,
                contents = {
                    {
                        name = "SortMethod",
                        text = "Primary",
                        type = "DROPDOWN",
                        tooltip = "Set the primary sorting used on the Cooldowns displayed",
                        items = function()
                            local t = {}
                            for method, text in pairs(types.sortMethods) do
                                local item = {
                                    label = text,
                                    value = method,
                                    onclick = function()
                                        _Cooldowns.SetSortMethod(method)
                                        _Cooldowns.SetSortMethodSecondary()
                                        _Cooldowns.controls["SortMethodSecondary"]:Update()
                                        _Cooldowns.controls["SortAscendingSecondary"]:Update()
                                        _Cooldowns.controls["NewRow"]:Update()
                                    end,
                                    desc = 'Use "'..text..'" as the primary sorting method.',
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetSortMethod()
                        end,
                        useTopText = true,
                    },
                    {
                        name = "SortAscending",
                        text = "Ascending",
                        type = "CHECKBUTTON",
                        width = 70,
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleSortAscending()
                        end,
                        valueFunc = function() return _Cooldowns.GetSortAscending() end,
                        tooltip = "This sort method should go ascending or descending?",
                        useTopText = true,
                    },
                    {
                        name = "NewRow",
                        text = "Distribute",
                        type = "CHECKBUTTON",
                        width = 30,
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleNewRow()
                        end,
                        valueFunc = function() return _Cooldowns.GetNewRow() end,
                        tooltip = [[Enable "smart" layout of rows/columns]],
                        useTopText = true,
                        SetDisabled = function()
                            local sort = _Cooldowns.GetSortMethod()
                            return sort == "priority" or sort == "expirationTime"
                        end,
                    },
                    {
                        type = "INFO",
                        name = "DistributeInfo",
                        tooltip = [[When toggled on, this setting will create new rows/columns 
    based on your primary sort method and growth direction.
    Only available for Unit and Class sort methods.]]
                    }
                }
            }
            table.insert(layoutConfigSection.contents, line)
            local line = {
                type = "LINE",
                name = "SortMethodLine2",
                extraHeight = true,
                contents = {
                    {
                        name = "SortMethodSecondary",
                        text = "Secondary",
                        type = "DROPDOWN",
                        tooltip = "Set the Secondary sorting used on the Cooldowns displayed",
                        items = function()
                            local t = {}
                            for method, text in pairs(types.sortMethods) do
                                if method ~= _Cooldowns.GetSortMethod() then
                                    local item = {
                                        label = text,
                                        value = method,
                                        onclick = function()
                                            _Cooldowns.SetSortMethodSecondary(method)
                                        end,
                                        desc = 'Use "'..text..'" as the secondary sorting method.',
                                    }
                                    table.insert(t, item)
                                end
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetSortMethodSecondary()
                        end,
                        useTopText = true,
                        --SetDisabled = function() return _Cooldowns.GetSortMethod() == "priority" end
                    },
                    {
                        name = "SortAscendingSecondary",
                        text = "Ascending",
                        type = "CHECKBUTTON",
                        width = 80,
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleSortAscendingSecondary()
                        end,
                        valueFunc = function() return _Cooldowns.GetSortAscendingSecondary() end,
                        tooltip = "This sort method should go ascending or descending?",
                        useTopText = true,
                        --SetDisabled = function() return _Cooldowns.GetSortMethod() == "priority" end
                    },
                }
            }
            table.insert(layoutConfigSection.contents, line)
            local line = {
                type = "LINE",
                name = "SortMethodLine3",
                extraHeight = true,
                contents = {
                    {
                        name = "sortFlaggedLast",
                        text = "Flagged Last",
                        type = "CHECKBUTTON",
                        width = 60,
                        onClick = function(self, button, down)
                            _Cooldowns.ToggleSortFlaggedLast()
                        end,
                        valueFunc = function() return _Cooldowns.GetSortFlaggedLast() end,
                        tooltip = "Sort all units flagged as Dead/DC/etc. to the end",
                        useTopText = true,
                    }
                }
            }
            table.insert(layoutConfigSection.contents, line)
            return layoutConfigSection
        end

    end -- end layout config section

    do -- Start of Display section
        _Cooldowns.GetDisplayConfigSection = function()
            local DisplayConfigSection = {
                label = "Display Settings",
                name = "DisplayConfigSection",
                contents = {}
            }

            local line = {
                type = "LINE",
                lineTitle = "Display Size Settings",
                name = "DisplaySizeSettingsLine",
                extraHeight = true,
                contents = {
                    {
                        name = "DisplayWidthSlider",
                        text = "Set Display Width",
                        type = "SLIDER",
                        tooltip = "Set the total width of displays",
                        func = function(value)
                            _Cooldowns.SetWidth(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetWidth()
                        end,
                        min = _Cooldowns.GetHeight,
                        max = 400,
                        hardMin = 1,
                        hardMax = 400,
                        step = 1,
                        useTopText = true,
                    },
                    {
                        name = "DisplayHeightSlider",
                        text = "Set Display Height",
                        type = "SLIDER",
                        tooltip = "Set the total height of displays",
                        func = function(value)
                            _Cooldowns.SetHeight(value)
                            if _Cooldowns.GetWidth() < value then
                                _Cooldowns.SetWidth(value)
                            end
                            _Cooldowns.controls["DisplayWidthSlider"]:Update()
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetHeight()
                        end,
                        min = 20,
                        max = 100,
                        hardMin = 1,
                        hardMax = 200,
                        step = 1,
                        useTopText = true,
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Display Alpha",
                name = "AlphaLine",
                contents = {
                    {
                        name = "DisplayAlpha",
                        text = "Display Alpha",
                        type = "SLIDER",
                        tooltip = "Set Display's Alpha (transparency)",
                        func = function(value)
                            _Cooldowns.SetAlpha(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetAlpha()
                        end,
                        min = 0,
                        max = 100,
                        hardMin = 0,
                        hardMax = 100,
                        step = 1,
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "DisplaySeparatorLine1",
                contents = {
                    {
                        name = "DisplaySeparator1",
                        type = "SEPARATOR",
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Enable Bars",
                name = "BarMainEnableLine",
                contents = {
                    {
                        name = "BarMainEnable",
                        text = "Enable Bars",
                        type = "CHECKBUTTON",
                        onClick = function()
                            _Cooldowns.ToggleEnableBar()
                            _Cooldowns.RefreshAllSettings()
                        end,
                        valueFunc = function() return _Cooldowns.GetEnableBar() end,
                        tooltip = "The Display will include a progress bar in its display",
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Bar Progress Settings",
                name = "BarProgressLine",
                SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                width = 200,
                contents = {
                    {
                        name = "BarInverse",
                        text = "Inverse",
                        type = "CHECKBUTTON",
                        width = 70,
                        onClick = function()
                            _Cooldowns.ToggleBarInverse()
                        end,
                        valueFunc = function() return _Cooldowns.GetBarInverse() end,
                        tooltip = "Inverts the bar's progress",
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                    },
                    {
                        name = "BarReverse",
                        text = "Reverse",
                        type = "CHECKBUTTON",
                        width = 70,
                        onClick = function()
                            _Cooldowns.ToggleBarReverse()
                        end,
                        valueFunc = function() return _Cooldowns.GetBarReverse() end,
                        tooltip = "Reverses the bar's progress",
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                    },
                    {
                        name = "BarSpark",
                        text = "Enable Spark",
                        type = "CHECKBUTTON",
                        width = 70,
                        onClick = function()
                            _Cooldowns.ToggleBarSpark()
                        end,
                        valueFunc = function() return _Cooldowns.GetBarSpark() end,
                        tooltip = [[Enables/disables the "spark", highlighting the moving edge of the bar]],
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Set Bar Texture",
                name = "BarTextureSelectLine",
                SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                width = 200,
                contents = {
                    {
                        name = "BarTextureSelect",
                        text = "Set Bar Texture",
                        type = "DROPDOWN",
                        tooltip = "Select a texture for the Cooldown Bars",
                        items = function()
                            local onclick = function(_, _, value)
                                _Cooldowns.BarSetBarTexture(value)
                            end
                            return BuildDropDownTextureList(onclick)
                        end,
                        valueFunc = function() return _Cooldowns.BarGetBarTexture() end,
                        SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Bar Color Settings",
                name = "BarColorSettingLine",
                extraHeight = true,
                SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                contents = {
                    {
                        name = "BarColorSetting",
                        text = "Color",
                        type = "COLOR",
                        tooltip = "Set the bar color used, or override",
                        GetColor = function()
                            return  _Cooldowns.BarGetBarColor()
                        end,
                        SetColor = function(r,g,b,a, button)
                            _Cooldowns.BarSetBarColor(r,g,b,a)
                        end,
                        useTopText = true,
                        SetDisabled = function() return _Cooldowns.BarGetUseClassColor() or not _Cooldowns.GetEnableBar() end,
                        useOpacity = false,
                    },
                    {
                        name = "BarColorUseClass",
                        text = "Use Class",
                        tooltip = "Set the bar to override with the class color",
                        type = "CHECKBUTTON",
                        onClick = function()
                            _Cooldowns.BarToggleUseClassColor()
                            _Cooldowns.controls["BarColorSetting"]:Update()
                        end,
                        valueFunc = function() return _Cooldowns.BarGetUseClassColor() end,
                        useTopText = true,
                        width = 70,
                        SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                    },
                    {
                        name = "BarForegroundAlphaSlider",
                        text = "Alpha",
                        type = "SLIDER",
                        tooltip = "Set Bar Foreground's alpha",
                        func = function(value)
                            _Cooldowns.BarSetForegroundAlpha(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.BarGetForegroundAlpha()
                        end,
                        min = 0,
                        max = 100,
                        hardMin = 0,
                        hardMax = 100,
                        step = 1,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Bar Background Texture",
                name = "BarBackgroundTextureSelectLine",
                SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                width = 200,
                contents = {
                    {
                        name = "BarBackgroundTextureSelect",
                        text = "Bar Background Texture",
                        type = "DROPDOWN",
                        tooltip = "Select a texture for the Background",
                        items = function()
                            local onclick = function(_, _, value)
                                _Cooldowns.BarSetBarBackgroundTexture(value)
                            end
                            return BuildDropDownTextureList(onclick)
                        end,
                        valueFunc = function() return _Cooldowns.BarGetBarBackgroundTexture() end,
                        SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Bar Background Color",
                name = "BarBackgroundColorSettingLine",
                extraHeight = true,
                SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                contents = {
                    {
                        name = "BarBackgroundColorSetting",
                        text = "Color",
                        type = "COLOR",
                        tooltip = "Set the Background color used, or override",
                        GetColor = function()
                            return  _Cooldowns.BarGetBarBackgroundColor()
                        end,
                        SetColor = function(r,g,b,a, button)
                            _Cooldowns.BarSetBarBackgroundColor(r,g,b,a)
                        end,
                        useTopText = true,
                        SetDisabled = function() return _Cooldowns.BarGetBackgroundUseClassColor() or not _Cooldowns.GetEnableBar() end,
                        useOpacity = false,
                    },
                    {
                        name = "BarBackgroundColorUseClass",
                        text = "Use Class",
                        tooltip = "Set the Background to override with the class color",
                        type = "CHECKBUTTON",
                        onClick = function()
                            _Cooldowns.BarToggleBackgroundUseClassColor()
                            _Cooldowns.controls["BarBackgroundColorSetting"]:Update()
                        end,
                        valueFunc = function() return _Cooldowns.BarGetBackgroundUseClassColor() end,
                        useTopText = true,
                        width = 70,
                        SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                    },
                    {
                        name = "BarBackgroundAlphaSlider",
                        text = "Alpha",
                        type = "SLIDER",
                        tooltip = "Set Bar Background's alpha",
                        func = function(value)
                            _Cooldowns.BarSetBackgroundAlpha(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.BarGetBackgroundAlpha()
                        end,
                        min = 0,
                        max = 100,
                        hardMin = 0,
                        hardMax = 100,
                        step = 1,
                        SetDisabled = function() return not _Cooldowns.GetEnableBar() end,
                        useTopText = true,
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "DisplaySeparatorLine2",
                contents = {
                    {
                        name = "DisplaySeparator2",
                        type = "SEPARATOR",
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Enable Icons",
                name = "IconEnableLine",
                contents = {
                    {
                        name = "IconEnable",
                        text = "Enable Icons",
                        type = "CHECKBUTTON",
                        onClick = function()
                            _Cooldowns.ToggleEnableIcon()
                            _Cooldowns.RefreshAllSettings()
                        end,
                        valueFunc = function() return _Cooldowns.GetEnableIcon() end,
                        tooltip = "The Display will include an icon in its display",
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Icon Color",
                name = "IconSettingLine",
                SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                contents = {
                    {
                        name = "IconColorSetting",
                        text = "Color",
                        type = "COLOR",
                        tooltip = "Set the Icon color",
                        GetColor = function()
                            return  _Cooldowns.GetIconColor()
                        end,
                        SetColor = function(r,g,b,a, button)
                            _Cooldowns.SetIconColor(r,g,b,a)
                        end,
                        SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Icon Side",
                name = "IconSideLine",
                extraHeight = true,
                SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                contents = {
                    {
                        name = "IconSideSelect",
                        text = "Icon Side",
                        type = "DROPDOWN",
                        tooltip = "Set which side of the display the Icon attaches to",
                        items = function()
                            local t = {}
                            for value, text in pairs(types.IconSides) do
                                local item = {
                                    label = text,
                                    value = value,
                                    onclick = function()
                                        _Cooldowns.SetIconSide(value)
                                    end,
                                    desc = "Place the Icon on the "..text,
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function() return _Cooldowns.GetIconSide() end,
                        SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Icon Zoom",
                name = "IconZoomLine",
                extraHeight = true,
                SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                contents = {
                    {
                        name = "IconZoom",
                        text = "Icon Zoom",
                        type = "SLIDER",
                        tooltip = "Set Border's size",
                        func = function(value)
                            _Cooldowns.SetIconZoom(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetIconZoom()
                        end,
                        min = 0,
                        max = 100,
                        hardMin = 0,
                        hardMax = 200,
                        step = 1,
                        useTopText = false,
                        SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Icon Settings",
                name = "IconSettingsLine",
                extraHeight = true,
                SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                contents = {
                    {
                        name = "IconDesaturate",
                        text = "Desaturate Icons",
                        type = "CHECKBUTTON",
                        width = 100,
                        onClick = function()
                            _Cooldowns.ToggleDesaturateIcon()
                        end,
                        valueFunc = function() return _Cooldowns.GetDesaturateIcon() end,
                        tooltip = "Removes the colour from the icon texture",
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                    },
                    {
                        name = "IconEnableCooldownSwipe",
                        text = "Cooldown Swipe",
                        type = "CHECKBUTTON",
                        width = 100,
                        onClick = function()
                            _Cooldowns.ToggleCooldownSwipe()
                        end,
                        valueFunc = function() return _Cooldowns.GetCooldownSwipe() end,
                        tooltip = "Enable Cooldown Swipe",
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                    },
                    {
                        name = "IconEnableCooldownEdge",
                        text = "Cooldown Edge",
                        type = "CHECKBUTTON",
                        width = 100,
                        onClick = function()
                            _Cooldowns.ToggleCooldownEdge()
                        end,
                        valueFunc = function() return _Cooldowns.GetCooldownEdge() end,
                        tooltip = "Enable Cooldown Edge",
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                    },
                    {
                        name = "IconEnableCooldownNumbers",
                        text = "Cooldown Numbers",
                        type = "CHECKBUTTON",
                        onClick = function()
                            _Cooldowns.ToggleCooldownNumbers()
                        end,
                        valueFunc = function() return _Cooldowns.GetCooldownNumbers() end,
                        tooltip = "Enable Cooldown Numbers",
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetEnableIcon() end,
                    },
                    {
                        type = "INFO",
                        name = "CooldownNumbersInfo",
                        tooltip = [==[|cffffffffCooldown Numbers|r
    This setting will enable/disable the text on the icons in this group. 
    Those numbers can be coming from a number of places however. 
    - If you have OmniCC Addon loaded then it will override your CD numbers
    - If you have ElvUI and have enabled Cooldown Text in its settings then it will override them
    - Otherwise the numbers will come from Blizzard's own settings which are enabled globally 
            in [escape - Options - Action Bars - Show Numbers for Cooldowns]]==]
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "DisplaySeparatorLine3",
                contents = {
                    {
                        name = "DisplaySeparator3",
                        type = "SEPARATOR",
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Enable Border",
                name = "BorderEnableLine",
                extraHeight = false,
                contents = {
                    {
                        name = "BorderEnable",
                        text = "Enable",
                        type = "CHECKBUTTON",
                        tooltip = "The Display will include a Border around a given element of the Display",
                        onClick = function()
                            _Cooldowns.ToggleUseBorders()
                            _Cooldowns.RefreshAllSettings()
                        end,
                        valueFunc = function() return _Cooldowns.GetUseBorders() end,
                        useTopText = false,
                        width = 70,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Border Settings",
                name = "BorderSelectLine",
                extraHeight = true,
                SetDisabled = function() return not _Cooldowns.GetUseBorders() end,
                contents = { 
                    {
                        name = "BorderSelect",
                        text = "Border",
                        type = "DROPDOWN",
                        tooltip = "Select a Border",
                        items = function()
                            local onclick = function(_, _, value)
                                _Cooldowns.SetBorder(value)
                            end
                            return BuildDropDownBorderList(onclick)
                        end,
                        valueFunc = function() return _Cooldowns.GetBorder() end,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetUseBorders() end,
                    },
                    {
                        name = "BorderSizeSlider",
                        text = "Size",
                        type = "SLIDER",
                        tooltip = "Set Border's size",
                        func = function(value)
                            _Cooldowns.SetBorderSize(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetBorderSize()
                        end,
                        min = 1,
                        max = 20,
                        hardMin = 1,
                        hardMax = 100,
                        step = 1,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetUseBorders() end,
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Border Position",
                name = "BorderPositionLine",
                extraHeight = true,
                SetDisabled = function() return not _Cooldowns.GetUseBorders() end,
                contents = {
                    {
                        name = "BorderOffsetXSlider",
                        text = "X",
                        type = "SLIDER",
                        tooltip = "Set Border offset X",
                        func = function(value)
                            _Cooldowns.SetBorderOffsetX(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetBorderOffsetX()
                        end,
                        min = -20,
                        max = 20,
                        hardMin = -100,
                        hardMax = 100,
                        step = 1,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetUseBorders() end,
                    },
                    {
                        name = "BorderOffsetYSlider",
                        text = "Y",
                        type = "SLIDER",
                        tooltip = "Set Border offset Y",
                        func = function(value)
                            _Cooldowns.SetBorderOffsetY(value)
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetBorderOffsetY()
                        end,
                        min = -20,
                        max = 20,
                        hardMin = -100,
                        hardMax = 100,
                        step = 1,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetUseBorders() end,
                    },
                    {
                        type = "DROPDOWN",
                        text = "Anchor to",
                        name = "BorderRegion",
                        tooltip = "Select which Display element the Border is anchored to",
                        --width = 150,
                        items = function()
                            local t = {}
                            for region, text in pairs(types.anchorRegions) do
                                local item = {
                                    label = text,
                                    value = region,
                                    onclick = function()
                                        _Cooldowns.SetBorderRegion(region)
                                    end,
                                    desc = "Anchor to the "..text,
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetBorderRegion()
                        end,
                        useTopText = true,
                        SetDisabled = function() return not _Cooldowns.GetUseBorders() end,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Border Color Settings",
                name = "BorderColorSettingLine",
                extraHeight = true,
                contents = {
                    {
                        name = "BorderColorSetting",
                        text = "Color",
                        type = "COLOR",
                        tooltip = "Set the Border color used, or override",
                        GetColor = function()
                            return  _Cooldowns.GetBorderColor()
                        end,
                        SetColor = function(r,g,b,a, button)
                            _Cooldowns.SetBorderColor(r,g,b,a)
                        end,
                        useTopText = true,
                        SetDisabled = function() return _Cooldowns.GetBorderUseClassColor() or not _Cooldowns.GetUseBorders() end,
                    },
                    {
                        name = "BorderColorUseClass",
                        text = "Use Class",
                        tooltip = "Set the Border to override with the class color",
                        type = "CHECKBUTTON",
                        onClick = function()
                            _Cooldowns.ToggleBorderUseClassColor()
                            _Cooldowns.controls["BorderColorSetting"]:Update()
                        end,
                        valueFunc = function() return _Cooldowns.GetBorderUseClassColor() end,
                        useTopText = true,
                        width = 70,
                        SetDisabled = function() return not _Cooldowns.GetUseBorders() end,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "DisplaySeparatorLine4",
                contents = {
                    {
                        name = "DisplaySeparator4",
                        type = "SEPARATOR",
                    }
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Glow Settings",
                name = "GlowPositionLine",
                extraHeight = true,
                contents = {
                    {
                        name = "GlowEnable",
                        text = "Enable",
                        type = "CHECKBUTTON",
                        tooltip = "The Display will include a Glow around a given element of the Display",
                        onClick = function()
                            _Cooldowns.ToggleUseGlow()
                            --_Cooldowns.RefreshAllSettings()
                        end,
                        valueFunc = function() return _Cooldowns.GetUseGlow() end,
                        useTopText = false,
                        width = 70,
                    },
                    {
                        type = "DROPDOWN",
                        text = "Anchor to",
                        name = "GlowRegion",
                        tooltip = "Select which Display element the Glow is anchored to",
                        --width = 150,
                        items = function()
                            local t = {}
                            for region, text in pairs(types.anchorRegions) do
                                local item = {
                                    label = text,
                                    value = region,
                                    onclick = function()
                                        _Cooldowns.SetGlowRegion(region)
                                    end,
                                    desc = "Anchor to the "..text,
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetGlowRegion()
                        end,
                        useTopText = true,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Flash Settings",
                name = "FlashPositionLine",
                extraHeight = true,
                contents = {
                    {
                        name = "FlashEnable",
                        text = "Enable",
                        type = "CHECKBUTTON",
                        tooltip = "The Display will Flash",
                        onClick = function()
                            _Cooldowns.ToggleUseFlash()
                            --_Cooldowns.RefreshAllSettings()
                        end,
                        valueFunc = function() return _Cooldowns.GetUseFlash() end,
                        width = 70,
                    },
                }
            }
            table.insert(DisplayConfigSection.contents, line)
            return DisplayConfigSection
        end
    end -- end Display config section

    do -- Start text types section (iterator)
        _Cooldowns.GetTextConfigSection = function()
            local ConfigSection = {
                label = "Text Settings",
                name = "TextConfigSection",
                useTabControl = true,
                totalTabs = 4,
                contents = {},
            }
            for j, textType in ipairs(types.textTypes) do

                local tab = {
                    type = "TAB",
                    tabTitle = types.textTypeToLabel[textType],
                    contents = {},
                }

                local line = {
                    type = "LINE",
                    lineTitle = "Enable Text",
                    name = textType.."EnableLine",
                    contents = {
                        {
                            name = format("%sEnable", textType),
                            text = "Enable",
                            tooltip = "Enable this Text",
                            type = "CHECKBUTTON",
                            onClick = function() _Cooldowns["Toggle"..textType.."Enable"]() end,
                            valueFunc = function() return _Cooldowns["Get"..textType.."Enable"]() end,
                        },
                    }
                }
                table.insert(tab.contents, line)

                local line = {
                    type = "LINE",
                    lineTitle = "Font Settings",
                    name = textType.."FontLine",
                    extraHeight = true,
                    contents = {
                        {
                            type = "DROPDOWN",
                            text = "Font",
                            name = format("%sFont", textType),
                            tooltip = "Select the Font",
                            --width = 150,
                            items = function()
                                local onclick = function(_,_, value)
                                    _Cooldowns["Set"..textType.."Font"](value)
                                end
                                return BuildDropDownFontList(onclick)
                            end,
                            valueFunc = function() return _Cooldowns["Get"..textType.."Font"]() end,
                            useTopText = true,
                        },
                        {
                            type = "SLIDER",
                            name = format("%sSize", textType),
                            text = "Size",
                            tooltip = "Set the Text size",
                            func = function(value)
                                _Cooldowns["Set"..textType.."Size"](value)
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."Size"]()
                            end,
                            min = 5,
                            max = 30,
                            hardMin = 5,
                            hardMax = 100,
                            step = 1,
                            useTopText = true,
                        },
                    }
                }
                table.insert(tab.contents, line)

                local line = {
                    type = "LINE",
                    lineTitle = "Color Settings",
                    name = textType.."ColorLine",
                    extraHeight = true,
                    contents = {
                        {
                            type = "COLOR",
                            text = "Color",
                            name = format("%sColor", textType),
                            tooltip = "Set the color.",
                            GetColor = function()
                                return  _Cooldowns["Get"..textType.."Color"]()
                            end,
                            SetColor = function(r,g,b,a, button)
                                _Cooldowns["Set"..textType.."Color"](r,g,b,a)
                            end,
                            useTopText = true,
                            SetDisabled = function() 
                                return _Cooldowns["Get"..textType.."ClassColor"]()
                            end,
                            width = 80,
                        },
                        {
                            type = "CHECKBUTTON",
                            name = format("%sClass", textType),
                            text = "Use Class",
                            tooltip = "Override the seleted color with the unit's class color",
                            onClick = function()
                                _Cooldowns["Toggle"..textType.."ClassColor"]()
                                _Cooldowns.controls[format("%sColor", textType)]:Update()
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."ClassColor"]()
                            end,
                            useTopText = true,
                            width = 50,
                        },
                    }
                }
                table.insert(tab.contents, line)

                if textType == "UnitNameText" then

                    local line = {
                        type = "LINE",
                        lineTitle = "Abbreviation",
                        name = textType.."AbbreviationLine",
                        extraHeight = true,
                        contents = {
                            {
                                type = "CHECKBUTTON",
                                name = format("%sUseAbbreviation", textType),
                                text = "Abbreviate",
                                tooltip = "Enable abbreviation of unit names",
                                onClick = function()
                                    _Cooldowns["Toggle"..textType.."UseAbbreviate"]()
                                end,
                                valueFunc = function() 
                                    return _Cooldowns["Get"..textType.."UseAbbreviate"]()
                                end,
                                useTopText = true,
                                width = 70,
                            },
                            {
                                name = format("%sAbbreviateNumber", textType),
                                text = "Abbreviate Number",
                                type = "SLIDER",
                                tooltip = "Set the abbreviation number",
                                func = function(value)
                                    _Cooldowns["SetUnitNameTextAbbreviateNumber"](value)
                                end,
                                valueFunc = function()
                                    return _Cooldowns["GetUnitNameTextAbbreviateNumber"]()
                                end,
                                min = 3,
                                max = 30,
                                hardMin = 1,
                                hardMax = 100,
                                step = 1,
                                width = 150,
                                useTopText = true,
                            },
                        }
                    }
                    table.insert(tab.contents, line)

                elseif textType == "SpellNameText" then

                    local line = {
                        type = "LINE",
                        lineTitle = "Abbreviation",
                        name = textType.."AbbreviationLine",
                        extraHeight = true,
                        contents = {
                            {
                                type = "DROPDOWN",
                                text = "Abbreviation",
                                name = format("%sAbbreviation", textType),
                                tooltip = "Select how the text will be abbreviated",
                                --width = 150,
                                items = function()
                                    local t = {}
                                    for i, abbreviateType in ipairs(types.spellNameAbbreivateTypes) do
                                        local item = {
                                            label = abbreviateType.text,
                                            value = abbreviateType.type,
                                            onclick = function()
                                                _Cooldowns["SetSpellNameTextAbbreviateType"](abbreviateType.type)
                                            end,
                                            desc = "Set the text's abbreviation",
                                        }
                                        table.insert(t, item)
                                    end
                                    return t
                                end,
                                valueFunc = function()
                                    return _Cooldowns.GetSpellNameTextAbbreviateType()
                                end,
                            },
                        }
                    }
                    table.insert(tab.contents, line)

                elseif textType == "DurationText" then
                    local line = {
                        type = "LINE",
                        lineTitle = "Abbreviation",
                        name = textType.."AbbreviationLine",
                        extraHeight = true,
                        contents = {
                            {
                                type = "SLIDER",
                                text = "Threshold",
                                name = format("%sThreshold", textType),
                                tooltip = "Select the remaining duration under which the precision will change",
                                func = function(value)
                                    _Cooldowns["Set"..textType.."Threshold"](value)
                                end,
                                valueFunc = function()
                                    return _Cooldowns["Get"..textType.."Threshold"]()
                                end,
                                min = 0,
                                max = 60,
                                step = 1,
                                useTopText = true,
                            },
                            {
                                type = "SLIDER",
                                text = "Decimals",
                                name = format("%sDecimals", textType),
                                tooltip = "Select how precise (how many decimals) the duration will be while below the threshold",
                                func = function(value)
                                    _Cooldowns["Set"..textType.."Decimals"](value)
                                end,
                                valueFunc = function()
                                    return _Cooldowns["Get"..textType.."Decimals"]()
                                end,
                                min = 0,
                                max = 4,
                                step = 1,
                                useTopText = true,
                            },
                        }
                    }
                    table.insert(tab.contents, line)
                end

                local line = {
                    type = "LINE",
                    lineTitle = "Font Style",
                    name = textType.."FontStyleLine",
                    extraHeight = true,
                    contents = {
                        {
                            type = "DROPDOWN",
                            text = "Outline",
                            name = format("%sFontStyle", textType),
                            tooltip = "Select the text font style",
                            --width = 150,
                            useTopText = true,
                            items = function()
                                local t = {}
                                for k, v in pairs(types.font_flags) do
                                    local item = {
                                        label = v,
                                        value = k,
                                        onclick = function()
                                            _Cooldowns["Set"..textType.."FontStyle"](k)
                                        end,
                                        desc = "Set the text's Font Style",
                                    }
                                    table.insert(t, item)
                                end
                                return t
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."FontStyle"]()
                            end,
                        },
                    }
                }
                table.insert(tab.contents, line)

                local line = {
                    type = "LINE",
                    lineTitle = "",
                    name = textType.."FontStyleLine2",
                    extraHeight = true,
                    contents = {
                        {
                            name = format("%sTextShadowOffsetX", textType),
                            text = "Shadow X offset",
                            type = "SLIDER",
                            tooltip = "Set the text shadow's horizontal offset",
                            func = function(value)
                                _Cooldowns["Set"..textType.."TextShadowOffsetX"](value)
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."TextShadowOffsetX"]()
                            end,
                            min = -10,
                            max = 10,
                            hardMin = -100,
                            hardMax = 100,
                            step = 1,
                            useTopText = true,
                        },
                        {
                            name = format("%sTextShadowOffsetY", textType),
                            text = "Shadow Y offset",
                            type = "SLIDER",
                            tooltip = "Set the text shadow's vertical offset",
                            func = function(value)
                                _Cooldowns["Set"..textType.."TextShadowOffsetY"](value)
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."TextShadowOffsetY"]()
                            end,
                            min = -10,
                            max = 10,
                            step = 1,
                            useTopText = true,
                        },
                        {
                            name = format("%sTextShadowColor", textType),
                            text = "Shadow Color",
                            useTopText = true,
                            tooltip = "Set a color for the text shadow",
                            type = "COLOR",
                            GetColor = function()
                                return  _Cooldowns["Get"..textType.."TextShadowColor"]()
                            end,
                            SetColor = function(r,g,b,a, button)
                                _Cooldowns["Set"..textType.."TextShadowColor"](r,g,b,a)
                            end,
                        },
                    }
                }
                table.insert(tab.contents, line)

                local line = {
                    type = "LINE",
                    lineTitle = "Anchor Settings",
                    name = textType.."AnchorsLine",
                    extraHeight = true,
                    contents = {
                        {
                            type = "DROPDOWN",
                            text = "Anchor To",
                            name = format("%sAnchorTo", textType),
                            tooltip = "Select which Display element the text is anchored to",
                            --width = 150,
                            items = function()
                                local t = {}
                                for region, text in pairs(types.anchorRegions) do
                                    local item = {
                                        label = text,
                                        value = region,
                                        onclick = function()
                                            _Cooldowns["Set"..textType.."AnchorTo"](region)
                                            --_Cooldowns.controls[format("%sAnchorDemo", textType)]:Update()
                                        end,
                                        desc = "Anchor to the "..text,
                                    }
                                    table.insert(t, item)
                                end
                                return t
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."AnchorTo"]()
                            end,
                            useTopText = true,
                        },
                        {
                            type = "DROPDOWN",
                            text = "Anchor Point",
                            name = format("%sDisplayPoint", textType),
                            tooltip = "Select the display anchor point",
                            --width = 150,
                            items = function()
                                local t = {}
                                for i, point in ipairs(types.AnchorPoints) do
                                    local item = {
                                        label = point,
                                        value = point,
                                        onclick = function()
                                            _Cooldowns["Set"..textType.."DisplayAnchor"](point)
                                            --_Cooldowns.controls[format("%sAnchorDemo", textType)]:Update()
                                        end,
                                        desc = "Set the display anchor point",
                                    }
                                    table.insert(t, item)
                                end
                                return t
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."DisplayAnchor"]()
                            end,
                            useTopText = true,
                        },
                        {
                            type = "DROPDOWN",
                            text = "Text Point",
                            name = format("%sTextPoint", textType),
                            tooltip = "Select the text anchor point",
                            --width = 150,
                            items = function()
                                local t = {}
                                for i, point in ipairs(types.AnchorPoints) do
                                    local item = {
                                        label = point,
                                        value = point,
                                        onclick = function()
                                            _Cooldowns["Set"..textType.."TextAnchor"](point)
                                            --_Cooldowns.controls[format("%sAnchorDemo", textType)]:Update()
                                        end,
                                        desc = "Set the text anchor point",
                                    }
                                    table.insert(t, item)
                                end
                                return t
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."TextAnchor"]()
                            end,
                            useTopText = true,
                        },
                    }
                }
                table.insert(tab.contents, line)

                local line = {
                    type = "LINE",
                    lineTitle = "",
                    name = textType.."AnchorOffsetsLine",
                    extraHeight = true,
                    contents = {
                        {
                            name = format("%sOffsetX", textType),
                            text = "X offset",
                            type = "SLIDER",
                            tooltip = "Set the text's horizontal offset",
                            func = function(value)
                                _Cooldowns["Set"..textType.."OffsetX"](value)
                                --_Cooldowns.controls[format("%sAnchorDemo", textType)]:Update()
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."OffsetX"]()
                            end,
                            min = -30,
                            max = 30,
                            hardMin = -500,
                            hardMax = 500,
                            step = 1,
                            useTopText = true,
                        },
                        {
                            name = format("%sOffsetY", textType),
                            text = "Y offset",
                            type = "SLIDER",
                            tooltip = "Set the text's vertical offset",
                            func = function(value)
                                _Cooldowns["Set"..textType.."OffsetY"](value)
                                --_Cooldowns.controls[format("%sAnchorDemo", textType)]:Update()
                            end,
                            valueFunc = function()
                                return _Cooldowns["Get"..textType.."OffsetY"]()
                            end,
                            min = -30,
                            max = 30,
                            hardMin = -500,
                            hardMax = 500,
                            step = 1,
                            useTopText = true,
                        },
                    }
                }
                table.insert(tab.contents, line)

                table.insert(ConfigSection.contents, tab)

            end
            return ConfigSection
        end
        
    end -- end of text settings

    do -- start States Section
        _Cooldowns.GetStatesSettingsConfigSection = function()
            if not _Cooldowns.GetCurrentGroupIndex() or _Cooldowns.GetCurrentGroupIndex() == 0 then return end

            local ConfigSection = {
                label = "Conditions",
                name = "StatesSettingsConfigSection",
                contents = {},
            }

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "BlankStatesLine",
                extraHeight = true,
                contents = {
                }
            }
            table.insert(ConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Available Conditions",
                name = "AvailableStatesLine",
                extraHeight = true,
                contents = {
                    {
                        type = "DROPDOWN",
                        text = "State",
                        name = "SelectState",
                        tooltip = "Select which Condition to configure",
                        items = function()
                            local t = {}
                            for i, stateDetails in ipairs(types.availableStates) do
                                table.insert(t,
                                {
                                    value = stateDetails.state,
                                    label = stateDetails.text,
                                    onclick = function(_, _, value)
                                        _Cooldowns.currentStateSettings = value
                                        _Cooldowns.RefreshAllSettings()
                                        _Cooldowns.controls["UnitAwayInfo"]:Update()
                                    end
                                })
                            end
                            return t
                        end,
                        valueFunc = function() return _Cooldowns.currentStateSettings end,
                    },
                    {
                        type = "DROPDOWN",
                        text = "Add Property",
                        name = "AddProperty",
                        tooltip = "Add a Property to adjust",
                        useTopText = true,
                        items = function()
                            local t = {}
                            for _, details in ipairs(_Cooldowns.StateSettings) do
                                table.insert(t,
                                {
                                    value = details.property,
                                    label = details.property,
                                    onclick = function(_, _, value)
                                        if not _Cooldowns.GetPropertyOverridden(_Cooldowns.currentStateSettings, details.property) then
                                            _Cooldowns.AddProperty(_Cooldowns.currentStateSettings, details.property, details.settingPath, details.propertySettings)
                                            _Cooldowns.RefreshAllSettings()
                                        end
                                    end
                                })
                            end
                            return t
                        end,
                        valueFunc = function() return "" end,
                    },
                    {
                        type = "INFO",
                        name = "UnitAwayInfo",
                        SetHidden = function() return _Cooldowns.currentStateSettings ~= "UnitAway" end,
                        tooltip = [==["Away" comprises the unit being Offline/DC, or not being in your instance]==]
                    }
                }
            }
            table.insert(ConfigSection.contents, line)

            local data = _Cooldowns.GetCurrentGroupData()
            for i, stateDetails in ipairs(types.availableStates) do

                for j, property in ipairs(data.stateSettings[stateDetails.state]) do
                    local optionsLine
                    for _, stateTable in ipairs(_Cooldowns.StateSettings) do
                        if stateTable.property == property then
                            optionsLine = stateTable.optionsLine
                            break
                        end
                    end
                    local line = CopyTable(optionsLine)
                    line.SetHidden = function() return _Cooldowns.currentStateSettings ~= stateDetails.state end
                    line.name = line.name .. stateDetails.state
                    for i, control in ipairs(line.contents) do
                        control.name = control.name.. stateDetails.state
                        if control.createFunctions then
                            control.createFunctions(control, stateDetails.state, property)
                        end
                    end
                    table.insert(line.contents,
                        {
                            name = stateDetails.state..property.."Delete",
                            text = "Remove",
                            type = "BUTTON",
                            width = 100,
                            color = {r=0.5,g=0,b=0,a=1},
                            tooltip = "Delete this property",
                            textFunc = function() return "Remove" end,
                            onClick = function(self, button)
                                _Cooldowns.RemoveProperty(stateDetails.state, property, j)
                                --_Cooldowns.sectionBuilders.StatesSettingsConfigSection()
                                _Cooldowns.RefreshAllSettings()
                            end,
                        }
                    )
                    table.insert(ConfigSection.contents, line)
                end
            end

            return ConfigSection
        end
    end -- end states settings

    do -- start Load settings section
        _Cooldowns.GetLoadSettingsConfigSection = function()
            local ConfigSection = {
                label = "Load Settings",
                name = "LoadSettingsConfigSection",
                contents = {},
            }

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "LoadMaintLine",
                contents = {
                    {
                        type = "INFO",
                        name = "LoadSettingsInfo",
                        tooltip = [==[|cffffffffLoads|r
    If nothing is ticked then the group will always load.
    Multiple settings in a row are considered with "OR".
    Settings on different rows are considered with "AND".]==]
                    }
                }
            }
            table.insert(ConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Basic Load Settings",
                name = "LoadInCombatLine",
                extraHeight = true,
                contents = {
                    {
                        name = "LoadInCombat",
                        text = "In Combat",
                        useTopText = true,
                        width = 80,
                        tooltip = "Load this Group only while in Combat",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("combat", "inCombat") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("combat", "inCombat") end,
                    },
                    {
                        name = "LoadInEncounter",
                        text = "In Encounter",
                        useTopText = true,
                        width = 80,
                        tooltip = "Load this Group only while in a boss Encounter",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("combat", "inEncounter") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("combat", "inEncounter") end,
                    },
                    {
                        name = "LoadInInstance",
                        text = "In Instance",
                        useTopText = true,
                        width = 80,
                        tooltip = "Load this Group only while in an Instance",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("combat", "InInstance") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("combat", "InInstance") end,
                    },
                }
            }
            table.insert(ConfigSection.contents, line)
            -- party, raid, raid size
            local line = {
                type = "LINE",
                lineTitle = "Group Type",
                name = "GroupTypeLoadLine",
                extraHeight = true,
                contents = {
                    {
                        name = "LoadSolo",
                        text = "Solo",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while solo",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("group", "solo") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("group", "solo") end,
                    },
                    {
                        name = "LoadParty",
                        text = "In Party",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a Party",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("group", "inParty") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("group", "inParty") end,
                    },
                    {
                        name = "LoadRaid",
                        text = "In Raid",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a Raid",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("group", "inRaid") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("group", "inRaid") end,
                    },
                }
            }
            table.insert(ConfigSection.contents, line)
            local line = {
                type = "LINE",
                lineTitle = "Instance Type",
                name = "GroupTypeLoadLine",
                extraHeight = true,
                contents = {
                    {
                        name = "LoadRaid",
                        text = "Raid",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a raid instance",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("instance", "raidInstance") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("instance", "raidInstance") end,
                    },
                    {
                        name = "LoadDungeon",
                        text = "Dungeon",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a dungeon (party) instance",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("instance", "dungeonInstance") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("instance", "dungeonInstance") end,
                    },
                    {
                        name = "LoadArena",
                        text = "Arena",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in an Arena match",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("instance", "arenaInstance") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("instance", "arenaInstance") end,
                    },
                    {
                        name = "LoadBattleground",
                        text = "Battleground",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a Battleground",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("instance", "battlegroundInstance") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("instance", "battlegroundInstance") end,
                    },
                }
            }
            table.insert(ConfigSection.contents, line)
            local line = {
                type = "LINE",
                lineTitle = "Raid Difficulty",
                name = "LoadDifficultyLine",
                extraHeight = true,
                contents = {
                    {
                        name = "LoadDifficultyLFR",
                        text = "LFR",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a LFR difficulty raid",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("difficulty", "raidLFR") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("difficulty", "raidLFR") end,
                    },
                    {
                        name = "LoadDifficultyNormal",
                        text = "Normal",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a Normal difficulty raid",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("difficulty", "raidNormal") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("difficulty", "raidNormal") end,
                    },
                    {
                        name = "LoadDifficultyHeroic",
                        text = "Heroic",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a Heroic difficulty raid",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("difficulty", "raidHeroic") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("difficulty", "raidHeroic") end,
                    },
                    {
                        name = "LoadDifficultyMythic",
                        text = "Mythic",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a Mythic difficulty raid",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("difficulty", "raidMythic") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("difficulty", "raidMythic") end,
                    },
                }
            }
            table.insert(ConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Player Role",
                name = "LoadRoleLine",
                extraHeight = true,
                contents = {
                    {
                        name = "LoadDPS",
                        text = "DPS",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a DPS spec",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("role", "roleDPS") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("role", "roleDPS") end,
                    },
                    {
                        name = "LoadHealer",
                        text = "Healer",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a Healer spec",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("role", "roleHealer") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("role", "roleHealer") end,
                    },
                    {
                        name = "LoadTank",
                        text = "Tank",
                        width = 80,
                        useTopText = true,
                        tooltip = "Load this Group only while in a Tank spec",
                        type = "CHECKBUTTON",
                        onClick = function() _Cooldowns.ToggleLoadSetting("role", "roleTank") end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("role", "roleTank") end,
                    },
                }
            }
            table.insert(ConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "EncounterID(s)",
                name = "LoadEncounterLine",
                extraHeight = true,
                contents = {
                    {
                        name = "LoadEncounter",
                        text = "Encounter ID(s)",
                        type = "EDITBOX",
                        func = function(self, value)
                            _Cooldowns.SetEncounterLoadSetting(value)
                            self:ClearFocus()
                        end,
                        valueFunc = function()
                            return _Cooldowns.GetEncounterLoadSetting()
                        end,
                        useTopText = false,
                        width = 300,
                    },
                    {
                        type = "INFO",
                        name = "LoadEncounterInfo",
                        tooltip = _Cooldowns.GetEncounterIDTooltip()
                    }
                }
            }
            table.insert(ConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Player Class/Spec",
                name = "LoadSpecLine",
                extraHeight = true,
                contents = {
                    {
                        name = "LoadUseSpec",
                        text = "Use Class/Spec Setting",
                        width = 25,
                        useTopText = false,
                        tooltip = "Only load for specific Specializations",
                        type = "CHECKBUTTON",
                        onClick = function()
                            _Cooldowns.ToggleLoadSetting("specs", "useSpecs")
                            _Cooldowns.RefreshAllSettings()
                        end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("specs", "useSpecs") end,
                    },
                    {
                        type = "TEXT",
                        name = "LoadUseSpecHint",
                        text = "Use Class/Spec Settings",
                        fontSize = 12,
                    }
                }
            }
            table.insert(ConfigSection.contents, line)

            for i, specs in ipairs(types.fullSpecList) do
                local className, classFile = GetClassInfo(i)
                local classCol = GetClassColorObj(classFile)
                local line = {
                    type = "LINE",
                    lineTitle = classCol:WrapTextInColorCode(className),
                    name = "Load"..classFile.."Line",
                    extraHeight = true,
                    SetHidden = function() return not _Cooldowns.GetLoadSetting("specs", "useSpecs") end,
                    contents = {
                    }
                }
                for j, specDetails in ipairs(specs) do
                    local control = {
                        name = "LoadSpec"..specDetails.specID,
                        text = "|T"..specDetails.icon..":0|t ".. specDetails.name,
                        width = 80,
                        useTopText = true,
                        tooltip = "Load when in "..specDetails.name.." spec",
                        type = "CHECKBUTTON",
                        onClick = function()
                            _Cooldowns.ToggleLoadSetting("specs", specDetails.specID)
                        end,
                        valueFunc = function() return _Cooldowns.GetLoadSetting("specs", specDetails.specID) end,
                    }
                    table.insert(line.contents, control)
                end
                table.insert(ConfigSection.contents, line)
            end

            return ConfigSection
        end
    end -- end load settings section

    do -- start Profiles settings
        _Cooldowns.GetProfilesSettingsConfig = function()
            local ConfigSection = {
                label = "Import/Export Settings",
                name = "ImportExportSettingsConfig",
                contents = {
                },
            }

            local line = {
                type = "LINE",
                lineTitle = "Export Group(s)",
                name = "ExportSingleGroupLine",
                extraHeight = false,
                contents = {
                    {
                        type = "DROPDOWN",
                        name = "ExportGroupDropdown",
                        tooltip = "Select a Cooldowns Group to export",
                        items = function()
                            local t = {
                                {
                                    label = "Select Group",
                                    value = 0,
                                    onclick = function() end,
                                }
                            }
                            for i = 1, _Cooldowns.GetNumGroups() do
                                local item = {
                                    label = _Cooldowns.GetGroupName(i),
                                    value = i,
                                    onclick = function()
                                        _Cooldowns.GetExportStringForGroup(i)
                                        if _Cooldowns.controls and _Cooldowns.controls.ExportGroupDropdown then
                                            _Cooldowns.controls.ExportGroupDropdown:Update()
                                        end
                                    end,
                                    desc = "Export ".._Cooldowns.GetGroupName(i),
                                }
                                table.insert(t, item)
                            end
                            return t
                        end,
                        valueFunc = function()
                            return 0
                        end,
                        useTopText = true,
                    },
                    {
                        name = "ExportAllGroups",
                        type = "BUTTON",
                        text = "Export All",
                        onClick = function(self, button)
                            _Cooldowns.ExportAllGroups()
                        end,
                        tooltip = "Click to get an export string for all CD Groups.",
                        width = 200,
                    },
                }
            }
            table.insert(ConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "ExportBoxLine",
                extraHeight = false,
                contents = {
                    {
                        type = "EXPORTBOX",
                        text = "",
                        name = "ExportBoxCooldowns",
                        func = function() end,
                        valueFunc = function() return _Cooldowns.currentExportString or "" end,
                        width = 420,
                        SetDisabled = function() return not _Cooldowns.currentExportString end
                    },
                }
            }
            table.insert(ConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "",
                name = "ProfilesSeparatorLine1",
                contents = {
                    {
                        name = "ProfilesSeparator1",
                        type = "SEPARATOR",
                    }
                }
            }
            table.insert(ConfigSection.contents, line)

            local line = {
                type = "LINE",
                lineTitle = "Import Cooldown Group(s)",
                name = "ImportBoxLine",
                extraHeight = true,
                contents = {
                    {
                        type = "IMPORTBOX",
                        text = "",
                        name = "ImportBoxCooldowns",
                        useTopText = true,
                        onClick = function(text) _Cooldowns.ImportGroupsFromString(text) end,
                        width = 420,
                    },
                }
            }
            table.insert(ConfigSection.contents, line)

            return ConfigSection
        end
    end -- end Profiles settings

end