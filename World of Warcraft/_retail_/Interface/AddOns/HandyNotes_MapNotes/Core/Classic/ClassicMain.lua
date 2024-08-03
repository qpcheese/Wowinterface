local ADDON_NAME, ns = ...

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes", true)
if not HandyNotes then return end

local ADDON_NAME = "HandyNotes_MapNotes"
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME)

local MapNotesMiniButton = LibStub("AceAddon-3.0"):NewAddon("MNMiniMapButton", "AceConsole-3.0")
local MNMMBIcon = LibStub("LibDBIcon-1.0", true)

local db = { }
local nodes = { }
local minimap = { }
local lfgIDs = { }
local extraInformations = { }


function MapNotesMiniButton:OnInitialize() --mmb.lua
  self.db = LibStub("AceDB-3.0"):New("MNMiniMapButtonClassicDB", { profile = { minimap = { hide = false, }, }, }) 
  MNMMBIcon:Register("MNMiniMapButton", ns.miniButton, self.db.profile.minimap)
end


local function updateextraInformation()
    table.wipe(extraInformations)
    for i=1,GetNumSavedInstances() do
        local name, _, _, _, locked, _, _, _, _, difficultyName, numEncounters, encounterProgress = GetSavedInstanceInfo(i)
        if (locked) then
          --print(name, difficultyName, numEncounters, encounterProgress)
          if (not extraInformations[name]) then
          extraInformations[name] = { }
          end
          extraInformations[name][difficultyName] = encounterProgress .. "/" .. numEncounters
        end
    end
end

local pluginHandler = { }
function pluginHandler:OnEnter(uiMapId, coord)
  local nodeData = nil

  if (minimap[uiMapId] and minimap[uiMapId][coord]) then
    nodeData = minimap[uiMapId][coord]
   end

	if (nodes[uiMapId] and nodes[uiMapId][coord]) then
	  nodeData = nodes[uiMapId][coord]
	end
	
	if (not nodeData) then return end
	
	local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
	if ( self:GetCenter() > UIParent:GetCenter() ) then -- compare X coordinate
	  tooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT")
	end

    if (not nodeData.name) then return end

	local instances = { strsplit("\n", nodeData.name) }


	updateextraInformation()
	
	for i, v in pairs(instances) do
    --print(i, v)
	  if (db.extraInformation and (extraInformations[v] or (lfgIDs[v] and extraInformations[lfgIDs[v]]))) then
 	    if (extraInformations[v]) then
        --print("Dungeon/Raid is locked")
	      for a,b in pairs(extraInformations[v]) do
          --tooltip:AddLine(v .. ": " .. a .. " " .. b, nil, nil, nil, false)
	        tooltip:AddDoubleLine(v, a .. " " .. b, 1, 1, 1, 1, 1, 1)
 	      end
	    end
      if (lfgIDs[v] and extraInformations[lfgIDs[v]]) then
        for a,b in pairs(extraInformations[lfgIDs[v]]) do
          --tooltip:AddLine(v .. ": " .. a .. " " .. b, nil, nil, nil, false)
          tooltip:AddDoubleLine(v, a .. " " .. b, 1, 1, 1, 1, 1, 1)
        end
      end
	  else
	    tooltip:AddLine(v, nil, nil, nil, false)
	  end

    if nodeData.dnID then -- outputs the names we set and displays it in the tooltip
      tooltip:AddDoubleLine(nodeData.dnID, nil, nil, false)
    end
    
    if nodeData.dnID and nodeData.mnID then -- outputs the Zone or Dungeonmap name and displays it in the tooltip
      local mnIDname = C_Map.GetMapInfo(nodeData.mnID).name
      if mnIDname then
        tooltip:AddDoubleLine("=> " .. mnIDname, nil, nil, false)
        --tooltip:AddDoubleLine("|T4578752:8:20|t" .. mnIDname, nil, nil, false)
      end 
    end

    if nodeData.TransportName then -- outputs transport name for TomTom to the tooltip
      tooltip:AddDoubleLine(nodeData.TransportName, nil, nil, false)
    end

    if not nodeData.dnID and nodeData.mnID and not nodeData.id and not nodeData.TransportName then -- outputs the Zone or Dungeonmap name and displays it in the tooltip
      local mnIDname = C_Map.GetMapInfo(nodeData.mnID).name
      if mnIDname then
        tooltip:AddDoubleLine("=> " .. mnIDname, nil, nil, false)
        --tooltip:AddDoubleLine("|T4578752:8:20|t" .. mnIDname, nil, nil, false)
      end 
    end
     	tooltip:Show()
  end
