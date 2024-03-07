local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local LibSharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")
local LibCustomGlow = LibStub:GetLibrary("LibCustomGlow-1.0")

EchoCooldownDisplayTemplateMixin = {}

function EchoCooldownDisplayTemplateMixin:ApplyParent(parent)
    self:SetParent(parent)
    if not _Cooldowns.GetOverrideStrata(self.groupIndex) then
        self:SetFrameStrata(parent:GetFrameStrata())
        self:SetFrameLevel(parent:GetFrameLevel() + 10)
    else
        self:SetFrameStrata(_Cooldowns.types.StrataList[_Cooldowns.GetStrata(self.groupIndex)])
    end
end
function EchoCooldownDisplayTemplateMixin:SetTextFontAndSize(textType)
    self:SetTextFont(
        textType,
        _Cooldowns.GetFontPath(_Cooldowns["Get"..textType.."Font"](self.groupIndex)),
        _Cooldowns["Get"..textType.."Size"](self.groupIndex),
        _Cooldowns["Get"..textType.."FontStyle"](self.groupIndex)
    )
end
function EchoCooldownDisplayTemplateMixin:SetTextShadowColor(textType)
    local c = _Cooldowns["Get"..textType.."TextShadowColor"](self.groupIndex)
    self:SetDisplayTextShadowColor(textType, c:GetRGBA())
end
function EchoCooldownDisplayTemplateMixin:SetShadowOffsets(textType)
    local x, y = _Cooldowns["Get"..textType.."TextShadowOffsetX"](self.groupIndex), _Cooldowns["Get"..textType.."TextShadowOffsetY"](self.groupIndex)
    self:SetDisplayShadowOffsets(textType, x, y)
end
function EchoCooldownDisplayTemplateMixin:SetSpellNameText()
    local spellName = self.spellName
    local type, text = _Cooldowns.GetSpellNameTextAbbreviateType(self.groupIndex)
    if type == "none" then
        text = spellName
    elseif type == "first" then 
        text = spellName:match("^%w+")
    elseif type == "last" then
        text = spellName:match("%w+$")
    elseif type == "ABC" then
        text = spellName:gsub("(%S+) ",function(t) return t:sub(1,1).."." end)
    end
    self.SpellNameText:SetText(text)
end
function EchoCooldownDisplayTemplateMixin:SetUnitNameText()
    if _Cooldowns["GetUnitNameTextUseAbbreviate"](self.groupIndex) then
        self.UnitNameText:SetText(_EchoRaidTools.Utf8Sub(self.UnitName, _Cooldowns["GetUnitNameTextAbbreviateNumber"](self.groupIndex)))
    else
        self.UnitNameText:SetText(self.UnitName)
    end
end
function EchoCooldownDisplayTemplateMixin:SetAnchor(textType)
    local point = _Cooldowns["Get"..textType.."TextAnchor"](self.groupIndex)
    local anchorTo = _Cooldowns["Get"..textType.."AnchorTo"](self.groupIndex)
    anchorTo = anchorTo == "bar" and self.StatusBar or anchorTo == "icon" and self.Icon or self
    local relPoint = _Cooldowns["Get"..textType.."DisplayAnchor"](self.groupIndex)
    local x = _Cooldowns["Get"..textType.."OffsetX"](self.groupIndex)
    local y = _Cooldowns["Get"..textType.."OffsetY"](self.groupIndex)
    self:SetTextAnchor(textType, point, anchorTo, relPoint, x, y)
end
function EchoCooldownDisplayTemplateMixin:SetBorderRegion()
    local region = _Cooldowns.GetBorderRegion(self.groupIndex)
    local x, y = _Cooldowns.GetBorderOffsetX(self.groupIndex), _Cooldowns.GetBorderOffsetY(self.groupIndex)
    self:SetDisplayBorderRegion(region, x, y)
