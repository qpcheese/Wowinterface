local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local noop = function() end

EchoRaidTools_CooldownsPanelMixin = {}
function EchoRaidTools_CooldownsPanelMixin:OnLoad()

end
function EchoRaidTools_CooldownsPanelMixin:OnHide()

end
function EchoRaidTools_CooldownsPanelMixin:OnShow()

end
function EchoRaidTools_CooldownsPanelMixin:OnSizeChanged()
    if self.init then
        _Cooldowns.RebuildConfig()
    else
        self.init = true
    end
end

EchoRaidTools_CooldownsWindowMixin = {}
function EchoRaidTools_CooldownsWindowMixin:OnLoad()
    _Cooldowns.OnHidefuncs = _Cooldowns.OnHideFuncs or {}
end
function EchoRaidTools_CooldownsWindowMixin:OnHide()
    _Cooldowns.configShown = false
    for _, func in ipairs(_Cooldowns.OnHideFuncs) do
        func()
    end
    _Cooldowns.HideBackdropFrames()
    _EchoRaidTools:SetStatus("")
    _Cooldowns.ToggleTestDisplays(false)
    if _Cooldowns.GetCurrentGroupIndex() > 0 then
        if _Cooldowns.controls["showTestDisplays"] then
            _Cooldowns.controls["showTestDisplays"]:Update()
        end
        if _Cooldowns.controls["numTestDisplays"] then
            _Cooldowns.controls["numTestDisplays"]:Update()
        end
        if _Cooldowns.controls.hideOtherAnchors then
            _Cooldowns.controls.hideOtherAnchors:Update()
        end
        if _Cooldowns.controls["AnchorToUnitframes"] then
            _Cooldowns.controls["AnchorToUnitframes"]:Update()
        end
    end
    _Cooldowns.showOtherAnchors = true
end
function EchoRaidTools_CooldownsWindowMixin:OnShow()
    _Cooldowns.configShown = true
    _Cooldowns.ShowConfig()
end


-- This was an idea for showing a demo of what text anchoring would look like... but really you can see it directly on the displays. 
--[[EchoRaidTools_TextAnchorDemoMixin = {}
function EchoRaidTools_TextAnchorDemoMixin:OnLoad()
end
function EchoRaidTools_TextAnchorDemoMixin:Anchor(point1, point2, offX, offY)
    self.Text:ClearAllPoints()
    self.Text:SetPoint(point1, self.Texture, point2, offX or 0, offY or 0)
end
function EchoRaidTools_TextAnchorDemoMixin:Setup(displayType)
    if displayType == "bar" then
        self.Texture:SetSize(100, 20)
    elseif displayType == "icon" then
        self.Texture:SetSize(35, 35)
    elseif displayType == "text" then
        self.Texture:SetSize(100, 15)
    end
end]]