end

function pluginHandler:OnLeave(uiMapID, coord)
    if self:GetParent() == WorldMapButton then
      WorldMapTooltip:Hide()
    else
      GameTooltip:Hide()
    end
end


do
	local tablepool = setmetatable({}, {__mode = 'uiMapId'})

	local function deepCopy(object)
		local lookup_table = {}
		local function _copy(object)
			if type(object) ~= "table" then
				return object
			elseif lookup_table[object] then
				return lookup_table[object]
			end

			local new_table = {}
			  lookup_table[object] = new_table
			for index, value in pairs(object) do
				new_table[_copy(index)] = _copy(value)
			end

			return setmetatable(new_table, getmetatable(object))
		end
			return _copy(object)
	end

	local function iter(t, prestate) -- Azeroth / Zone / Minimap / Inside Dungeon settings

		if not t then return end

		local data = t.data
		local state, value = next(data, prestate)

		while value do
			local alpha
      local scale
			local icon = ns.icons[value.type]

			local allLocked = true
			local anyLocked = false

      ns.professions = value.type == "Alchemy" or value.type == "Engineer" or value.type == "Cooking" or value.type == "Fishing" or value.type == "Archaeology" or value.type == "Mining" or value.type == "Jewelcrafting" or value.type == "Blacksmith" or value.type == "Leatherworking" or value.type == "Skinning" or value.type == "Tailoring" or value.type == "Herbalism" or value.type == "Inscription" or value.type == "Enchanting" or value.type == "FishingClassic" or value.type == "ProfessionOrders"

      ns.instances = value.type == "Dungeon" or value.type == "Raid" or value.type == "PassageDungeon" or value.type == "PassageDungeonRaidMulti" or value.type == "PassageRaid" or value.type == "VInstance" or value.type == "PassageDungeon" or value.type == "Multiple" or value.type == "LFR" or value.type == "Gray"

      ns.transports = value.type == "Portal" or value.type == "HPortal" or value.type == "APortal" or value.type == "HPortalS" or value.type == "APortalS" or value.type == "PassageHPortal" or value.type == "PassageAPortal" or value.type == "PassagePortal" or value.type == "Zeppelin" or value.type == "HZeppelin" or value.type == "AZeppelin" or value.type == "Ship" or value.type == "AShip" or value.type == "HShip" or value.type == "Carriage" or value.type == "TravelH" or value.type == "TravelA" or value.type == "GPortal" or value.type == "Tport2" or value.type == "TransportHelper" or value.type == "OgreWaygate" or value.type == "WayGateGreen" or value.type == "Ghost"

      ns.capitalgenerals = value.type == "Exit" or value.type == "PassageUpL" or value.type == "PassageDownL" or value.type == "PassageRightL" or value.type == "PassageLeftL" or value.type == "Hearthstone" or value.type == "Auctioneer" or value.type == "Bank" or value.type == "MNL" or value.type == "Barber" or value.type == "Transmogger" or value.type == "ItemUpgrade" or value.type == "PvPVendor" or value.type == "PvEVendor" or value.type == "MNL" or value.type == "DragonFlyTransmog"

      ns.CapitalIDs =
        --Cataclysm
        WorldMapFrame:GetMapID() == 1454 or -- Orgrimmar
        WorldMapFrame:GetMapID() == 1456 or -- Thunder Bluff
        WorldMapFrame:GetMapID() == 1458 or -- Undercity
        WorldMapFrame:GetMapID() == 1954 or -- Silvermoon
        WorldMapFrame:GetMapID() == 1947 or -- Exodar
        WorldMapFrame:GetMapID() == 1457 or -- Darnassus
        WorldMapFrame:GetMapID() == 1453 or -- Stormwind
        WorldMapFrame:GetMapID() == 1455 or -- Ironforge
        WorldMapFrame:GetMapID() == 1955 or -- Shattrath
        --Retail & Cataclysm
        WorldMapFrame:GetMapID() == 86 or -- Ragefire Chasmn
        WorldMapFrame:GetMapID() == 125 or  -- Dalaran Northrend
        WorldMapFrame:GetMapID() == 126   -- Dalaran Northrend Basement


			if value.name == nil then value.name = value.id or value.mnID end
      
			local instances = { strsplit("\n", value.name) }
			for i, v in pairs(instances) do
				if (not extraInformations[v] and not extraInformations[lfgIDs[v]]) then
					allLocked = false
				else
					anyLocked = true
				end
			end

      if (anyLocked and db.graymultipleID) or ((allLocked and not db.graymultipleID) and db.assignedgray) then
        icon = ns.icons["Gray"]
      end

      if (value.type == "LFR") then
        icon = ns.icons["LFR"]
      end

      if (value.type == "HIcon") then
        icon = ns.icons["HIcon"]
      end

      if (value.type == "AIcon") then
        icon = ns.icons["AIcon"]
      end

      if (anyLocked and db.invertlockout) or ((allLocked and not db.invertlockout) and db.uselockoutalpha) then
				alpha = db.mapnoteAlpha
      else
				alpha = db.mapnoteAlpha
			end

      scale = db.zoneScale
      alpha = db.zoneAlpha
      if t.minimapUpdate then -- Minimap Zone
          scale = db.minimapScale
          alpha = db.minimapAlpha
      end

      -- Profession icons in Capitals
      if ns.professions and ns.CapitalIDs and (value.hideOnMinimap == true) then
        scale = db.CapitalsProfessionsScale
        alpha = db.CapitalsProfessionsAlpha
      end

      -- Profession Minimap icons in Capitals
      if ns.CapitalIDs and (value.hideOnMinimap == false) then
        scale = db.MinimapCapitalsScale
        alpha = db.MinimapCapitalsAlpha
      end
      
      -- inside Dungeon
      mapInfo = C_Map.GetMapInfo(t.uiMapId)
      if mapInfo and mapInfo.mapType == 4 and not ns.CapitalIDs then 
          scale = db.dungeonScale
          alpha = db.dungeonAlpha
      end

      -- Instance icons World
      if ns.instances and (not value.hideOnMinimap == false) then
        scale = db.instanceScale
        alpha = db.instanceAlpha
      end

      -- Profession Minimap icons in Capitals
      if ns.professions and ns.CapitalIDs and (value.hideOnMinimap == false) then
        scale = db.MinimapCapitalsProfessionsScale
        alpha = db.MinimapCapitalsProfessionsAlpha
      end

      -- Capitals Minimap Transport (Zeppeline/Ship/Carriage) icons
      if ns.CapitalIDs and ns.transports and (value.hideOnMinimap == false) then
        scale = db.MinimapCapitalsTransportScale
        alpha = db.MinimapCapitalsTransportAlpha
      end

      -- Capitals Minimap Instance (Dungeon/Raid/Passage/Multi) icons
      if ns.CapitalIDs and ns.instances and (value.hideOnMinimap == false) then
        scale = db.MinimapCapitalsInstanceScale
        alpha = db.MinimapCapitalsInstanceAlpha
      end

      -- Capitals Minimap General (Hearthstone/Exit/Passage) icons
      if ns.CapitalIDs and ns.capitalgenerals and (value.hideOnMinimap == false) then
        scale = db.MinimapCapitalsGeneralScale
        alpha = db.MinimapCapitalsGeneralAlpha
      end

      -- Capitals General (Hearthstone/Exit/Passage) icons
      if ns.CapitalIDs and ns.capitalgenerals and (value.hideOnMinimap == true) then
        scale = db.CapitalsGeneralScale
        alpha = db.CapitalsGeneralAlpha
      end

      -- Capitals Transport (Zeppeline/Ship/Carriage) icons
      if ns.CapitalIDs and ns.transports and (value.hideOnMinimap == true) then
        scale = db.CapitalsTransportScale
        alpha = db.CapitalsTransportAlpha
      end

      -- Capitals Instance (Dungeon/Raid/Passage/Multi) icons
      if ns.CapitalIDs and ns.instances and (value.hideOnMinimap == true) then
        scale = db.CapitalsInstanceScale
        alpha = db.CapitalsInstanceAlpha
      end   

      if t.uiMapId == 947 then-- Azeroth World Map
        scale = db.azerothScale
        alpha = db.azerothAlpha
      end

      if t.uiMapId == 946 then-- Cosmos World Map
        scale = db.cosmosScale
        alpha = db.cosmosAlpha
      end

      if (value.showInZone or t.minimapUpdate) then -- Zone scale
          return state, nil, icon, scale, alpha
      end

			state, value = next(data, state)
		end
		wipe(t)
		tablepool[t] = true
	end

	local function iterCont(t, prestate) -- continent settings
		if not t then return end
    --if not db.activate.Continent then return end

    local state, value
  	local zone = t.C[t.Z]
    local data = nodes[zone]

		while zone do

			if data then -- Only if there is data for this zone
				state, value = next(data, prestate)

				while state do -- Have we reached the end of this zone?
          local alpha
          local icon = ns.icons[value.type]
          
					local allLocked = true
					local anyLocked = false
          
					local instances = { strsplit("\n", value.name) }
					for i, v in pairs(instances) do
						if (not extraInformations[v] and not extraInformations[lfgIDs[v]]) then
							allLocked = false
						else
							anyLocked = true
						end
					end

          if (anyLocked and db.graymultipleID) or ((allLocked and not db.graymultipleID) and db.assignedgray) then   
						icon = ns.icons["Gray"]
					end

          if (value.type == "LFR") then
            icon = ns.icons["LFR"]
          end
    
          if (value.type == "HIcon") then
            icon = ns.icons["HIcon"]
          end
    
          if (value.type == "AIcon") then
            icon = ns.icons["AIcon"]
          end

          if (anyLocked and db.invertlockout) or ((allLocked and not db.invertlockout) and db.uselockoutalpha) then
						alpha = db.continentAlpha
          else
            alpha = db.continentAlpha
          end

					if not value.hideOnContinent then -- Continent scale
						return state, zone, icon, db.continentScale, alpha
          end

					state, value = next(data, state)  -- Get next data
				end
			end
      -- Get next zone
			t.Z = next(t.C, t.Z)
			zone = t.C[t.Z]
			data = nodes[zone]
			prestate = nil
		end
		wipe(t)
		tablepool[t] = true
	end

