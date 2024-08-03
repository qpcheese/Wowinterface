local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ProfessionsCustomerOrdersFrame")
local color1, color2, color3, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ProfessionsCustomerOrdersFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored2 then
        color2 = addonTable.classColor
    else
        color2 = dbObj.color2
    end
    if dbObj.classcolored3 then
        color3 = addonTable.classColor
    else
        color3 = dbObj.color3
    end
    if dbObj.classcolored4 then
        color4 = addonTable.classColor
    else
        color4 = dbObj.color4
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_ProfessionsCustomerOrders") then
        self:Recolor(color1, color2, color3, color4, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_ProfessionsCustomerOrders" then
                self:Recolor(color1, color2, color3, color4, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_ProfessionsCustomerOrders") then
        self:Recolor(color, color, color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color3, color4, desaturation)
    --reskin frames
    for _,frame in pairs({
        ProfessionsCustomerOrdersFrame,
        ProfessionsCustomerOrdersFrame.MoneyFrameInset,
        ProfessionsCustomerOrdersFrame.Form.CurrentListings,
        ProfessionsCustomerOrdersFrame.Form.CurrentListings.OrderList,
        ProfessionsCustomerOrdersFrame.Form.QualityDialog,
        ProfessionsCustomerOrdersFrame.BrowseOrders.CategoryList,
        ProfessionsCustomerOrdersFrame.BrowseOrders.RecipeList,
        ProfessionsCustomerOrdersFrame.MyOrdersPage.OrderList,
        ProfessionsCustomerOrdersFrame.Form.LeftPanelBackground,
        ProfessionsCustomerOrdersFrame.Form.RightPanelBackground,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = ProfessionsCustomerOrdersFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    for _,frame in pairs({
        ProfessionsCustomerOrdersFrameBrowseTab,
        ProfessionsCustomerOrdersFrameOrdersTab,
    }) do 
        addon:SkinTabs(frame, color3)
    end
    --reskin scrollbars
    for _,frame in pairs({
        ProfessionsCustomerOrdersFrame.BrowseOrders.CategoryList,
        ProfessionsCustomerOrdersFrame.BrowseOrders.RecipeList,
        ProfessionsCustomerOrdersFrame.MyOrdersPage.OrderList,
        ProfessionsCustomerOrdersFrame.Form.CurrentListings.OrderList
    }) do 
        addon:SkinScrollBar(frame, color4)
    end
    --window specific regions
    for _,texture in pairs({
        ProfessionsCustomerOrdersFrame.Form.CurrentListings.Bg,
        --ProfessionsCustomerOrdersFrameLeft, catched with MoneyFrameBorder loop
        --ProfessionsCustomerOrdersFrameMiddle,
        --ProfessionsCustomerOrdersFrameRight,
        ProfessionsCustomerOrdersFrame.Form.OrderRecipientTarget.Left,
        ProfessionsCustomerOrdersFrame.Form.OrderRecipientTarget.Middle,
        ProfessionsCustomerOrdersFrame.Form.OrderRecipientTarget.Right,
        ProfessionsCustomerOrdersFrame.Form.PaymentContainer.TipMoneyInputFrame.GoldBox.Left,
        ProfessionsCustomerOrdersFrame.Form.PaymentContainer.TipMoneyInputFrame.GoldBox.Middle,
        ProfessionsCustomerOrdersFrame.Form.PaymentContainer.TipMoneyInputFrame.GoldBox.Right,
        ProfessionsCustomerOrdersFrame.Form.PaymentContainer.TipMoneyInputFrame.SilverBox.Left,
        ProfessionsCustomerOrdersFrame.Form.PaymentContainer.TipMoneyInputFrame.SilverBox.Middle,
        ProfessionsCustomerOrdersFrame.Form.PaymentContainer.TipMoneyInputFrame.SilverBox.Right,
    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    for _,region in pairs ({
        ProfessionsCustomerOrdersFrame.MoneyFrameBorder:GetRegions(),
    }) do
        region:SetDesaturation(desaturation)
        region:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


