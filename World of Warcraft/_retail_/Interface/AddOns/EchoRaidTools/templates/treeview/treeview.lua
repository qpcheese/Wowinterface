local _AddonName, _EchoRaidTools = ...

--[[
Treeview widget:

    myTreeView = _EchoRaidTools:CreateTreeView(parent, treeTable, indentSize)
        - Creates and returns the new tree view frame.  
        - treeTable example below
        - indentSize is number of pixels for each level of the treeView

    myTreeView:ProcessItemTable(updatedTreeTable, fullReset)
        - updates the existing treeview with an updated table. 
        - fullReset [bool] if all currently open nodes can be refreshed/closed

    exampleTreeTable = {
        {
            type = "node",
            title = "Node1",
            icon = 236709,
            children = {
                {
                    type = "button",
                    title = "child button1",
                    clickFunc = function() print("child button1 clicked") end,
                },
                {
                    type = "node",
                    title = "Node2",
                    children = {
                        {
                            type = "button",
                            title = "child child button1",
                            clickFunc = function() print("child child button1 clicked") end,
                        },
                        {
                            type = "button",
                            title = "child child button2",
                            clickFunc = function() print("child child button2 clicked") end,
                        },
                    }
                },
                {
                    type = "button",
                    title = "child button2",
                    clickFunc = function() print("child button2 clicked") end,
                },
            },
        },
    }
        - Nodes must provide [type = "node", title = "string", children = table, id = value]
        - buttons must provide [type = "button", title = "string", id = value, clickFunc = function]
        - `id` should be unique
        - Optional values:
            - `icon` can be provided to show an icon on the left of the node/button. Provide a valid path/id
            - `defaultOpen = bool` will set the node open by default

            - nodes and buttons also accept a `template` which will be used instead of the default treeview template. 
                - optional `resetFunc` and `initFunc` functions can be defined and will be used when your template's pool is created.
                - if your template provides an `additionalSetup` method then it will be run after the base template's setup func
                    - it will be called with the current subTable of the treeTable, allowing you to add whatever info you need to the treeTable for your template 
                    - For an example of it treeView being overloaded for a specific use see CooldownNavigationTemplate in the Cooldown module
]]

local nodeReset = function(pool, item)
    item.title = nil
    item.id = nil
    item.Button.title = nil
    item.parent = nil
    item.expanded = false
    item.children:Hide()
    item:Hide()
    item:ClearAllPoints()
end
local nodeInit = function() end

local buttonReset = function(pool, item)
    item.title = nil
    item.id = nil
    item.parent = nil
    item:Hide()
    item:ClearAllPoints()
end
local buttonInit = function() end

EchoRaidTools_TreeviewMixin = {}

function _EchoRaidTools:CreateTreeView(parent, items, indent)
    local treeview = CreateFrame("FRAME", nil, parent, "EchoRaidTools_Treeview_Frame")
    treeview:OnLoad(items, indent)
    return treeview
end
EchoRaidTools_Treeview_FrameMixin = {}
function EchoRaidTools_Treeview_FrameMixin:OnLoad(items, indent)
    self.indent = indent or 20
    self.nodePool = CreateFramePool("FRAME", self, "EchoRaidTools_Treeview_Node", nodeReset, nil, nodeInit)
    self.buttonPool = CreateFramePool("BUTTON", self, "EchoRaidTools_Treeview_Button", buttonReset, nil, buttonInit)
    self:ProcessItemTable(items, true)
end

function EchoRaidTools_Treeview_FrameMixin:ProcessItemTable(items, fullReset)
    local openNodes
    if not fullReset then
        openNodes = self:GetOpenNodes()
    end
    self:ReleaseAllChildren()
    local processTable
    processTable = function(items, parentNode)
        for i, info in ipairs(items) do
            if info.type == "node" then
                local node
                if info.template then
                    if not self[info.template.."pool"] then
                        self[info.template.."pool"] = CreateFramePool("FRAME", self, info.template, info.resetFunc or nodeReset, nil, info.initFunc or nodeInit)
                    end
                    node = self[info.template.."pool"]:Acquire()
                    node.pool = self[info.template.."pool"]
                else
                    node = self.nodePool:Acquire()
                    node.pool = self.nodePool
                end
                node.id = info.id
                node:SetParent(parentNode.children)
                node.parent = parentNode
                node.treeviewParentFrame = self
                node:SetupNode(info)
                parentNode.children[i] = node
                node.children:SetPoint("TOPLEFT", node.Button, "BOTTOMLEFT", self.indent, 0)
                processTable(info.children, node)
                node.defaultOpen = info.defaultOpen
            elseif info.type == "button" then
                local button
                if info.template then
                    if not self[info.template.."pool"] then
                        self[info.template.."pool"] = CreateFramePool("BUTTON", self, info.template, info.resetFunc or buttonReset, nil, info.initFunc or buttonInit)
                    end
                    button = self[info.template.."pool"]:Acquire()
                    button.pool = self[info.template.."pool"]
                else
                    button = self.buttonPool:Acquire()
                    button.pool = self.buttonPool
                end
                button.id = info.id
                button:SetParent(parentNode.children)
                button.parent = parentNode
                button.treeviewParentFrame = self
                button:SetupButton(info)
                parentNode.children[i] = button
            end
        end
    end
    processTable(items, self)
    self:SetChildPositions()
    self:ApplyOpenNodes(openNodes)
