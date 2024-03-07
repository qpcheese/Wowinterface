--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}
   
petbm.PetTeamView = petbm.PetBattleMaster:NewModule("PetTeamView", "AceEvent-3.0", "AceHook-3.0")
local L = petbm.Locale.GetInstance()

local log = petbm.Debug:new("PetTeamView")

local MAX_ACTIVE_PETS = 3
petbm.PetTeamView.MAX_TEAM_FRAMES = 8

local VERSION = 1
local HEAL_PET_SPELL = 125439
local NUM_ICONS_PER_ROW = 10
local NUM_ICON_ROWS = 8
local NUM_ICONS_SHOWN = NUM_ICONS_PER_ROW * NUM_ICON_ROWS
local ICON_ROW_HEIGHT = 36
local TEAM_ICON_SIZE = 30
local SELECTED_TEAM_ICON_SIZE = 36

local BAR_BACKDROP_COLOR = {0, 0, 0, 0.5}
local BACKDROP_COLOR = {31/255, 28/255, 38/255, 0}
local BACKDROP_BORDER_COLOR = {1, 1, 1, 1}

local BACKDROP = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
	tile = true, tileSize = 16, edgeSize = 16, 
	insets = { left = 4, right = 4, top = 4, bottom = 4 }
}

local OLD_ICONS = {
	"Interface\\Icons\\ability_deathknight_summongargoyle",
    "Interface\\Icons\\Ability_Druid_FerociousBite",
	"Interface\\Icons\\Ability_EyeOfTheOwl",
	"Interface\\Icons\\Ability_Hunter_Pet_Devilsaur",
    "Interface\\Icons\\achievment_Boss_ultraxion",
    "Interface\\Icons\\INV_Pet_Cats_OrangeTabbyCat"
}

local function _GetIconTexture(self, index)
	local icon = self.icons[index]
--	if (type(icon) == "number") then
--		log:Debug("_GetIconTexture 2")
--	 	self.textureHelper.icon:SetTexture(icon)
--		log:Debug("_GetIconTexture exit2: %s", self.textureHelper.icon:GetTexture())
--	 	return gsub(strupper(self.textureHelper.icon:GetTexture()), "INTERFACE\\ICONS\\", "")
--	end
	return icon
end

