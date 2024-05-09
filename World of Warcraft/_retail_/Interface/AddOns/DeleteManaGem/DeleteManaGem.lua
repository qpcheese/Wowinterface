CreateFrame("Button", "DeleteManaGem"):SetScript("OnClick", function()
    for b = 0, NUM_BAG_SLOTS do
        for s = 1, C_Container.GetContainerNumSlots(b) do
            if C_Container.GetContainerItemID(b, s) == 36799 then
                ClearCursor()
                C_Container.PickupContainerItem(b, s)
                DeleteCursorItem()
                return
            end
        end
    end
end)