local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

_Cooldowns.StateSettings = {
    {
        property = "Alpha",
        settingPath = {"displaySettings"},
        propertySettings = {"Alpha"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Display Alpha",
            name = "AlphaLine",
            contents = {
                {
                    name = "DisplayAlpha",
                    text = "Display Alpha",
                    type = "SLIDER",
                    tooltip = "Set Display's Alpha (transparency)",
                    min = 0,
                    max = 100,
                    hardMin = 0,
                    hardMax = 100,
                    step = 1,
                    createFunctions = function(self, state, property)
                        self.func = function(value)
                            _Cooldowns.SetStateValue(value, state, "Alpha", "Alpha")
                        end
                        self.valueFunc = function()
                            return _Cooldowns.GetStateValue(state, "Alpha", "Alpha")
                        end
                    end
                }
            }
        },
    },
    {
        property = "Hide",
        settingPath = {},
        propertySettings = {"Hide"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Hide the Displays",
            name = "DisplayHideLine",
            contents = {
                {
                    name = "DisplayHide",
                    text = "Hide",
                    tooltip = "Hide the display",
                    type = "CHECKBUTTON",
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            local newValue = not _Cooldowns.GetStateValue(state, "Hide", "Hide")
                            _Cooldowns.SetStateValue(newValue, state, "Hide", "Hide")
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, "Hide", "Hide") end
                    end
                },
            }
        },
    },
    {
        property = "Enable Bars",
        propertySettings = {"enableBar"},
        settingPath = {"displaySettings"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Enable Bars",
            name = "BarEnableLine",
            contents = {
                {
                    name = "BarEnable",
                    text = "Enable Bars",
                    type = "CHECKBUTTON",
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            local newValue = not _Cooldowns.GetStateValue(state, "Enable Bars", "enableBar")
                            _Cooldowns.SetStateValue(newValue, state, "Enable Bars", "enableBar")
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, "Enable Bars", "enableBar") end
                    end,
                    tooltip = "The Display will include a progress bar in its display",
                }
            }
        }
    },
    {
        property = "Enable Icons",
        propertySettings = {"enableIcon"},
        settingPath = {"displaySettings"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Enable Icons",
            name = "IconEnableLine",
            contents = {
                {
                    name = "IconEnable",
                    text = "Enable Icons",
                    type = "CHECKBUTTON",
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            local newValue = not _Cooldowns.GetStateValue(state, "Enable Icons", "enableIcon")
                            _Cooldowns.SetStateValue(newValue, state, "Enable Icons", "enableIcon")
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, "Enable Icons", "enableIcon") end
                    end,
                    tooltip = "The Display will include an Icon in its display",
                }
            }
        }
    },
    {
        property = "Desaturate Icons",
        propertySettings = {"desaturateIcon"},
        settingPath = {"displaySettings"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Desaturate Icons",
            name = "desaturateIconLine",
            contents = {
                {
                    name = "desaturateIcon",
                    text = "Desaturate Icons",
                    type = "CHECKBUTTON",
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            local newValue = not _Cooldowns.GetStateValue(state, "Desaturate Icons", "desaturateIcon")
                            _Cooldowns.SetStateValue(newValue, state, "Desaturate Icons", "desaturateIcon")
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, "Desaturate Icons", "desaturateIcon") end
                    end,
                    tooltip = "Removes the colour from the icon's texture",
                }
            }
        }
    },
    {
        property = "Enable Glow",
        propertySettings = {"UseGlow"},
        settingPath = {"displaySettings"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Enable Glow",
            name = "GlowEnableLine",
            contents = {
                {
                    name = "GlowEnable",
                    text = "Enable Glow",
                    type = "CHECKBUTTON",
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            local newValue = not _Cooldowns.GetStateValue(state, "Enable Glow", "UseGlow")
                            _Cooldowns.SetStateValue(newValue, state, "Enable Glow", "UseGlow")
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, "Enable Glow", "UseGlow") end
                    end,
                    tooltip = "The Display's Glow will show",
                }
            }
        }
    },
    {
        property = "Enable Flash",
        propertySettings = {"UseFlash"},
        settingPath = {"displaySettings"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Enable Flash",
            name = "FlashEnableLine",
            contents = {
                {
                    name = "FlashEnable",
                    text = "Enable Flash",
                    type = "CHECKBUTTON",
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            local newValue = not _Cooldowns.GetStateValue(state, "Enable Flash", "UseFlash")
                            _Cooldowns.SetStateValue(newValue, state, "Enable Flash", "UseFlash")
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, "Enable Flash", "UseFlash") end
                    end,
                    tooltip = "The Display's will Flash",
                }
            }
        }
    },
    {
        property = "Enable Borders",
        propertySettings = {"UseBorder"},
        settingPath = {"displaySettings"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Enable Borders",
            name = "BorderEnableLine",
            contents = {
                {
                    name = "BorderEnable",
                    text = "Enable Borders",
                    type = "CHECKBUTTON",
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            local newValue = not _Cooldowns.GetStateValue(state, "Enable Borders", "UseBorder")
                            _Cooldowns.SetStateValue(newValue, state, "Enable Borders", "UseBorder")
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, "Enable Borders", "UseBorder") end
                    end,
                    tooltip = "The Display's Border will show",
                }
            }
        }
    },
    {
        property = "BorderColor",
        propertySettings = {"useBorderClassColor", "BorderColor"},
        settingPath = {"displaySettings"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Border Color Settings",
            name = "BorderColorSettingLine",
            extraHeight = true,
            contents = {
                {
                    name = "BorderColorSetting",
                    text = "Color",
                    type = "COLOR",
                    useTopText = true,
                    tooltip = "Set the Border color used, or override",
                    createFunctions = function(self, state, property)
                        self.GetColor = function()
                            return _Cooldowns.GetStateValue(state, "BorderColor", "BorderColor")
                        end
                        self.SetColor = function(r,g,b,a, button)
                            local Color = CreateColor(r,g,b,a)
                            _Cooldowns.SetStateValue(Color, state, "BorderColor", "BorderColor")
                        end
                        self.SetDisabled = function() return _Cooldowns.GetStateValue(state, "BorderColor", "useBorderClassColor") end
                    end
                },
                {
                    name = "BorderColorUseClass",
                    text = "Use Class",
                    tooltip = "Set the Border to override with the class color",
                    type = "CHECKBUTTON",
                    useTopText = true,
                    width = 70,
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            _Cooldowns.SetStateValue(not _Cooldowns.GetStateValue(state, "BorderColor", "useBorderClassColor"), state, "BorderColor", "useBorderClassColor")
                            _Cooldowns.controls["BorderColorSetting"..state]:Update()
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, "BorderColor", "useBorderClassColor") end
                    end
                },
            }
        },
    },
    {
        property = "BarColor",
        propertySettings = {"useClassColor", "barColor"},
        settingPath = {"displaySettings"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Bar Color Settings",
            name = "BarColorSettingLine",
            extraHeight = true,
            contents = {
                {
                    name = "BarColorSetting",
                    text = "Color",
                    type = "COLOR",
                    useTopText = true,
                    tooltip = "Set the bar color used, or override",
                    createFunctions = function(self, state, property)
                        self.GetColor = function()
                            return _Cooldowns.GetStateValue(state, "BarColor", "barColor")
                        end
                        self.SetColor = function(r,g,b,a, button)
                            local Color = CreateColor(r,g,b,a)
                            _Cooldowns.SetStateValue(Color, state, "BarColor", "barColor")
                        end
                        self.SetDisabled = function() return _Cooldowns.GetStateValue(state, "BarColor", "useClassColor") end
                    end
                },
                {
                    name = "BarColorUseClass",
                    text = "Use Class",
                    tooltip = "Set the bar to override with the class color",
                    type = "CHECKBUTTON",
                    useTopText = true,
                    width = 70,
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            _Cooldowns.SetStateValue(not _Cooldowns.GetStateValue(state, "BarColor", "useClassColor"), state, "BarColor", "useClassColor")
                            _Cooldowns.controls["BarColorSetting"..state]:Update()
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, "BarColor", "useClassColor") end
                    end
                },
            }
        },
    },
    {
        property = "IconColor",
        propertySettings = {"iconColor"},
        settingPath = {"displaySettings"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Icon Color Settings",
            name = "IconColorSettingLine",
            extraHeight = true,
            contents = {
                {
                    name = "IconColorSetting",
                    text = "Color",
                    type = "COLOR",
                    useTopText = true,
                    tooltip = "Set the Icon color",
                    createFunctions = function(self, state, property)
                        self.GetColor = function()
                            return _Cooldowns.GetStateValue(state, "IconColor", "iconColor")
                        end
                        self.SetColor = function(r,g,b,a, button)
                            local Color = CreateColor(r,g,b,a)
                            _Cooldowns.SetStateValue(Color, state, "IconColor", "iconColor")
                        end
                    end
                },
            }
        }
    }
}

