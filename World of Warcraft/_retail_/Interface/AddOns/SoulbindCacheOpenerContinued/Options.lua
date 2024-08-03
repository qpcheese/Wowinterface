local _, L = ...;

SoulbindCacheOpener.option_buttons = {};

function SoulbindCacheOpener:initializeOptions() 
    local panel = CreateFrame("Frame");
    panel.name = L["addon_name"];
    local category = Settings.RegisterCanvasLayoutCategory(panel, L["addon_name"]);
    Settings.RegisterAddOnCategory(category);

    local title = panel:CreateFontString("ARTWORK", nil, "GameFontNormalHuge");
    title:SetPoint("TOP");
    title:SetText(L["addon_name"]);
    title:SetTextColor(0.118,0.741,0.447);

    local headhidden = panel:CreateFontString("ARTWORK", nil, "GameFontNormalLarge");
    headhidden:SetText(L["hidden_groups"]);
    headhidden:SetPoint("TOPLEFT", 20, -50 );

    for i, name in ipairs(SoulbindCacheOpener.group_ids_ordered) do
        local cb = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate");
        cb:SetPoint("TOPLEFT", 20, -50 + (-20*i));
        cb.Text:SetText("   " .. L[name]);
        cb.group_id = name;
        local isChecked = false;
        if( SoulbindCacheOpenerDB.ignored_groups[name] ~= nil) then
            isChecked = SoulbindCacheOpenerDB.ignored_groups[name];
        end
        cb:SetChecked(isChecked);
        cb:HookScript("OnClick", function(_, btn, down)
        -- TODO: refactor that out, since it is also used in SoulbindCacheOpener:slashHandler() 
            SoulbindCacheOpenerDB.ignored_groups[name] = cb:GetChecked();
            SoulbindCacheOpener:updateIgnoreItems();
            SoulbindCacheOpener:updateButtons();
        end)
        SoulbindCacheOpener.option_buttons[name] = cb; 
    end

    local text = panel:CreateFontString("ARTWORK", nil, "GameFontWhiteSmall");
    text:SetText(L["option_description"]);
    text:SetPoint("BOTTOMLEFT", 20, 20);
end

function SoulbindCacheOpener:updateOptionCheckbox(group_id, state) 
    if (SoulbindCacheOpener.option_buttons[group_id] ~= nil) then
        SoulbindCacheOpener.option_buttons[group_id]:SetChecked(state);
    end
end 

-- UI strings, translation ready
L["hidden_groups"] = "Hide items"
L["addon_name"] = "Soulbind Cache Opener - Continued"
L["option_description"] = "Further settings can be done with the chat command /sco . For resetting the addon type /sco reset in the chat window."
