-- declaration
local _, Jetpacks = ...
Jetpacks.points = {}


-- our db and defaults
local db
local defaults = { profile = { completed = false, icon_scale = 1.2, icon_alpha = 1.0 } }

local continents = {
	[1462] = true, -- Mechagon
}


-- upvalues
local GameTooltip = _G.GameTooltip
local IsControlKeyDown = _G.IsControlKeyDown
local gsub = _G.string.gsub
local LibStub = _G.LibStub
local next = _G.next
local UIParent = _G.UIParent

local HandyNotes = _G.HandyNotes
local TomTom = _G.TomTom

local completedQuests = {}
local points = Jetpacks.points


-- plugin handler for HandyNotes
local function infoFromCoord(mapFile, coord)
	local point = points[mapFile] and points[mapFile][coord]
	return point[2], point[3]
end

function Jetpacks:OnEnter(mapFile, coord)
	if self:GetCenter() > UIParent:GetCenter() then -- compare X coordinate
		GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	end

	local name, note = infoFromCoord(mapFile, coord)

	GameTooltip:SetText(name)

	if note then
		GameTooltip:AddLine(note)
		GameTooltip:AddLine(" ")
	end

	if TomTom then
		GameTooltip:AddLine("Right-click to set a waypoint.", 1, 1, 1)
	end

	GameTooltip:Show()
end

function Jetpacks:OnLeave()
		GameTooltip:Hide()
end


local function createWaypoint(mapID, coord)
	local x, y = HandyNotes:getXY(coord)
	TomTom:AddWaypoint(mapID, x, y, { title = "Ancient Shrine", persistent = nil, minimap = true, world = true })
end

local function createAllWaypoints()
	for mapFile, coords in next, points do
		if not continents[mapFile] then
		for coord, questID in next, coords do
			if coord and (db.completed or not completedQuests[questID]) then
				createWaypoint(mapFile, coord)
			end
		end
		end
	end
	TomTom:SetClosestWaypoint()
end

function Jetpacks:OnClick(button, down, mapFile, coord)
	if TomTom and button == "RightButton" and not down then
		if IsControlKeyDown() then
			createAllWaypoints()
		else
			createWaypoint(mapFile, coord)
		end
	end
end


do
	-- custom iterator we use to iterate over every node in a given zone
	local function iterator(t, prev)
		if not completedQuests[38356] or not completedQuests[37961] then return end
		if not t then return end

		local coord, v = next(t, prev)
		while coord do
			if v and (db.completed or not completedQuests[v[1]]) then
				return coord, nil, "interface\\icons\\inv_backpack_wrathion_c_01", db.icon_scale, db.icon_alpha
			end

			coord, v = next(t, coord)
		end
	end

	function Jetpacks:GetNodes2(mapID)
		return iterator, points[mapID]
	end
end


-- config
local options = {
	type = "group",
	name = "Jetpacks",
	desc = "Jetpack locations to fly in Mechagon",
	get = function(info) return db[info[#info]] end,
	set = function(info, v)
		db[info[#info]] = v
		Jetpacks:Refresh()
	end,
	args = {
		desc = {
			name = "These settings control the look and feel of the icon.",
			type = "description",
			order = 1,
		},
		completed = {
			name = "Show completed",
			desc = "Show icons for music scrolls you have already collected.",
			type = "toggle",
			width = "full",
			arg = "completed",
			order = 2,
		},
		icon_scale = {
			type = "range",
			name = "Icon Scale",
			desc = "Change the size of the icons.",
			min = 0.25, max = 2, step = 0.01,
			arg = "icon_scale",
			order = 3,
		},
		icon_alpha = {
			type = "range",
			name = "Icon Alpha",
			desc = "Change the transparency of the icons.",
			min = 1, max = 1, step = 1,
			arg = "icon_alpha",
			order = 4,
		},
	},
}


-- initialise
function Jetpacks:OnEnable()
	local HereBeDragons = LibStub("HereBeDragons-2.0", true)
	if not HereBeDragons then
		HandyNotes:Print("Your installed copy of HandyNotes is out of date and the Jetpacks plug-in will not work correctly.  Please update HandyNotes to version 1.5.0 or newer.")
		return
	end

	for continentMapID in next, continents do
		local children = C_Map.GetMapChildrenInfo(continentMapID, nil, true)
		for _, map in next, children do
			local coords = points[map.mapID]
			if coords then
				for coord, criteria in next, coords do
					local mx, my = HandyNotes:getXY(coord)
					local cx, cy = HereBeDragons:TranslateZoneCoordinates(mx, my, map.mapID, continentMapID)
					if cx and cy then
						points[continentMapID] = points[continentMapID] or {}
						points[continentMapID][HandyNotes:getCoord(cx, cy)] = criteria
					end
				end
			end
		end
	end

	HandyNotes:RegisterPluginDB("Jetpacks", self, options)

	local tmpPairs = C_QuestLog.GetAllCompletedQuestIDs()
	for _, id in ipairs(tmpPairs) do 
		completedQuests[id] = true
	end

	db = LibStub("AceDB-3.0"):New("HandyNotes_JetpacksDB", defaults, "Default").profile

	Jetpacks:Refresh()
	Jetpacks:RegisterEvent("CRITERIA_UPDATE", "Refresh")
end

function Jetpacks:Refresh(_, questID)
	if questID then completedQuests[questID] = true end
	self:SendMessage("HandyNotes_NotifyUpdate", "Jetpacks")
end


-- activate
LibStub("AceAddon-3.0"):NewAddon(Jetpacks, "HandyNotes_Jetpacks", "AceEvent-3.0")