end
function EchoCooldownDisplayTemplateMixin:SetUpBorder()
    local groupIndex = self.groupIndex
    local edgeFile = LibSharedMedia:Fetch("border", _Cooldowns.GetBorder(groupIndex))
    local borderSize = _Cooldowns.GetBorderSize(groupIndex)
    local col
    if _Cooldowns.GetBorderUseClassColor(groupIndex) then
        col = self.ClassColor
    --[[elseif _Cooldowns.GetBorderUseFilterColor(groupIndex) then
        col = self.filter <= _Cooldowns.numFilters and _Cooldowns.filters.GetColor(self.filter, groupIndex) or _Cooldowns.customFilters.GetColor(self.filter - _Cooldowns.numFilters, groupIndex)]]
    else
        col = _Cooldowns.GetBorderColor(groupIndex)
    end
    local r,g,b,a = col:GetRGBA()

    local region = _Cooldowns.GetBorderRegion(self.groupIndex)
    local x, y = _Cooldowns.GetBorderOffsetX(self.groupIndex), _Cooldowns.GetBorderOffsetY(self.groupIndex)

    local show =  _Cooldowns.GetUseBorders(groupIndex)
    self:SetUpDisplayBorder(edgeFile, borderSize, r, g, b, a, region, x, y, show)
end

function EchoCooldownDisplayTemplateMixin:ShowCooldownSwipe()
    self.Icon.Cooldown:SetDrawSwipe(_Cooldowns.GetCooldownSwipe(self.groupIndex))
end
function EchoCooldownDisplayTemplateMixin:ShowCooldownEdge()
    self.Icon.Cooldown:SetDrawEdge(_Cooldowns.GetCooldownEdge(self.groupIndex))
end
function EchoCooldownDisplayTemplateMixin:ShowBar(bool)
    if bool then
        self.StatusBar:Show()
    else
        self.StatusBar:Hide()
    end
    self:SetIconSide()
end
function EchoCooldownDisplayTemplateMixin:SetBarInverse()
    local invert = _Cooldowns.GetBarInverse(self.groupIndex)
    self.StatusBar.invert = invert
end
function EchoCooldownDisplayTemplateMixin:SetBarReverse()
    local reverse = _Cooldowns.GetBarReverse(self.groupIndex)
    self:SetDisplayBarReverse(reverse)
end
function EchoCooldownDisplayTemplateMixin:SetSparkEnable()
    self.sparkEnabled = _Cooldowns.GetBarSpark(self.groupIndex)
    if not self.sparkEnabled then
        if self.StatusBar.Spark:IsShown() then
            self.StatusBar.Spark:Hide()
        end
    else
        if self.OnCD then
            self.StatusBar.Spark:Show()
        end
    end
end
function EchoCooldownDisplayTemplateMixin:ShowSpark()
    if self.sparkEnabled then
        self.StatusBar.Spark:Show()
    end
end
function EchoCooldownDisplayTemplateMixin:ShowIcon(bool)
    local side = _Cooldowns.GetIconSide(self.groupIndex)
    self:DisplayShowIcon(bool, side)
end
function EchoCooldownDisplayTemplateMixin:SetIconSide()
    local side = _Cooldowns.GetIconSide(self.groupIndex)
    self:SetDisplayIconSide(side)
end
function EchoCooldownDisplayTemplateMixin:SetDisplaySize()
    local height = _Cooldowns.GetHeight(self.groupIndex)
    local width = _Cooldowns.GetWidth(self.groupIndex)
    self:SetDisplayWidth(width)
    self:SetDisplayHeight(height)
    self:SetIconSide()
end
function EchoCooldownDisplayTemplateMixin:SetDisplayHeight(height)
    self.Icon:SetSize(height, height)
    self.StatusBar:SetHeight(height)
    self:SetHeight(height)
end
function EchoCooldownDisplayTemplateMixin:SetDisplayWidth(width)
    self:SetWidth(width)
