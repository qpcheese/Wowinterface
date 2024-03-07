EchoRaidToolsMainMenuButtonTemplateMixin = {}
function EchoRaidToolsMainMenuButtonTemplateMixin:SetSelected(bool)
    if bool then 
        self.SelectedTexture:Show()
    else
        self.SelectedTexture:Hide()
    end
end