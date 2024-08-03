-- LiteBag Junk Plugin

local C_Item_GetItemInfo = C_Item.GetItemInfo;
local C_Container_GetContainerItemLink, C_Container_GetContainerItemInfo = C_Container.GetContainerItemLink, C_Container.GetContainerItemInfo;

local CACHE = {};

local function ContainerItemIsJunk(bag, slot)
    local itemLink = C_Container_GetContainerItemLink(bag, slot);

    if CACHE[itemLink] then
        return CACHE[itemLink];
    end

    local itemInfo = C_Container_GetContainerItemInfo(bag, slot);

    if itemInfo then
        local _, _, _, _, _, _, _, _, _, _, sellPrice, classID = C_Item_GetItemInfo(itemLink);
        local isJunk = classID ~= Enum.ItemClass.Questitem and itemInfo.quality == Enum.ItemQuality.Poor and ((sellPrice or 0) * (itemInfo.stackCount or 1)) > 0;

        CACHE[itemLink] = isJunk;

        return isJunk;
    end

    return false;
end

local function UpdateButton(button)
    if not button then
        return;
    end

    if not button:IsShown() then
        button.JunkIcon:Hide();
        SetItemButtonDesaturated(button, false); -- Reset desaturation
        return;
    end

    button.JunkIcon:Hide();

    if not button:HasItem() then
        return;
    end

    local bag  = button:GetBagID();
    local slot = button:GetID();

    button.JunkIcon:SetShown(ContainerItemIsJunk(bag, slot));
end

if LiteBag_RegisterHook then
    LiteBag_RegisterHook('LiteBagItemButton_Update', UpdateButton);
end