-- needed after patch 5.1 (petId was changed from number to string)
local function _CleanupTeams(self)
	log:Debug("_CleanupTeams")
	local teams = self.db.profile.teams
	
	if (not self.db.profile.version) then
		-- cleanup old teams with numeric petIds
		for i=#teams,1,-1 do
			local team = teams[i]
			if (team and team.pets) then
				log:Debug("check team [%s]", i)
				for petIndex=#team.pets,1,-1 do
					log:Debug("check pet [%s] type [%s]", team.pets[petIndex],  type(team.pets[petIndex]))
					if (type(team.pets[petIndex]) ~= "string") then
						tremove(team.pets, petIndex)
						if (team.abilities and #team.abilities >= petIndex) then
							tremove(team.abilities, petIndex)
						end
					end
				end		
				if (#team.pets == 0) then
					log:Debug("remove team")
					tremove(teams, i)
				elseif (not team.icon) then
					if (i > #OLD_ICONS) then
						team.icon = OLD_ICONS[1]
					else
						team.icon = OLD_ICONS[i]
					end
				end
			end
		end
		
		-- move abilities and petIds into a struct
		for i=#teams,1,-1 do
			local team = teams[i]
			if (team and team.pets) then
				for petIndex=#team.pets,1,-1 do
					local petId = team.pets[petIndex]
					team.pets[petIndex] = {}
					team.pets[petIndex].petId = petId
					team.pets[petIndex].abilities = team.abilities[petIndex]
				end
				team.abilities = nil
			end
		end
	end
	
	self.db.profile.version = VERSION
	
	if (self.db.profile.currentTeam) then
		self.db.profile.currentTeam = math.min(#teams, self.db.profile.currentTeam)
	end
	
	-- some users reported nil-teams
	for i=#teams,1,-1 do
		if (not teams[i]) then
			tremove(teams, i)
		end
	end
end

local function _EnsurePetJournal(self)
	if (not PetJournal or not PetJournal:IsVisible()) then
		self.petJournalToggled = true
		ToggleCollectionsJournal(2)
		CollectionsJournal:SetAlpha(0)
	end
end

local function _RevertPetJournal(self)
	if (self.petJournalToggled) then
		CollectionsJournal:SetAlpha(1)
		ToggleCollectionsJournal(2)
		self.petJournalToggled = nil
	end
end

local function _UpdatePortrait(self, portrait)
	local petId = portrait.petId
	if (petId) then
		local health, maxHealth, attack, speed, quality = C_PetJournal.GetPetStats(petId)
		if (health <= 0) then
			portrait.isDead:Show()
			portrait.healthBar:Hide()
		else
			portrait.isDead:Hide()
			if (health < maxHealth - 1) then
				portrait.healthBar:Update(health, maxHealth)
				portrait.healthBar:Show()
			else
				portrait.healthBar:Hide()
			end
		end
	end
end

local function _InitPortrait(self, portrait)
	local petId, ability1ID, ability2ID, ability3ID, locked = C_PetJournal.GetPetLoadOutInfo(portrait:GetID())
--	log:Debug("_InitPortrait id [%s] petId [%s]", portrait:GetID(), petId)
	portrait.petId = petId
	if (not petId) then
		portrait:Hide()
		portrait.healthBar:Hide()
	else
		local speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureId = C_PetJournal.GetPetInfoByPetID(petId)
		if (petType and petType > 0) then
			local health, maxHealth, attack, speed, quality = C_PetJournal.GetPetStats(petId)
			portrait.petTypeIcon:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[petType])
			portrait.icon:SetTexture(icon)
			portrait.level:SetText(level)
			portrait:Show()
			portrait.healthBar:Hide()
			local color = ITEM_QUALITY_COLORS[1]
			if (quality) then
				color = ITEM_QUALITY_COLORS[quality-1]
			end
			portrait.iconBorder:SetVertexColor(color.r, color.g, color.b, 1)
			_UpdatePortrait(self, portrait)
		else
			portrait:Hide()
			portrait.healthBar:Hide()
		end
	end
end

local function _InitPortraits(self)
	_InitPortrait(self, self.portrait1)
	_InitPortrait(self, self.portrait2)
	_InitPortrait(self, self.portrait3)
end

local function _SavePetData(self, pet)
	local speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureId = C_PetJournal.GetPetInfoByPetID(pet.petId)
	pet.speciesId = speciesID
	pet.customName = customName
	pet.name = name
	pet.level = level
	pet.petType = petType
	pet.creatureId = creatureId
end

local function _SaveTeam(self, teamIndex)
	
	local team = self.db.profile.teams[teamIndex]
	if (not team) then
		return
	end
		
	log:Debug("_SaveTeam [%s]", team.name)
	for i=1,MAX_ACTIVE_PETS do
		team.pets[i] = wipe(team.pets[i] or {})
		local pet = team.pets[i]
		if (not pet) then
			team.pets[i] = {}
			pet = team.pets[i]
		end
		pet.abilities = wipe(pet.abilities or {})
		pet.petId, pet.abilities[1], pet.abilities[2], pet.abilities[3] = C_PetJournal.GetPetLoadOutInfo(i)
		if (pet.petId) then
			_SavePetData(self, pet)
			log:Debug("_SaveTeam petId[%s]=[%s] abilities[%s %s %s]", i, pet.petId, pet.abilities[1], pet.abilities[2], pet.abilities[3])
		else
			log:Debug("_SaveTeam missing petId for index %s", i)
		end
	end
	_InitPortraits(self)
	self:SendMessage("PETBM_TEAM_CHANGED", teamIndex)
end

local function _SaveCurrentTeam(self)
	if (self.processFrame:IsVisible()) then
		return
	end
	_SaveTeam(self, self.db.profile.currentTeam)		
end

-- Blizzard is reinitializing the petIds sometimes. We will try to repair the 
-- missing team members here. 
local function _RepairMissingTeamMember(self, team, petIndex)
	if (team) then
		log:Debug("_RepairMissingTeamMember team [%s] petIndex [%s]", team.name, petIndex)
		local msg = L["The ID of the %s'th member of the active team \"%s\" has changed."]:format(petIndex, team.name)
		local matchId = petbm.PetStable:FindMatch(team.pets[petIndex])
		if (not matchId) then
			msg = msg..L[" No matching pets where found in stable."]
			-- don't spam the console
			-- petbm.PetBattleMaster:Print(msg)
		else
			log:Debug("Repaired teamMember [%s] of team [%s] to matching petId [%s]", petIndex, team.name, matchId);
			team.pets[petIndex].petId = matchId
		end
	end
end

-- Returns true, if the given pet is valid (has a valid petId)
local function _IsValidPet(pet)
	local rtn = false
	if (pet and pet.petId and type(pet.petId) == "string") then
		-- inspired by http://www.warcraftpets.com/community/forum/viewtopic.php?f=3&t=11452
		if (pet.petId:match("^0x")) then -- if MoP petID (0x00etc)
			pet.petId = format("BattlePet-0-%s",pet.petId:match("0x0000(%x+)")) -- convert to BattlePet-0-00etc
		end
		pet.petId = pet.petId:gsub(":","%-") -- for earlier beta builds to 18888 (BattlePet:0:00etc to BattlePet-0-00etc)
		local speciesId, customName, level = C_PetJournal.GetPetInfoByPetID(pet.petId)
		rtn = speciesId ~= nil
	end
	return rtn
end

local function _CheckTeam(self, team)
	if (team) then
		log:Debug("_CheckTeam [%s]", team.name)
		for petIndex=1,MAX_ACTIVE_PETS do
			if (not _IsValidPet(team.pets[petIndex])) then
				_RepairMissingTeamMember(self, team, petIndex)
			else
				_SavePetData(self, team.pets[petIndex])
			end
		end
	end
end

local function _CheckCurrentTeam(self)
	_CheckTeam(self, self.currentTeam)
end

local function _CheckAllTeams(self)
	local teams = self.db.profile.teams
	log:Debug("_CheckAllTeams n: [%s]", #teams)
	for i=1,#teams do
		_CheckTeam(self, teams[i])
	end
end

-- The team selection is called asynchronously, otherwise
-- the abilities doesn't get updated correctly sometimes.
-- After each step the process is delayed by one frame.
local function _SelectTeamProcess(frame)
	local self = frame.obj
	for petIndex=1,MAX_ACTIVE_PETS do
		log:Debug("SelectTeamProcess [%s]", petIndex)
		local curAbilities = self.abilities
		local curPetId
		curPetId, curAbilities[1], curAbilities[2], curAbilities[3] = C_PetJournal.GetPetLoadOutInfo(petIndex)
		local pet = self.currentTeam.pets[petIndex]
		log:Debug("select [%s]=[%s] ([%s])", petIndex, pet.petId, curPetId)
		
		-- patch 5.4.2 has reset some pet ids, so check wheter they are still valid
		if (not _IsValidPet(pet)) then
			log:Debug("petId [%s] not found, ignoring the pet", pet.petId)
		elseif (pet.petId and curPetId) then
			-- update current data
			_SavePetData(self, pet)
			
			-- Blizzard changed the petId case. Why not, why should the addon authors be bored...
			if (pet.petId:lower() ~= curPetId:lower()) then
				C_PetJournal.SetPetLoadOutInfo(petIndex, pet.petId)
				return
			elseif (pet.abilities) then
				local n = #pet.abilities
				for abilityIndex=1,n do
					local abilityId = pet.abilities[abilityIndex] 
					if (abilityId and curAbilities[abilityIndex] ~= abilityId) then
						C_PetJournal.SetAbility(petIndex, abilityIndex, abilityId)
						return
					end
				end
			end
		end
	end

	if (PetJournal_UpdatePetLoadOut) then
		PetJournal_UpdatePetLoadOut()
	end
	
	_InitPortraits(self)
	_RevertPetJournal(self)
	self.processFrame:Hide()
end

local function _OnTeamSelected(frame)
	log:Debug("_OnTeamSelected")
	local self = frame.obj
	self:SendMessage("PETBM_TEAM_SELECTED", self.offset + frame:GetID())
end

local function _GetTeamSelectTooltip(frame)
	local self = frame.obj
	local team = self.db.profile.teams[self.offset + frame:GetID()]
	if (team and team.name) then
		return L["Selects the team \"%s\""]:format(team.name)
	end
	return ""
end

local function _GetTeamEditTooltip(frame)
	local self = frame.obj
	if (self.currentTeam) then
		return L["Edits the name and the icon of team \"%s\""]:format(self.currentTeam.name or L["Unnamed"])
	end
	return ""
end

local function _UpdateTeamFrame(frame, team)
	local self = frame.obj
	local hidden = self.isSelecting or (self.selectDelay and time() < self.selectDelay)
	frame.icon:SetTexture(team.icon or "Interface\\Icons\\ability_deathknight_summongargoyle")
	if (hidden) then
		frame:Disable()
		frame.icon:SetDesaturated(1)
	else
		frame:Enable()
		frame.icon:SetDesaturated(nil)
		if (self.currentTeam) then
			self.teamName:SetText(self.currentTeam.name or L["Unnamed"])
		end
	end
	local selectedTeam
	if (self.offset + frame:GetID() == self.db.profile.currentTeam) then
--		frame.iconBorder:Show()
		frame.icon:SetAlpha(1)
		frame:SetWidth(SELECTED_TEAM_ICON_SIZE)
		frame:SetHeight(SELECTED_TEAM_ICON_SIZE)
		selectedTeam = frame
	else
--		frame.iconBorder:Hide()
		frame.icon:SetAlpha(0.6)
		frame:SetWidth(TEAM_ICON_SIZE)
		frame:SetHeight(TEAM_ICON_SIZE)
	end
	if (selectedTeam) then
		self.teamMarker:ClearAllPoints()
		self.teamMarker:SetPoint("BOTTOM", selectedTeam, "TOP", 0, 0)
		self.teamMarker:Show()
	end
end

local function _OnShowPopup(popup)
	local self = popup.obj
	if (not self.currentTeam) then
		popup:Hide()
		return
	end
	self.selectedTexture = nil
	popup.editBox:SetText(self.currentTeam.name or L["Unnamed"])
end

local function _OnSavePopup(ok)
	local self = ok:GetParent().obj
	local popup = self.popup
	if (not self.currentTeam) then
		popup:Hide()
		return
	end
	self.currentTeam.name = popup.editBox:GetText() or L["Unnamed"]
	if (self.selectedTexture) then
		--self.currentTeam.icon = "INTERFACE\\ICONS\\"..self.selectedTexture
		self.currentTeam.icon = self.selectedTexture
--	else
--		self.currentTeam.icon = "INTERFACE\\ICONS\\".._GetIconTexture(self, 1)
	end
	popup:Hide()
	self:SendMessage("PETBM_TEAM_CHANGED", self.db.profile.currentTeam)
end

local function _UpdatePopup(scrollFrame)
	local popup = scrollFrame:GetParent()
	local self = popup.obj
	local numIcons = #self.icons
	local offset = FauxScrollFrame_GetOffset(popup.scrollFrame)
	local index = (offset * NUM_ICONS_PER_ROW) + 1
	
	log:Debug("offset [%s] numIcons [%s]", offset, numIcons)
	
	local texture
	for row=1, NUM_ICON_ROWS do
		log:Debug("loop 1")
		local iconLine = popup["iconLine"..row]
		for col=1, NUM_ICONS_PER_ROW do
			log:Debug("loop 2")
			local icon = iconLine["icon"..col]
			if (index > numIcons) then
				log:Debug("hide 1")
				icon:Hide()
			else
				log:Debug("load texture")
				local texture = _GetIconTexture(self, index)
				log:Debug("loaded texture")
				if (texture) then
					log:Debug('Set texture: [%s]', texture)
					--icon.icon:SetTexture("INTERFACE\\ICONS\\"..texture)
					icon.icon:SetTexture(texture)
					icon:Show()
					if (texture == self.selectedTexture) then
						icon:SetChecked(1)
					else
						icon:SetChecked(nil)
					end
				else
					log:Debug('hide texture')
					icon:Hide()
				end
				log:Debug("after loop")
				index = index + 1
			end
		end
	end
	FauxScrollFrame_Update(popup.scrollFrame, ceil(numIcons / NUM_ICONS_PER_ROW) , NUM_ICON_ROWS, ICON_ROW_HEIGHT)
end

local function _TogglePopup(frame)
	local self = frame.obj
	if (self.popup:IsVisible()) then
		self.popup:Hide()
	else
		if (#self.icons == 0) then
			GetMacroIcons(self.icons)
			GetMacroItemIcons(self.icons)
		end
		self.popup:Show()
		_UpdatePopup(self.popup.scrollFrame)
	end
end

local function _Update(self)
	self.background:SetAlpha(petbm.PetBattleMaster.db.profile.teamViewAlpha)
	self.frame:SetBackdropBorderColor(unpack(petbm.PetBattleMaster.db.profile.teamViewBorderColor))
--	self.teamBar:SetBackdropBorderColor(unpack(petbm.PetBattleMaster.db.profile.teamViewBorderColor))
	self.teamMarker:SetVertexColor(unpack(petbm.PetBattleMaster.db.profile.teamViewBorderColor))
	_InitPortraits(self)
end

local function _PortraitOnDragStart(frame)
	local self = frame.obj
	log:Debug("_PortraitOnDragStart petId [%s]", frame.petId)
	if (frame.petId) then
		C_PetJournal.PickupPet(frame.petId, true)
	end
end

local function _CheckHideWorldStateFrame(self)
	log:Debug("_CheckHideWorldStateFrame frame.visible [%s]", self.frame:IsVisible())
	if ((self.frame:IsVisible() or C_PetBattles.IsInBattle()) and WorldStateAlwaysUpFrame) then
			log:Debug("hide")
		self.worldStateHidden = true
		WorldStateAlwaysUpFrame:SetAlpha(0)
	end
end

local function _CheckShowWorldStateFrame(self)
	log:Debug("_CheckShowWorldStateFrame")
	if (self.worldStateHidden and WorldStateAlwaysUpFrame) then
		log:Debug("show")
		WorldStateAlwaysUpFrame:SetAlpha(1)
	end
	self.worldStateHidden = nil
end

local function OnShowWorldStateAlwaysUpFrame(self, frame)
	log:Debug("OnShowWorldStateAlwaysUpFrame")
	_CheckHideWorldStateFrame(self)
end

local function _PortraitOnReceiveDrag(frame)
	local self = frame.obj
	local type, petId = GetCursorInfo()
	if (type == "battlepet") then
		_EnsurePetJournal(self)
		C_PetJournal.SetPetLoadOutInfo(frame:GetID(), petId)
		PetJournal_UpdatePetLoadOut()
		ClearCursor()
		_RevertPetJournal(self)
	end
end

local function _UpdateHealCooldown(frame)
	local start, duration, enable = GetSpellCooldown(frame.spellID)
	CooldownFrame_Set(frame.cooldown, start, duration, enable)
end

local function _InitPopup(self)
	local popup = self.popup
	popup.obj = self
	popup.nameLabel:SetText(L["Team name"])
	popup:SetBackdrop({
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		tile = true, edgeSize = 16,
	})
	popup:SetScript("OnShow", _OnShowPopup)
	popup:SetScript("OnHide", function(frame) wipe(frame.obj.icons) end)
	popup.ok:SetScript("OnClick", _OnSavePopup)
	popup.scrollFrame:SetScript("OnVerticalScroll", function(frame, offset)
		FauxScrollFrame_OnVerticalScroll(frame, offset, ICON_ROW_HEIGHT, _UpdatePopup)
	end)
	
	local scrollbg = popup.scrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
    scrollbg:SetAllPoints(popup.scrollFrame.ScrollBar)
    scrollbg:SetTexture(0, 0, 0, 0.7)
	
	petbm.MovingView.RegisterFrame(popup)
end
 
local function _InitPortraitFrame(self, parent, id)
	local frame = CreateFrame("Frame", "petbmTeamMember"..id, parent, "petbmTeamMemberTemplate")
	frame.obj = self
	frame:RegisterForDrag("LeftButton")
	frame:SetScript("OnDragStart", _PortraitOnDragStart)
	frame:SetScript("OnReceiveDrag", _PortraitOnReceiveDrag)
	frame:SetID(id)
	petbm.WidgetUtil.AddTooltip(frame, L["Pet portrait"], L["Enter pet journal to switch between pets"])
	
	local healthBar = petbm.HealthBar.New(parent, frame:GetWidth() - 2, 8)
	healthBar.frame:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, 0)
	frame.healthBar = healthBar

	frame:SetScript("OnEnter", function(frame)
		local petId = C_PetJournal.GetPetLoadOutInfo(frame:GetID())
		if (petId) then
			local speciesId, customName, level = C_PetJournal.GetPetInfoByPetID(petId)
			local health, maxHealth, power, speed, quality = C_PetJournal.GetPetStats(petId)
			BattlePetToolTip_Show(speciesId, level, quality - 1, maxHealth, power, speed, customName)
			BattlePetTooltip:ClearAllPoints()
			BattlePetTooltip:SetPoint("TOPLEFT", frame, "TOPRIGHT", 0, -10)
		end
	end)
	frame:SetScript("OnLeave", function(frame)
		BattlePetTooltip:Hide()
	end)
			
	return frame
end

local function _InitTeamFrame(self, parent, id)
	local frame = CreateFrame("Button", "petbmTeam"..id, parent, "petbmTeamTemplate")
	self.teamFrames[id] = frame
	frame.obj = self
	frame.delta = 0
	frame:SetID(id)
	frame:SetScript("OnClick", _OnTeamSelected)
--	frame:SetScript("OnUpdate", _UpdateTeamFrame)
	frame:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
	petbm.WidgetUtil.AddTooltip(frame, L["Team selection"], _GetTeamSelectTooltip)
	return frame
end

local function _UpdateAllTeamFrames(self)
	log:Debug("_UpdateAllTeamFrames")
	local n = #self.db.profile.teams
	self.teamMarker:Hide()
	for i=1,petbm.PetTeamView.MAX_TEAM_FRAMES do
		local index = self.offset + i
		local teamFrame = self.teamFrames[i]
		local team = self.db.profile.teams[index]
		if (team) then
			_UpdateTeamFrame(teamFrame, team)
			teamFrame:Show()
		else
			teamFrame:Hide()
		end
	end
	if (self.offset > 0) then
		self.left:Show()
	else
		self.left:Hide()
	end
	if (self.offset + petbm.PetTeamView.MAX_TEAM_FRAMES < n) then
		self.right:Show()
	else
		self.right:Hide()
	end
--	self.slider:SetMinMaxValues(0, math.min(0, n - entries))
	if (n <= 1) then
		self.teamBar:Hide()
	else
		self.teamBar:Show()
		local numEntries = math.min(petbm.PetTeamView.MAX_TEAM_FRAMES, n)
		self.teamBar:SetWidth((numEntries - 1) * (TEAM_ICON_SIZE + 2) + 8 + SELECTED_TEAM_ICON_SIZE)
--		if (entries < n) then
--			self.slider:Show()
--		else
--			self.slider:Hide()
--		end
	end
end

local function _InitTeamBarFrame(self, parent)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetHeight(SELECTED_TEAM_ICON_SIZE + 8)
	frame:SetPoint("TOP", parent, "BOTTOM", 0, 2)
--	frame:SetBackdrop(BACKDROP)
--	frame:SetBackdropColor(unpack(BAR_BACKDROP_COLOR))
--	frame:SetBackdropBorderColor(unpack(BACKDROP_BORDER_COLOR))
	
	for i=1,petbm.PetTeamView.MAX_TEAM_FRAMES do
		local teamButton = _InitTeamFrame(self, frame, i)
		if (i == 1) then
			teamButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
		else
			teamButton:SetPoint("TOPLEFT", self.teamButtons[i - 1], "TOPRIGHT", 2, 0)
		end
		self.teamButtons[i] = teamButton
	end
	
	local teamMarker = frame:CreateTexture(nil, "ARTWORK")
	teamMarker:SetWidth(8)
	teamMarker:SetHeight(5)
	teamMarker:SetTexture("Interface\\Addons\\PetBattleMaster\\resources\\TeamMarker")
	self.teamMarker = teamMarker	
	
	-- scroll buttons
	local left = CreateFrame("Button", nil, frame)
	left.obj = self
	left:SetWidth(24)
	left:SetHeight(24)
	left:SetPoint("RIGHT", frame, "LEFT", 2, 0)
	left:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
	left:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
	left:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
	left:SetScript("OnClick", function(frame)
		local self = frame.obj
		self.offset = math.max(0, self.offset - self.MAX_TEAM_FRAMES)
		_UpdateAllTeamFrames(self)
	end)
	self.left = left

	local right = CreateFrame("Button", nil, frame)
	right.obj = self
	right:SetWidth(24)
	right:SetHeight(24)
	right:SetPoint("LEFT", frame, "RIGHT", -2, 0)
	right:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
	right:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
	right:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
	right:SetScript("OnClick", function(frame)
		local self = frame.obj
		local teams = self.db.profile.teams
		self.offset = math.min(self.offset + self.MAX_TEAM_FRAMES, #teams - self.MAX_TEAM_FRAMES)
		_UpdateAllTeamFrames(self)
	end)
	self.right = right
	
	self.teamBar = frame
end

local function _InitFrame(self)
	local frame = CreateFrame("Frame", "petbmTeamView", UIParent, "SecureFrameTemplate, BackdropTemplate")
	frame.obj = self
	frame:SetWidth(270)
	frame:SetHeight(94)
	frame:SetFrameStrata("DIALOG")
	frame:SetPoint("TOP", UIParent, "TOP", 0, -30)
	frame:SetMovable(true)
	frame:SetScript("OnShow", _OnShow)
	frame:SetScript("OnHide", _OnHide)
	frame:Hide()
	self.frame = frame
	petbm.MovingView.RegisterFrame(frame)
	
	frame:SetBackdrop(BACKDROP)
	frame:SetBackdropColor(unpack(BACKDROP_COLOR))
	
	local background = frame:CreateTexture(nil, "BACKGROUND")
	self.background = background
	background:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
	background:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4)
	background:SetTexture("Interface\\PetBattles\\PetJournal")
	background:SetTexCoord(0.00195313, 0.79882813, 0.59277344, 0.75976563)

	-- pet menu
    local petJournal = CreateFrame("Button", "petbmJournal", frame, "SecureActionButtonTemplate")
    petJournal:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -47)
    petJournal:SetWidth(28)
    petJournal:SetHeight(28)
    petJournal:SetNormalTexture("Interface\\Icons\\Ability_Mount_RidingHorse")
    petJournal.tooltipText = MicroButtonTooltipText(MOUNTS_AND_PETS, "ToggleCollectionsJournal")
    petJournal.newbieText = NEWBIE_TOOLTIP_MOUNTS_AND_PETS
    petJournal:SetScript("OnClick", function() ToggleCollectionsJournal(2) end)

	-- team portraits
	local portrait1 = _InitPortraitFrame(self, frame, 1)
	portrait1:SetPoint("TOPLEFT", frame, "TOPLEFT", 48, -32)
	self.portrait1 = portrait1
	
	local portrait2 = _InitPortraitFrame(self, frame, 2)
	portrait2:SetPoint("LEFT", portrait1, "RIGHT", 20, 0)
	self.portrait2 = portrait2

	local portrait3 = _InitPortraitFrame(self, frame, 3)
	portrait3:SetPoint("LEFT", portrait2, "RIGHT", 20, 0)
	self.portrait3 = portrait3

	-- change team name and icon
	local change = CreateFrame("Button", nil, frame)
	change.obj = self
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
	change:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -12)
	change:SetScript("OnClick", _TogglePopup)
	petbm.WidgetUtil.AddTooltip(change, L["Team name/icon edit"], _GetTeamEditTooltip)

	-- team name
	local teamName = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	teamName:SetJustifyH("LEFT")
	teamName:SetWidth(200)
	teamName:SetPoint("LEFT", change, "RIGHT", 4, 0)
--	teamName:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -12)
	teamName:SetText("Team 1")
	self.teamName = teamName
	
	-- close button
	local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
	close:SetScript("OnClick", function(frame) frame:GetParent():Hide() end)
	
	-- team buttons
	_InitTeamBarFrame(self, frame)
	
	-- heal button
	
	local spellName, spellSubname, spellIcon = GetSpellInfo(HEAL_PET_SPELL)
	log:Debug("spellName [%s]", spellName)
	local heal = CreateFrame("Button", "petbmHeal", frame, "SecureActionButtonTemplate")
	heal:SetAttribute("type", "spell")
	heal:SetAttribute("spell", spellName)
	heal:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -10, -47)
	heal:SetWidth(28)
	heal:SetHeight(28)
	heal.spellID = HEAL_PET_SPELL
	heal:SetScript("OnEnter", PetJournalHealPetButton_OnEnter)
	heal:SetScript("OnLeave", function() GameTooltip:Hide() end)
	heal:SetScript("OnEvent", _UpdateHealCooldown)
	heal:RegisterForClicks("AnyUp", "AnyDown")
	heal:RegisterEvent("SPELL_UPDATE_COOLDOWN")
	self.heal = heal
		
	local cooldown = CreateFrame("Cooldown", "petbmHealCooldown", heal, "CooldownFrameTemplate")
	heal.cooldown = cooldown
	
	local texture = heal:CreateTexture()
	texture:SetTexture(spellIcon)
	texture:SetAllPoints(heal)
