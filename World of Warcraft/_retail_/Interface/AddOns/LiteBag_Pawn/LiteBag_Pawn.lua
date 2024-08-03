-- LiteBag Pawn Support Plugin

local function UpdateButton(button)
    if not button then
        return;
    end

    if not (button:IsShown() and PawnIsContainerItemAnUpgrade and button.UpgradeIcon) then
        return;
    end

    button.UpgradeIcon:Hide();

    if not button:HasItem() then
        return;
    end

    local bag  = button:GetBagID();
    local slot = button:GetID();

    local isUpgrade = PawnIsContainerItemAnUpgrade(bag, slot);

    button.UpgradeIcon:SetShown(isUpgrade);
end

if LiteBag_RegisterHook then
    LiteBag_RegisterHook('LiteBagItemButton_Update', UpdateButton);
end