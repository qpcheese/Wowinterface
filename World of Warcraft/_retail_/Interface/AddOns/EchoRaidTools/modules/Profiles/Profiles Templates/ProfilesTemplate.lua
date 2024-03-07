EchoRaidTools_ProfilesNavigationSelectableButtonFrameMixin = {}
function EchoRaidTools_ProfilesNavigationSelectableButtonFrameMixin:AdditionalLoad()
    self.SelectedTexture:Hide()
end
function EchoRaidTools_ProfilesNavigationSelectableButtonFrameMixin:AdditionalSetup(info)
    if info.isSelected and info.isSelected() then
        self.SelectedTexture:Show()
    else
        self.SelectedTexture:Hide()
    end
end