end
function EchoCooldownDisplayTemplateMixin:SetIconZoom(zoom)
    self.IconTexture:SetTexCoord(zoom, 1 -zoom, zoom, 1 -zoom)
end
function EchoCooldownDisplayTemplateMixin:UpdateIconZoom()
    local zoomSetting = _Cooldowns.GetIconZoom(self.groupIndex) / 100
    local zoomValue = 0.25 * zoomSetting
    self:SetIconZoom(zoomValue)
end
function EchoCooldownDisplayTemplateMixin:SetDisplayAlpha()
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "Alpha", self.groupIndex) then
            local stateAlpha = _Cooldowns.GetStateValue(stateDetails.state, "Alpha", "Alpha", self.groupIndex)
            if stateAlpha then
                self:SetAlpha(stateAlpha/100)
                return
            end
        end
    end
    local alpha = _Cooldowns.GetAlpha(self.groupIndex)/100
    self:SetAlpha(alpha)
end
function EchoCooldownDisplayTemplateMixin:UpdateBarForegroundAlpha()
    local alpha = _Cooldowns.BarGetForegroundAlpha(self.groupIndex)/100
    local r,g,b = self.StatusBar:GetStatusBarColor()
    self.StatusBar:SetStatusBarColor(r,g,b,alpha)
    --self.StatusBar.BarTexture:SetAlpha(alpha)
end
function EchoCooldownDisplayTemplateMixin:UpdateBarBackgroundAlpha()
    local alpha = _Cooldowns.BarGetBackgroundAlpha(self.groupIndex)/100
    local r,g,b = self.StatusBar.Background:GetVertexColor()
    self.StatusBar.Background:SetVertexColor(r,g,b,alpha)
    --self.StatusBar.Background:SetAlpha(alpha)
end

function EchoCooldownDisplayTemplateMixin:SetDisplayHide()
    if self.states.subGroup and not _Cooldowns.GetGroupSetting(self.states.subGroup, self.groupIndex) then
        self.toBeShown = nil
        self.toBeHidden = true
        _Cooldowns.UpdatePositions(self.groupIndex, nil, true)
        return
    end
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "Hide", self.groupIndex) then
            local stateHide = _Cooldowns.GetStateValue(stateDetails.state, "Hide", "Hide", self.groupIndex)
            if stateHide ~= nil then
                if stateHide and (self:IsShown() or self.toBeShown) then
                    self.toBeShown = nil
                    self.toBeHidden = true
                    _Cooldowns.UpdatePositions(self.groupIndex, nil, true)
                elseif (not stateHide) and (not self:IsShown()) then
                    self.toBeShown = true
                    _Cooldowns.UpdatePositions(self.groupIndex, nil, true)
                end
                return
            end
        end
    end
    if not self:IsShown() then
        self.toBeShown = true
        _Cooldowns.UpdatePositions(self.groupIndex)
    end
end
function EchoCooldownDisplayTemplateMixin:UpdateBarColor()
    local alpha = _Cooldowns.BarGetForegroundAlpha(self.groupIndex)/100
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "BarColor", self.groupIndex) then
            if _Cooldowns.GetStateValue(stateDetails.state, "BarColor", "useClassColor", self.groupIndex) then
                local r,g,b = self.ClassColor:GetRGB()
                self.StatusBar:SetStatusBarColor(r,g,b,alpha)
                return
            --[[elseif _Cooldowns.GetStateValue(stateDetails.state, "BarColor", "useFilterColor", self.groupIndex) then
                local filterCol = self.filter <= _Cooldowns.numFilters and _Cooldowns.filters.GetColor(self.filter, self.groupIndex) or _Cooldowns.customFilters.GetColor(self.filter - _Cooldowns.numFilters, self.groupIndex)
                local r,g,b = filterCol:GetRGB()
                self.StatusBar:SetStatusBarColor(r,g,b,alpha)
                return]]
            else
                local col = _Cooldowns.GetStateValue(stateDetails.state, "BarColor", "barColor", self.groupIndex)
                if col then
                    local r,g,b = col:GetRGB()
                    self.StatusBar:SetStatusBarColor(r,g,b,alpha)
                    return
                end
            end
        end
    end
    if _Cooldowns.BarGetUseClassColor(self.groupIndex) then
        local r,g,b = self.ClassColor:GetRGB()
        self.StatusBar:SetStatusBarColor(r,g,b,alpha)
    --[[elseif _Cooldowns.BarGetUseFilterColor(self.groupIndex) then
        local filterCol = self.filter <= _Cooldowns.numFilters and _Cooldowns.filters.GetColor(self.filter, self.groupIndex) or _Cooldowns.customFilters.GetColor(self.filter - _Cooldowns.numFilters, self.groupIndex)
        local r,g,b = filterCol:GetRGB()
        self.StatusBar:SetStatusBarColor(r,g,b,alpha)]]
    else
        local r,g,b = _Cooldowns.BarGetBarColor(self.groupIndex):GetRGB()
        self.StatusBar:SetStatusBarColor(r,g,b,alpha)
    end