function pluginHandler:GetNodes2(uiMapId, isMinimapUpdate)
  --print(uiMapId)
      local C = deepCopy(HandyNotes:GetContinentZoneList(uiMapId)) -- Is this a continent?
      if C then
          table.insert(C, uiMapId)
          local tbl = next(tablepool) or {}
          tablepool[tbl] = nil
          tbl.C = C
          tbl.Z = next(C)
          tbl.contId = uiMapId
          return iterCont, tbl, nil
      else
          if (nodes[uiMapId] == nil) then return iter end 
          local tbl = next(tablepool) or {}
          tablepool[tbl] = nil
          tbl.minimapUpdate = isMinimapUpdate
          tbl.uiMapId = uiMapId
          if (isMinimapUpdate and minimap[uiMapId]) then
              tbl.data = minimap[uiMapId]
          else
              tbl.data = nodes[uiMapId]
          end
          return iter, tbl, nil
      end
  end
end

local waypoints = {}
local function setWaypoint(uiMapID, coord)
    local dungeon = nodes[uiMapID][coord]

    local waypoint = nodes[dungeon]
    if waypoint and TomTom:IsValidWaypoint(waypoint) then
        return
    end
    
    local title = dungeon.name
    local x, y = HandyNotes:getXY(coord)
    waypoints[dungeon] = TomTom:AddWaypoint(uiMapID , x, y, {
        title = dungeon.TransportName or dungeon.name,
        persistent = nil,
        minimap = true,
        world = true
    })  
