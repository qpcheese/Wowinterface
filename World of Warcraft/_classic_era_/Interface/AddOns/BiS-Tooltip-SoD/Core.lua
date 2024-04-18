BiSTooltip = LibStub("AceAddon-3.0"):NewAddon("Bis-Tooltip")
--local AceAddon =

Bistooltip_char_equipment = {}

local function createEquipmentWatcher()
    local frame = CreateFrame("Frame")
    frame:Hide()

    frame:SetScript("OnEvent", frame.Show)
    frame:RegisterEvent("BAG_UPDATE")

    local flag = false

    frame:SetScript("OnUpdate", function(self)
        self:Hide()
        if flag == false then
            flag = true
            local collection = {}
            for bag = 0, NUM_BAG_SLOTS do
                for slot = 1, C_Container.GetContainerNumSlots(bag) do
                    local itemID = C_Container.GetContainerItemID(bag, slot)
                    if itemID ~= nil then
                        collection[itemID] = 1
                    end
                end
            end
            for i = 0, 18 do
                local itemID = GetInventoryItemID("player", i)
                if itemID ~= nil then
                    collection[itemID] = 2
                end
            end
            Bistooltip_char_equipment = collection
            flag = false
        end
    end)
end

function BiSTooltip:OnInitialize()
    createEquipmentWatcher()
    BiSTooltip.AceAddonName = "Bis-Tooltip"
    --[==[@debug@
    ver = ' Dev Mode'
    --@end-debug@]==]
    --@non-debug@
	ver = ' v1.3'
	--@end-non-debug@

    BiSTooltip.AddonNameAndVersion = "Bis-Tooltip" .. ver
    BiSTooltip:initConfig()
    BiSTooltip:addMapIcon()
    BiSTooltip:initBislists()
    BiSTooltip:initBisTooltip()
end
