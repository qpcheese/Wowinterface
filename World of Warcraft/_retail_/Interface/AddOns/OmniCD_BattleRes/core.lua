------------------------------------------------------------------------------
--
--  Battle Res plugin for OmniCD
--  © 2021-2024 Treebonker, All rights reserved.
--
--  Tracks battle resurrection in keystone dungeons and raids.
--  Adds a new option tab called 'Battle Res' to OmniCD.
--  OmniCD's Friendly CD module must be enabled for the corresponding instance zone.
--
--  10.2.7 LFR uses the same shared-charge system as other raid difficulties.
--
------------------------------------------------------------------------------

local E, L = OmniCD:unpack();
if E.preCata then
	return
end
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local GetSpellInfo = C_Spell and C_Spell.GetSpellName or GetSpellInfo
local GetSpellCharges = GetSpellCharges or function(spellID)
	local spellChargeInfo = C_Spell.GetSpellCharges(spellID);
	if spellChargeInfo then
		return spellChargeInfo.currentCharges, spellChargeInfo.maxCharges, spellChargeInfo.cooldownStartTime, spellChargeInfo.cooldownDuration, spellChargeInfo.chargeModRate;
	end
end

local modname = "BattleRes";
local module = CreateFrame("Frame");
local db;
local Brez;
local BASE_ICON_SIZE = 36;

local defaults = { profile = {
	difficultyID = {
		[8] = true,
		[14] = false,
		[15] = false,
		[16] = false,
		[17] = false,
	},
	locked		= false,
	showCounter	= true,
	reverse		= false,
	desaturateZeroCharge = true,
	scale		= 1,
	swipeAlpha	= 0.8,
	activeAlpha	= 1,
	chargePos	= "BOTTOMRIGHT",
	chargeOfsX	= 0,
	chargeOfsY	= 0,
	chargeScale	= 1,
	counterPos	= "CENTER",
	counterOfsX	= 0,
	counterOfsY	= 0,
	counterScale	= 0.8,
	iconTexture	= 136080,
	displayBorder	= true,
	borderColor	= {
		r = 0.4,
		g = 0.4,
		b = 0.4,
	},
	borderPixels	= 1,
	manualPos	= {},
}}

--
-- Options
--

local brezCollection = {
	rebirth	= { 1,	GetSpellInfo(20484),	136080	},
	raiseAlly	= { 2,	GetSpellInfo(61999),	136143	},
	soulStone	= { 3,	GetSpellInfo(20707),	136210	},
	intercession	= { 4,	GetSpellInfo(391054),	4726195	},
}

local getDifficulty = function(_, k) return db.difficultyID[k]; end
local setDifficulty = function(_, k, value) db.difficultyID[k] = value module:Refresh(true); end