end

function pluginHandler:OnClick(button, pressed, uiMapId, coord)

  if not db.activate.ShiftWorld then

    if (not pressed) then return end

    if (button == "RightButton" and db.tomtom and TomTom) then
        setWaypoint(uiMapId, coord)
        return
    end

    if (button == "LeftButton") then

      local mnID = nodes[uiMapId][coord].mnID
      if mnID then
        WorldMapFrame:SetMapID(mnID)
      end
      
      if nodes[uiMapId][coord].mnID and nodes[uiMapId][coord].id then
        mnID = nodes[uiMapId][coord].mnID[1] --change id function to mnID function
      else
        mnID = nodes[uiMapId][coord].mnID --single coords function
      end

      local dungeonID
      if (type(nodes[uiMapId][coord].id) == "table") then
        dungeonID = nodes[uiMapId][coord].id[1] --multi coords journal function
      else
        dungeonID = nodes[uiMapId][coord].id --single coords function
      end

      if (not dungeonID) then return end
    end

  end

  if db.activate.ShiftWorld then

    if (not pressed) then return end

    if IsShiftKeyDown() and (button == "RightButton" and db.tomtom and TomTom) then
        setWaypoint(uiMapId, coord)
    return end

    if IsShiftKeyDown() and (button == "LeftButton") then

      local mnID = nodes[uiMapId][coord].mnID
      if mnID then
         WorldMapFrame:SetMapID(mnID)
      end
      
      if nodes[uiMapId][coord].mnID and nodes[uiMapId][coord].id then
        mnID = nodes[uiMapId][coord].mnID[1] --change id function to mnID function
      else
        mnID = nodes[uiMapId][coord].mnID --single coords function
      end

      local dungeonID
      if (type(nodes[uiMapId][coord].id) == "table") then
        dungeonID = nodes[uiMapId][coord].id[1] --multi coords journal function
      else
        dungeonID = nodes[uiMapId][coord].id --single coords journal function
      end

      if (not dungeonID) then return end
    end
  end
