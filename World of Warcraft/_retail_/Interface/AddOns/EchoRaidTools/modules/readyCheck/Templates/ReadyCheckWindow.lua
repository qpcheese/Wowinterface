local _AddonName, _EchoRaidTools = ...
local _ReadyCheck = _EchoRaidTools:GetModule("readyCheck")

local MaximisedFrameParent
local qualityAtlas = {"Professions-ChatIcon-Quality-Tier1", "Professions-ChatIcon-Quality-Tier2", "Professions-ChatIcon-Quality-Tier3"}

EchoRaidTools_MaximisedFrameParentMixin = {}
function EchoRaidTools_MaximisedFrameParentMixin:OnLoad()
    MaximisedFrameParent = self
end

EchoRaidTools_ReadyCheckWindowMixin = {}
function EchoRaidTools_ReadyCheckWindowMixin:OnShow()
    if not self.isExample then
        self.Header.CloseButton:Enable()
    else
        self.Header.CloseButton:Disable()
    end
    self.Header.MinimiseButton:Enable()
    self.BackgroundTexture:SetVertexColor(0.1,0.1,0.1,1)
    self.Header.BackgroundTexture:SetVertexColor(0,0,0,1)
    self.Glow1:SetVertexColor(0,0,0,1)
    self.Glow2:SetVertexColor(0,0,0,1)
end
function EchoRaidTools_ReadyCheckWindowMixin:OnLoad()
    self:RegisterForDrag("LeftButton")
    self.FadeOutAnim.parent = self
    self.SimpleFadeOutAnim.parent = self
    self.Header.CloseButton.parent = self
    self.Header.MinimiseButton.parent = self
    self.minimised = false
end
function EchoRaidTools_ReadyCheckWindowMixin:OnMouseDown(button)
    if button == "RightButton" and not self.isExample then
        self:HideWindow(true)
    end
end
function EchoRaidTools_ReadyCheckWindowMixin:OnDragStart()
    self:StartMoving()
end
function EchoRaidTools_ReadyCheckWindowMixin:OnDragStop()
    self:StopMovingOrSizing()
    _ReadyCheck.SetWindowPosition()
end
function EchoRaidTools_ReadyCheckWindowMixin:StopAnimations()
    self.FadeOutAnim:Stop()
    self.SimpleFadeOutAnim:Stop()
end
function EchoRaidTools_ReadyCheckWindowMixin:HideWindow(simple, outsideMembers, closeButton)
    self.Header.ReadyCheckDuration:Hide()
    local text = ""
    local everyoneReady = self.currentReady == self.totalReady
    if everyoneReady or outsideMembers then
        text = "Everyone is Ready!!"
        PlaySound(38326)
    else
        text = format("%d / %d", self.currentReady, self.totalReady)
    end
    self.Header.TitleText:SetText(text)
    if self.timer then self.timer:Cancel() end
    if simple then
        self.SimpleFadeOutAnim:Play()
    else
        if self.FadeOutAnim:IsPlaying() and closeButton then
            self.FadeOutAnim:Stop()
            self.SimpleFadeOutAnim:Play()
        end
        if everyoneReady then
            self.BackgroundTexture:SetVertexColor(0.1,1,0.1,1)
            self.Header.BackgroundTexture:SetVertexColor(0,0.4,0,1)
            self.Glow1:SetVertexColor(0,1,0,1)
            self.Glow2:SetVertexColor(0,1,0,1)
        else
            self.BackgroundTexture:SetVertexColor(1,0.1,0.1,1)
            self.Header.BackgroundTexture:SetVertexColor(0.4,0,0,1)
            self.Glow1:SetVertexColor(1,0,0,1)
            self.Glow2:SetVertexColor(1,0,0,1)
        end
        self.FadeOutAnim:Play()
    end
end
function EchoRaidTools_ReadyCheckWindowMixin:ToggleMinimised()
    self.minimised = not self.minimised
    if self.minimised then
        MaximisedFrameParent:Hide()
        self:SetWidth(150)
        self.Header.TitleText:Hide()
        self.TopLine.TitleText:Show()
        self.Header.MinimiseButton.tooltip = "Show full display"
        self.Header.MinimiseButton.ButtonTexture:SetRotation(0)
        self.Header.MinimiseButton.HighlightTexture:SetRotation(0)
        self.Header.MinimiseButton.DisabledTexture:SetRotation(0)
    else
        MaximisedFrameParent:Show()
        self:SetWidth(530)
        self.Header.TitleText:Show()
        self.TopLine.TitleText:Hide()
        self.Header.MinimiseButton.tooltip = "Show minimal display"
        local rot = math.rad(180)
        self.Header.MinimiseButton.ButtonTexture:SetRotation(rot)
        self.Header.MinimiseButton.HighlightTexture:SetRotation(rot)
        self.Header.MinimiseButton.DisabledTexture:SetRotation(rot)
    end
    _ReadyCheck.SetShowMinimisedWindow(self.minimised)
