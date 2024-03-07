local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

EchoRaidToolsConfig_FilterSpellButtonMixin = {}
function EchoRaidToolsConfig_FilterSpellButtonMixin:SetText(string)
    self.SpellText:SetText(string)
    local width = self.SpellText:GetStringWidth()
    self:SetWidth(width + 31)
end
function EchoRaidToolsConfig_FilterSpellButtonMixin:SetIcon(icon)
    if icon then
        self.Icon:SetTexture(icon)
        self.Icon:Show()
    else
        self.Icon:Hide()
    end
end
function EchoRaidToolsConfig_FilterSpellButtonMixin:SetClass(class)
    local col = class ~= "" and C_ClassColor.GetClassColor(class)
    local r,g,b,a
    if col then
        r,g,b,a = col:GetRGBA()
    else
        r,g,b,a = 0.8,0.8,0.8,1
    end
    self.Border:SetVertexColor(r,g,b,a)
    self.SpellText:SetTextColor(r,g,b,a)
    self.DeleteButton.Normal:SetVertexColor(r,g,b,a)
end
function EchoRaidToolsConfig_FilterSpellButtonMixin:SetupClick(func)
    self.DeleteButton:SetScript("OnClick", func)
end