end
function EchoRaidTools_Treeview_FrameMixin:SetChildPositions()
    local positionChildren
    positionChildren = function(children, parentChildrenContainer)
        local lastItem
        for i, child in ipairs(children) do
            child:Show()
            if lastItem then
                child:SetPoint("TOPLEFT", lastItem.children or lastItem, "BOTTOMLEFT", lastItem.children and -self.indent or 0, 0)
                child:SetPoint("TOPRIGHT", lastItem.children or lastItem, "BOTTOMRIGHT")
            else
                child:SetPoint("TOPLEFT", parentChildrenContainer, "TOPLEFT")
                child:SetPoint("TOPRIGHT", parentChildrenContainer, "TOPRIGHT")
            end
            lastItem = child
            if child.children then
                positionChildren(child.children, child.children)
                child.children:Hide()
                child.children:SetPoint("BOTTOMRIGHT", child.Button, "BOTTOMRIGHT")
            end
        end
    end
    positionChildren(self.children, self.children)
    self:SetFrameHeight()
end
function EchoRaidTools_Treeview_FrameMixin:ReleaseAllChildren()
    local iterateAndRelease
    iterateAndRelease = function(children)
        for i = #children, 1, -1 do
            local child = children[i]
            if child.type == "node" and child.children then
                iterateAndRelease(child.children)
                child.pool:Release(child)
                --self.nodePool:Release(child)
                children[i] = nil
            elseif child.type == "button" then
                child.pool:Release(child)
                --self.buttonPool:Release(child)
                children[i] = nil
            end
        end
    end
    iterateAndRelease(self.children)
end
function EchoRaidTools_Treeview_FrameMixin:SetFrameHeight()
    local height = 0
    local iterateVisible
    iterateVisible = function(node)
        for i, child in ipairs(node.children) do
            if child.children and child.expanded then
                if child.Button then
                    height = height + child.Button:GetHeight()
                end
                iterateVisible(child)
            else
                height = height + child:GetHeight()
            end
        end
    end
    iterateVisible(self)
    self.height = height
    if self:IsShown() then
        local p, r, rp, x, y = self:GetPointByName("TOPLEFT")
        self:SetPoint("BOTTOMLEFT", r, rp, x, -height)
    end
end
function EchoRaidTools_Treeview_FrameMixin:GetOpenNodes()
    local openNodes = {}
    local iterateNodes
    iterateNodes = function(node)
        for i, child in ipairs(node.children) do
            if child.children and child.expanded then
                openNodes[child.id] = true
                iterateNodes(child)
            end
        end
    end
    iterateNodes(self)
    return openNodes
end
function EchoRaidTools_Treeview_FrameMixin:ApplyOpenNodes(openNodes)
    if not openNodes then return end
    local iterateNodes
    iterateNodes = function(node)
        for i, child in ipairs(node.children) do
            if child.children then
                if (openNodes and openNodes[child.id]) or child.defaultOpen then
                    child:Toggle()
                end
                iterateNodes(child)
            end
        end
    end
    iterateNodes(self)
    return openNodes
end
function EchoRaidTools_Treeview_FrameMixin:GetFrameByID(id, getChildrenFrame)
    local retFrame
    local iterateFrames
    iterateFrames = function(node)
        for i, child in ipairs(node.children) do
            if child.id == id then
                if getChildrenFrame and child.children then
                    retFrame = child.children
                else
                    retFrame = child
                end
                return
            elseif child.children then
                iterateFrames(child)
            end
        end
    end
    iterateFrames(self)
    return retFrame
end

EchoRaidTools_Treeview_BaseButtonMixin = {}
function EchoRaidTools_Treeview_BaseButtonMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
    self.HighlightTexture:Show()
end
function EchoRaidTools_Treeview_BaseButtonMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
    self.HighlightTexture:Hide()
