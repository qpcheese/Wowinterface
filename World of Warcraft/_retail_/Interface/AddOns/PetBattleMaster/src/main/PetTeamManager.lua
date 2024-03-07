--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}
   
petbm.PetTeamManager = petbm.PetBattleMaster:NewModule("PetTeamManager", "AceEvent-3.0", "AceHook-3.0")
local L = petbm.Locale.GetInstance()

local log = petbm.Debug:new("PetTeamManager")

local SCROLLER_WIDTH = 20
local MAX_ACTIVE_PETS = 3
local SELECTED_ENTRY_TEXTURE = "Interface/Tooltips/UI-Tooltip-Background"
local ENTRY_COLOR = {1, 1, 1, 0}
local SELECTED_ENTRY_COLOR = {0.5, 1, 0.25, 0.5}
local ENTRY_BORDER_COLOR = {0.5, 1, 0.25, 0.2}
local SELECTED_BORDER_COLOR = {0.5, 1, 0.25, 1}
local ENTRY_WIDTH = 238
local NAME_WIDTH = 140
local ENTRY_HEIGHT = 73
local VISIBLE_ENTRIES = 8
local WIDTH = ENTRY_WIDTH + 8
local HEIGHT = 608
local PORTRAIT_SIZE = 34
local PORTRAIT_ICON_SIZE = 20
local PORTRAIT_ICON_OFF = 6

local BACKDROP_COLOR = {31/255, 28/255, 38/255, 0}
local BACKDROP_BORDER_COLOR = {1, 1, 1, 1}

local BACKDROP = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
	tile = true, tileSize = 16, edgeSize = 16, 
	insets = { left = 4, right = 4, top = 4, bottom = 4 }
}

StaticPopupDialogs["PETBM_DELETE_TEAM"] = {
  text = L["Do you really want to delete the team?"],
  button1 = OKAY,
  button2 = CANCEL,
  OnAccept = function()
  	petbm.PetTeamManager:DeleteCurrentTeam()
  end,
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}

local function _CopyTable(table)
	local rtn
	if (table) then
		rtn = {}
		for k,v in pairs(table) do
			rtn[k] = v
		end
	end
	return rtn
end

local function _GetTeamEditTooltip(frame)
	local self = frame.obj
	local teams = petbm.PetTeamView.db.profile.teams
	local offset = FauxScrollFrame_GetOffset(self.scrollFrame)
	if (teams and frame:GetID()) then
		local team = teams[frame:GetID() + offset]
		if (team) then
			return L["Edits the name and the icon of team \"%s\""]:format(team.name or L["Unnamed"])
		end
	end
	return ""
end

local function _UpdateEntry(self, entry, team, isScrolling, isActive, isFirst, isLast)
	if (not team) then
		entry:Hide()
		return
	end
	if (not team.icon) then
	    team.icon = "Interface\\Icons\\ability_deathknight_summongargoyle"
	end

	entry:Show()
	entry.teamIcon:SetNormalTexture(team.icon)
	entry.teamName:SetText(team.name or L["Unnamed"])
	
	local backdropColor = ENTRY_COLOR
	local borderColor = ENTRY_BORDER_COLOR
	entry.up:Hide()
	entry.down:Hide()
	if (isActive) then
		backdropColor = SELECTED_ENTRY_COLOR
		borderColor = SELECTED_BORDER_COLOR
		if (not isFirst) then
			entry.up:Show()
		end
		if (not isLast) then
			entry.down:Show()
		end
	end
	entry:SetBackdropColor(unpack(backdropColor))
	entry:SetBackdropBorderColor(unpack(borderColor))
	
	for petIndex=1,MAX_ACTIVE_PETS do
		if (team.pets[petIndex] and petbm.PetTeamView:IsValidPet(team.pets[petIndex])) then
			local petId = team.pets[petIndex].petId
			local portrait = entry.portraits[petIndex]
			if (petId and type(petId) == "string") then
				--local speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureId = C_PetJournal.GetPetInfoByPetID(petId)
				portrait:UpdateByPetId(petId)
			end
			
			portrait.frame:ClearAllPoints()
			if (petIndex == 1) then
				portrait.frame:SetPoint("TOPLEFT", portrait.frame:GetParent(), "TOPLEFT", 60, -26)
			elseif (isScrolling) then
				portrait.frame:SetPoint("LEFT", entry.portraits[petIndex - 1].frame, "RIGHT", 15, 0)
			else
				portrait.frame:SetPoint("LEFT", entry.portraits[petIndex - 1].frame, "RIGHT", 20, 0)
			end
		end
	end
	
	if (isScrolling) then
		entry.teamName:SetWidth(NAME_WIDTH - 13)
		entry:SetWidth(ENTRY_WIDTH - 13)
	else
		entry.teamName:SetWidth(NAME_WIDTH)
		entry:SetWidth(ENTRY_WIDTH)
	end
