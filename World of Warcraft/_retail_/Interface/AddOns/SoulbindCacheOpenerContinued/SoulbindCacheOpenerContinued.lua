local debug = false;
local maxButtons = 20;

local _, L = ...;

function SoulbindCacheOpener:updateButtons()
	if debug == true then print("Testing", "4 - updateButtons Called") end
	self.previous = 0;
	for i = 1, maxButtons do
		if debug == true then print("Testing", "4 - Hiding button " .. i) end
		SoulbindCacheOpener.buttons[i]:Hide();
		SoulbindCacheOpener.buttons[i]:SetText("");
	end
	for i = 1, #self.items do
		if debug == true then print("Testing", "5 - self.items loop") end
		self:updateButton(self.items[i], SoulbindCacheOpener.buttons[self.previous + 1]);
	end
end

function SoulbindCacheOpener:updateButton(currItem, btn)
	local id = currItem.id;
	local count = GetItemCount(id);
	local btn_number = self.previous + 1;

	if (count >= currItem.minCount and not SoulbindCacheOpenerDB.ignored_items[id] and not SoulbindCacheOpener.group_ignored_items[id] and self.previous < maxButtons) then
		btn:ClearAllPoints();
		if SoulbindCacheOpenerDB.alignment == "LEFT" then
			if self.previous == 0 then
				btn:SetPoint("LEFT", self.frame, "LEFT", 0, 0);
			else
				btn:SetPoint("LEFT", self.buttons[self.previous], "RIGHT", 2, 0);
			end
		else
			if self.previous == 0 then
				btn:SetPoint("RIGHT", self.frame, "RIGHT", 0, 0);
			else
				btn:SetPoint("RIGHT", self.buttons[self.previous], "LEFT", -2, 0);
			end
		end
		self.previous = btn_number;
		btn.countString:SetText(format("%d",count));
		-- update button icon and macro
		btn.texture:SetDesaturated(false);
		btn:SetAttribute("macrotext", format("/use item:%d",id));
		btn.icon:SetTexture(GetItemIcon(id));
		btn.texture = btn.icon;
		btn.texture:SetAllPoints(btn);
		btn.id = id;
		if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "ButtonShow") end end
		btn:Show();
	end
end

function SoulbindCacheOpener:createButton(btn,id)
	if debug == true then print("Testing", "7 - createButton Called") end
	btn:Hide();
	btn.id = id;
	btn:SetWidth(38);
	btn:SetHeight(38);
	btn:SetClampedToScreen(true);
	--Right click to drag
	btn:EnableMouse(true);
	btn:RegisterForDrag("RightButton");
	btn:SetMovable(true);
	btn:SetScript("OnDragStart", function(self) self:GetParent():StartMoving(); end);
	btn:SetScript("OnDragStop", function(self) 
			self:GetParent():StopMovingOrSizing();
			self:GetParent():SetUserPlaced(false);
			local point, relativeTo, relativePoint, xOfs, yOfs = self:GetParent():GetPoint();
			SoulbindCacheOpenerDB.position = {point, nil, relativePoint, xOfs, yOfs};
			end);
	--Setup macro
	btn:SetAttribute("type", "macro");
	btn:SetAttribute("macrotext", format("/use item:%d",id));
	btn.countString = btn:CreateFontString(btn:GetName().."Count", "OVERLAY", "NumberFontNormal");
	btn.countString:SetPoint("BOTTOMRIGHT", btn, -0, 2);
	btn.countString:SetJustifyH("RIGHT");
	btn.icon = btn:CreateTexture(nil,"BACKGROUND");
	btn.icon:SetTexture(GetItemIcon(id));
	btn.texture = btn.icon;
	btn.texture:SetAllPoints(btn);
	btn:RegisterForClicks("LeftButtonUp", "LeftButtonDown");
	
	--Tooltip
	btn:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self,"ANCHOR_TOP");
		GameTooltip:SetItemByID(format("%d",btn.id));
		GameTooltip:SetClampedToScreen(true);
		GameTooltip:Show();
	  end);
	btn:SetScript("OnLeave",GameTooltip_Hide);
 end

