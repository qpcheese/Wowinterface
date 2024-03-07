--[[

## Title: FilterWorldMap
## Notes: Removes icons from the WorldMapFrame
## Author: Dahk Celes (DDCorkum)
## X-License: Public Domain.  Please clearly mark changes.  <http://unlicense.org>
## Version: 1.3


Changelog

1.3 (3 Aug 2021) by Dahk Celes
- Added an option for vignettes, such as the locations of chests

1.2 (9 May 2021) by Dahk Celes
- Performance improvement by hooking only two data providers instead of the whole world map
- AreaPOIPinTemplate pins are now sub-divided into anima conductors and the remainder.

1.1 (8 May 2021) by Dahk Celes
- Filters can be turned on/off from drop-down options in the WorldMapFrame
- Renaming from 'HideWorldMapFrame' to 'FilterWorldMap'

1.0 (7 May 2021) by Dahk Celes
- Initial version requested by a user on WoWI

--]]


--------------------------
-- Saved Variables

local toHide = {}

local listener = CreateFrame("Frame")
listener:RegisterEvent("ADDON_LOADED")
listener:SetScript("OnEvent", function()
	toHide = FilterWorldMapOptions or toHide
	FilterWorldMapOptions = toHide
end)


--------------------------
-- Execution

do
	-- STEP 1: Establish custom code to fire after each data provider
	-- STEP 2: Securely hook each data provider's RefreshAllData() func

	-- STEP 1:
	-- 	key		table		Mixin upon which the dataProvider is based
	--	val		function	Function to be securely hooked after RefreshAllData()
	local funcs =
	{
		-- Filters points of interest, including Shadowlands Anima Conductors
		[AreaPOIDataProviderMixin] = function(self)
			for pin in WorldMapFrame:EnumeratePinsByTemplate("AreaPOIPinTemplate") do
				if pin.description:find(ANIMA_DIVERSION_ORIGIN_TOOLTIP) then
					if (toHide.AreaPOIPinTemplate_AnimaConductors) then
						WorldMapFrame:RemovePin(pin)
					end
				else
					if toHide.AreaPOIPinTemplate_Remainder then
						WorldMapFrame:RemovePin(pin)
					end
				end
			end
		end,

		-- Filters bonus objectives
		[BonusObjectiveDataProviderMixin] = function(self)
			if toHide.BonusObjectivePinTemplate then
				self:RemoveAllData()
			end
		end,
		
		[VignetteDataProviderMixin] = function(self)
			if toHide.VignettePinTemplate then
				self:RemoveAllData()
				--for pin in WorldMapFrame:EnumeratePinsByTemplate("VignettePinTemplate") do
				--	if WorldMapFrame:RemovePin(pin)
				--end
			end
		end,
	}

	-- STEP 2:
	for dataProvider in pairs(WorldMapFrame.dataProviders) do
		for mixin, func in pairs(funcs) do
			if dataProvider.RefreshAllData == mixin.RefreshAllData then
				hooksecurefunc(dataProvider, "RefreshAllData", func)
			end
		end
	end
end


--------------------------
-- Options Drop Down

do
	-- STEP 1: Localization
	-- STEP 2: Create a helper func for turning filters on/off
	-- STEP 3: Hook the WorldMapTrackingOptionsButton drop down menu
	
	-- STEP 1:
	local ALL_OPTIONS =
	{
		{ value = "AreaPOIPinTemplate_AnimaConductors", text = ANIMA_DIVERSION_ORIGIN_TOOLTIP .. " (" .. EXPANSION_NAME8 .. ")", continent = 1550},
		{ value = "AreaPOIPinTemplate_Remainder", text = MINIMAP_TRACKING_POI},
		{ value = "BonusObjectivePinTemplate", text = TRACKER_HEADER_BONUS_OBJECTIVES, },
		{ value = "VignettePinTemplate", text = BATTLE_PET_SOURCE_11 .. " (Vignettes)", },
	}
	
	-- STEP 2:
	local function setOption(btn)
		-- Caution: items are 'included' when checked (toHide=nil), and 'filtered' when unchecked (toHide=true)
		toHide[btn.value] = not btn.checked or nil
		WorldMapFrame:RefreshAllDataProviders()
	end

	-- STEP 3:
	local infoTitle = 
	{
		isTitle = true,
		notCheckable = true,
		text = WORLD_MAP_FILTER_TITLE .. "       |cff666666(FilterWorldMap)",
	}
	local infoOption =
	{
		isNotRadio = true,
		keepShownOnClick = true,
		func = setOption
	}
	hooksecurefunc(WorldMapFrame.overlayFrames[2], "InitializeDropDown", function()
		UIDropDownMenu_AddSeparator()
		UIDropDownMenu_AddButton(infoTitle)
		for __, option in ipairs(ALL_OPTIONS) do
			if (option.continent == nil or C_Map.GetMapInfo(WorldMapFrame:GetMapID()).parentMapID == option.continent) then
				infoOption.value = option.value
				infoOption.text = option.text
				infoOption.checked = not toHide[option.value]
				UIDropDownMenu_AddButton(infoOption)
			end
		end
	end)
end