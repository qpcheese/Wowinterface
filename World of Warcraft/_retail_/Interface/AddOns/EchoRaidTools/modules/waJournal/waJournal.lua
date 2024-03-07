local _AddonName, _EchoRaidTools = ...;

-- luacheck: globals EncounterJournal EncounterJournal_HideCreatures EncounterJournal_SetTab EncounterJournal_DisplayEncounter EncounterJournal_DisplayInstance EncounterJournal_ValidateSelectedTab ScrollFrame_OnScrollRangeChanged ScrollFrame_OnVerticalScroll ScrollFrameTemplate_OnMouseWheel ScrollFrame_OnLoad PAPER_FRAME_COLLAPSED_COLOR PAPER_FRAME_EXPANDED_COLOR ElvUI

local journal = _EchoRaidTools:NewModule("waJournal");

local contentFrame;
local scrollChild;
local scrollData;
local doFullUpdate;

local function createButtonTexture(parent,layer,texture,hidden)
	local tex = parent:CreateTexture(nil,layer,texture);
	tex:ClearAllPoints();
	if(hidden)then
		tex:Hide();
	end
	return tex;
end

local function getPayloadForUID(uid)
	if(journal.importData)then
		for _,waData in pairs(journal.importData) do
			if(waData.uid == uid)then
				return tDClone(waData);
			end
		end
	end
end

local function onImportButtonClicked(self,button,down)
	local data = self:GetParent():GetParent().data;

	local importPacket = {};
	importPacket.m = "d";
	importPacket.d = getPayloadForUID(data.uid);
	importPacket.s = "4.0.2";
	importPacket.v = 1421;

	if(data.children)then
		importPacket.c = {};
		local function traverseChildren(children)
			for _,childOptionData in ipairs(children) do
				local child = getPayloadForUID(childOptionData.uid);
				table.insert(importPacket.c,child);
				if(childOptionData.children)then
					importPacket.v = 2000;
					traverseChildren(childOptionData.children);
				end
			end
		end
		traverseChildren(data.children);
	end

	WeakAuras.Import(importPacket);
end


