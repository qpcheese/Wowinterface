-- LiteBag Uncollected Plugin

local ipairs, string_find = ipairs, string.find;
local C_TooltipInfo_GetHyperlink = C_TooltipInfo.GetHyperlink;
local TRANSMOGRIFY_STYLE_UNCOLLECTED, TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN = TRANSMOGRIFY_STYLE_UNCOLLECTED, TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN;
local C_Container_GetContainerItemLink, C_TransmogCollection_PlayerHasTransmogByItemInfo = C_Container.GetContainerItemLink, C_TransmogCollection.PlayerHasTransmogByItemInfo;

local function IsItemUncollected(itemLink)
    local tooltipData = C_TooltipInfo_GetHyperlink(itemLink);

    if tooltipData then
        for _, line in ipairs(tooltipData.lines) do
            local text = line.leftText;
            if text and (string_find(text, TRANSMOGRIFY_STYLE_UNCOLLECTED) or string_find(text, TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN)) then
                return true;
            end
        end
    end
end

local function UpdateButton(button)
    if not button then
        return;
    end

    if not button:IsShown() then
        return;
    end

    if not button.Uncollected then
        button.Uncollected = button:CreateTexture(nil, 'OVERLAY');
        button.Uncollected:SetPoint('CENTER', button.IconBorder, 'CENTER', 0, 0);
        button.Uncollected:SetSize(28, 24);
        button.Uncollected:SetAtlas('transmog-icon-hidden');
    end

    button.Uncollected:Hide();

    if not button:HasItem() then
        return;
    end

    local bag  = button:GetBagID();
    local slot = button:GetID();

    local itemLink = C_Container_GetContainerItemLink(bag, slot);

    if itemLink and not C_TransmogCollection_PlayerHasTransmogByItemInfo(itemLink) then
        button.Uncollected:SetShown(IsItemUncollected(itemLink));
    end
end

if LiteBag_RegisterHook then
    LiteBag_RegisterHook('LiteBagItemButton_Update', UpdateButton);
end