local GetSpellName = C_Spell and C_Spell.GetSpellName or GetSpellInfo
local IsSpellUsable = C_Spell and C_Spell.IsSpellUsable or IsUsableSpell
local Range = {
	friendly = {
		["PRIEST"] = {
			(GetSpellName(17)), -- Power Word: Shield
			(GetSpellName(527)), -- Purify
		},
		["DRUID"] = {
			(GetSpellName(774)), -- Rejuvenation
			(GetSpellName(2782)), -- Remove Corruption
		},
		["PALADIN"] = GetSpellName(19750), -- Flash of Light
		["SHAMAN"] = GetSpellName(8004), -- Healing Surge
		["WARLOCK"] = GetSpellName(5697), -- Unending Breath
		--["DEATHKNIGHT"] = GetSpellName(47541), -- Death Coil
		["MONK"] = GetSpellName(115450), -- Detox
	},
	hostile = {
		["DEATHKNIGHT"] = {
			(GetSpellName(47541)), -- Death Coil
			(GetSpellName(49576)), -- Death Grip
		},
		["DEMONHUNTER"] = GetSpellName(185123), -- Throw Glaive
		["DRUID"] = GetSpellName(8921),  -- Moonfire
		["HUNTER"] = {
			(GetSpellName(193455)), -- Cobra Shot
			(GetSpellName(19434)), -- Aimed Short
			(GetSpellName(193265)), -- Hatchet Toss
		},
		["MAGE"] = {
			(GetSpellName(116)), -- Frostbolt
			(GetSpellName(30451)), -- Arcane Blast
			(GetSpellName(133)), -- Fireball
		},
		["MONK"] = GetSpellName(115546), -- Provoke
		["PALADIN"] = GetSpellName(62124), -- Hand of Reckoning
		["PRIEST"] = GetSpellName(585), -- Smite
		--["ROGUE"] = GetSpellName(1725), -- Distract
		["SHAMAN"] = GetSpellName(188196), -- Lightning Bolt
		["WARLOCK"] = GetSpellName(686), -- Shadow Bolt
		["WARRIOR"] = GetSpellName(355), -- Taunt
	},
}

ShadowUF:RegisterModule(Range, "range", ShadowUF.L["Range indicator"])

local LSR = LibStub("SpellRange-1.0")

local playerClass = select(2, UnitClass("player"))
local rangeSpells = {}

local UnitPhaseReason_o = UnitPhaseReason
local UnitPhaseReason = function(unit)
	local phase = UnitPhaseReason_o(unit)
	if (phase == Enum.PhaseReason.WarMode or phase == Enum.PhaseReason.ChromieTime) and UnitIsVisible(unit) then
		return nil
	end
	return phase
end

local function checkRange(self)
	local frame = self.parent

	-- Check which spell to use
	local spell
	if( UnitCanAssist("player", frame.unit) ) then
		spell = rangeSpells.friendly
	elseif( UnitCanAttack("player", frame.unit) ) then
		spell = rangeSpells.hostile
	end

	if( not UnitIsConnected(frame.unit) or UnitPhaseReason(frame.unit) ) then
		frame:SetRangeAlpha(ShadowUF.db.profile.units[frame.unitType].range.oorAlpha)
	elseif( spell ) then
		frame:SetRangeAlpha(LSR.IsSpellInRange(spell, frame.unit) == 1 and ShadowUF.db.profile.units[frame.unitType].range.inAlpha or ShadowUF.db.profile.units[frame.unitType].range.oorAlpha)
	-- That didn't work, but they are grouped lets try the actual API for this, it's a bit flaky though and not that useful generally
	elseif( UnitInRaid(frame.unit) or UnitInParty(frame.unit) ) then
		frame:SetRangeAlpha(UnitInRange(frame.unit, "player") and ShadowUF.db.profile.units[frame.unitType].range.inAlpha or ShadowUF.db.profile.units[frame.unitType].range.oorAlpha)
	-- Nope, just show in range :(
	else
		frame:SetRangeAlpha(ShadowUF.db.profile.units[frame.unitType].range.inAlpha)
	end
end

local function updateSpellCache(category)
	rangeSpells[category] = nil
	if( ShadowUF.db.profile.range[category .. playerClass] and IsSpellUsable(ShadowUF.db.profile.range[category .. playerClass]) ) then
		rangeSpells[category] = ShadowUF.db.profile.range[category .. playerClass]

	elseif( ShadowUF.db.profile.range[category .. "Alt" .. playerClass] and IsSpellUsable(ShadowUF.db.profile.range[category .. "Alt" .. playerClass]) ) then
		rangeSpells[category] = ShadowUF.db.profile.range[category .. "Alt" .. playerClass]

	elseif( Range[category][playerClass] ) then
		if( type(Range[category][playerClass]) == "table" ) then
			for i = 1, #Range[category][playerClass] do
				local spell = Range[category][playerClass][i]
				if( spell and IsSpellUsable(spell) ) then
					rangeSpells[category] = spell
					break
				end
			end
		elseif( Range[category][playerClass] and IsSpellUsable(Range[category][playerClass]) ) then
			rangeSpells[category] = Range[category][playerClass]
		end
	end
end

local function createTimer(frame)
	if( not frame.range.timer ) then
		frame.range.timer = C_Timer.NewTicker(0.5, checkRange)
		frame.range.timer.parent = frame
	end
end

local function cancelTimer(frame)
	if( frame.range and frame.range.timer ) then
		frame.range.timer:Cancel()
		frame.range.timer = nil
	end
end

function Range:ForceUpdate(frame)
	if( UnitIsUnit(frame.unit, "player") ) then
		frame:SetRangeAlpha(ShadowUF.db.profile.units[frame.unitType].range.inAlpha)
		cancelTimer(frame)
	else
		createTimer(frame)
		checkRange(frame.range.timer)
	end
end

function Range:OnEnable(frame)
	if( not frame.range ) then
		frame.range = CreateFrame("Frame", nil, frame)
	end

	frame:RegisterNormalEvent("PLAYER_SPECIALIZATION_CHANGED", self, "SpellChecks")
	frame:RegisterUpdateFunc(self, "ForceUpdate")

	createTimer(frame)
end

function Range:OnLayoutApplied(frame)
	self:SpellChecks(frame)
end

function Range:OnDisable(frame)
	frame:UnregisterAll(self)

	if( frame.range ) then
		cancelTimer(frame)
		frame:SetRangeAlpha(1.0)
	end
end


function Range:SpellChecks(frame)
	updateSpellCache("friendly")
	updateSpellCache("hostile")
	if( frame.range and ShadowUF.db.profile.units[frame.unitType].range.enabled ) then
		self:ForceUpdate(frame)
	end
end
