local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("AuctionHouseFrame")
local color1, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["AuctionHouseFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored3 then
        color3 = addonTable.classColor
    else
        color3 = dbObj.color3
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_AuctionUI") then
        self:Recolor(color1, color3, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_AuctionUI" then
                self:Recolor(color1, color3, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end

end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_AuctionUI") then
        self:Recolor(color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color3, desaturation)
    for k,v in pairs({
        AuctionFrameTopLeft,
        AuctionFrameTop,
        AuctionFrameTopRight,
        AuctionFrameBotRight,
        AuctionFrameBot,
        AuctionFrameBotLeft,
    
        BrowseDropDownLeft,
        BrowseDropDownMiddle,
        BrowseDropDownRight,

        BrowsePriceOptionsFrame.TopEdge,
        BrowsePriceOptionsFrame.BottomEdge,
        BrowsePriceOptionsFrame.TopRightCorner,
        BrowsePriceOptionsFrame.TopLeftCorner,
        BrowsePriceOptionsFrame.RightEdge,
        BrowsePriceOptionsFrame.LeftEdge,
        BrowsePriceOptionsFrame.BottomRightCorner,
        BrowsePriceOptionsFrame.BottomLeftCorner,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    for k,v in pairs({SideDressUpFrame:GetRegions()}) do 
        if v:GetObjectType() == "Texture" then
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color1.r,color1.g,color1.b)
        end
    end
    for k,v in pairs({BrowseScrollFrame:GetRegions()}) do 
        if v:GetObjectType() == "Texture" then
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color1.r,color1.g,color1.b)
        end
    end
    local SideDressUpModelCloseButton = SideDressUpModelCloseButton
    local nT = SideDressUpModelCloseButton:GetNormalTexture()
    local hT = SideDressUpModelCloseButton:GetHighlightTexture()
    local pT = SideDressUpModelCloseButton:GetPushedTexture()
    for _,texture in pairs({SideDressUpModelCloseButton:GetRegions()}) do 
        if texture ~= nT and texture ~= hT and texture ~= pT then
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color1.r,color1.g,color1.b)
        end
    end
    for _,button in pairs({
        BrowseBidButton,
        BrowseBuyoutButton,
        BrowseCloseButton,
        BidBidButton,
        BidBuyoutButton,
        BidCloseButton
    }) do
        for _,v in pairs({button:GetRegions()}) do 
            if v ~= button.Text and v ~= button.Left and v ~= button.Middle and v ~= button.Right then
                v:SetDesaturation(desaturation)
                v:SetVertexColor(color1.r,color1.g,color1.b)
            end
        end
    end
    for i=1,3 do
        for _,texture in pairs({
            _G["AuctionFrameTab" ..i.. "Left"],
            _G["AuctionFrameTab" ..i.. "Middle"],
            _G["AuctionFrameTab" ..i.. "Right"],
            _G["AuctionFrameTab" ..i.. "LeftDisabled"],
            _G["AuctionFrameTab" ..i.. "MiddleDisabled"],
            _G["AuctionFrameTab" ..i.. "RightDisabled"],
        }) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color3.r,color3.g,color3.b)
        end
    end
end


