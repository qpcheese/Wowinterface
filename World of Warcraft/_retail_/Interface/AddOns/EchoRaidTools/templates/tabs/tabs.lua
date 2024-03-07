local resetFunc = function(pool, item)
    item:ClearAllPoints()
    item:Hide()
end

EchoRaidTools_TabMainPanelMixin = {}
function EchoRaidTools_TabMainPanelMixin:OnLoad()
    self.tabPool = CreateFramePool("BUTTON", self.TabTray, "EchoRaidTools_TabButton", resetFunc)
    self.tabs = {}
    self.panelPool = CreateFramePool("FRAME", self, "EchoRaidTools_TabContentPanel", resetFunc)
    self.panels = {}
    self.TabTray:SetHeight(30)
end
function EchoRaidTools_TabMainPanelMixin:CreateTab(title, position)
    local tab = self.tabPool:Acquire()
    tab.parent = self
    tab.position = position
    tab:SetText(title)
    tab:SetHeight(22)
    tab:ClearAllPoints()
    tab:Show()
    table.insert(self.tabs, position, tab)

    local panel = self.panelPool:Acquire()
    panel.parent = self
    panel.position = position
    panel:SetPoint("TOPLEFT", self.TabTray, "BOTTOMLEFT")
    panel:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT")
    panel:Hide()
    table.insert(self.panels, position, panel)
end
function EchoRaidTools_TabMainPanelMixin:PositionTabs()
    local x = 7
    for i, tab in ipairs(self.tabs) do
        tab:SetPoint("BOTTOMLEFT", self.TabTray, "BOTTOMLEFT", x, 0)
        x = x + tab:GetWidth()
    end
end
function EchoRaidTools_TabMainPanelMixin:ResizeTabs()
    for i, tab in ipairs(self.tabs) do
        local width
        width = max(tab:GetTextWidth()+20, 110)
        tab:SetWidth(width)
    end
end
function EchoRaidTools_TabMainPanelMixin:SetTabs(tabTable)
    self.numTabs = #tabTable
    self.tabPool:ReleaseAll()
    self.tabs = {}
    self.panelPool:ReleaseAll()
    self.panels = {}
    if tabTable and #tabTable and #tabTable > 0 then
        for i, title in ipairs(tabTable) do
            self:CreateTab(title, i)
        end
    else
        return
    end
    self:ResizeTabs()
    self:PositionTabs()
    self:SelectTab(1)
    return self.panels
end
function EchoRaidTools_TabMainPanelMixin:SelectTab(num)
    for i  =1, self.numTabs do
        if i ~= num then
            self.panels[i]:Hide()
            local p,r,rp,x,y = self.tabs[i]:GetPointByName("BOTTOMLEFT")
            self.tabs[i]:SetPoint(p,r,rp,x,2)
            self.tabs[i].SelectedTexture:Hide()
        else
            self.panels[i]:Show()
            local p,r,rp,x,y = self.tabs[i]:GetPointByName("BOTTOMLEFT")
            self.tabs[i]:SetPoint(p,r,rp,x,0)
            self.tabs[i].SelectedTexture:Show()
        end
    end
end
function EchoRaidTools_TabMainPanelMixin:OnShow()
end

EchoRaidTools_TabButtonMixin = {}
function EchoRaidTools_TabButtonMixin:OnEnter()

end
function EchoRaidTools_TabButtonMixin:OnLeave()

end
function EchoRaidTools_TabButtonMixin:OnClick()
    self.parent:SelectTab(self.position)
end