local function createWAJournalButton(parent)
	local frame = CreateFrame("Frame",nil,parent);
	frame:SetSize(5,24);

	frame.descriptionFrame = CreateFrame("SimpleHTML", nil, frame)
	frame.description = frame.descriptionFrame:CreateFontString(nil,"ARTWORK","GameFontBlack");
	frame.descriptionFrame.description = frame.description
	frame.description:SetSize(0,0);
	frame.description:SetPoint("TOP",frame,"BOTTOM",0,-9);
	frame.description:SetVertexColor(0.25,0.1484375,0.02,1);

	-- hyperlink format for Descriptions: |cff0066ff|Hjournal:2:sectionID:difficultyID:spellID|h[Spell Name]|h|r
	-- sectionID is the awkward bit. see https://wow.tools/dbc/?dbc=journalencountersection
	-- difficultyID = 16 for Mythic
	-- spellID is optional and just lets the link carry a tooltip for the spell
	frame.descriptionFrame:SetScript("OnHyperlinkEnter",
		function(self, link, text)
			local spellID = select(5, strsplit(":", link))
			if spellID and GetSpellInfo(spellID) then
				GameTooltip:SetOwner(self.description, "ANCHOR_BOTTOMRIGHT")
				GameTooltip:ClearLines()
				GameTooltip:SetSpellByID(spellID)
				GameTooltip:Show()
			end
		end
	)
	frame.descriptionFrame:SetScript("OnHyperlinkLeave",
		function(self, link, text)
			GameTooltip:Hide()
		end
	)
	frame.descriptionFrame:SetScript("OnHyperlinkClick",
		function(self, link, text, button)
			SetItemRef(link, text, button)
		end
	)

	frame.descriptionBG = createButtonTexture(frame,"BACKGROUND","UI-PaperOverlay-AbilityTextBG");
	frame.descriptionBG:SetSize(12,12);
	frame.descriptionBG:SetPoint("TOPLEFT",frame.description,"TOPLEFT",-9,12);
	frame.descriptionBG:SetPoint("BOTTOMRIGHT",frame.description,"BOTTOMRIGHT",9,-11);

	frame.descriptionBGBottom = createButtonTexture(frame,"BACKGROUND","UI-PaperOverlay-AbilityTextBottomBorder");
	frame.descriptionBGBottom:SetPoint("LEFT",frame.descriptionBG,"BOTTOMLEFT",0,0);
	frame.descriptionBGBottom:SetPoint("RIGHT",frame.descriptionBG,"BOTTOMRIGHT",0,0);

	frame.button = CreateFrame("Button",nil,frame);
	frame.button:SetSize(5,24);
	frame.button:SetPoint("TOPLEFT");
	frame.button:SetPoint("RIGHT");

	frame.button.downloadButton = CreateFrame("Button",nil,frame.button);
	frame.button.downloadButton:SetSize(12,20);
	frame.button.downloadButton:SetPoint("RIGHT",frame.button,"RIGHT",-4,0);

	local normalTexture = frame.button.downloadButton:CreateTexture(nil,"BACKGROUND");
	normalTexture:SetSize(32,32);
	normalTexture:SetPoint("CENTER");
	normalTexture:SetTexture("Interface\\AddOns\\EchoRaidTools\\assets\\textures\\Journal\\dl-icon-default.tga");
	frame.button.downloadButton:SetNormalTexture(normalTexture);
	frame.button.downloadButton:SetDisabledTexture(normalTexture);
	normalTexture:Show();

	local pushedTexture = frame.button.downloadButton:CreateTexture(nil,"BACKGROUND");
	pushedTexture:SetSize(32,32);
	pushedTexture:SetPoint("CENTER");
	pushedTexture:SetTexture("Interface\\AddOns\\EchoRaidTools\\assets\\textures\\Journal\\dl-icon-pushed.tga");
	frame.button.downloadButton:SetPushedTexture(pushedTexture);

	local highlightTexture = frame.button.downloadButton:CreateTexture(nil,"BACKGROUND");
	highlightTexture:SetSize(32,32);
	highlightTexture:SetPoint("CENTER");
	highlightTexture:SetTexture("Interface\\AddOns\\EchoRaidTools\\assets\\textures\\Journal\\dl-icon-hover.tga");
	highlightTexture:SetBlendMode("ADD");
	frame.button.downloadButton:SetHighlightTexture(highlightTexture);
	frame.button.downloadButton:SetScript("OnClick",onImportButtonClicked);

	frame.button.versionLabel = frame.button:CreateFontString(nil,"ARTWORK","GameFontNormalMed1");
	frame.button.versionLabel:SetSize(24,24);
	frame.button.versionLabel:SetPoint("RIGHT",frame.button.downloadButton,"LEFT",-3,0);
	frame.button.versionLabel:SetJustifyH("RIGHT");

	frame.button.expandIcon = frame.button:CreateFontString(nil,"OVERLAY","GameFontNormalLarge");
	frame.button.expandIcon:SetSize(12,12);
	frame.button.expandIcon:SetPoint("LEFT",5,0);

	frame.button.waIcon = frame.button:CreateTexture(nil,"OVERLAY");
	frame.button.waIcon:SetSize(18,18);
	frame.button.waIcon:SetPoint("LEFT",frame.button.expandIcon,"RIGHT",5,0);

	frame.button.label = frame.button:CreateFontString(nil,"OVERLAY","GameFontNormalMed3");
	frame.button.label:SetSize(5,24);
	frame.button.label:SetPoint("LEFT",frame.button.waIcon,"RIGHT",5,-1);
	frame.button.label:SetJustifyH("LEFT");

	local highlightLeft = createButtonTexture(frame.button,"HIGHLIGHT","UI-EJ-PaperHeader-Highlight-Left");
	highlightLeft:SetPoint("LEFT",-1,-1);
	local highlightRight = createButtonTexture(frame.button,"HIGHLIGHT","UI-EJ-PaperHeader-Highlight-Right");
	highlightRight:SetPoint("RIGHT",3,-1);
	local highlightMid = createButtonTexture(frame.button,"HIGHLIGHT","_PaperHeader-Highlight-Mid");
	highlightMid:SetPoint("LEFT",highlightLeft,"RIGHT",-33,0);
	highlightMid:SetPoint("RIGHT",highlightRight,"LEFT",33,0);

	frame.button.glowframe = CreateFrame("Frame",nil,frame.button);
	frame.button.glowframe:SetPoint("TOPLEFT",0,0);
	frame.button.glowframe:SetPoint("BOTTOMRIGHT",0,0);
	frame.button.glowframe:SetAlpha(0);

	local glowHighlightLeft = createButtonTexture(frame.button.glowframe,"OVERLAY","UI-EJ-PaperHeader-Highlight-Left");
	glowHighlightLeft:SetPoint("LEFT",-1,-1);
	local glowHighlightRight = createButtonTexture(frame.button.glowframe,"OVERLAY","UI-EJ-PaperHeader-Highlight-Right");
	glowHighlightRight:SetPoint("RIGHT",3,-1);
	local glowHighlightMid = createButtonTexture(frame.button.glowframe,"OVERLAY","_PaperHeader-Highlight-Mid");
	glowHighlightMid:SetPoint("LEFT",glowHighlightLeft,"RIGHT",-33,0);
	glowHighlightMid:SetPoint("RIGHT",glowHighlightRight,"LEFT",33,0);

	frame.button.glowframe.SetAnimationColor = function(a,r,g,b)
		glowHighlightLeft:SetVertexColor(r,g,b,a);
		glowHighlightRight:SetVertexColor(r,g,b,a);
		glowHighlightMid:SetVertexColor(r,g,b,a);
	end

	frame.glowAnimation = frame:CreateAnimationGroup();
	frame.glowAnimation:SetLooping("REPEAT");
	for i=1,2 do
		local animationStep = frame.glowAnimation:CreateAnimation("Alpha");
		animationStep:SetTarget(frame.button.glowframe);
		animationStep:SetFromAlpha(i % 2 == 0 and 1 or 0);
		animationStep:SetToAlpha(i % 2 == 0 and 0 or 1);
		animationStep:SetDuration(0.6);
		animationStep:SetOrder(i);
	end

	local eLeftUp = createButtonTexture(frame.button,"BACKGROUND","UI-PaperOverlay-PaperHeader-SelectUp-Left",true);
	eLeftUp:SetPoint("LEFT",-1,-1);
	local eRightUp = createButtonTexture(frame.button,"BACKGROUND","UI-PaperOverlay-PaperHeader-SelectUp-Right",true);
	eRightUp:SetPoint("RIGHT",3,-1);
	local eLeftDown = createButtonTexture(frame.button,"BACKGROUND","UI-EJ-PaperHeader-SelectDown-Left",true);
	eLeftDown:SetPoint("LEFT",eLeftUp,"LEFT",0,0);
	local eRightDown = createButtonTexture(frame.button,"BACKGROUND","UI-EJ-PaperHeader-SelectDown-Right",true);
	eRightDown:SetPoint("RIGHT",eRightUp,"RIGHT",0,0);

	local cLeftUp = createButtonTexture(frame.button,"BACKGROUND","UI-EJ-PaperHeader-UnSelectUp-Left");
	cLeftUp:SetPoint("LEFT",eLeftUp,"LEFT",0,0);
	local cRightUp = createButtonTexture(frame.button,"BACKGROUND","UI-EJ-PaperHeader-UnSelectUp-Right");
	cRightUp:SetPoint("RIGHT",eRightUp,"RIGHT",0,0);
	local cLeftDown = createButtonTexture(frame.button,"BACKGROUND","UI-EJ-PaperHeader-UnSelectDown-Left",true);
	cLeftDown:SetPoint("LEFT",eLeftUp,"LEFT",0,0);
	local cRightDown = createButtonTexture(frame.button,"BACKGROUND","UI-EJ-PaperHeader-UnSelectDown-Right",true);
	cRightDown:SetPoint("RIGHT",eRightUp,"RIGHT",0,0);

	local eMidUp = createButtonTexture(frame.button,"BACKGROUND","UI-PaperOverlay-PaperHeader-SelectUp-Mid",true);
	eMidUp:SetDrawLayer("BACKGROUND",-2);
	eMidUp:SetPoint("LEFT",eLeftUp,"RIGHT",-32,0);
	eMidUp:SetPoint("RIGHT",eRightUp,"LEFT",33,0);

	local eMidDown = createButtonTexture(frame.button,"BACKGROUND","_PaperHeader-SelectDown-Mid",true);
	eMidDown:SetDrawLayer("BACKGROUND",-2);
	eMidDown:SetPoint("LEFT",eLeftDown,"RIGHT",-32,0);
	eMidDown:SetPoint("RIGHT",eRightDown,"LEFT",33,0);

	local cMidUp = createButtonTexture(frame.button,"BACKGROUND","_PaperHeader-UnSelectUp-Mid");
	cMidUp:SetDrawLayer("BACKGROUND",-2);
	cMidUp:SetPoint("LEFT",eLeftUp,"RIGHT",-32,0);
	cMidUp:SetPoint("RIGHT",eRightUp,"LEFT",33,0);

	local cMidDown = createButtonTexture(frame.button,"BACKGROUND","_PaperHeader-UnSelectDown-Mid",true);
	cMidDown:SetDrawLayer("BACKGROUND",-2);
	cMidDown:SetPoint("LEFT",eLeftDown,"RIGHT",-32,0);
	cMidDown:SetPoint("RIGHT",eRightDown,"LEFT",33,0);

	frame.textures = {
		expanded = {
			up = {
				eLeftUp,eMidUp,eRightUp,
			},
			down = {
				eLeftDown,eMidDown,eRightDown,
			},
		},
		collapsed = {
			up = {
				cLeftUp,cMidUp,cRightUp,
			},
			down = {
				cLeftDown,cMidDown,cRightDown,
			},
		},
	};

	local function displayTextureSet(set,collapsed,isDown)
		for textureType,textures in pairs(set) do
			for _,texture in ipairs(textures) do
				if(collapsed)then
					texture:Hide();
				else
					if((textureType == "down") == isDown)then
						texture:Show();
					else
						texture:Hide();
					end
				end
			end
		end
	end

	local function displayTextures(collapsed,isDown)
		displayTextureSet(frame.textures.expanded,collapsed,isDown);
		displayTextureSet(frame.textures.collapsed,not collapsed,isDown);
	end

	frame.button:SetScript("OnMouseDown",function()
		displayTextures(frame.data.collapsed,true);
	end);

	frame.button:SetScript("OnMouseUp",function()
		displayTextures(frame.data.collapsed,false);
	end);

	frame:HookScript("OnHide",function()
		frame.animationWasPlayingOnHide = frame.glowAnimation:IsPlaying();
		frame.glowAnimation:Stop();
	end);

	frame:HookScript("OnShow",function()
		if(frame.animationWasPlayingOnHide)then
			frame.glowAnimation:Play();
		end
	end);

	frame.button:SetScript("OnClick",function(self,button)
		if(not frame.data.cantCollapse)then
			frame.data.collapsed = not frame.data.collapsed;
			doFullUpdate();
		end
	end);

	frame.displayTextures = displayTextures;

	return frame;