local runSetIconTexture = function(info)
	local currentOpt = info[#info];
	db.iconTexture = brezCollection[currentOpt][3];
	module:Refresh();
end

local function SetPreviewCharges(currentCharges)
	local isZeroCharge = currentCharges == 0;
	currentCharges = isZeroCharge and 0 or 2;
	Brez.icon.icon:SetDesaturated(db.desaturateZeroCharge and isZeroCharge);
	Brez.icon.icon:SetVertexColor(1, 1, 1);
	Brez.icon.count:SetText(currentCharges);
	Brez.icon.cooldown:SetDrawSwipe(isZeroCharge);
	Brez.icon.cooldown:SetHideCountdownNumbers(not db.showCounter or not isZeroCharge);
	Brez.icon.cooldown:SetCooldown(GetTime(), 150);
end

function module.Preview()
	module.isPreview = not module.isPreview;
	if (module.isPreview) then
		SetPreviewCharges();
		Brez:Show();
	else
		module:Refresh(true);
	end
end

module.options = {
	disabled = function(info) return info[2] and not E:GetModuleEnabled(modname) end,
	name = L["Battle Res"],
	type = "group",
	childGroups = "tab",
	get = function(info) local option = info[#info] return db[option]; end,
	set = function(info, value) local option = info[#info] db[option] = value module:Refresh(); end,
	args = {
		title = { -- overwrite generic
			name = format("%s%s|r - %s", E.HEX_C.TWITCH_PURPLE, modname, GetAddOnMetadata("OmniCD_BattleRes", "Version")),
			order = 0,
			type = "description",
			fontSize = "large",
		},
		preview = {
			name = PREVIEW,
			order = 3, -- generic enable toggle button order is 2
			type = "execute",
			func = module.Preview,
		},
		resetPos = {
			name = RESET_POSITION,
			desc = L["Reset frame position"],
			order = 4,
			type = "execute",
			func = function()
				wipe(db.manualPos);
				if (Brez) then
					E.LoadPosition(Brez);
				end
			end,
			confirm = E.ConfirmAction,
		},
		resetModule = {
			name = L["Reset Module"],
			order = 5,
			type = "execute",
			func = function()
				module.DB:ResetProfile()
				module:Refresh(true) -- no callback registered
			end,
			confirm = E.ConfirmAction,
		},
		visibility = {
			name = L["Visibility"],
			order = 10,
			type = "group",
			args = {
				TODOFixFirstImgInTabFlyingOff = {
					name = "", order = 0, type = "description",
				},
				notice = {
					image = "Interface\\AddOns\\OmniCD\\Media\\omnicd-recent", imageWidth = 32, imageHeight = 16, imageCoords = { 0.13, 1.13, 0.25, 0.75 },
					name = " ",
					order = 1,
					type = "description",
				},
				notice1 = {
					name = L["|cffff2020Friendly CD module must be enabled for the corresponding instance zone."],
					order = 2,
					type = "description",
				},
				lb1 = {
					name = "\n\n", order = 3, type = "description",
				},
				dungeon = {
					disabled = function() return not E.DB.profile.Party.visibility.party end,
					name = DUNGEON_DIFFICULTY,
					order = 10,
					type = "multiselect",
					width = "full",
					values = {
						[8]  = CHALLENGES,
					},
					get = getDifficulty,
					set = setDifficulty,
				},
				raid = {
					disabled = function() return not E.DB.profile.Party.visibility.raid end,
					name = RAID_DIFFICULTY,
					order = 20,
					type = "multiselect",
					width = "full",
					values = {
						[14] = PLAYER_DIFFICULTY1,  -- Normal
						[15] = PLAYER_DIFFICULTY2,  -- Heroic
						[16] = PLAYER_DIFFICULTY6,  -- Mythic
						[17] = PLAYER_DIFFICULTY3,  -- Raid Finder (no longer works -> added back in 10.2.7)
					},
					get = getDifficulty,
					set = setDifficulty,
				},
			}
		},
		settings = {
			name = SETTINGS,
			order = 20,
			type = "group",
			args = {
				locked = {
					name = LOCK_FRAME,
					desc = L["Lock frame position"],
					order = 12,
					type = "toggle",
				},
				showCounter = {
					name = COUNTDOWN_FOR_COOLDOWNS_TEXT,
					desc = format("%s\n\n|cffff2020%s",
					L["Toggle the cooldown numbers. Spells with charges only show cooldown numbers at 0 charge"],
					L["[Show Numbers for Cooldowns] must be enabled in Blizzard's \'Options/Action Bars\' menu when using Blizzard's cooldown numbers."]),
					order = 13,
					type = "toggle",
				},
				reverse = {
					name = L["Reverse Swipe"],
					desc = L["Reverse the cooldown swipe animation"],
					order = 15,
					type = "toggle",
				},
				desaturateZeroCharge = {
					name = L["Desaturate Colors"],
					desc = L["Desaturate color at 0 charge"],
					order = 16,
					type = "toggle",
				},
				scale = {
					name = L["Icon Size"],
					desc = L["Set the size of icons"],
					order = 21,
					type = "range",
					min = 0.5, max = 2, bigStep = 0.05, step = 0.01, isPercent = true,
				},
				swipeAlpha = {
					name = L["Swipe Opacity"],
					desc = L["Set the opacity of swipe animations"],
					order = 22,
					type = "range",
					min = 0, max = 1, step = 0.1,
				},
				activeAlpha = {
					name = L["Active Icon Opacity"],
					desc = L["Set the opacity of icons on cooldown"],
					order = 23,
					type = "range",
					min = 0, max = 1, step = 0.1,
				},
				iconTexture = {
					name = L["Icon Texture"],
					order = 30,
					type = "group",
					inline = true,
					args = {}
				},
				textSettings = {
					name = LOCALE_TEXT_LABEL,
					order = 40,
					type = "group",
					inline = true,
					args = {
						chargePos = {
							name = L["Charge Position"],
							order = 1,
							type = "select",
							values = {
								CENTER = L["CENTER"],
								LEFT = L["LEFT"],
								RIGHT = L["RIGHT"],
								TOP = "TOP",
								BOTTOM = "BOTTOM",
								BOTTOMRIGHT = L["BOTTOMRIGHT"],
							}
						},
						chargeOfsX = {
							name = L["Offset X"],
							order = 2,
							type = "range",
							min = -100, max = 100, step = 1,
						},
						chargeOfsY = {
							name = L["Offset Y"],
							order = 3,
							type = "range",
							min = -100, max = 100, step = 1,
						},
						chargeScale = {
							name = L["Charge Size"],
							desc = L["Set the size of charge numbers"],
							order = 4,
							type = "range",
							min = 0.5, max = 2, step = 0.05, isPercent = true,
						},
						lb1 = {
							name = "", ordr = 5, type = "description",
						},
						counterPos = {
							name = L["Counter Position"],
							order = 6,
							type = "select",
							values = {
								CENTER = L["CENTER"],
								LEFT = L["LEFT"],
								RIGHT = L["RIGHT"],
								TOP = "TOP",
								BOTTOM = "BOTTOM",
							}
						},
						counterOfsX = {
							name = L["Offset X"],
							order = 7,
							type = "range",
							min = -100, max = 100, step = 1,
						},
						counterOfsY = {
							name = L["Offset Y"],
							order = 8,
							type = "range",
							min = -100, max = 100, step = 1,
						},
						counterScale = {
							name = L["Counter Size"],
							desc = L["Set the size of cooldown numbers"],
							order = 9,
							type = "range",
							min = 0.5, max = 2, step = 0.05, isPercent = true,
						},
					}
				},
				border = {
					disabled = function(info) return not db.displayBorder; end,
					name = L["Border"],
					order = 50,
					type = "group",
					inline = true,
					args = {
						displayBorder = {
							disabled = false,
							name = ENABLE,
							desc = L["Display custom border around icons"],
							order = 0,
							type = "toggle",
						},
						borderColor = {
							name = L["Border Color"],
							order = 1,
							type = "color",
							dialogControl = "ColorPicker-OmniCD",
							get = function(info)
								local key = info[2];
								return db.borderColor.r, db.borderColor.g, db.borderColor.b;
							end,
							set = function(info, r, g, b)
								local key = info[2];
								db.borderColor.r = r;
								db.borderColor.g = g;
								db.borderColor.b = b;
								module:Refresh();
							end,
						},
						--[[
						borderPixels = {
							name = L["Border Thickness"],
							order = 2,
							type = "select",
							values = {1,2},
						},
						]]
					}
				},
			}
		},
	}
}

for k, v in pairs(brezCollection) do
	module.options.args.settings.args.iconTexture.args[k] = {
		image = v[3], imageWidth = 32, imageHeight = 32, imageCoords = E.BORDERLESS_TCOORDS,
		name = "", -- update name on Refresh
		order = v[1],
		type = "execute",
		func = runSetIconTexture,
		width = 0.3,
	}
end

E:RegisterModuleOptions(modname, module.options, modname);

--
-- Core
--

local Timer;
local lastCharges;

local function CancelTimer()
	if (not Timer) then
		return;
	end
	Timer:Cancel();
	Timer = nil;
end

local function ResetIcon()
	CancelTimer();
	Brez.icon.cooldown:Clear();
	Brez.icon.count:SetText("");
	Brez.icon.icon:SetDesaturated(true);
	Brez.icon.icon:SetVertexColor(0.3, 0.3, 0.3);
	lastCharges = nil;
end

function module.OnUpdateTimer()
	local currentCharges, maxCharges, cooldownStart, cooldownDuration = GetSpellCharges(20484);
	if (not currentCharges) then -- returns value only during boss encounters in raids
		ResetIcon();
	elseif (currentCharges ~= lastCharges) then
		local isZeroCharge = currentCharges == 0;
		Brez.icon.icon:SetDesaturated(db.desaturateZeroCharge and isZeroCharge);
		Brez.icon.cooldown:SetDrawSwipe(isZeroCharge);
		Brez.icon.cooldown:SetHideCountdownNumbers(not db.showCounter or not isZeroCharge);
		if (not lastCharges) then
			Brez.icon.icon:SetVertexColor(1, 1, 1);
		end

		CancelTimer();
		Brez.icon.count:SetText(currentCharges);
		if (currentCharges < maxCharges) then
			Brez.icon.cooldown:SetCooldown(cooldownStart, cooldownDuration);
			Timer = C_Timer.NewTicker(math.abs(cooldownDuration - GetTime() + cooldownStart), module.OnUpdateTimer, 1); -- self-adjusting
		end
		lastCharges = currentCharges;
	end
end

local function UpdateTimer(isProfileChanged)
	-- Timer start: REGEN_DISABLED>ENCOUNTER_START>INSTANCE_ENCOUNTER_ENGAGE_UNIT 0s
	-- Timer reset: ENCOUNTER_END>INSTANCE_ENCOUNTER_ENGAGE_UNIT>REGEN_ENABLED 0.02s
	-- GetSpellCharges on CooldownHide that returns updated value 0.11s
	if (isProfileChanged) then
		module.OnUpdateTimer();
	else
		C_Timer.After(0.2, module.OnUpdateTimer);
	end
end

local function RegisterUserHealth()
	Brez:RegisterUnitEvent("UNIT_HEALTH", "player");
end

local function Brez_OnEvent(Brez, event, ...)
	-- 9.0
	-- Reincarnation    20 (40% for Improved Reincarnation - lvl 46 passive)
	-- Normal res	35%
	-- Battle res	60% (100% for Rebirth Rank2 - lvl 46 passive)
	-- Body/Spirit Healer res   80%
	if (event == "UNIT_HEALTH") then -- user unitevent
		local unit = ...;
		if (not UnitIsDeadOrGhost(unit)) then
			-- 10.0 engineering brez brings a player back to life with 35% health (tooltip is 60%)
			-- Just remove the health check since our timer is self adjusting anyway
			--[[
			local percHealth = UnitHealth(unit) / UnitHealthMax(unit);
			if ((percHealth > 0.5 and percHealth < 0.7) or percHealth > 0.9) then
				UpdateTimer();
			end
			]]
			UpdateTimer();
			Brez:UnregisterEvent("UNIT_HEALTH");
		end
	elseif (event == "CHALLENGE_MODE_START") then
		Brez:Show(); -- Startup for Mythic 0
		UpdateTimer();
		Brez:RegisterEvent("CHALLENGE_MODE_COMPLETED");
	elseif (event == "ENCOUNTER_START") then
		UpdateTimer();
		Brez:RegisterEvent("ENCOUNTER_END");
	elseif (event == "CHALLENGE_MODE_COMPLETED" or event == "ENCOUNTER_END") then
		ResetIcon();
		Brez:UnregisterEvent(event);
	end
end

local function Brez_OnShow(Brez)
	E.RegisterCallback(Brez, "OnBattleRezed", UpdateTimer);
	E.RegisterCallback(Brez, "OnDisabledUserDied", RegisterUserHealth);
	Brez.isShown = true;
end

local function Brez_CooldownOnHide()
	if (Brez.isShown) then
		UpdateTimer();
	end
end

local function CreateBrez()
	if (Brez) then
		return;
	end
	local key = "OmniCDBrez";
	Brez = CreateFrame("Frame", key, UIParent, "OmniCDTemplate");
	Brez.key = key;
	Brez.db = db;
	Brez.anchor:Hide(); -- hide unused
	Brez:SetScript("OnHide", nil);
	Brez:SetScript("OnShow", Brez_OnShow);
	Brez:SetScript("OnEvent", Brez_OnEvent);
	local icon = CreateFrame("Button", key .. "Icon", Brez, "OmniCDButtonTemplate");
	icon:SetPoint("TOP");
	icon:SetSize(BASE_ICON_SIZE, BASE_ICON_SIZE);
	icon:EnableMouse(false);
	icon:Show();
	icon.counter = icon.cooldown:GetRegions();
	icon.count:ClearAllPoints();
	icon.count:SetPoint("BOTTOMRIGHT", icon, 0, 0); -- fix offset being scaled
	icon.cooldown:SetScript("OnHide", Brez_CooldownOnHide);
	Brez.icon = icon;
	-- Cache stuff
	local ta, tb = {}, {};
	for i = 1, 5 do
		local a = select(i, icon.count:GetPoint());
		local b = select(i, icon.counter:GetPoint());
		ta[i] = a;
		tb[i] = b;
	end
	icon.CountPoint = ta;
	icon.counterPoint = tb;
	icon:SetClampedToScreen(true);
	icon:SetScript("OnMouseDown", E.OmniCDAnchor_OnMouseDown);
	icon:SetScript("OnMouseUp", E.OmniCDAnchor_OnMouseUp);
end

local function OnShutdown()
	Brez.isShown = false;
	Brez.isArmed = false;
	Brez:Hide();
	ResetIcon();
	Brez:UnregisterAllEvents();
	E.UnregisterAllCallbacks(Brez);
	if (module.isPreview) then
		module.Preview();
		E:ACR_NotifyChange();
	end
end

local function OnStartup(_, isProfileChanged)
	if (module.isPreview) then
		module.Preview();
		E:ACR_NotifyChange();
	end
	local _,_, difficultyID = GetInstanceInfo(); -- scheduled call from UpdateRosterInfo (returns 0 on PEW w/o delay)
	if (db.difficultyID[difficultyID] or (difficultyID == 23 and db.difficultyID[8])) then
		if (not Brez.isArmed or isProfileChanged) then
			if (difficultyID == 23) then -- Mythic0 dungeon
				Brez:RegisterEvent("CHALLENGE_MODE_START");
			else
				if (difficultyID == 8) then -- Mythic+ dungeon in progress
					Brez:RegisterEvent("CHALLENGE_MODE_COMPLETED");
				else
					if (IsEncounterInProgress()) then
						Brez:RegisterEvent("ENCOUNTER_END");
					end
					Brez:RegisterEvent("ENCOUNTER_START");
				end
				Brez:Show();
				UpdateTimer(isProfileChanged);
			end
			Brez.isArmed = true;
		end
	elseif (Brez.isArmed) then
		OnShutdown();
	end
end

local anchorPos = {
	RIGHT = "LEFT",
	LEFT = "RIGHT",
	CENTER = "CENTER",
	BOTTOMRIGHT = "BOTTOMRIGHT",
	TOP = "BOTTOM",
	BOTTOM = "TOP",
}

function module:Refresh(isProfileChanged)
	if (not self.enabled) then
		return;
	end

	db = self.DB.profile;
	Brez.db = db;

	E.LoadPosition(Brez);

	local icon = Brez.icon;
	icon:EnableMouse(not db.locked);
	icon:SetScale(db.scale);
	icon:SetAlpha(db.activeAlpha);
	icon.count:ClearAllPoints();
	icon.count:SetPoint(anchorPos[db.chargePos], icon, db.chargePos, db.chargeOfsX, db.chargeOfsY);
	icon.count:SetScale(db.chargeScale);
	icon.counter:ClearAllPoints();
	icon.counter:SetPoint(anchorPos[db.counterPos], icon, db.counterPos, db.counterOfsX, db.counterOfsY);
	icon.counter:SetScale(db.counterScale);
	icon.icon:SetTexture(db.iconTexture);

	if (db.displayBorder) then
		icon.icon:SetTexCoord(unpack(E.BORDERLESS_TCOORDS));
		icon.borderTop:ClearAllPoints();
		icon.borderBottom:ClearAllPoints();
		icon.borderRight:ClearAllPoints();
		icon.borderLeft:ClearAllPoints();
		local edgeSize = E.PixelMult / db.scale --* db.borderPixels;
		icon.borderTop:SetPoint("TOPLEFT", icon, "TOPLEFT");
		icon.borderTop:SetPoint("BOTTOMRIGHT", icon, "TOPRIGHT", 0, -edgeSize);
		icon.borderBottom:SetPoint("BOTTOMLEFT", icon, "BOTTOMLEFT");
		icon.borderBottom:SetPoint("TOPRIGHT", icon, "BOTTOMRIGHT", 0, edgeSize);
		icon.borderLeft:SetPoint("TOPLEFT", icon, "TOPLEFT");
		icon.borderLeft:SetPoint("BOTTOMRIGHT", icon, "BOTTOMLEFT", edgeSize, 0);
		icon.borderRight:SetPoint("TOPRIGHT", icon, "TOPRIGHT");
		icon.borderRight:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", -edgeSize, 0);
		local r, g, b = db.borderColor.r, db.borderColor.g, db.borderColor.b;
		icon.borderTop:SetColorTexture(r, g, b);
		icon.borderBottom:SetColorTexture(r, g, b);
		icon.borderRight:SetColorTexture(r, g, b);
		icon.borderLeft:SetColorTexture(r, g, b);
		icon.borderTop:Show();
		icon.borderBottom:Show();
		icon.borderRight:Show();
		icon.borderLeft:Show();
	else
		icon.borderTop:Hide();
		icon.borderBottom:Hide();
		icon.borderRight:Hide();
		icon.borderLeft:Hide();
		icon.icon:SetTexCoord(0, 1, 0, 1);
	end

	local currentCharges = icon.count:GetText();
	currentCharges = tonumber(currentCharges);
	local isZeroCharge = currentCharges == 0;
	if (currentCharges) then
		icon.icon:SetDesaturated(db.desaturateZeroCharge and isZeroCharge);
		icon.icon:SetVertexColor(1, 1, 1);
	else
		icon.icon:SetDesaturated(true);
		icon.icon:SetVertexColor(0.3, 0.3, 0.3);
	end

	icon.cooldown:SetDrawSwipe(isZeroCharge);
	icon.cooldown:SetHideCountdownNumbers(not db.showCounter or not isZeroCharge);
	icon.cooldown:SetSwipeColor(0, 0, 0, db.swipeAlpha);
	icon.cooldown:SetReverse(db.reverse);
	icon.cooldown:SetDrawEdge(true);

	-- Update execute names
	for k, v in pairs(brezCollection) do
		local option = self.options.args.settings.args.iconTexture.args[k];
		local name = v[2];
		option.name = option.image == db.iconTexture and "|cffffffff" .. name or "|cff4c4c4c" .. name;
	end

	if (isProfileChanged) then
		if (not E.Party.enabled or E.Party.disabled) then -- turning off preview doesn't hide icon if OmniCD is in test mode
			OnShutdown();
		else
			OnStartup(nil, isProfileChanged);
		end
	end
end

--
-- Init
--
local DB_VERSION = 0.1;

function module.Initialize()
	module.DB = E.DB:RegisterNamespace(modname, defaults);
	db = module.DB.profile;
end

function module:Enable()
	if (self.enabled) then
		return;
	end
	CreateBrez();
	E.RegisterCallback(self, "OnStartup", OnStartup);
	E.RegisterCallback(self, "OnShutdown", OnShutdown);
	self:SetScript("OnEvent", function(self, event, ...)
		self[event](self, ...);
	end)
	self.enabled = true;
	self:Refresh(true);
end

function module:Disable()
	if (not self.enabled) then
		return;
	end
	E.UnregisterAllCallbacks(self);
	self:UnregisterAllEvents();
	OnShutdown();
	self.enabled = false;
end

E[modname] = module;
