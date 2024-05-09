local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local pairs = pairs
local SetVertexColor = SetVertexColor
local GetParent = GetParent
local SetBackdropBorderColor = SetBackdropBorderColor
local IsObjectType = IsObjectType

local module = addon:NewModule("Ace3_Skin")
local color
local Ace3GUI = nil
local hooked = nil

function module:OnEnable()
    AceGUI = LibStub("AceGUI-3.0", true)
    if not AceGUI then 
        return 
    end
    local dbObj = addon.db.profile["Skins"]["Ace3_Skin"]
    if dbObj.classcolored1 then
        color = addonTable.classColor
    else
        color = dbObj.color1
    end
    self:Recolor()
end

function module:OnDisable()
    --reload
end

--AceGUI-3.0-SharedMediaWidgets
local function recolorAGSMW(widget)
    for _,v in pairs ({
        "DLeft",
        "DMiddle",
        "DRight"
    }) do
        widget.frame[v]:SetVertexColor(color.r,color.g,color.b,color.a)
    end
end

local recolorWidget = {
    --CONTAINER
    --Frame
    ["Frame"] = function(widget)
        --widget.frame:SetBackdropBorderColor(color.r,color.g,color.b,color.a)
        widget.statustext:GetParent():SetBackdropBorderColor(color.r,color.g,color.b,color.a)
        for _,v in pairs ({
            widget.frame:GetRegions()
        }) do
            if v:IsObjectType("Texture") then
                v:SetVertexColor(color.r,color.g,color.b,color.a)
            end
        end
    end,
    --TabGroup
    ["TabGroup"] = function(widget)
        widget.border:SetBackdropBorderColor(color.r,color.g,color.b,color.a)
        local origCreateTab = widget.CreateTab
        widget.CreateTab = function(self, id)
            local tab = origCreateTab(self, id)
            for _, region in pairs ({
                "Left",
                "Middle",
                "Right",
                "LeftDisabled",
                "MiddleDisabled",
                "RightDisabled",
            }) do
                tab[region]:SetVertexColor(color.r,color.g,color.b,color.a)
            end
            return tab
        end
    end,
    --TreeGroup
    ["TreeGroup"] = function(widget)
        widget.border:SetBackdropBorderColor(color.r,color.g,color.b,color.a)
        widget.treeframe:SetBackdropBorderColor(color.r,color.g,color.b,color.a)
    end,
    --InlineGroup
    ["InlineGroup"] = function(widget)
        widget.content:GetParent():SetBackdropBorderColor(color.r,color.g,color.b,color.a)
    end,
    --WIDGETS
    --Dropdown
    ["Dropdown"] = function(widget)
        for _,v in pairs ({
            "Left",
            "Middle",
            "Right"
        }) do
            widget.dropdown[v]:SetVertexColor(color.r,color.g,color.b,color.a)
        end
    end,
    --Dropdown-Pullout
    ["Dropdown-Pullout"] = function(widget)
        widget.frame:SetBackdropBorderColor(color.r,color.g,color.b,color.a)
    end,
    --Slider
    ["Slider"] = function(widget)
        widget.slider:SetBackdropBorderColor(color.r,color.g,color.b,color.a)
    end,
    --EditBox
    ["EditBox"] = function(widget)
        for _,v in pairs ({
            "Left",
            "Middle",
            "Right"
        }) do
            widget.editbox[v]:SetVertexColor(color.r,color.g,color.b,color.a)
        end
    end,
    --MultiLineEditBox
    ["MultiLineEditBox"] = function(widget)
        widget.scrollBG:SetBackdropBorderColor(color.r,color.g,color.b,color.a)
    end,
    --Heading
    ["Heading"] = function(widget)
        widget.left:SetVertexColor(color.r,color.g,color.b,color.a)
        widget.right:SetVertexColor(color.r,color.g,color.b,color.a)
    end,
    --LSM30_Font
    ["LSM30_Font"] = function(widget) recolorAGSMW(widget) end,
    --LSM30_Statusbar
    ["LSM30_Statusbar"] = function(widget) recolorAGSMW(widget) end,
    --LSM30_Border
    ["LSM30_Border"] = function(widget) recolorAGSMW(widget) end,
    --LSM30_Background
    ["LSM30_Background"] = function(widget) recolorAGSMW(widget) end,
}


function module:Recolor()
    if not hooked then
        ----------------------------------------------------
        --##CONTAINER
        ----------------------------------------------------
        local origRegisterAsContainer = AceGUI.RegisterAsContainer
        AceGUI.RegisterAsContainer = function(self, widget)
            local widgetType = widget.type
            if recolorWidget[widgetType] then
                recolorWidget[widgetType](widget)
            end
            return origRegisterAsContainer(self, widget)
        end
        ----------------------------------------------------
        --##WIDGETS
        ----------------------------------------------------
        local origRegisterAsWidget = AceGUI.RegisterAsWidget
        AceGUI.RegisterAsWidget = function(self, widget)
            local widgetType = widget.type
            if recolorWidget[widgetType] then
                recolorWidget[widgetType](widget)
            end
            return origRegisterAsWidget(self, widget)
        end
        hooked = true
    end
    --update pool
    --[[
    local objPools = AceGUI.objPools
    for widgetType, _ in pairs (recolorWidget) do
        if objPools[widgetType] then
            local objPool = objPools[widgetType]
            for widget,_ in pairs (objPool) do
                recolorWidget[widgetType](widget)
            end
        end
    end
    ]]--
    ----------------------------------------------------
    --##AGSMW
    ---------------------------------------------------- 
    local AGSMW = LibStub("AceGUISharedMediaWidgets-1.0", true)
    if AGSMW then
        local frame = AGSMW:GetDropDownFrame()
        frame:SetBackdropBorderColor(color.r,color.g,color.b,color.a)
        AGSMW:ReturnDropDownFrame(frame)
    end
    ----------------------------------------------------
    --##TOOLTIP
    ---------------------------------------------------- 
    --todo
end


