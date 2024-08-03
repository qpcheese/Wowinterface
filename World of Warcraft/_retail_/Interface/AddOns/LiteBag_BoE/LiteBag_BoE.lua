-- LiteBag BoE Indicator Plugin
-- Based on xodiv's BindsOn plugin

local BankButtonIDToInvSlotID, ReagentBankButtonIDToInvSlotID = BankButtonIDToInvSlotID, ReagentBankButtonIDToInvSlotID;
local C_TooltipInfo_GetInventoryItem, C_TooltipInfo_GetBagItem = C_TooltipInfo.GetInventoryItem, C_TooltipInfo.GetBagItem;
local TooltipUtil_FindLinesFromData = TooltipUtil.FindLinesFromData;

local BindColors = {
    [ITEM_ACCOUNTBOUND]        = CreateColor(0, 0.6, 0.89), -- Vivid Cerulean
    [ITEM_BNETACCOUNTBOUND]    = CreateColor(0, 0.6, 0.89), -- Vivid Cerulean
    [ITEM_BIND_TO_ACCOUNT]     = CreateColor(0, 0.6, 0.89), -- Vivid Cerulean
    [ITEM_BIND_TO_BNETACCOUNT] = CreateColor(0, 0.6, 0.89), -- Vivid Cerulean
    [ITEM_BIND_ON_EQUIP]       = CreateColor(0.6, 0, 1, 1), -- Violet
    [ITEM_BIND_ON_USE]         = CreateColor(0.6, 0, 1, 1), -- Violet
    [TOOLTIP_BATTLE_PET]       = CreateColor(1, 1, 1, 1),   -- White
};

local lineQuery = {
    Enum.TooltipDataLineType.ItemBinding,
};

local function GetContainerItemBindColor(bag, slot)
    local tooltipData;

    if bag == Enum.BagIndex.Bank then
        tooltipData = C_TooltipInfo_GetInventoryItem('player', BankButtonIDToInvSlotID(slot));
    elseif bag == Enum.BagIndex.ReagentBank then
        tooltipData = C_TooltipInfo_GetInventoryItem('player', ReagentBankButtonIDToInvSlotID(slot));
    else
        tooltipData = C_TooltipInfo_GetBagItem(bag, slot);
    end

    if not tooltipData then
        return;
    end

    if tooltipData.battlePetSpeciesID then
        return BindColors[TOOLTIP_BATTLE_PET];
    end

    local bindingLines = TooltipUtil_FindLinesFromData(lineQuery, tooltipData);

    if #bindingLines == 1 then
        local text = bindingLines[1].leftText;

        if text and BindColors[text] then
            return BindColors[text];
        end
    end
end

local function UpdateButton(button)
    if not button:IsShown() then
        return;
    end

    if not button.BoE then
        button.BoE = button:CreateTexture(nil, 'OVERLAY', nil, 7);
        button.BoE:SetPoint('TOPLEFT', button, 'TOPLEFT', 0, 0);
        button.BoE:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 0, 0);
        button.BoE:SetTexture('Interface\\AddOns\\LiteBag_BoE\\indicator_white.blp');
    end

    button.BoE:Hide();

    if not button:HasItem() then
        return;
    end

    local bag  = button:GetBagID();
    local slot = button:GetID();

    local color = GetContainerItemBindColor(bag, slot);

    if color then
        button.BoE:SetVertexColor(color:GetRGBA());
        button.BoE:Show();
    end
end

if LiteBag_RegisterHook then
    LiteBag_RegisterHook('LiteBagItemButton_Update', UpdateButton);
end