for _, textType in pairs(_Cooldowns.types.textTypes) do
    local stateTable = {
        property = textType.." Color",
        propertySettings = {textType.."ClassColor", textType.."Color"},
        settingPath = {"texts"},
        optionsLine = {
            type = "LINE",
            lineTitle = textType.." Color Settings",
            name = textType.."ColorSettingLine",
            extraHeight = true,
            contents = {
                {
                    name = textType.."ColorSetting",
                    text = "Color",
                    type = "COLOR",
                    useTopText = true,
                    tooltip = "Set the "..textType.." color used, or override",
                    createFunctions = function(self, state, property)
                        self.GetColor = function()
                            return _Cooldowns.GetStateValue(state, textType.." Color", textType.."Color")
                        end
                        self.SetColor = function(r,g,b,a, button)
                            local Color = CreateColor(r,g,b,a)
                            _Cooldowns.SetStateValue(Color, state, textType.." Color", textType.."Color")
                        end
                        self.SetDisabled = function() return _Cooldowns.GetStateValue(state, textType.." Color", textType.."lassColor") end
                    end
                },
                {
                    name = textType.."ColorUseClass",
                    text = "Use Class",
                    tooltip = "Set the "..textType.." to override with the class color",
                    type = "CHECKBUTTON",
                    useTopText = true,
                    width = 70,
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            _Cooldowns.SetStateValue(not _Cooldowns.GetStateValue(state, textType.." Color", textType.."ClassColor"), state, textType.." Color", textType.."ClassColor")
                            _Cooldowns.controls[textType.."ColorSetting"..state]:Update()
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, textType.." Color", textType.."ClassColor") end
                    end
                },
            }
        },
    }
    table.insert(_Cooldowns.StateSettings, stateTable)

    local stateTable = {
        property = textType.." Enable",
        settingPath = {"texts"},
        propertySettings = {textType.."Enable"},
        optionsLine = {
            type = "LINE",
            lineTitle = "Enable/Disable the Text",
            name = textType.."EnableLine",
            contents = {
                {
                    name = textType.."Enable",
                    text = "Enable",
                    tooltip = "Enable the text",
                    type = "CHECKBUTTON",
                    createFunctions = function(self, state, property)
                        self.onClick = function()
                            local newValue = not _Cooldowns.GetStateValue(state, textType.." Enable", textType.."Enable")
                            _Cooldowns.SetStateValue(newValue, state, textType.." Enable", textType.."Enable")
                        end
                        self.valueFunc = function() return _Cooldowns.GetStateValue(state, textType.." Enable", textType.."Enable") end
                    end
                },
            }
        },
    }
    table.insert(_Cooldowns.StateSettings, stateTable)
end
