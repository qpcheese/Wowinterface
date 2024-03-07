local _AddonName, _EchoRaidTools = ...

-----------------------------------------------------------------
-- TODO Remove me!
--__EchoRaidTools = _EchoRaidTools
-----------------------------------------------------------------

EchoRaidToolsDB = EchoRaidToolsDB or {}

EchoAddon:Initialize(_EchoRaidTools, _AddonName)

local LSM = LibStub("LibSharedMedia-3.0");
LSM:Register("font", "Expressway MonoNum", "Interface\\AddOns\\EchoRaidTools\\assets\\ExpresswayMonoNum.ttf", LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western)

function _EchoRaidTools:ADDON_LOADED(name)
    if name == _AddonName then
        -- Load Modules

        for _, module in ipairs(_EchoRaidTools.modules or {}) do
            if module["ADDON_LOADED"] and type(module["ADDON_LOADED"]) == "function" then
                module["ADDON_LOADED"](module, name)
            end
        end

        local LibDBIcon = LibStub("LibDBIcon-1.0", true)
        do -- add minimap icon
            EchoRaidToolsDB.minimap = EchoRaidToolsDB.minimap or {}
            EchoRaidToolsDB.compartment = EchoRaidToolsDB.compartment == nil and true or EchoRaidToolsDB.compartment
            local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("EchoRaidTools",
                {
                    type = "data source",
                    text = "EchoRaidTools",
                    icon = "Interface\\AddOns\\EchoRaidTools\\assets\\textures\\ELp3.tga",

                    OnClick = function(self, btn)
                        EchoRaidTools_Toggle()
                    end,

                    OnTooltipShow = function(tooltip)
                        if not tooltip or not tooltip.AddLine then return end
                        tooltip:AddLine("EchoRaidTools")
                        tooltip:AddLine([[Click to toggle the config
|cffaaaaaaUse "/echort minimap" to toggle the minimap button|r
|cffaaaaaaUse "/echort compartment" to toggle the compartment button|r]])
                    end,
                }
            )
            LibDBIcon:Register("EchoRaidTools", miniButton, EchoRaidToolsDB.minimap)

            if EchoRaidToolsDB.compartment then
                LibDBIcon:AddButtonToCompartment("EchoRaidTools")
            end
        end

        local AceConsole = LibStub:GetLibrary("AceConsole-3.0")
        if AceConsole then
            AceConsole:RegisterChatCommand("echort", function(msg)
                if msg == "reset" then
                    if _EchoRaidTools.panels.main then
                        _EchoRaidTools.panels.main:SetPoint("CENTER", UIParent, "CENTER")
                    end
                    EchoRaidTools_Toggle()
                elseif msg == "minimap" then
                    EchoRaidToolsDB.minimap.hide = not EchoRaidToolsDB.minimap.hide
                    if EchoRaidToolsDB.minimap.hide then
                        LibDBIcon:Hide("EchoRaidTools")
                    else
                        LibDBIcon:Show("EchoRaidTools")
                    end
                elseif msg == "compartment" then
                    EchoRaidToolsDB.compartment = not EchoRaidToolsDB.compartment
                    if EchoRaidToolsDB.compartment then
                        LibDBIcon:AddButtonToCompartment("EchoRaidTools")
                    else
                        LibDBIcon:RemoveButtonFromCompartment("EchoRaidTools")
                    end
                else
                    EchoRaidTools_Toggle()
                end
            end)
        end

    end
end

function _EchoRaidTools:PLAYER_ENTERING_WORLD(isInitialLogin, isReloadingUi)
    if(isInitialLogin or isReloadingUi)then
        _EchoRaidTools:InitializeEncounterData();
    end
end

function _EchoRaidTools:GetEchoColor()
    return {0.898, 0.063, 0.224, 1}
end