local _AddonName, _EchoRaidTools = ...

EchoRaidToolsConfig_SliderTemplateMixin = {}
function EchoRaidToolsConfig_SliderTemplateMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidToolsConfig_SliderTemplateMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end


EchoRaidToolsConfig_SliderMixin = {}
function EchoRaidToolsConfig_SliderMixin:OnLoad()
    self.Enabled = true
end
function EchoRaidToolsConfig_SliderMixin:OnEnter()
    if self.Enabled and self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidToolsConfig_SliderMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidToolsConfig_SliderMixin:Enable()
    self.TopText:SetTextColor(1, 0.82, 0, 0.7)
    self.Slider:Enable()
    self.Slider:SetAlpha(1)
    self.ValueEditbox:Enable()
    self.ValueEditbox:SetAlpha(1)
    self.Enabled = true
end
function EchoRaidToolsConfig_SliderMixin:Disable()
    self.TopText:SetTextColor(0.5,0.5,0.5,0.5)
    self.Slider:Disable()
    self.Slider:SetAlpha(0.5)
    self.ValueEditbox:Disable()
    self.ValueEditbox:SetAlpha(0.5)
    self.Enabled = false
end
function EchoRaidToolsConfig_SliderMixin:IsEnabled()
    return self.Enabled
end
function EchoRaidToolsConfig_SliderMixin:Setup(min, max, step, hardMin, hardMax, valueFunc, func)
    hardMin = hardMin or min
    hardMax = hardMax or max
    self.min = min
    self.max = max
    self.hardMin = hardMin
    self.hardMax = hardMax
    self.valueFunc = valueFunc
    self.Slider:SetMinMaxValues(
        type(min) == "function" and min() or min,
        type(max) == "function" and max() or max
    )
    local ValueEditbox = self.ValueEditbox
    local Slider = self.Slider
    self.Slider:SetValue(valueFunc())
    self.ValueEditbox:SetText(valueFunc())
    self.Slider:SetValueStep(step)
    self.Slider:SetObeyStepOnDrag(true)
    self.Slider:SetScript("OnValueChanged", function(self, value)
        if value ~= valueFunc() then
            func(value)
            ValueEditbox:SetText(value)
        end
    end)
    self.ValueEditbox:SetScript("OnEnterPressed", function(self)
        local textValue = self:GetText()
        local value = tonumber(textValue)
        value = Clamp(value, hardMin, hardMax)
        if value and value ~= valueFunc() then
            func(value)
            Slider:SetValue(value)
            self:ClearFocus()
        else
            self:SetText(Slider:GetValue())
            self:ClearFocus()
        end
    end)
end
function EchoRaidToolsConfig_SliderMixin:UpdateValues()
    self.Slider:SetMinMaxValues(
        type(self.min) == "function" and self.min() or self.min,
        type(self.max) == "function" and self.max() or self.max
    )
    --if not self.valueFunc() then print(self.name) end
    self.Slider:SetValue(self.valueFunc())
    self.ValueEditbox:SetText(self.valueFunc())
end

EchoRaidTools_BetterSliderMixin = {}
-- MAIN SETUP METHOD
-- softMinimum, sofMaximum, stepSize, getterFunction, setterFunction[, hardMinimum, hardMaximum]
function EchoRaidTools_BetterSliderMixin:Setup(min, max, step, valueFunc, func, hardMin, hardMax)
    self.ValueText = self.Overlay.ValueText
    hardMin = hardMin or min
    hardMax = hardMax or max
    self.min = min
    self.max = max
    self.hardMin = hardMin
    self.hardMax = hardMax
    self.valueFunc = valueFunc
    self.func = func
    self.Slider:SetMinMaxValues(
        type(min) == "function" and min() or min,
        type(max) == "function" and max() or max
    )
    local ValueText = self.ValueText
    local ValueEditbox = self.ValueEditbox
    local Slider = self.Slider
    self.Slider:SetValue(valueFunc())
    self.ValueEditbox:SetText(valueFunc())
    self.ValueText:SetText(valueFunc())
    self.Slider:SetValueStep(step)
    self.Slider:SetObeyStepOnDrag(true)
    self.Slider:SetScript("OnValueChanged", function(self, value)
        if value ~= valueFunc() then
            func(value)
            ValueEditbox:SetText(value)
            ValueText:SetText(value)
        end
    end)
    local parent = self
    self.ValueEditbox:SetScript("OnEnterPressed", function(self)
        local textValue = self:GetText()
        local value = tonumber(textValue)
        value = Clamp(value, hardMin, hardMax)
        if value and value ~= valueFunc() then
            func(value)
            Slider:SetValue(value)
            self:ClearFocus()
            ValueText:SetText(value)
        else
            self:SetText(Slider:GetValue())
            self:ClearFocus()
        end
        self:Hide()
        ValueText:Show()
        parent:SetScript("OnMouseWheel", nil)
    end)
    self.ValueEditbox:SetScript("OnEscapePressed", function(self)
        self:Hide()
        ValueText:Show()
        parent:SetScript("OnMouseWheel", nil)
    end)
    self.ValueEditbox:SetScript("OnEditFocusLost", function(self)
        self:Hide()
        ValueText:Show()
        parent:SetScript("OnMouseWheel", nil)
    end)
    self.Increment:SetScript("OnClick", function()
        local value = tonumber(valueFunc() + 1)
        value = Clamp(value, hardMin, hardMax)
        if value and value ~= valueFunc() then
            func(value)
            Slider:SetValue(value)
            ValueText:SetText(value)
        end
    end)
    self.Decrement:SetScript("OnClick", function()
        local value = tonumber(valueFunc() - 1)
        value = Clamp(value, hardMin, hardMax)
        if value and value ~= valueFunc() then
            func(value)
            Slider:SetValue(value)
            ValueText:SetText(value)
        end
    end)
    self.Slider.BarTexture:SetPoint("BOTTOMRIGHT", self.Slider.Thumb, "BOTTOM")