function SoulbindCacheOpener:reset()
	if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "8 - Reset Called") end end
	SoulbindCacheOpenerDB = { ["enable"] = true,["alignment"] = "LEFT", ["ignored_items"] = {}, ["ignored_groups"] = {} };
	self.frame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0);
	self:OnEvent("UPDATE");
end

function SoulbindCacheOpener:resetPosition() 
	self.frame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0);
	self:OnEvent("UPDATE");
end

function resetAll() 
	SoulbindCacheOpenerDB = {["enable"] = true,["alignment"] = "LEFT", ["ignored_items"] = {}, ["ignored_groups"] = {} };
	self:OnEvent("UPDATE");
end

function SoulbindCacheOpener:AddButton()
	if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "2 - Add Button Called") end end
	self.frame:Show();
	if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "3 - Frame Shown") end end
	SoulbindCacheOpener:updateButtons();
end

function SoulbindCacheOpener:updateIgnoreItems() 
	SoulbindCacheOpener.group_ignored_items = {};
	for gn, bl in pairs(SoulbindCacheOpenerDB.ignored_groups) do
		if bl then
			SoulbindCacheOpener:updateIgnoreItemsForOneGroup(gn);
		end
	end
end

function SoulbindCacheOpener:updateIgnoreItemsForOneGroup(group_name) 
	local groupIds = SoulbindCacheOpener.groups[group_name];
	if (groupIds ~= nil) then 
		for i, id in ipairs(groupIds) do
			SoulbindCacheOpener.group_ignored_items[id] = true;
		end
	end
end

function SoulbindCacheOpener:OnEvent(event, ...)
	if event == "ADDON_LOADED" then
		if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "0 - Addon Loaded") end end
		self.frame:UnregisterEvent("ADDON_LOADED");
		SoulbindCacheOpenerDB = SoulbindCacheOpenerDB or {};
		--If DB is empty
		if next (SoulbindCacheOpenerDB) == nil then
			SoulbindCacheOpener:reset();
		end
		if SoulbindCacheOpenerDB.ignored_items == nil then
			SoulbindCacheOpenerDB.ignored_items = {};
		end
		SoulbindCacheOpener.updateIgnoreItems();
		SoulbindCacheOpener.initializeOptions();
	end

	if event == "PLAYER_LOGIN" then
		if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "9 - Player Login Event") end end
		self.frame:UnregisterEvent("PLAYER_LOGIN");
	end 
	--Check for combat
	if UnitAffectingCombat("player") then
		if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "10 - Player is in Combat") end end
		return
	end
	if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "1 - Event Called") end end
	SoulbindCacheOpener:AddButton();
end