end

local Addon = CreateFrame("Frame")
Addon:RegisterEvent("PLAYER_LOGIN")
Addon:SetScript("OnEvent", function(self, event, ...) return self[event](self, ...)end)


local function updateStuff()
  updateextraInformation()
  HandyNotes:SendMessage("HandyNotes_NotifyUpdate", "MapNotes")
end

function Addon:PLAYER_ENTERING_WORLD()
  if (not self.faction) then
      self.faction = UnitFactionGroup("player")
      self:PopulateTable()
      self:PopulateMinimap()
  end
    updateextraInformation()
    updateStuff()
end

function Addon:PLAYER_LOGIN()

  ns.LoadOptions(self)
  ns.Addon = Addon

  -- Register Database Profile
  self.db = LibStub("AceDB-3.0"):New("HandyNotes_MapNotesClassicEraDB", ns.defaults)
  db = self.db.profile

  -- Register options 
  HandyNotes:RegisterPluginDB("MapNotes", pluginHandler, ns.options)
  LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("MNMiniMapButton", ns.options) -- Minimap

  -- Check for any lockout changes when we zone
  Addon:RegisterEvent("PLAYER_ENTERING_WORLD") 

  if ns.Addon.db.profile.activate.HideMMB then -- minimap button
    MNMMBIcon:Hide("MNMiniMapButton")
  end

  -- Register Worldmapbutton
  ns.WorldMapButton = LibStub('Krowi_WorldMapButtons-1.4'):Add(ADDON_NAME .. "WorldMapOptionsButtonTemplate","BUTTON")
  if ns.Addon.db.profile.activate.HideWMB
    then ns.WorldMapButton:Hide()
    else ns.WorldMapButton:Show()
  end

  --remove BlizzPOIs for MapNotes icons function
  function RemoveBlizzPOIs()
    if (not ns.Addon.db.profile.activate.RemoveBlizzPOIs or ns.Addon.db.profile.activate.HideMapNote) then return end
    
    for pin in WorldMapFrame:EnumeratePinsByTemplate("AreaPOIPinTemplate") do
        for _, poiID in pairs(ns.BlizzAreaPoisInfo) do
            local poi = C_AreaPoiInfo.GetAreaPOIInfo(WorldMapFrame:GetMapID(), pin.areaPoiID)
            if (poi ~= nil and poi.areaPoiID == poiID) then
                WorldMapFrame:RemovePin(pin)
            end
        end
    end
  end
    
  hooksecurefunc(WorldMapFrame, "OnMapChanged", function()
    RemoveBlizzPOIs()
  end)
    
  WorldMapFrame:HookScript("OnShow", function()
    RemoveBlizzPOIs()
  end)