end

local function ProfileUpdate(self)
	_UpdateAllTeamFrames(self)
end

local function SetPetLoadOutInfo(self)
	_SaveCurrentTeam(self)
end

local function SetAbility(self)
	_SaveCurrentTeam(self)
end

local function ToggleEditTeam(self)
	_TogglePopup(self.frame)
end

local function _OnShow(frame)
	log:Debug("_OnShow")
	_CheckHideWorldStateFrame(frame.obj)
	_UpdateAllTeamFrames(frame.obj)
end

local function _OnHide(frame)
	log:Debug("_OnHide")
	_CheckShowWorldStateFrame(frame.obj)
end

local function OnShowPetJournal(self)
	if (self.frame:IsVisible() and not self.petJournalToggled) then
		self.reopenAfterJournal = true
		self.frame:Hide()
		_OnHide(self.frame)
	end
end

local function OnHidePetJournal(self)
	if (self.reopenAfterJournal) then
		self.reopenAfterJournal = nil
		self.frame:Show()
		-- why is the callback not triggerd by Show() ???
		_OnShow(self.frame)
	end
end

local function PET_BATTLE_CLOSE(self)
	if (petbm.PetBattleMaster.db.profile.autoOpenTeamView) then
		self.frame:Show()
	else
		_CheckShowWorldStateFrame(self)
	end