end

local waJournalButtons = {};
local function getOrCreateWAJournalButton()
	for _,pending in ipairs(waJournalButtons) do
		if(pending.isFree)then
			pending.isFree = false;
			return pending;
		end
	end

	local frame = createWAJournalButton(scrollChild);
	frame.isFree = false;
	table.insert(waJournalButtons,frame);
	frame:SetID(#waJournalButtons);
	return frame;
end

local function clearAllWAJournalButtons()
	for i=#waJournalButtons,1,-1 do
		local pending = waJournalButtons[i];
		if(not pending.isFree)then
			pending.isFree = true;
			pending:ClearAllPoints();
			pending.glowAnimation:Stop();
			pending.animationWasPlayingOnHide = nil;
		end
	end
end

local function updateScrollButtonFrame(frame,data,depth)
	frame:SetWidth(scrollChild:GetWidth() - (10 * depth));
	frame.data = data;
	frame.displayTextures(data.collapsed,false);
	frame.glowAnimation:Stop();

	local button = frame.button;

	local mostLeftFrame = frame;
	if(not data.cantCollapse)then
		button.expandIcon:SetText(data.collapsed and "+" or "-");
		button.expandIcon:Show();
		mostLeftFrame = button.expandIcon;
	else
		button.expandIcon:Hide();
	end

	if(data.icon)then
		button.waIcon:SetPoint("LEFT",mostLeftFrame,mostLeftFrame == frame and "LEFT" or "RIGHT",5,0);
		button.waIcon:Show();
		button.waIcon:SetTexture(data.icon);
		button.label:SetPoint("LEFT",frame.button.waIcon,"RIGHT",5,0);
	else
		button.waIcon:Hide();
		button.label:SetPoint("LEFT",mostLeftFrame,mostLeftFrame == frame and "LEFT" or "RIGHT",5,0);
	end

	local label = strtrim(data.label);
	if(data.parent)then
		local parent = data.parent:gsub("%-","%%-");
		label = label:gsub(strtrim(parent),"");
	end
	local first3characters = label:sub(1,3);
	if(first3characters == " - ")then
		label = label:sub(3);
	end

	local mostRightFrame = frame;

	if(data.type == "wa" or data.type == "wagroup")then
		button.downloadButton:Show();
		button.downloadButton:Enable();
		button.downloadButton:GetNormalTexture():SetVertexColor(1,1,1,1);

		button.versionLabel:Show();

		local color;
		local localWAData = journal:GetWADataByAny(data.uid,data.label);
		local waLocalVersion = localWAData and (localWAData.echoVersion or 0);
		if(not localWAData or waLocalVersion > data.version)then
			color = "ffbb0000";
			button.glowframe.SetAnimationColor(1,0xBB/255,0,0);
			frame.glowAnimation:Play();
		elseif(waLocalVersion < data.version)then
			color = "ffdd8417";
			button.glowframe.SetAnimationColor(1,0xDD/255,0x84/255,0x17/255);
			frame.glowAnimation:Play();
		else
			color = "ff00b01d";
		end

		button.versionLabel:SetText("|c"..color..data.version.."|r");
		mostRightFrame = button.versionLabel;
	else
		button.downloadButton:Hide();
		button.versionLabel:Hide();
	end

	button.label:SetPoint("RIGHT",mostRightFrame,mostRightFrame == frame and "RIGHT" or "LEFT",-5,0);
	button.label:SetText(label);

	if(data.children)then
		button.label:SetFontObject("GameFontNormalMed3");
	else
		button.label:SetFontObject("GameFontNormal");
	end

	if(data.collapsed)then
		button.expandIcon:SetTextColor(PAPER_FRAME_COLLAPSED_COLOR:GetRGB());
		button.label:SetTextColor(PAPER_FRAME_COLLAPSED_COLOR:GetRGB());
	else
		button.expandIcon:SetTextColor(PAPER_FRAME_EXPANDED_COLOR:GetRGB());
		button.label:SetTextColor(PAPER_FRAME_EXPANDED_COLOR:GetRGB());
	end

	frame.description:SetText(data.description or "");
	if(data.description and not data.collapsed)then
		frame.descriptionBG:Show();
		frame.descriptionBGBottom:Show();
		frame.description:Show();
		frame.description:SetWidth(frame:GetWidth() - 20);
	else
		frame.descriptionBG:Hide();
		frame.descriptionBGBottom:Hide();
		frame.description:Hide();
	end
end

local function updateDisplay(data,depth)
	for index,child in ipairs(data) do
		local frame = getOrCreateWAJournalButton();
		updateScrollButtonFrame(frame,child,depth);
		if(child.children and not child.collapsed)then
			updateDisplay(child.children,depth + 1);
		end
	end
end

local function layoutScrollBox()
	local totalSize = 0;
	for index,button in ipairs(waJournalButtons) do
		if(not button.isFree)then
			button:Show();
			totalSize = totalSize + button:GetHeight();

			if(index == 1)then
				button:SetPoint("TOPRIGHT",scrollChild,"TOPRIGHT",0,-2);
				totalSize = totalSize + 2;
			else
				local targetButton = waJournalButtons[index - 1];
				local descriptionHeight = 0;
				if(not targetButton.data.collapsed and strlen(targetButton.description:GetText() or "") > 0)then
					descriptionHeight = targetButton.descriptionBG:GetHeight();
					totalSize = totalSize + descriptionHeight;
				end

				button:SetPoint("TOPRIGHT",targetButton,"BOTTOMRIGHT",0,-5-descriptionHeight);
				totalSize = totalSize + 5;
			end
		else
			button:Hide();
		end
	end
	scrollChild:SetHeight(totalSize);
end

local function createContentFrame()
	contentFrame = CreateFrame("Frame", nil, EncounterJournal.encounter.info);
	contentFrame:SetSize(390,423);
	contentFrame:SetPoint("BOTTOMRIGHT",-3,1);
	contentFrame:Hide();

	local scrollFrame = CreateFrame("ScrollFrame",nil,contentFrame);
	scrollFrame:SetSize(350,383);
	scrollFrame:SetPoint("BOTTOMRIGHT",-5,1);

	scrollFrame:SetScript("OnScrollRangeChanged",ScrollFrame_OnScrollRangeChanged);
	scrollFrame:SetScript("OnVerticalScroll",ScrollFrame_OnVerticalScroll);
	scrollFrame:SetScript("OnMouseWheel",ScrollFrameTemplate_OnMouseWheel);

	contentFrame.scrollframe = scrollFrame;

	scrollChild = CreateFrame("Frame",nil,scrollFrame,"BackdropTemplate");
	scrollChild:SetSize(320,372);
	scrollChild:SetPoint("TOPLEFT",scrollFrame);
	scrollChild:Show();
	scrollChild:SetBackdropColor(1,1,1,1);

	scrollFrame:SetScrollChild(scrollChild);

	ScrollFrame_OnLoad(scrollFrame);
	scrollFrame.ScrollBar:AdjustPointsOffset(-20,0);

	contentFrame:SetScript("OnShow",function(self)
		EncounterJournal_HideCreatures();
		EncounterJournal.encounter.info.difficulty:Hide();
		EncounterJournal.encounter.info.rightShadow:Hide();
		EncounterJournal.encounter.info.encounterTitle:Hide();
		EncounterJournal.encounter.instance:Hide();
	end);
end

-- ElvUI Skining
local function doElvUISkin(E, S, tabButton)
	if not (E.private.skins.blizzard.enable and E.private.skins.blizzard.encounterjournal) then return; end
	local EncounterInfo = _G.EncounterJournal.encounter.info;

	tabButton:ClearAllPoints();
	tabButton:Point('TOPLEFT', EncounterInfo.modelTab, 'BOTTOMLEFT', 0, -1);

	tabButton:CreateBackdrop('Transparent');
	tabButton.backdrop:SetInside(2, 2);

	tabButton:SetNormalTexture(E.ClearTexture);
	tabButton:SetPushedTexture(E.ClearTexture);
	tabButton:SetDisabledTexture(E.ClearTexture);

	local hl = tabButton:GetHighlightTexture();
	local r, g, b = unpack(E.media.rgbvaluecolor);
	hl:SetColorTexture(r, g, b, .2);
	hl:SetInside(tabButton.backdrop);

	S:HandleTrimScrollBar(contentFrame.scrollframe.ScrollBar);

	tabButton:SetScript('OnEnter', E.noop);
	tabButton:SetScript('OnLeave', E.noop);
	tabButton.SetPoint = E.noop;

	if(not E.private.skins.parchmentRemoverEnable)then
		return;
	end

	local oUpdateScrollButtonFrame = updateScrollButtonFrame;
	updateScrollButtonFrame = function(frame,data,depth)
		oUpdateScrollButtonFrame(frame,data,depth);

		if(not frame.isElvUISkinned)then
			frame.descriptionBG:SetAlpha(0);
			frame.descriptionBGBottom:SetAlpha(0);

			local buttonRegions = {frame.button:GetRegions()};
			for i = 5, 19 do
				local region = buttonRegions[i];
				region:SetTexture();
			end

			frame.description:SetTextColor(1, 1, 1)
			frame.button.label:SetTextColor(unpack(E.media.rgbvaluecolor));
			frame.button.label.SetTextColor = E.noop;
			frame.button.expandIcon:SetTextColor(1, 1, 1);
			frame.button.expandIcon.SetTextColor = E.noop;

			S:HandleButton(frame.button);
			if frame.button:GetFontString() then
				frame.button:GetFontString():SetTextColor(1, 1, 1);
			end

			frame.button.bg = CreateFrame('Frame', nil, frame.button);
			frame.button.bg:SetTemplate();
			frame.button.bg:SetOutside(frame.button.waIcon);
			frame.button.bg:SetFrameLevel(frame.button.bg:GetFrameLevel() - 1);
			frame.button.waIcon:SetTexCoord(.08, .92, .08, .92);

			frame.isElvUISkinned = true;
		end

		if frame.button.waIcon:IsShown() then
			frame.button.bg:Show()
		else
			frame.button.bg:Hide()
		end
	end
end

local function packWAOptions(option,manifestEntry)
	local waData = journal.importData[manifestEntry.id] or manifestEntry;

	option.icon = waData.displayIcon or waData.groupIcon;
	option.label = waData.id;
	option.description = manifestEntry.description or waData.desc;
	option.version = waData.echoVersion or 0;
	option.parent = waData.parent;
	option.uid = waData.uid;
	option.collapsed = true;
	option.cantCollapse = not option.description and not option.children;
end

local function packEncounterOptions(options,encounterData)
	for index,waData in ipairs(encounterData) do
		local option = {};
		option.sortValue = 2;

		if(waData.children)then
			option.children = {};
			option.type = "wagroup";
			option.collapsed = true;
		else
			option.type = "wa";
		end

		packWAOptions(option,waData);

		if(waData.parent)then

			local insertTarget;

			local function traverseChildren(parent)
				if(waData.parent == parent.label)then
					insertTarget = parent;
					return;
				end

				if(parent.children)then
					for _,child in ipairs(parent.children) do
						traverseChildren(child);
						if(insertTarget)then
							return;
						end
					end
				end
			end

			for i=#options,1,-1 do
				local potentialParent = options[i];
				traverseChildren(potentialParent);
				if(insertTarget)then
					break;
				end
			end



			if(insertTarget == nil)then
				ViragDevTool_AddData(option,"options");
				error("Smt is really broken report it to developers",2);
			else
				table.insert(insertTarget.children,option);
			end
		else
			table.insert(options,option);
		end
	end
end

local function buildOptionsTable()
	local options = {};

	if(EncounterJournal)then
		local selectedInstanceID = EncounterJournal.instanceID;
		local selectedEncounterID = _EchoRaidTools:GetEncounterIDforJournalID(EncounterJournal.encounterID);

		if(selectedInstanceID)then
			if(journal.manifest[0])then
				local option = {};
				option.sortValue = -1;
				option.label = "General";
				option.collapsed = true;
				option.children = {};

				table.insert(options,option);
				packEncounterOptions(option.children,journal.manifest[0]);
			end

			local instanceData = journal.manifest[selectedInstanceID];
			if(instanceData)then
				local allEncountersData = instanceData[0];
				if(allEncountersData)then
					local option = {};
					option.sortValue = 0;
					option.label = "All Encounters";
					option.collapsed = true;
					option.children = {};

					table.insert(options,option);
					packEncounterOptions(option.children,allEncountersData);
				end

				if(selectedEncounterID)then
					local encounterData = instanceData[selectedEncounterID];
					if(encounterData)then
						packEncounterOptions(options,instanceData[selectedEncounterID]);
					end
				else
					for encounterID,encounterData in pairs(instanceData) do
						local option = {};
						option.collapsed = true;
						if(encounterID ~= 0)then
							option.sortValue = 1;
							option.label = _EchoRaidTools:GetEncounterDataByEncounterID(encounterID).name;
							option.children = {};
							table.insert(options,option);
							packEncounterOptions(option.children,encounterData);
						end
					end
				end
			end

			table.sort(options,function(t1,t2) return t1.sortValue < t2.sortValue end);
		end
	end

	return options;
end

function doFullUpdate()
	clearAllWAJournalButtons();
	updateDisplay(scrollData,0);
	layoutScrollBox();
end


local function createJournalTab()
	local tabButton = CreateFrame("Button", nil, EncounterJournal.encounter.info);
	tabButton:SetSize(63,57);
	tabButton:SetFrameLevel(510);
	tabButton:SetPoint("TOP", EncounterJournal.encounter.info.modelTab, "BOTTOM", 0, 2);

	local normalTexture = tabButton:CreateTexture(nil, "BACKGROUND");
	normalTexture:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures");
	normalTexture:SetTexCoord(0.25585938,0.37890625,0.90332031,0.95898438);
	normalTexture:SetAllPoints();
	tabButton:SetDisabledTexture(normalTexture);
	tabButton:SetNormalTexture(normalTexture);

	local pushedTexture = tabButton:CreateTexture(nil, "BACKGROUND");
	pushedTexture:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures");
	pushedTexture:SetTexCoord(0.12890625,0.25195313,0.90332031,0.95898438);
	pushedTexture:SetAllPoints();
	tabButton:SetPushedTexture(pushedTexture);

	local highlightTexture = tabButton:CreateTexture(nil, "BACKGROUND");
	highlightTexture:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures");
	highlightTexture:SetTexCoord(0.00195313,0.12500000,0.90332031,0.95898438);
	highlightTexture:SetAllPoints();
	highlightTexture:SetBlendMode("ADD");
	tabButton:SetHighlightTexture(highlightTexture);

	local selectedTexture = tabButton:CreateTexture(nil, "OVERLAY");
	selectedTexture:SetSize(34,34);
	selectedTexture:SetPoint("CENTER",2,0);
	selectedTexture:SetTexture("Interface\\AddOns\\EchoRaidTools\\assets\\textures\\ELp1.tga");
	selectedTexture:Hide();

	local unSelectedTexture = tabButton:CreateTexture(nil, "OVERLAY");
	unSelectedTexture:SetSize(34,34);
	unSelectedTexture:SetPoint("CENTER",2,0);
	unSelectedTexture:SetTexture("Interface\\AddOns\\EchoRaidTools\\assets\\textures\\ELp2.tga");
	unSelectedTexture:Show();

	tabButton.selected = selectedTexture;
	tabButton.unSelected = unSelectedTexture;

	local ourTabIndex = 5;
	tabButton:SetID(ourTabIndex);

	-- This is needed because default blizzard code will error on calling `Click` from invalid tab index that is not accessible globaly
	do
		local function callOriginalAndDoTabStuff(original,...)
			local isOurTab = EncounterJournal.encounter.info.tab == ourTabIndex;
			if(isOurTab)then
				EncounterJournal.encounter.info.tab = 1;
				EncounterJournal_ValidateSelectedTab();
			end

			original(...);

			if(isOurTab)then
				EncounterJournal_SetTab(ourTabIndex);
			end
		end

		local oEncounterJournal_DisplayInstance = EncounterJournal_DisplayInstance;
		EncounterJournal_DisplayInstance = function(...)
			callOriginalAndDoTabStuff(oEncounterJournal_DisplayInstance,...);
			scrollData = buildOptionsTable();
			doFullUpdate();
		end

		local oEncounterJournal_DisplayEncounter = EncounterJournal_DisplayEncounter;
		EncounterJournal_DisplayEncounter = function(...)
			callOriginalAndDoTabStuff(oEncounterJournal_DisplayEncounter,...);
			scrollData = buildOptionsTable();
			doFullUpdate();
		end
	end

	tabButton:SetScript("OnClick",function(self,button)
		EncounterJournal_SetTab(ourTabIndex);
		PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN);
	end);

	createContentFrame();

	hooksecurefunc("EncounterJournal_SetTab",function(tabType)
		if(tabType == ourTabIndex)then
			if(not contentFrame:IsShown())then
				contentFrame:Show();
			else
				contentFrame:GetScript("OnShow")(contentFrame);
			end
			unSelectedTexture:Hide();
			selectedTexture:Show();
			tabButton:LockHighlight();
		else
			contentFrame:Hide();
			unSelectedTexture:Show();
			selectedTexture:Hide();
			tabButton:UnlockHighlight();
		end
	end);

	if(IsAddOnLoaded("ElvUI"))then
		local E = ElvUI[1];
		local S = E:GetModule('Skins');
		if(S)then
			-- I will go insane
			if(S.addonsToLoad["Blizzard_EncounterJournal"])then
				S:AddCallbackForAddon("Blizzard_EncounterJournal", "EchoRaidToolsEJSkin", function() doElvUISkin(E,S,tabButton); end);
			else
				doElvUISkin(E,S,tabButton);
			end
		end
	end
