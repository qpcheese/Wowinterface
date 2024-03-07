local threshold
local IUI = LibStub("LibItemUpgradeInfo-1.0")

local ilevel = function(...)
	local ilevel = -1
	local upgrades, upgraded
	for i=1, select('#', ...) do
		local itemLink = select(i, ...)

		if (itemLink) then
			local upgradeID = IUI:GetUpgradeID(itemLink)
			ilevel = IUI:GetUpgradedItemLevel(itemLink)
			upgrades, upgraded = IUI:GetMaximumUpgrade(upgradeID),IUI:GetCurrentUpgrade(upgradeID)
			if not ilevel then
				ilevel = -1
			end
		end
	end

	if ilevel and (ilevel >= threshold) then
		if upgrades and upgraded then
			--ilevel = ilevel.." ("..upgraded.."/"..upgrades..")" -- Not official for release.
		end
		return ilevel
	end
end

SyLevel:RegisterOptionCallback(function(db)
	local filters = db.FilterSettings
	if(filters and filters.ilevel) then
		threshold = filters.ilevel
	else
		threshold = 1
	end
end)

SyLevel:RegisterFilter('Item level text', 'Text', ilevel, [[Adds item level text that the items have.]])