end
function EchoRaidTools_BetterSliderMixin:UpdateValues()
    local script = self.Slider:GetScript("OnValueChanged")
    self.Slider:SetScript("OnValueChanged", nil)
    self.Slider:SetMinMaxValues(
        type(self.min) == "function" and self.min() or self.min,
        type(self.max) == "function" and self.max() or self.max
    )
    self.Slider:SetValue(self.valueFunc())
    self.ValueEditbox:SetText(self.valueFunc())
    self.ValueText:SetText(self.valueFunc())
    self.Slider:SetScript("OnValueChanged", script)
end
function EchoRaidTools_BetterSliderMixin:OnLoad()
    self.Enabled = true
    self.Slider:SetPassThroughButtons("RightButton")
    self.ValueText = self.Overlay.ValueText
end
local function OnMouseWheel(self, delta)
    if delta > 0 then
        local value = tonumber(self.valueFunc() + 1)
        value = Clamp(value, self.hardMin, self.hardMax)
        if value and value ~= self.valueFunc() then
            self.func(value)
            self.Slider:SetValue(value)
            self.ValueText:SetText(value)
            self.ValueEditbox:SetText(value)
        end
    else
        local value = tonumber(self.valueFunc() - 1)
        value = Clamp(value, self.hardMin, self.hardMax)
        if value and value ~= self.valueFunc() then
            self.func(value)
            self.Slider:SetValue(value)
            self.ValueText:SetText(value)
            self.ValueEditbox:SetText(value)
        end
    end
end
function EchoRaidTools_BetterSliderMixin:OnMouseDown(button)
    if button == "RightButton" and self:IsEnabled() then
        self.ValueEditbox:SetText(self.valueFunc())
        self.ValueEditbox:Show()
        self.ValueEditbox:SetFocus()
        self.ValueEditbox:HighlightText(0,-1)
        self.ValueText:Hide()
        self:SetScript("OnMouseWheel", OnMouseWheel)
    end
end
function EchoRaidTools_BetterSliderMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_BetterSliderMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidTools_BetterSliderMixin:Enable()
    self.TopText:SetTextColor(1, 0.82, 0, 0.7)
    self.Slider:Enable()
    self.Increment:Enable()
    self.Decrement:Enable()
    --self.Slider:SetAlpha(1)
    --self.ValueEditBox:Enable()
    --self.ValueText:Enable()
    self.ValueText:SetAlpha(1)
    self.Enabled = true
    self.Slider.BarLeft:SetDesaturated(false)
    self.Slider.BarRight:SetDesaturated(false)
    self.Slider.BarMiddle:SetDesaturated(false)
    self.Slider.Bar:SetDesaturated(false)
end
function EchoRaidTools_BetterSliderMixin:Disable()
    self.ValueEditbox:Hide()
    self.ValueText:Show()
    self.TopText:SetTextColor(0.5,0.5,0.5, 0.5)
    self.Slider:Disable()
    self.Increment:Disable()
    self.Decrement:Disable()
    --self.Slider:SetAlpha(0.5)
    --self.ValueEditBox:Disable()
    --self.ValueText:Disable()
    self.ValueText:SetAlpha(0.3)
    self.Enabled = false
    self.Slider.BarLeft:SetDesaturated(true)
    self.Slider.BarRight:SetDesaturated(true)
    self.Slider.BarMiddle:SetDesaturated(true)
    self.Slider.Bar:SetDesaturated(true)
end
function EchoRaidTools_BetterSliderMixin:IsEnabled()
    return self.Enabled
end

EchoRaidTools_BetterSlider_SliderTemplateMixin = {}
function EchoRaidTools_BetterSlider_SliderTemplateMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_BetterSlider_SliderTemplateMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidTools_BetterSlider_SliderTemplateMixin:OnLoad()
    self:SetPassThroughButtons("RightButton")
end

EchoRaidTools_BetterSlider_EditBoxTemplateMixin = {}
function EchoRaidTools_BetterSlider_EditBoxTemplateMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_BetterSlider_EditBoxTemplateMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