end

function Addon:PopulateMinimap()
  for uiMapId,uiMapIdDetails in pairs(nodes) do
      if (minimap[uiMapId]) then
          for coords,icondetails in pairs(uiMapIdDetails) do 
              if (not icondetails.hideOnMinimap) then
                  minimap[uiMapId][coords] = icondetails
              end
          end
      end
  end
end

function Addon:PopulateTable()
  ns.nodes = nodes
  ns.minimap = minimap

  table.wipe(nodes)
  table.wipe(minimap)

  ns.LoadMapNotesNodesInfo() -- load nodes\MapNotesNodesInfo.lua
  ns.LoadMapNotesMinimapInfo() -- load nodes\MapNotesMinimapNodesInfo.lua

  ns.LoadClassicMiniMapInfo(self) -- load nodes\Classic\ClassicMiniMapInfo.lua
  ns.LoadClassicZoneInfo(self) -- load nodes\Classic\ClassicZoneInfo.lua
  ns.LoadClassicZoneFPInfo(self) -- load nodes\Classic\ClassicZoneFPInfo.lua
  ns.LoadClassicMinimapFPInfo(self) -- load nodes\Classic\ClassicMinimapFPInfo.lua
  ns.LoadClassicZoneGhostInfo(self) -- load nodes\Classic\ClassicZoneGhostInfo.lua
  ns.LoadClassicMinimapGhostInfo(self) -- load nodes\Classic\ClassicMinimapGhostInfo.lua
  ns.LoadClassicContinentInfo(self) -- load nodes\Classic\ClassicContinentInfo.lua
  ns.LoadClassicWorldMapInfo(self) -- load nodes\Classic\ClassicWorldMapInfo.lua

  ns.LoadClassicCapitalsLocationinfo(self) -- load nodes\Classic\ClassicCapitals.lua
  ns.LoadClassicMinimapCapitalsLocationinfo(self) -- load nodes\Classic\ClassicMinimapCapitals.lua
end

function Addon:UpdateInstanceNames(node)
  local dungeonInfo = EJ_GetInstanceInfo
    local id = node.id

      if (node.lfgid) then
        dungeonInfo = GetLFGDungeonInfo
        id = node.lfgid 
      end

      if (type(id) == "table") then
        for i,v in pairs(node.id) do
          local name = dungeonInfo(v)
            self:UpdateAlter(v, name)
          if (node.name) then
            node.name = node.name .. "\n" .. name
          else
            node.name = name
          end
        end
      elseif (id) then
        node.name = dungeonInfo(id)
        self:UpdateAlter(id, node.name)
      end
end


function Addon:FullUpdate()
  self:PopulateTable()
  self:PopulateMinimap()
end