end

local function findManifestEntry(manifest,waId)
	for i,v in ipairs(manifest) do
		if(v.id == waId)then
			return v;
		end
	end

	assert(false,"Cant find manifest entry for id "..waId);
end

local function fixUpNestedPreview(bossIndex,journalID,waId)
	local targetData;

	local manifest = journal.manifest[journalID][0];

	for i,currentWATarget in ipairs(manifest) do
		if(currentWATarget.id == waId)then
			targetData = currentWATarget;
		end
	end

	if(not targetData)then
		error("Smt done goofed",2);
		return;
	end

	local encounters = _EchoRaidTools:GetEncountersInInstance(journalID);
	for i,child in ipairs(targetData.children) do
		local boss = encounters[bossIndex];
		local targetBossInsertSpot = journal.manifest[journalID][boss.encounterID] or {};

		local parent = tDClone(findManifestEntry(manifest,child));
		parent.realParent = parent.parent;
		parent.parent = nil;

		local function insertAllChildren(parent)
			table.insert(targetBossInsertSpot,parent);

			if(parent.children)then
				for i,childId in ipairs(parent.children) do
					local child = findManifestEntry(manifest,childId);
					insertAllChildren(child);
				end
			end
		end

		insertAllChildren(parent);

		journal.manifest[journalID][boss.encounterID] = targetBossInsertSpot;
	end