end

EchoRaidTools_WindowFadeAnimMixin = {}
function EchoRaidTools_WindowFadeAnimMixin:OnFinished()
    self.parent.Header.ReadyCheckDuration:SetScript("OnUpdate", nil)
    _ReadyCheck.StopAllUnitEvents()
    _ReadyCheck.watchingUpdates = false
    self.parent:Hide()
end

EchoRaidTools_ReadyCheckPlayerLineMixin = {}
function EchoRaidTools_ReadyCheckPlayerLineMixin:SetReady(bool)
    if bool == true then
        self.isReady = true
        self.ReadyIndicator:SetAtlas("common-icon-checkmark")
        self.ReadyIndicator:Show()
    elseif bool == false then
        self.isReady = false
        self.ReadyIndicator:SetAtlas("common-icon-redx")
        self.ReadyIndicator:Show()
    elseif bool == nil then
        self.isReady = nil
        self.ReadyIndicator:Hide()
    end
end

EchoRaidTools_ReadyCheckWindow = {}

EchoRaidTools_CloseButtonMixin = {}
function EchoRaidTools_CloseButtonMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_CloseButtonMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidTools_CloseButtonMixin:OnClick()
    self.parent:HideWindow(true, nil, true)
end

EchoRaidTools_MinimiseButtonMixin = {}
function EchoRaidTools_MinimiseButtonMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_MinimiseButtonMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidTools_MinimiseButtonMixin:OnLoad()
    self.minimised = false
    self.tooltip = "Show minimal display"
    local rot = math.rad(180)
    self.ButtonTexture:SetRotation(rot)
    self.HighlightTexture:SetRotation(rot)
    self.DisabledTexture:SetRotation(rot)
end
function EchoRaidTools_MinimiseButtonMixin:OnClick()
    self.parent:ToggleMinimised()
end

EchoRaidTools_ReadyCheckCounterMixin = {}
function EchoRaidTools_ReadyCheckCounterMixin:OnLoad()
    if self.Negative then
        self.Texture:SetAtlas("communities-chat-icon-minus")
    elseif self.Positive then
        self.Texture:SetAtlas("communities-chat-icon-plus")
    end
    self.count = 0
    self.Count:SetText(0)
end
function EchoRaidTools_ReadyCheckCounterMixin:Increment()
    self.count = self.count + 1
    self.Count:SetText(self.count)
end
function EchoRaidTools_ReadyCheckCounterMixin:Reset()
    self.count = 0
    self.Count:SetText(self.count)
end

EchoRaidTools_ReadyCheck_BasicTextFrameMixin = {}
function EchoRaidTools_ReadyCheck_BasicTextFrameMixin:OnLoad()
    if self.MaximisedOnly then
        self:SetParent(MaximisedFrameParent)
    end
    if self.text then
        self.Text:SetText(self.text)
    end
    self:EnableMouse(false)
    self:SetMouseMotionEnabled(true)
end
function EchoRaidTools_ReadyCheck_BasicTextFrameMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_ReadyCheck_BasicTextFrameMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end

EchoRaidTools_ReadyCheck_BasicIconFrameMixin = {}
function EchoRaidTools_ReadyCheck_BasicIconFrameMixin:OnLoad()
    if self.MaximisedOnly then
        self:SetParent(MaximisedFrameParent)
    end
    if self.texture then
        self.Icon:SetTexture(self.texture)
    elseif self.atlas then
        self.Icon:SetAtlas(self.atlas)
    end
    if self.IconSize then
        self.Icon:ClearAllPoints()
        self.Icon:SetPoint("CENTER")
        self.Icon:SetSize(self.IconSize, self.IconSize)
    end
    self:EnableMouse(false)
    self:SetMouseMotionEnabled(true)
end
function EchoRaidTools_ReadyCheck_BasicIconFrameMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_ReadyCheck_BasicIconFrameMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidTools_ReadyCheck_BasicIconFrameMixin:SetIcon(icon)
    self.icon = icon
    if icon then
        self:Show()
    else
        self:Hide()
        return
    end
    if C_Texture.GetAtlasInfo(icon) then
        self.Icon:SetAtlas(icon)
    else
        self.Icon:SetTexture(icon)
    end
    if self.tooltipText then
        local icon = self.icon
        icon =  icon and C_Texture.GetAtlasInfo(icon) and CreateAtlasMarkup(icon) or "|T"..icon..":0|t" or ""
        self.tooltip = format("%s%s%s",icon, self.quality and CreateAtlasMarkup(qualityAtlas[self.quality]) or "",self.tooltipText)
    end
