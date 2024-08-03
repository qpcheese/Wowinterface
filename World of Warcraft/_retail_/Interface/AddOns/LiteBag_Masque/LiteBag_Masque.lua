-- LiteBag Masque Support Plugin

local Masque = LibStub and LibStub('Masque', true);

if not Masque then
    return;
end

local group = Masque:Group('LiteBag');

function AddButton(button)
    if button then
        group:AddButton(button);
    end
end

if LiteBag_RegisterHook then
    LiteBag_RegisterHook('LiteBagItemButton_Create', AddButton);
end