end
function EchoCooldownDisplayTemplateMixin:UpdateBarBackgroundColor()
    local alpha = _Cooldowns.BarGetBackgroundAlpha(self.groupIndex)/100
    if _Cooldowns.BarGetBackgroundUseClassColor(self.groupIndex) then
        local r,g,b = self.ClassColor:GetRGB()
        self.StatusBar.Background:SetVertexColor(r,g,b,alpha)
    --[[elseif _Cooldowns.BarGetBackgroundUseFilterColor(self.groupIndex) then
        local filterCol = self.filter <= _Cooldowns.numFilters and _Cooldowns.filters.GetColor(self.filter, self.groupIndex) or _Cooldowns.customFilters.GetColor(self.filter - _Cooldowns.numFilters, self.groupIndex)
        local r,g,b = filterCol:GetRGB()
        self.StatusBar.Background:SetVertexColor(r,g,b,alpha)]]
    else
        local r,g,b = _Cooldowns.BarGetBarBackgroundColor(self.groupIndex):GetRGB()
        self.StatusBar.Background:SetVertexColor(r,g,b,alpha)
    end
end

function EchoCooldownDisplayTemplateMixin:SetStatusBarTexture()
    self.StatusBar:SetStatusBarTexture(_Cooldowns.GetStatusBarTexture(_Cooldowns.BarGetBarTexture(self.groupIndex)))
end
function EchoCooldownDisplayTemplateMixin:SetStatusBarBackgroundTexture()
    self.StatusBar.Background:SetTexture(_Cooldowns.GetStatusBarTexture(_Cooldowns.BarGetBarBackgroundTexture(self.groupIndex)))
end

function EchoCooldownDisplayTemplateMixin:SetTextColor(textType)
    if _Cooldowns["Get"..textType.."ClassColor"](self.groupIndex) then
        self[textType]:SetTextColor(self.ClassColor:GetRGBA())
    --[[elseif _Cooldowns["Get"..textType.."FilterColor"](self.groupIndex) then
        local filterCol = self.filter <= _Cooldowns.numFilters and _Cooldowns.filters.GetColor(self.filter, self.groupIndex) or _Cooldowns.customFilters.GetColor(self.filter - _Cooldowns.numFilters, self.groupIndex)
        self[textType]:SetTextColor(filterCol:GetRGBA())]]
    else
        self[textType]:SetTextColor(_Cooldowns["Get"..textType.."Color"](self.groupIndex):GetRGBA())
    end