end

local function PET_BATTLE_OPENING_START(self)
	self.frame:Hide()
	_CheckHideWorldStateFrame(self)
end

local function PET_JOURNAL_LIST_UPDATE(self)
	log:Debug("PET_JOURNAL_LIST_UPDATE")
	_InitPortraits(self)
end

local function PET_JOURNAL_PET_DELETED(self)
	_InitPortraits(self)
end

local function PETBM_TEAM_SELECTED(self, event, teamIndex)
	self.db.profile.currentTeam = teamIndex
	self.currentTeam = self.db.profile.teams[teamIndex]
	if (self.currentTeam) then
		_CheckCurrentTeam(self)
		self.teamName:SetText(self.currentTeam.name or L["Unnamed"])
		_UpdateAllTeamFrames(self)
		_EnsurePetJournal(self)
		self.processFrame:Show()
	else
		log:Debug("PETBM_TEAM_SELECTED no team found for teamIndex [%s]", teamIndex)
	end
end

local function PETBM_TEAM_CHANGED(self)
	_UpdateAllTeamFrames(self)
end

local function PETBM_TEAM_DELETED(self, event, teamIndex)
	log:Debug("PETBM_TEAM_DELETED")
	if (self.db.profile.currentTeam and self.db.profile.currentTeam == teamIndex) then
		self.db.profile.currentTeam = nil
		local teams = self.db.profile.teams
		log:Debug("current team n [%s]", #teams)
		if (#teams > 0) then
			self.db.profile.currentTeam = 1
			self:SendMessage("PETBM_TEAM_SELECTED", self.db.profile.currentTeam)
		end
	else
		log:Debug("not the current team")
		_UpdateAllTeamFrames(self)
	end
end

local function PETS_UPDATED(self)
	-- we get several updates after starting the game
	if (self.checkCount < 10) then
		-- sometimes Blizzard resets all petIds :-(
		_CheckAllTeams(self);
		self.checkCount = self.checkCount + 1
	end 
end

local function IconButton_OnClick(frame, button, down)
	local self = petbm.PetTeamView
	local popup = self.popup
	log:Debug("icon click frame: [%s]", frame)
	local row = button:GetParent():GetID() - 1
	local col = button:GetID()
	local index = (FauxScrollFrame_GetOffset(popup.scrollFrame) * NUM_ICONS_PER_ROW) + (row * NUM_ICONS_PER_ROW) + col
	log:Debug("index [%s]", index)
	if (index <= #self.icons) then
		self.selectedTexture = _GetIconTexture(self, index)
		log:Debug("texture [%s]", self.selectedTexture)
	end 
--	MacroPopupButton_SelectTexture(self:GetID() + ( * NUM_ICONS_PER_ROW));
	_UpdatePopup(popup.scrollFrame)
end

local function OnInitialize(self)
	self.teamButtons = {}
	self.teamFrames = {}
	self.abilities = {}
	self.updatePortraitsDelta = 0
	self.offset = 0
	self.checkCount = 0
	self.db = petbm.PetBattleMaster.db:RegisterNamespace("PetTeamView", {
		profile = {
			currentTeam = 1,
    		teams = {}
    	}
    })
    log:Debug("OnInitialize numTeams [%s]", #self.db.profile.teams)
    --_CleanupTeams(self)
    self.currentTeam = self.db.profile.teams[self.db.profile.currentTeam]
    
    self.processFrame = CreateFrame("Frame")
    self.processFrame.obj = self
    self.processFrame:SetScript("OnUpdate", _SelectTeamProcess)
    self.processFrame:Hide()
    
	_InitFrame(self)
end

local function OnEnable(self)
	self.popup = _G["petbmNameIconEditor"]
	self.icons = {}
	self.textureHelper = CreateFrame("Button")
	self.textureHelper.icon = self.textureHelper:CreateTexture()
	_InitPopup(self)

	self:RegisterEvent("PET_BATTLE_OPENING_START")
	self:RegisterEvent("PET_BATTLE_CLOSE")
	self:RegisterEvent("PET_JOURNAL_LIST_UPDATE")
	self:RegisterEvent("PET_JOURNAL_PET_DELETED")
	self:RegisterEvent("PET_BATTLE_MAX_HEALTH_CHANGED")
	self:RegisterEvent("PET_BATTLE_HEALTH_CHANGED")
	self:RegisterEvent("PET_BATTLE_XP_CHANGED")
	self:RegisterMessage("PETBM_TEAM_SELECTED")
	self:RegisterMessage("PETBM_TEAM_DELETED")
	self:RegisterMessage("PETBM_TEAM_CHANGED")
	self:RegisterMessage("PETS_UPDATED")

--	self:SecureHookScript(WorldStateAlwaysUpFrame, "OnShow", "OnShowWorldStateAlwaysUpFrame")
end

local function ToggleView(self)
	log:Debug("ToggleView")
	if (self.frame:IsVisible()) then
		self.frame:Hide()
	else
--		_EnsurePetJournal(self)
		self.frame:Show()
		_UpdateAllTeamFrames(self)
		local teams = self.db.profile.teams
		if (not self.db.profile.currentTeam and #teams > 0) then
			self.db.profile.currentTeam = 1
		end
		if (self.db.profile.currentTeam) then
			self:SendMessage("PETBM_TEAM_SELECTED", self.db.profile.currentTeam)
		end
--		_RevertPetJournal(self)
	end	
end

local function IsValidPet(self, pet)
	return _IsValidPet(pet)
end

local function Init(self)
	self:SecureHookScript(PetJournal, "OnShow", "OnShowPetJournal")
	self:SecureHookScript(PetJournal, "OnHide", "OnHidePetJournal")
	self:SecureHook(C_PetJournal, "SetPetLoadOutInfo")
	self:SecureHook(C_PetJournal, "SetAbility")
	self:ProfileUpdate()
end

petbm.PetTeamView.Init = Init
petbm.PetTeamView.OnInitialize = OnInitialize
petbm.PetTeamView.OnEnable = OnEnable
petbm.PetTeamView.ProfileUpdate = ProfileUpdate
petbm.PetTeamView.ToggleView = ToggleView
petbm.PetTeamView.PET_BATTLE_CLOSE = PET_BATTLE_CLOSE
petbm.PetTeamView.PET_BATTLE_OPENING_START = PET_BATTLE_OPENING_START
petbm.PetTeamView.PET_JOURNAL_LIST_UPDATE = _Update
petbm.PetTeamView.PET_JOURNAL_PET_DELETED = _Update
petbm.PetTeamView.PET_BATTLE_MAX_HEALTH_CHANGED = _Update
petbm.PetTeamView.PET_BATTLE_HEALTH_CHANGED = _Update
petbm.PetTeamView.PET_BATTLE_XP_CHANGED = _Update
petbm.PetTeamView.PETBM_TEAM_SELECTED = PETBM_TEAM_SELECTED
petbm.PetTeamView.PETBM_TEAM_DELETED = PETBM_TEAM_DELETED
petbm.PetTeamView.PETBM_TEAM_CHANGED = PETBM_TEAM_CHANGED
petbm.PetTeamView.PETS_UPDATED = PETS_UPDATED
petbm.PetTeamView.SetPetLoadOutInfo = SetPetLoadOutInfo
petbm.PetTeamView.SetAbility = SetAbility
petbm.PetTeamView.IconButton_OnClick = IconButton_OnClick
petbm.PetTeamView.ToggleEditTeam = ToggleEditTeam
petbm.PetTeamView.SaveTeam = _SaveTeam
petbm.PetTeamView.IsValidPet = IsValidPet
petbm.PetTeamView.OnShowPetJournal = OnShowPetJournal
petbm.PetTeamView.OnHidePetJournal = OnHidePetJournal
petbm.PetTeamView.CheckCurrentTeam = _CheckCurrentTeam
--petbm.PetTeamView.OnShowWorldStateAlwaysUpFrame = OnShowWorldStateAlwaysUpFrame