end

--[[
	Callback for updating the scroll frame.
--]]
local function _OnScrollUpdate(frame)
	local self = frame.obj
	local teams = petbm.PetTeamView.db.profile.teams
	local n = #teams
	log:Debug("OnScrollUpdate numTeams [%s]", n)
	local offset = FauxScrollFrame_GetOffset(frame)
	local isScrolling = n > VISIBLE_ENTRIES
	for i=1,VISIBLE_ENTRIES do
		local index = offset + i
		local entry = self.entries[i]
		if (index > n) then
			entry:Hide()
		else
			_UpdateEntry(self, entry, teams[index], isScrolling, index == self.currentTeamIndex, index == 1, index == #teams)
		end
	end
	FauxScrollFrame_Update(frame, n, VISIBLE_ENTRIES, ENTRY_HEIGHT)
end

local function _UpdateEntries(self)
--	local teams = petbm.PetTeamView.db.profile.teams
--	local n = #self.entries
--	local off = 0
--	for i=1,n do
--		_UpdateEntry(self, self.entries[i], teams[i])
--	end
	_OnScrollUpdate(self.scrollFrame)
end

local function _EditEntry(frame)
	local self = frame.obj
	local offset = FauxScrollFrame_GetOffset(self.scrollFrame)
	local teamIndex = offset + frame:GetID()
	self:SendMessage("PETBM_TEAM_SELECTED", teamIndex)
	petbm.PetTeamView:ToggleEditTeam()
end

local function _UpdateTeamButtons(self)
	local teams = petbm.PetTeamView.db.profile.teams
	if (#teams == 0) then
		self.currentTeamIndex = nil
		self.background:SetTexture("Interface\\PetBattles\\MountJournal-NoMounts")
	else
		self.background:SetTexture("Interface\\PetBattles\\MountJournal-BG")
	end
	if (self.currentTeamIndex) then
		-- both create and delete are shown
		self.createTeam:SetWidth(ENTRY_WIDTH / 2 - 8)
		self.createTeam:ClearAllPoints()
		self.createTeam:SetPoint("BOTTOMLEFT", self.frame, "BOTTOMLEFT", 4, 4)
		self.createTeam:Show()
		self.deleteTeam:SetWidth(ENTRY_WIDTH / 2 - 8)
		self.deleteTeam:ClearAllPoints()
		self.deleteTeam:SetPoint("BOTTOMRIGHT", self.frame, "BOTTOMRIGHT", -4, 4)
		self.deleteTeam:Show()
	else
		-- only create is shown
		self.createTeam:SetWidth(ENTRY_WIDTH)
		self.createTeam:ClearAllPoints()
		self.createTeam:SetPoint("BOTTOM", self.frame, "BOTTOM", 0, 4)
		self.createTeam:Show()
		self.deleteTeam:Hide()
	end
end

local function _SelectTeam(frame)
	log:Debug("_SelectTeam")
	local self = frame.obj
	local id = frame:GetID()
	local offset = FauxScrollFrame_GetOffset(self.scrollFrame)
	self:SendMessage("PETBM_TEAM_SELECTED", offset + id)
end

local function _CreateTeam(frame)
	local self = frame.obj
	local teams = petbm.PetTeamView.db.profile.teams
	local n = #teams
	local team = {name = L["Unnamed"], pets = {}}
	tinsert(teams, team)
	petbm.PetTeamView:SaveTeam(#teams)
	self:SendMessage("PETBM_TEAM_SELECTED", #teams)
	petbm.PetTeamView:ToggleEditTeam()
	_UpdateTeamButtons(self)
end

-- the user has already been asked
local function DeleteCurrentTeam(self)
	log:Debug("DeleteCurrentTeam")
	local teams = petbm.PetTeamView.db.profile.teams
	local index = self.currentTeamIndex
	self.currentTeamIndex = nil
	if (index and index <= #teams) then
		log:Debug("remove [%s]", index)
		tremove(teams, index)
	end
	self:SendMessage("PETBM_TEAM_DELETED", index)
	self:Update()
end

local function _DeleteTeam(frame)
	local self = frame.obj
	if (self.currentTeamIndex) then
		local dialog = StaticPopup_Show("PETBM_DELETE_TEAM")
		dialog:ClearAllPoints()
		dialog:SetPoint("BOTTOM", frame, "TOP", 0, 30)
	end
end

local function _PortraitOnDragStart(frame)
	local self = frame.portrait.obj
	local petId = frame.portrait.petId
	local teams = petbm.PetTeamView.db.profile.teams
	log:Debug("_PortraitOnDragStart petId [%s]", petId)
	if (petId) then
		-- remember abilities, if possible
		self.dragAbilities = nil
		if (frame.teamIndex) then
			log:Debug("copy abilities")
			local offset = FauxScrollFrame_GetOffset(self.scrollFrame) or 0
			local team = teams[offset + frame.teamIndex]
			for i=1,MAX_ACTIVE_PETS do
				if (team.pets[i] and team.pets[i].petId == petId) then
					self.dragAbilities = team.pets[i].abilities
					break
				end
			end
		end
		-- set cursor
		C_PetJournal.PickupPet(petId, true)
	end
end

local function _PortraitOnReceiveDrag(frame)
	local self = frame.portrait.obj
	local teams = petbm.PetTeamView.db.profile.teams
	log:Debug("_PortraitOnReceiveDrag")
	local type, petId = GetCursorInfo()
	if (type == "battlepet") then
		local offset = FauxScrollFrame_GetOffset(self.scrollFrame) or 0
		local teamIndex = offset + frame.teamIndex
		local team = teams[teamIndex]
		if (team) then
			if (teamIndex == self.currentTeamIndex) then
				C_PetJournal.SetPetLoadOutInfo(frame:GetID(), petId)
				PetJournal_UpdatePetLoadOut()
			else
				for i=1,MAX_ACTIVE_PETS do
					if (team.pets[i].petId == petId) then
						team.pets[i].petId = team.pets[frame:GetID()].petId
						team.pets[i].abilities = team.pets[frame:GetID()].abilities
						break
					end
				end
				team.pets[frame:GetID()].petId = petId
				team.pets[frame:GetID()].abilities = _CopyTable(self.dragAbilities)
			end
			self:SendMessage("PETBM_TEAM_CHANGED", teamIndex)
		end
		ClearCursor()
	end
	self.dragAbilities = nil
end

local function _InitPortraitFrame(self, parent, id, teamIndex)

	local portrait = petbm.PetPortrait.New(parent, PORTRAIT_SIZE, false, PORTRAIT_ICON_SIZE, PORTRAIT_ICON_OFF)
	local frame = portrait.frame
	frame:SetID(id)
	frame.teamIndex = teamIndex
	frame.portrait = portrait
	portrait.obj = self
	frame:RegisterForDrag("LeftButton")
	frame:SetScript("OnDragStart", _PortraitOnDragStart)
	frame:SetScript("OnReceiveDrag", _PortraitOnReceiveDrag)

	-- FIXME has to be a frame (SetAlpha), and behind the icons  	
--	local dragNotifier = frame:CreateTexture(nil, "OVERLAY")
--	dragNotifier:SetTexture("Interface\\Buttons\\CheckButtonHilight")
--	dragNotifier:SetBlendMode("ADD")
--	dragNotifier:SetAllPoints(frame)
--	portrait.dragNotifier = dragNotifier
--	
--	local animGroup = dragNotifier:CreateAnimationGroup()
--	animGroup:SetLooping("REPEAT")
--	local alpha1 = animGroup:CreateAnimation("Alpha")
--	alpha1:SetChange(-1.0)
--	alpha1:SetDuration(0.9)
--	alpha1:SetOrder(1)
--	local alpha2 = animGroup:CreateAnimation("Alpha")
--	alpha1:SetChange(1.0)
--	alpha1:SetDuration(0.9)
--	alpha1:SetOrder(2)
--	portrait.dragAnim = animGroup
--	animGroup:Play() 	
			
	return portrait
end

local function _OnTeamSelected(self, teamIndex)
	self.currentTeamIndex = teamIndex
	_UpdateTeamButtons(self)
	_UpdateEntries(self)
end

local function _OnEnterEntry(frame)
	local self = frame.obj
	if (frame:GetID() ~= self.currentTeamIndex) then
		frame:GetParent():SetBackdropBorderColor(unpack(SELECTED_BORDER_COLOR))
	end
end

local function _OnLeaveEntry(frame)
	local self = frame.obj
	if (frame:GetID() ~= self.currentTeamIndex) then
		frame:GetParent():SetBackdropBorderColor(unpack(ENTRY_BORDER_COLOR))
	end
end

local function _OnShowFrame(frame)
	local self = frame.obj
	local teams = petbm.PetTeamView.db.profile.teams
	local n = #teams
	local currentTeam = petbm.PetTeamView.db.profile.currentTeam
	if (n > 0 and currentTeam and currentTeam <= n) then
		_OnTeamSelected(self, currentTeam)
	end
	petbm.PetTeamView:CheckCurrentTeam()
end

local function _ShiftEntry(self, from, to)
	local teams = petbm.PetTeamView.db.profile.teams
	local tmp = teams[to]
	teams[to] = teams[from]
	teams[from] = tmp
	self.currentTeamIndex = to
	petbm.PetTeamView.db.profile.currentTeam = to
end

local function _ShiftEntryUp(frame)
	local self = frame.obj
	local offset = FauxScrollFrame_GetOffset(self.scrollFrame)
	local index = frame:GetID() + offset
	if (index > 1) then
		_ShiftEntry(self, index, index - 1)
		if (frame:GetID() == 1) then
			FauxScrollFrame_SetOffset(self.scrollFrame, offset - 1)
		end
		petbm.PetTeamManager.Update(self) 
	end
end

local function _ShiftEntryDown(frame)
	local self = frame.obj
	local teams = petbm.PetTeamView.db.profile.teams
	local offset = FauxScrollFrame_GetOffset(self.scrollFrame)
	local index = frame:GetID() + offset
	if (index < #teams) then
		_ShiftEntry(self, index, index + 1)
		if (offset + VISIBLE_ENTRIES == index) then
			FauxScrollFrame_SetOffset(self.scrollFrame, offset + 1)
		end
		petbm.PetTeamManager.Update(self) 
	end
end

local function _InitEntryFrame(self, parent, id)
	local frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
	frame.obj = self
	frame:SetID(id)
	frame:SetWidth(ENTRY_WIDTH)
	frame:SetHeight(ENTRY_HEIGHT)
	frame:SetBackdrop({bgFile = SELECTED_ENTRY_TEXTURE, 
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
		tile = true, tileSize = 16, edgeSize = 16, 
		insets = { left = 4, right = 4, top = 4, bottom = 4 }})
	frame:SetBackdropColor(unpack(ENTRY_COLOR))
	frame:SetBackdropBorderColor(unpack(ENTRY_BORDER_COLOR))
	
	local teamIcon = CreateFrame("Button", "petbmTMtmIc"..id, frame)
	teamIcon.obj = self
	teamIcon:SetID(id)
	teamIcon:SetWidth(42)
	teamIcon:SetHeight(42)
	teamIcon:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -15)
	teamIcon:SetScript("OnClick", _SelectTeam)
	teamIcon:SetScript("OnEnter", _OnEnterEntry)
	teamIcon:SetScript("OnLeave", _OnLeaveEntry)
	frame.teamIcon = teamIcon
	
	-- change team name and icon
	local change = CreateFrame("Button", nil, frame)
	change.obj = self
	change:SetID(id)
	change:SetWidth(16)
	change:SetHeight(16)
	local texture = change:CreateTexture()
	texture:SetTexture("Interface\\Addons\\PetBattleMaster\\resources\\Edit-Up")
	texture:SetAllPoints(change)
	texture:SetTexCoord(0, 19/32, 0, 18/32)
	change:SetNormalTexture(texture)
	change:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
	local texture = change:CreateTexture()
	texture:SetTexture("Interface\\Addons\\PetBattleMaster\\resources\\Edit-Down")
	texture:SetAllPoints(change)
	texture:SetTexCoord(0, 19/32, 0, 18/32)
	change:SetPushedTexture(texture)
	change:SetPoint("TOPLEFT", frame, "TOPLEFT", 52, -6)
	change:SetScript("OnClick", _EditEntry)
	petbm.WidgetUtil.AddTooltip(change, L["Team name/icon edit"], _GetTeamEditTooltip)

	-- team name
	local teamName = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	teamName:SetJustifyH("LEFT")
	teamName:SetWidth(NAME_WIDTH)
	teamName:SetPoint("LEFT", change, "RIGHT", 4, 0)
--	teamName:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -12)
	teamName:SetText("Team 1")
	frame.teamName = teamName
	
	-- team portraits
	frame.portraits = {}
	local portrait1 = _InitPortraitFrame(self, frame, 1, id)
	portrait1.frame:SetPoint("TOPLEFT", frame, "TOPLEFT", 60, -26)
	frame.portraits[1] = portrait1
	
	local portrait2 = _InitPortraitFrame(self, frame, 2, id)
	portrait2.frame:SetPoint("LEFT", portrait1.frame, "RIGHT", 20, 0)
	frame.portraits[2] = portrait2

	local portrait3 = _InitPortraitFrame(self, frame, 3, id)
	portrait3.frame:SetPoint("LEFT", portrait2.frame, "RIGHT", 20, 0)
	frame.portraits[3] = portrait3
	
	local up = CreateFrame("Button", nil, frame)
	up.obj = self
	up:SetID(id)
	up:SetWidth(32)
	up:SetHeight(32)
	local texture = up:CreateTexture()
	texture:SetTexture("Interface\\Glues\\CharacterSelect\\Glue-Char-Up")
	texture:SetAllPoints(up)
	up:SetNormalTexture(texture)
	up:SetHighlightTexture("Interface\\Glues\\CharacterSelect\\Glue-Char-Up-Glow", "MOD")
	up:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
	up:SetScript("OnClick", _ShiftEntryUp)
	up:Hide()
	frame.up = up
	
	local down = CreateFrame("Button", nil, frame)
	down.obj = self
	down:SetID(id)
	down:SetWidth(32)
	down:SetHeight(32)
	local texture = down:CreateTexture()
	texture:SetTexture("Interface\\Glues\\CharacterSelect\\Glue-Char-Down")
	texture:SetAllPoints(down)
	down:SetNormalTexture(texture)
	down:SetHighlightTexture("Interface\\Glues\\CharacterSelect\\Glue-Char-Down-Glow", "MOD")
	down:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
	down:SetScript("OnClick", _ShiftEntryDown)
	down:Hide()
	frame.down = down
		
	return frame
end

local function _InitBenchFrame(self)
	local frame = CreateFrame("Frame", nil, self.frame)
	frame.obj = self
	frame:SetWidth(WIDTH)
	frame:SetHeight(HEIGHT)
	frame:SetPoint("TOPLEFT", self.frame, "TOPRIGHT", 0, 0)
--	frame:SetScript("OnShow", _OnShowFrame)
	frame:SetBackdrop(BACKDROP)
	frame:SetBackdropColor(unpack(BACKDROP_COLOR))
	self.bench = frame
	
	local background = frame:CreateTexture(nil, "BACKGROUND")
	self.background = background
	background:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
	background:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4)
	background:SetTexture("Interface\\PetBattles\\MountJournal-BG")
	background:SetTexCoord(0, 0.78515625, 0, 1)
	
	local benchEntries = {}
	local cols = 4
	for row=1,5 do
		benchEntries[row] = {}
		local prev
		for col=1,cols do
			local entry = _InitPortraitFrame(self, frame, row * cols + col, nil)
			if (col == 1) then
				if (row == 1) then
					entry.frame:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -20)
				else
					entry.frame:SetPoint("TOP", benchEntries[row - 1][1].frame, "BOTTOM", 0, 0)
				end
			else
				entry.frame:SetPoint("LEFT", prev.frame, "RIGHT", 0, 0)
			end
			benchEntries[row][col] = entry
			prev = entry
		end
	end
end

local function _InitFrame(self)
	log:Debug("_InitFrame: %s", PetJournal)
	local parent = PetJournal
	--local parent = PetJournal
	local frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
	frame.obj = self
	frame:SetWidth(WIDTH)
	frame:SetHeight(HEIGHT)
	frame:SetPoint("TOPLEFT", parent, "TOPRIGHT", 0, 0)
	frame:SetScript("OnShow", _OnShowFrame)
	frame:SetBackdrop(BACKDROP)
	frame:SetBackdropColor(unpack(BACKDROP_COLOR))
	self.frame = frame
	
	local background = frame:CreateTexture(nil, "BACKGROUND")
	self.background = background
	background:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
	background:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4)
	background:SetTexture("Interface\\PetBattles\\MountJournal-BG")
--	background:SetTexCoord(0.00195313, 0.79882813, 0.59277344, 0.75976563)
	background:SetTexCoord(0, 0.78515625, 0, 1)
	self.background = background
	
	local off = 2
	for i=1,VISIBLE_ENTRIES do
		local entry = _InitEntryFrame(self, frame, i)
		entry:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -off)
		off = off + entry:GetHeight()
		self.entries[i] = entry
	end
	
	local createTeam = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	createTeam.obj = self
	createTeam:SetWidth(ENTRY_WIDTH)
	createTeam:SetPoint("BOTTOM", frame, "BOTTOM", 0, 4)
	createTeam:SetText(L["Create team"])
	createTeam:SetScript("OnClick", _CreateTeam)
	self.createTeam = createTeam
	
	local deleteTeam = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	deleteTeam.obj = self
	deleteTeam:SetWidth(ENTRY_WIDTH)
	deleteTeam:SetPoint("TOP", frame, "BOTTOM", 0, 0)
	deleteTeam:SetText(L["Delete team"])
	deleteTeam:SetScript("OnClick", _DeleteTeam)
	self.deleteTeam = deleteTeam
	
	local scrollFrame = CreateFrame("ScrollFrame", petbm.WidgetUtil.GetNextName(), frame, "FauxScrollFrameTemplate")
	scrollFrame.obj = self
	scrollFrame:SetWidth(WIDTH - SCROLLER_WIDTH)
	scrollFrame:SetHeight(HEIGHT - 27)
	scrollFrame:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -SCROLLER_WIDTH - 3, -4)
	scrollFrame:SetScript("OnVerticalScroll", function(frame, value) FauxScrollFrame_OnVerticalScroll(frame, value, ENTRY_HEIGHT, _OnScrollUpdate) end)
	scrollFrame:SetScript("OnShow", _OnScrollUpdate)
	
	local scrollbg = scrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	scrollbg:SetAllPoints(scrollFrame.ScrollBar)
	scrollbg:SetTexture(0, 0, 0, 0.7)
	
	self.scrollFrame = scrollFrame