end
function EchoCooldownDisplayTemplateMixin:UpdateTextColors(textType)
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, textType.." Color", self.groupIndex) then
            if _Cooldowns.GetStateValue(stateDetails.state, textType.." Color", textType.."ClassColor", self.groupIndex) then
                self[textType]:SetTextColor(self.ClassColor:GetRGBA())
                return
            --[[elseif _Cooldowns.GetStateValue(stateDetails.state, textType.." Color", textType.."FilterColor", self.groupIndex) then
                local filterCol = self.filter <= _Cooldowns.numFilters and _Cooldowns.filters.GetColor(self.filter, self.groupIndex) or _Cooldowns.customFilters.GetColor(self.filter - _Cooldowns.numFilters, self.groupIndex)
                self[textType]:SetTextColor(filterCol:GetRGBA())
                return]]
            else
                local col = _Cooldowns.GetStateValue(stateDetails.state, textType.." Color", textType.."Color", self.groupIndex)
                if col then
                    self[textType]:SetTextColor(col:GetRGBA())
                    return
                end
            end
        end
    end
    if _Cooldowns["Get"..textType.."ClassColor"](self.groupIndex) then
        self[textType]:SetTextColor(self.ClassColor:GetRGBA())
    --[[elseif _Cooldowns["Get"..textType.."FilterColor"](self.groupIndex) then
        local filterCol = self.filter <= _Cooldowns.numFilters and _Cooldowns.filters.GetColor(self.filter, self.groupIndex) or _Cooldowns.customFilters.GetColor(self.filter - _Cooldowns.numFilters, self.groupIndex)
        self[textType]:SetTextColor(filterCol:GetRGBA())]]
    else
        self[textType]:SetTextColor(_Cooldowns["Get"..textType.."Color"](self.groupIndex):GetRGBA())
    end
end
function EchoCooldownDisplayTemplateMixin:UpdateAllTextColors()
    for _, textType in pairs(_Cooldowns.types.textTypes) do
        self:UpdateTextColors(textType)
    end
end
function EchoCooldownDisplayTemplateMixin:UpdateTextEnable(textType)
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, textType.." Enable", self.groupIndex) then
            local textEnable = _Cooldowns.GetStateValue(stateDetails.state, textType.." Enable", textType.."Enable", self.groupIndex)
            if textEnable ~= nil then
                if textEnable then
                    self[textType]:Show()
                else
                    self[textType]:Hide()
                end
                return
            end
        end
    end
    if _Cooldowns["Get"..textType.."Enable"](self.groupIndex) then
        if textType == "DurationText" then
            if self.OnCD then
                self[textType]:Show()
            end
        elseif textType == "ChargesText" then
            if self.count > 1 or (self.count > 0 and self.OnCD) then
                self[textType]:Show()
            end
        else
            self[textType]:Show()
        end
    elseif self[textType]:IsShown() then
        self[textType]:Hide()
    end
end
function EchoCooldownDisplayTemplateMixin:UpdateAllTextEnable()
    for _, textType in pairs(_Cooldowns.types.textTypes) do
        self:UpdateTextEnable(textType)
    end
end
function EchoCooldownDisplayTemplateMixin:SetDurationPrecision()
    self.durationThreshold = _Cooldowns.GetDurationTextThreshold(self.groupIndex)
    self.durationDecimals = _Cooldowns.GetDurationTextDecimals(self.groupIndex)
end

function EchoCooldownDisplayTemplateMixin:UpdateBarEnable()
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "Enable Bars", self.groupIndex) then
            local barEnable = _Cooldowns.GetStateValue(stateDetails.state, "Enable Bars", "enableBar", self.groupIndex)
            if barEnable then
                if not self.StatusBar:IsShown() then
                    self.StatusBar:Show()
                    if self.Icon:IsShown() then
                        self.StatusBar:SetPoint("LEFT", self.Icon, "RIGHT")
                    else
                        self.StatusBar:SetPoint("LEFT", self)
                    end
                end
            else
                if self.StatusBar:IsShown() then
                    self.StatusBar:Hide()
                end
            end
            return
        end
    end
    if _Cooldowns.GetEnableBar(self.groupIndex) then
        if not self.StatusBar:IsShown() then
            self.StatusBar:Show()
            if self.Icon:IsShown() then
                self.StatusBar:SetPoint("LEFT", self.Icon, "RIGHT")
            else
                self.StatusBar:SetPoint("LEFT", self)
            end
        end
    else
        if self.StatusBar:IsShown() then
            self.StatusBar:Hide()
        end
    end