end
function EchoRaidTools_Treeview_BaseButtonMixin:SetTitle(text)
    self.title = text
    self.ButtonText:SetText(text)
end
function EchoRaidTools_Treeview_BaseButtonMixin:SetIcon(icon)
    if icon then
        if C_Texture.GetAtlasInfo(icon) then
            self.Icon:SetAtlas(icon)
        else
            self.Icon:SetTexture(icon)
        end
        self.Icon:Show()
        local _,region,relativePoint = self.Icon:GetPointByName("LEFT")
        self.Icon:SetPoint("RIGHT", region, relativePoint, self.Icon:GetHeight(), 0)
    else
        self.Icon:Hide()
        local _,region,relativePoint = self.Icon:GetPointByName("LEFT")
        self.Icon:SetPoint("RIGHT", region, relativePoint, 0, 0)
    end
end

EchoRaidTools_Treeview_ButtonMixin = {}
function EchoRaidTools_Treeview_ButtonMixin:SetupButton(info)
    self:SetTitle(info.title)
    self:SetIcon(info.icon)
    self:SetClickFunc(info.clickFunc)
    self.tooltip = info.tooltip
    if self.AdditionalSetup then
        self:AdditionalSetup(info)
    end
end
function EchoRaidTools_Treeview_ButtonMixin:OnClick()
    if self.clickFunc then
        PlaySound(62538)
        self.clickFunc()
    end
end
function EchoRaidTools_Treeview_ButtonMixin:SetClickFunc(func)
    self.clickFunc = func
end
function EchoRaidTools_Treeview_ButtonMixin:OnLoad()
    self.type = "button"
    self.OpenArrow:Hide()
    self.OpenArrow:SetPoint("RIGHT", self, "LEFT", 1, 0)
end

EchoRaidTools_Treeview_NodeButtonMixin = {}
function EchoRaidTools_Treeview_NodeButtonMixin:OnClick()
    self.parent:Toggle(true)
end

EchoRaidTools_Treeview_NodeMixin = {}
function EchoRaidTools_Treeview_NodeMixin:OnLoad()
    self.expanded = false
    self.Button.parent = self
    self.type = "node"
    self.Button.OpenArrow:Show()
    self.Button.OpenArrow:SetRotation(math.rad(90))
end
function EchoRaidTools_Treeview_NodeMixin:SetupNode(info)
    self:SetTitle(info.title)
    self:SetIcon(info.icon)
    self.tooltip = info.tooltip
    if self.AdditionalSetup then
        self:AdditionalSetup(info)
    end
end
function EchoRaidTools_Treeview_NodeMixin:SetTitle(text)
    self.title = text
    self.Button:SetTitle(text)
end
function EchoRaidTools_Treeview_NodeMixin:SetIcon(icon)
    self.icon = icon
    self.Button:SetIcon(icon)
end
function EchoRaidTools_Treeview_NodeMixin:Toggle(bool)
    if self.expanded then
        if bool then
            PlaySound(19972)
        end
        self.children:Hide()
        self.Button.OpenArrow:SetRotation(math.rad(90))
        self.Button.OpenArrow:SetDesaturated(true)
        self.Button.OpenArrow:SetAlpha(0.4)
        self.Button.ButtonText:SetTextColor(1, 1, 1)
        self.expanded = false
    else
        if bool then
            PlaySound(604)
        end
        self.children:Show()
        self.Button.OpenArrow:SetRotation(math.rad(0))
        self.Button.OpenArrow:SetDesaturated(false)
        self.Button.OpenArrow:SetAlpha(0.6)
        self.Button.ButtonText:SetTextColor(1, 0.82, 0.1)
        self.expanded = true
    end
    self:SetChildrenHeight()
    self.treeviewParentFrame:SetFrameHeight()
end
function EchoRaidTools_Treeview_NodeMixin:SetChildrenHeight()
    local setParentHeight
    setParentHeight = function(node)
        if node.expanded then
            local childHeight = node:GetChildrenHeight()
            node.children:SetPoint("BOTTOMRIGHT", node.Button, "BOTTOMRIGHT", 0, -childHeight)
            setParentHeight(node.parent)
        elseif node.children and node.Button then
            node.children:SetPoint("BOTTOMRIGHT", node.Button, "BOTTOMRIGHT")
            setParentHeight(node.parent)
        end
    end
    setParentHeight(self)
end
function EchoRaidTools_Treeview_NodeMixin:GetChildrenHeight()
    local height = 0
    local getHeight
    getHeight = function(children)
        for i, child in ipairs(children) do
            height = height + child:GetHeight()
            if child.children and child.expanded then
                getHeight(child.children)
            end
        end
    end
    getHeight(self.children)
    return height
end