end

local function ProfileUpdate(self)
	self:Update()
end

local function Update(self)
	if (petbm.PetBattleMaster.db.profile.teamManagerActive) then
		self.frame:Show()
		_UpdateEntries(self)
		_UpdateTeamButtons(self)
	else
		self.frame:Hide()
	end
end

local function PET_JOURNAL_LIST_UPDATE(self)
	self:Update()
end

local function PET_JOURNAL_PET_DELETED(self)
	self:Update()
end

local function PETBM_TEAM_CHANGED(self, event, teamIndex)
	_UpdateEntries(self)
end

local function PETBM_TEAM_SELECTED(self, event, teamIndex)
	_OnTeamSelected(self, teamIndex)
end

local function OnInitialize(self)
	log:Debug("OnInitialize")
	self.entries = {}
end

local function OnEnable(self)
	log:Debug("OnEnable")
end

function petbm.PetTeamManager:Init()
	log:Debug("Init")
	_InitFrame(self)
	--_InitBenchFrame(self)
	self:RegisterEvent("PET_JOURNAL_LIST_UPDATE")
	self:RegisterEvent("PET_JOURNAL_PET_DELETED")
	self:RegisterMessage("PETBM_TEAM_SELECTED")
	self:RegisterMessage("PETBM_TEAM_CHANGED")
	self:ProfileUpdate()
end

petbm.PetTeamManager.OnInitialize = OnInitialize
petbm.PetTeamManager.OnEnable = OnEnable
petbm.PetTeamManager.ProfileUpdate = ProfileUpdate
petbm.PetTeamManager.Update = Update
petbm.PetTeamManager.DeleteCurrentTeam = DeleteCurrentTeam
petbm.PetTeamManager.PET_JOURNAL_LIST_UPDATE = PET_JOURNAL_LIST_UPDATE
petbm.PetTeamManager.PET_JOURNAL_PET_DELETED = PET_JOURNAL_PET_DELETED
petbm.PetTeamManager.PETBM_TEAM_SELECTED = PETBM_TEAM_SELECTED
petbm.PetTeamManager.PETBM_TEAM_CHANGED = PETBM_TEAM_CHANGED
petbm.PetTeamManager.ApplyConfig = ApplyConfig
	