end
function EchoCooldownDisplayTemplateMixin:UpdateIconEnable()
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "Enable Icons", self.groupIndex) then
            local iconEnable = _Cooldowns.GetStateValue(stateDetails.state, "Enable Icons", "enableIcon", self.groupIndex)
            if iconEnable then
                if not self.Icon:IsShown() then
                    self.Icon:Show()
                    self.Icon:SetSize(self:GetHeight(), self:GetHeight())
                    self.StatusBar:SetPoint("LEFT", self.Icon, "RIGHT")
                end
            else
                if self.Icon:IsShown() then
                    self.Icon:Hide()
                    self.StatusBar:SetPoint("LEFT", self)
                end
            end
            return
        end
    end
    if _Cooldowns.GetEnableIcon(self.groupIndex) then
        if not self.Icon:IsShown() then
            self.Icon:Show()
            self.Icon:SetSize(self:GetHeight(), self:GetHeight())
            self.StatusBar:SetPoint("LEFT", self.Icon, "RIGHT")
        end
    else
        if self.Icon:IsShown() then
            self.Icon:Hide()
            self.StatusBar:SetPoint("LEFT", self)
        end
    end
end

function EchoCooldownDisplayTemplateMixin:UpdateIconColor()
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "IconColor", self.groupIndex) then
            local col = _Cooldowns.GetStateValue(stateDetails.state, "IconColor", "iconColor", self.groupIndex)
            if col then
                self.Icon.IconTexture:SetVertexColor(col:GetRGBA())
                return
            end
        end
    end
    self.Icon.IconTexture:SetVertexColor(_Cooldowns.GetIconColor(self.groupIndex):GetRGBA())
end

function EchoCooldownDisplayTemplateMixin:UpdateBorderColor()
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "BorderColor", self.groupIndex) then
            local col
            if _Cooldowns.GetStateValue(stateDetails.state, "BorderColor", "useBorderClassColor", self.groupIndex) then
                col = self.ClassColor
            --[[elseif _Cooldowns.GetStateValue(stateDetails.state, "BorderColor", "useBorderFilterColor", self.groupIndex) then
                col = self.filter <= _Cooldowns.numFilters and _Cooldowns.filters.GetColor(self.filter, self.groupIndex) or _Cooldowns.customFilters.GetColor(self.filter - _Cooldowns.numFilters, self.groupIndex)]]
            else
                col = _Cooldowns.GetStateValue(stateDetails.state, "BorderColor", "BorderColor", self.groupIndex)
            end
            self.Border:SetBackdropBorderColor(col:GetRGBA())
            self.Border:SetBackdropColor(0,0,0,0)
            return
        end
    end
    local col
    if _Cooldowns.GetBorderUseClassColor(self.groupIndex) then
        col = self.ClassColor
    --[[elseif _Cooldowns.GetBorderUseFilterColor(self.groupIndex) then
        col = self.filter <= _Cooldowns.numFilters and _Cooldowns.filters.GetColor(self.filter, self.groupIndex) or _Cooldowns.customFilters.GetColor(self.filter - _Cooldowns.numFilters, self.groupIndex)]]
    else
        col = _Cooldowns.GetBorderColor(self.groupIndex)
    end
    self.Border:SetBackdropBorderColor(col:GetRGBA())
    self.Border:SetBackdropColor(0,0,0,0)
end
function EchoCooldownDisplayTemplateMixin:UpdateBorderShow()
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "Enable Borders", self.groupIndex) then
            local borderEnable = _Cooldowns.GetStateValue(stateDetails.state, "Enable Borders", "UseBorder", self.groupIndex)
            if borderEnable ~= nil then
                if borderEnable then
                    self.Border:Show()
                else
                    self.Border:Hide()
                end
                return
            end
        end
    end
    if _Cooldowns.GetUseBorders(self.groupIndex) then
        self.Border:Show()
    else
        self.Border:Hide()
    end