------------------------------------------------
-- Slash Commands
------------------------------------------------
local function slashHandler(msg)
	msg = msg:lower() or "";
	local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")
	if (cmd == "hide") then
		SoulbindCacheOpenerDB.ignored_items[tonumber(args)] = true;
		SoulbindCacheOpener:updateIgnoreItems();
		SoulbindCacheOpener:updateButtons();
		print ("|cffffa500Soulbind Cache Opener|r: ignoring itemid", args);


	elseif (cmd == "show") then
		SoulbindCacheOpenerDB.ignored_items[tonumber(args)] = false;
		SoulbindCacheOpener:updateIgnoreItems();
		SoulbindCacheOpener:updateButtons();
		print ("|cffffa500Soulbind Cache Opener|r: showing itemid", args);

	elseif (cmd == "hidegroup") then
		-- TODO: refactor that out, since it is also used in SoulbindCacheOpener:initializeOptions() 
		SoulbindCacheOpenerDB.ignored_groups[args] = true;
		SoulbindCacheOpener:updateIgnoreItems() ;
		SoulbindCacheOpener:updateButtons();
		SoulbindCacheOpener:updateOptionCheckbox(args, true);
		print ("|cffffa500Soulbind Cache Opener|r: hiding group", args);

	elseif (cmd == "showgroup") then
		-- TODO: refactor that out, since it is also used in SoulbindCacheOpener:initializeOptions() 
		SoulbindCacheOpenerDB.ignored_groups[args] = false;
		SoulbindCacheOpener:updateIgnoreItems();
		SoulbindCacheOpener:updateButtons();
		SoulbindCacheOpener:updateOptionCheckbox(args, false);
		print ("|cffffa500Soulbind Cache Opener|r: showing group", args);

	elseif (msg == "reset") then
		print("|cffffa500Soulbind Cache Opener|r: Resetting settings.");
		SoulbindCacheOpener:reset();
	else
		local groups_id_list_string = ""
		for i, name in ipairs(SoulbindCacheOpener.group_ids_ordered) do
			groups_id_list_string = groups_id_list_string .. " " .. name;
		end
		print("|cffffa500Soulbind Cache Opener|r: Commands for |cffffa500/SoulbindCacheOpener|r :");
		print("  |cffffa500 hide <itemid>|r - Ignore an item");
		print("  |cffffa500 show <itemid>|r - Show an item");
		print("  |cffffa500 hidegroup <group>|r - Ignore multiple items");
		print("  |cffffa500 showgroup <group>|r - Show multiple items");
		print("  |cffffa500      available item groups|r: " .. groups_id_list_string);
		print("  |cffffa500 reset|r - Reset all settings");
	end
end

SlashCmdList.SoulbindCacheOpener = function(msg) slashHandler(msg) end;
SLASH_SoulbindCacheOpener1 = "/SoulbindCacheOpener";
SLASH_SoulbindCacheOpener2 = "/SCO";

--Helper functions
local function cout(msg, premsg)
	premsg = premsg or "[".."Soulbind Cache Opener".."]"
	print("|cFFE8A317"..premsg.."|r "..msg);
end

local function coutBool(msg,bool)
	if bool then
		print(msg..": true");
	else
		print(msg..": false");
	end
end

--Main Frame
SoulbindCacheOpener.frame = CreateFrame("Frame", "SoulbindCacheOpener_Frame", UIParent);
SoulbindCacheOpener.frame:Hide();
SoulbindCacheOpener.frame:SetWidth(120);
SoulbindCacheOpener.frame:SetHeight(38);
SoulbindCacheOpener.frame:SetClampedToScreen(true);
SoulbindCacheOpener.frame:SetFrameStrata("BACKGROUND");
SoulbindCacheOpener.frame:SetMovable(true);
SoulbindCacheOpener.frame:RegisterEvent("PLAYER_ENTERING_WORLD");
SoulbindCacheOpener.frame:RegisterEvent("PLAYER_REGEN_ENABLED");
SoulbindCacheOpener.frame:RegisterEvent("PLAYER_LOGIN");
SoulbindCacheOpener.frame:RegisterEvent("ADDON_LOADED")
SoulbindCacheOpener.frame:RegisterEvent("BAG_UPDATE");

 ---Create button row
 for i = 1, maxButtons do
	SoulbindCacheOpener.buttons[i] = CreateFrame("Button", "scocbutton" .. i, SoulbindCacheOpener.frame, "SecureActionButtonTemplate");
	SoulbindCacheOpener:createButton(SoulbindCacheOpener.buttons[i], 86220);
end


SoulbindCacheOpener.frame:SetScript("OnEvent", function(self,event,...) SoulbindCacheOpener:OnEvent(event,...) end);
SoulbindCacheOpener.frame:SetScript("OnShow", function(self,event,...) 
	--Restore position
	self:ClearAllPoints();
	if SoulbindCacheOpenerDB and SoulbindCacheOpenerDB.position then
		self:SetPoint(SoulbindCacheOpenerDB.position[1],UIParent,SoulbindCacheOpenerDB.position[3],SoulbindCacheOpenerDB.position[4],SoulbindCacheOpenerDB.position[5]);
	else
		self:SetPoint('CENTER', UIParent, 'CENTER', 0, 0);
	end		
	
 end);
