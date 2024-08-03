-- LiteBag Item Level Plugin

local ADDON_NAME, NS = ...;

local C_Item_GetItemInfoInstant = C_Item.GetItemInfoInstant;
local C_Item_GetCurrentItemLevel = C_Item.GetCurrentItemLevel;
local C_Container_GetContainerItemLink, C_Container_GetContainerItemInfo = C_Container.GetContainerItemLink, C_Container.GetContainerItemInfo;
local ITEM_QUALITY_COLORS = ITEM_QUALITY_COLORS;

local CACHE = {};

local ITEM_CLASSES = {
    [Enum.ItemClass.Weapon]     = true,
    [Enum.ItemClass.Armor]      = true,
    -- [Enum.ItemClass.Gem]        = true,
    [Enum.ItemClass.Profession] = true,
};

local function GetContainerItemLevelAndQuality(bag, slot)
    local itemLink = C_Container_GetContainerItemLink(bag, slot);
    local cached = CACHE[itemLink];

    if cached then
        return cached.itemLevel, cached.quality;
    end

    local itemInfo = C_Container_GetContainerItemInfo(bag, slot);

    if not itemInfo then
        return;
    end

    local _, _, _, _, _, classID = C_Item_GetItemInfoInstant(itemLink);
    local itemLevel, quality;

    if classID == nil then -- Hmmm...
        local tooltipData = C_TooltipInfo.GetBagItem(bag, slot);

        if tooltipData and tooltipData.battlePetLevel and tooltipData.battlePetBreedQuality then
            if not CACHE[itemLink] then
                CACHE[itemLink] = {};
            end

            itemLevel = tooltipData.battlePetLevel;
            quality   = tooltipData.battlePetBreedQuality;
        end
    elseif ITEM_CLASSES[classID] then
        local itemLocation = ItemLocation:CreateFromBagAndSlot(bag, slot);
        itemLevel = itemLocation and C_Item_GetCurrentItemLevel(itemLocation);
        quality   = itemInfo.quality;
    end

    if itemLevel then
        if not CACHE[itemLink] then
            CACHE[itemLink] = {};
        end

        CACHE[itemLink].itemLevel = itemLevel;
        CACHE[itemLink].quality   = quality;

        return itemLevel, quality;
    end
end

local function UpdateButton(button)
    if not button:IsShown() then
        return;
    end

    if button.count then
        local font = button.count >= 1000 and NumberFont_OutlineThick_Mono_Small or NumberFontNormal;
        button.Count:SetFontObject(font);
        button.Count:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 0, 2);
    end

    if not button.ItemLevel then
        button.ItemLevel = button:CreateFontString(nil, 'ARTWORK', 'NumberFontNormal');
        button.ItemLevel:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 0, 2);
        button.ItemLevel:SetJustifyH('RIGHT');
    end

    button.ItemLevel:Hide();

    if not button:HasItem() then
        return;
    end

    local bag  = button:GetBagID();
    local slot = button:GetID();

    local itemLevel, quality = GetContainerItemLevelAndQuality(bag, slot);

    if itemLevel and quality then
        button.ItemLevel:SetText(itemLevel);

        if LiteBagItemLevelDB.useColoring then
            button.ItemLevel:SetTextColor(ITEM_QUALITY_COLORS[quality].color:GetRGB());
        else
            button.ItemLevel:SetTextColor(1, 1, 1);
        end

        button.ItemLevel:Show();
    end
end

if LiteBag_RegisterHook then
    LiteBag_RegisterHook('LiteBagItemButton_Update', UpdateButton);
end

EventUtil.ContinueOnAddOnLoaded(ADDON_NAME, function()
    LiteBagItemLevelDB = LiteBagItemLevelDB or {};

    if LiteBagItemLevelDB.useColoring == nil then
        LiteBagItemLevelDB.useColoring = true;
    end

    _G['SLASH_LITEBAG_ITEMLEVEL1'] = '/lbil';
    SlashCmdList['LITEBAG_ITEMLEVEL'] = function(input)
        if input then
            if string.find(input, 'usecolor') then
                local _, state = strsplit(' ', input);

                if state then
                    LiteBagItemLevelDB.useColoring = state == '1' and true or false;
                end
            end
        end
    end
end);