end
function EchoCooldownDisplayTemplateMixin:UpdateFlashShow()
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "Enable Flash", self.groupIndex) then
            local flashEnable = _Cooldowns.GetStateValue(stateDetails.state, "Enable Flash", "UseFlash", self.groupIndex)
            if flashEnable ~= nil then
                if flashEnable then
                    self:StartFlash()
                else
                    self:StopFlash()
                end
                return
            end
        end
    end
    if _Cooldowns.GetUseFlash(self.groupIndex) then
        self:StartFlash()
    else
        self:StopFlash()
    end
end
function EchoCooldownDisplayTemplateMixin:SetGlowRegion()
    local region = _Cooldowns.GetGlowRegion(self.groupIndex)
    local x, y = 0,0
    self:SetDisplayGlowRegion(region, x, y)
end
function EchoCooldownDisplayTemplateMixin:UpdateGlowShow()
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "Enable Glow", self.groupIndex) then
            local glowEnable = _Cooldowns.GetStateValue(stateDetails.state, "Enable Glow", "UseGlow", self.groupIndex)
            if glowEnable ~= nil then
                if glowEnable then
                    self:ShowGlow()
                else
                    self:HideGlow()
                end
                return
            end
        end
    end
    if _Cooldowns.GetUseGlow(self.groupIndex) then
        self:ShowGlow()
    else
        self:HideGlow()
    end
end

function EchoCooldownDisplayTemplateMixin:UpdateDesaturateIcon()
    for _, stateDetails in ipairs(_Cooldowns.types.availableStates) do
        if self.states[stateDetails.state] and _Cooldowns.GetPropertyOverridden(stateDetails.state, "Desaturate Icons", self.groupIndex) then
            local Desat = _Cooldowns.GetStateValue(stateDetails.state, "Desaturate Icons", "desaturateIcon", self.groupIndex)
            if Desat ~= nil then
                if Desat then
                    self.Icon.IconTexture:SetDesaturated(true)
                else
                    self.Icon.IconTexture:SetDesaturated(false)
                end
                return
            end
        end
    end
    if _Cooldowns.GetDesaturateIcon(self.groupIndex) then
        self.Icon.IconTexture:SetDesaturated(true)
    else
        self.Icon.IconTexture:SetDesaturated(false)
    end
end
function EchoCooldownDisplayTemplateMixin:UpdateStates()
    self:SetDisplayAlpha()
    self:SetDisplayHide()
    self:UpdateBarEnable()
    self:UpdateIconEnable()
    self:UpdateIconColor()
    self:UpdateBarColor()
    self:UpdateBorderShow()
    self:UpdateBorderColor()
    self:UpdateAllTextColors()
    self:UpdateAllTextEnable()
    self:UpdateDesaturateIcon()
    self:UpdateGlowShow()
    self:UpdateFlashShow()

end
function EchoCooldownDisplayTemplateMixin:SetCurrentStates(bool)
    if not _Cooldowns.unitFlags[self.unit] then
        _Cooldowns.UpdateUnitFlags(self.unit)
    end
    local update = false
    if self.states.UnitDead == nil or self.states.UnitDead ~=  _Cooldowns.unitFlags[self.unit].dead then
        self.states.UnitDead = _Cooldowns.unitFlags[self.unit].dead
        update = true
    end
    if self.states.UnitAway == nil or self.states.UnitAway ~= _Cooldowns.unitFlags[self.unit].away then
        self.states.UnitAway = _Cooldowns.unitFlags[self.unit].away
        update = true
    end
    if self.states.subGroup == nil or self.states.subGroup ~= _Cooldowns.unitFlags[self.unit].subGroup then
        self.states.subGroup = _Cooldowns.unitFlags[self.unit].subGroup
        update = true
    end
    if self.states.OnCD == nil or self.states.OnCD ~= self.OnCD then
        self.states.OnCD = self.OnCD
        update = true
    end
    if self.states.buffUp == nil or self.states.buffUp ~= self.buffUp then
        self.states.buffUp = self.buffUp
        update = true
    end
    if self.states.outOfRange == nil or self.states.outOfRange ~= _Cooldowns.unitFlags[self.unit].outOfRange then
        self.states.outOfRange = _Cooldowns.unitFlags[self.unit].outOfRange
        update = true
    end
    self.flagged = self.states.UnitDead and 4 or self.states.UnitAway and 3 or 0
    if update or bool then
       self:UpdateStates()
    end