end

local playerEnteringWorldFired = false;
function journal:PLAYER_ENTERING_WORLD(isInitialLogin,isReloadingUi)
	playerEnteringWorldFired = true;
end

function journal:ADDON_LOADED(addonName)
	if(addonName == "Blizzard_EncounterJournal")then
		if (not IsAddOnLoaded("!!!EchoInternal")) then

			if(not playerEnteringWorldFired)then
				print("|cffff0000EchoRaidTools Error|r: Some addon force loaded 'Blizzard_EncounterJournal'. This will prevent some features of EchoRaidTools functioning correctly (ElvUI skinning, expanded WAs from group view. Contact developers of EchoRaidTools to debug this!")
			else
				fixUpNestedPreview(1,1208,"1. Kazzara, the Hellforged");
				fixUpNestedPreview(2,1208,"2. The Amalgamation Chamber");
				fixUpNestedPreview(3,1208,"3. The Forgotten Experiments");
				fixUpNestedPreview(4,1208,"4. Assault of the Zaqali");
				fixUpNestedPreview(5,1208,"5. Rashok, the Elder");
				fixUpNestedPreview(6,1208,"6. The Vigilant Steward, Zskarn");
				fixUpNestedPreview(7,1208,"7. Magmorax");
				fixUpNestedPreview(8,1208,"8. Echo of Neltharion");
				fixUpNestedPreview(9,1208,"9. Scalecommander Sarkareth");

				fixUpNestedPreview(1,1207,"1. Gnarlroot");
				fixUpNestedPreview(2,1207,"2. Igira the Cruel");
				fixUpNestedPreview(3,1207,"3. Volcoross");
				fixUpNestedPreview(4,1207,"4. Council of Dreams");
				fixUpNestedPreview(5,1207,"5. Larodar, Keeper of the Flame");
				fixUpNestedPreview(6,1207,"6. Nymue, Weaver of the Cycle");
				fixUpNestedPreview(7,1207,"7. Smolderon");
				fixUpNestedPreview(8,1207,"8. Tindral Sageswift, Seer of the Flame");
				fixUpNestedPreview(9,1207,"9. Fyrakk the Blazing");
			end

			createJournalTab();
		end
	end
end