end
function EchoRaidTools_ReadyCheck_BasicIconFrameMixin:SetTooltip(tooltip)
    self.tooltipText = tooltip
    if self.tooltipText then
        local icon = self.icon
        icon =  icon and C_Texture.GetAtlasInfo(icon) and CreateAtlasMarkup(icon) or icon and "|T"..icon..":0|t" or ""
        self.tooltip = format("%s%s%s",icon, self.quality and CreateAtlasMarkup(qualityAtlas[self.quality]) or "",self.tooltipText)
    end
end


EchoRaidTools_ReadyCheck_RoleIconMixin = {}
function EchoRaidTools_ReadyCheck_RoleIconMixin:SetRole(role)
    if role == "DAMAGER" then
        self.Icon:SetAtlas("roleicon-tiny-dps")
        self:Show()
    elseif role == "TANK" then
        self.Icon:SetAtlas("roleicon-tiny-tank")
        self:Show()
    elseif role == "HEALER" then
        self.Icon:SetAtlas("roleicon-tiny-healer")
        self:Show()
    else
        self:Hide()
    end
end

EchoRaidTools_ReadyCheck_ClassIconMixin = {}
function EchoRaidTools_ReadyCheck_ClassIconMixin:SetClass(unit)
    local name, fileName, id = UnitClass(unit)
    if name then
        self:Show()
        self.Icon:SetAtlas("classicon-"..fileName:lower())
        self.tooltip = name
    end
end

EchoRaidTools_ReadyCheck_SpecIconMixin = {}
function EchoRaidTools_ReadyCheck_SpecIconMixin:SetSpec(specID)
    local _, name, _, icon = GetSpecializationInfoByID(specID)
    if icon then
        self:Show()
        self.tooltip = name
        self.Icon:SetTexture(icon)
    end
end

EchoRaidTools_ReadyCheck_LeaderIconMixin = {}
function EchoRaidTools_ReadyCheck_LeaderIconMixin:SetLeader(unit)
    local leader = UnitIsGroupLeader(unit)
    local assist = UnitIsGroupAssistant(unit)
    if leader then
        self.Icon:SetAtlas("UI-HUD-UnitFrame-Player-Group-LeaderIcon-2x")
        self.Icon:SetDesaturated(false)
        self:Show()
    elseif assist then
        self.Icon:SetAtlas("UI-HUD-UnitFrame-Player-Group-LeaderIcon-2x")
        self.Icon:SetDesaturated(true)
        self:Show()
    else
        self:Hide()
    end
end

local perfectColor = CreateColor(0.5,0.5,0.5,0.5)
local goodColor = CreateColor(1, 1, 1, 1)
local worryColor = CreateColor(1, 0.9, 0, 1)
local badColor = CreateColor(1, 0, 0, 1)
EchoRaidTools_ReadyCheck_Durability = {}
function EchoRaidTools_ReadyCheck_Durability:SetDurability(number)
    local col = number < 30 and badColor or number < 60 and worryColor or number < 100 and goodColor or perfectColor
    self.Text:SetText(number.."%")
    self.Text:SetTextColor(col:GetRGBA())
end

EchoRaidTools_ReadyCheck_IconWithQualityMixin = {}
function EchoRaidTools_ReadyCheck_IconWithQualityMixin:SetQuality(quality)
    self.quality = quality
    if quality then
        self.Quality:SetAtlas(qualityAtlas[quality])
        self.Quality:Show()
    else
        self.Quality:Hide()
    end
    if self.tooltipText then
        local icon = self.icon or 134400
        icon =  icon and C_Texture.GetAtlasInfo(icon) and CreateAtlasMarkup(icon) or "|T"..icon..":0|t"
        self.tooltip = format("%s%s%s",icon, self.quality and CreateAtlasMarkup(qualityAtlas[self.quality]) or "",self.tooltipText)
    end
end

local charLimit = 6
EchoRaidTools_ReadyCheck_IconWithTextMixin = {}
function EchoRaidTools_ReadyCheck_IconWithTextMixin:SetText(text)
    --text = _EchoRaidTools.Utf8Sub(text, charLimit)
    self.Text:SetText(text)
end

EchoRaidTools_ReadyCheck_IconWithDurationMixin = {}
function EchoRaidTools_ReadyCheck_IconWithDurationMixin:SetDuration(expirationTime)
    local remaining = expirationTime - GetTime()
    if remaining > 0 and remaining < 600 then
        local remainingMins = ceil(remaining/60)
        self.Duration:SetText(remainingMins.."m")
        self.Duration:Show()
        self.DurationBG:Show()
        return
    end
    self.DurationBG:Hide()
    self.Duration:Hide()
end