end
function EchoCooldownDisplayTemplateMixin:StartBuff()
    if self.uptimeCallback then self.uptimeCallback:Cancel() end
    self.uptimeCallback = C_Timer.NewTimer(self.buffExpirationTime - GetTime(), function() self:EndBuff() end)
    if _Cooldowns.GetEnableUptimes(self.groupIndex) then
        self.overrideDuration = true
        self.Icon.Cooldown:SetCooldown(self.buffStart, self.buffDuration)
        self.Icon.Cooldown:SetReverse()
        self.StatusBar:SetMinMaxValues(self.buffStart, self.buffExpirationTime)
    end
end
function EchoCooldownDisplayTemplateMixin:EndBuff()
    if self.uptimeCallback then self.uptimeCallback:Cancel() end
    self.overrideDuration = false
    self.buffExpirationTime = nil
    self.buffUp = nil
    self.Icon.Cooldown:SetCooldown(self.start, self.duration)
    self.StatusBar:SetMinMaxValues(self.start, self.expirationTime)
    self:SetCurrentStates()
end


EchoCooldownsDraggableAnchorMixin = {}
function EchoCooldownsDraggableAnchorMixin:OnLoad()
    self:RegisterForDrag("LeftButton")
    self.IsLocked = true
    self:SetAlpha(0)
    self:SetClampRectInsets(15, -15, -15, 15)
end
function EchoCooldownsDraggableAnchorMixin:OnDragStart()
    if not self.isLocked then
        self:StartMoving()
    end
end
function EchoCooldownsDraggableAnchorMixin:OnDragStop()
    self:StopMovingOrSizing()
    local left, bottom, w,h = self:GetRect()
    local x = Round((left + w/2) - (GetScreenWidth()/2))
    local y = Round((bottom + h/2) - (GetScreenHeight()/2))
    _Cooldowns.SetAnchorOffsetX(x, self.groupIndex)
    _Cooldowns.SetAnchorOffsetY(y, self.groupIndex)
    if _Cooldowns.controls.MainOffsetX then
        _Cooldowns.controls.MainOffsetX:Update()
        _Cooldowns.controls.MainOffsetY:Update()
    end
end
function EchoCooldownsDraggableAnchorMixin:Unlock()
    self:EnableMouse(true)
    self:SetAlpha(1)
    self.IsLocked = false
    self.Background.AnimationGroup:Play()
end
function EchoCooldownsDraggableAnchorMixin:Lock()
    self.Background.AnimationGroup:Stop()
    self:EnableMouse(false)
    self:SetAlpha(0)
    self.IsLocked = true
end
function EchoCooldownsDraggableAnchorMixin:OnEnter()
    self.GroupName:Show()
end
function EchoCooldownsDraggableAnchorMixin:OnLeave()
    self.GroupName:Hide()
end
function EchoCooldownsDraggableAnchorMixin:Locate()
    self.LocateTexture.LocateAnim:Play()
end

EchoCooldownsOutlineMixin = {}
function EchoCooldownsOutlineMixin:OnShow()
    self.AnimationGroup:Play()
end
function EchoCooldownsOutlineMixin:OnHide()
    self.AnimationGroup:Stop()
end