if not BigWigsLoader.isBeta then return end
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Kyrioss", 2648, 2566)
if not mod then return end
mod:RegisterEnableMob(209230) -- Kyrioss
mod:SetEncounterID(2816)
mod:SetRespawnTime(30)

--------------------------------------------------------------------------------
-- Locals
--

local chainLightningCount = 1
local lightningTorrentCount = 1
local lightningDashCount = 1
local unstableChargeCount = 1

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		444123, -- Lightning Torrent
		419870, -- Lightning Dash
		{424148, "SAY"}, -- Chain Lightning
		-- Mythic
		{420739, "SAY", "SAY_COUNTDOWN", "ME_ONLY_EMPHASIZE"}, -- Unstable Charge
	}, {
		[420739] = CL.mythic,
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "LightningTorrent", 444034)
	self:Log("SPELL_CAST_START", "LightningDash", 419870)
	self:Log("SPELL_CAST_START", "ChainLightning", 424148)

	-- Mythic
	self:Log("SPELL_CAST_START", "UnstableCharge", 420739)
	self:Log("SPELL_AURA_APPLIED", "UnstableChargeApplied", 420739)
	self:Log("SPELL_AURA_REMOVED", "UnstableChargeRemoved", 420739)
end

function mod:OnEngage()
	chainLightningCount = 1
	lightningTorrentCount = 1
	lightningDashCount = 1
	unstableChargeCount = 1
	self:CDBar(419870, 3.0, CL.count:format(self:SpellName(419870), lightningDashCount)) -- Lightning Dash
	self:CDBar(424148, 7.0, CL.count:format(self:SpellName(424148), chainLightningCount)) -- Chain Lightning
	if self:Mythic() then
		-- TODO recheck when Mythic is available
		self:CDBar(420739, 15.6, CL.count:format(self:SpellName(420739), unstableChargeCount)) -- Unstable Charge
	end
	self:CDBar(444123, 30.0, CL.count:format(self:SpellName(444123), lightningTorrentCount)) -- Lightning Torrent
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:LightningTorrent(args)
	self:StopBar(CL.count:format(args.spellName, lightningTorrentCount))
	self:Message(444123, "cyan", CL.count:format(args.spellName, lightningTorrentCount))
	lightningTorrentCount = lightningTorrentCount + 1
	self:CDBar(444123, 60.0, CL.count:format(args.spellName, lightningTorrentCount))
	self:PlaySound(444123, "long")
end

function mod:LightningDash(args)
	self:StopBar(CL.count:format(args.spellName, lightningDashCount))
	self:Message(args.spellId, "orange", CL.count:format(args.spellName, lightningDashCount))
	lightningDashCount = lightningDashCount + 1
	if self:Story() then
		if lightningDashCount % 2 == 0 then
			self:CDBar(args.spellId, 41.2, CL.count:format(args.spellName, lightningDashCount))
		else
			self:CDBar(args.spellId, 18.7, CL.count:format(args.spellName, lightningDashCount))
		end
	else -- Normal, Heroic
		-- TODO confirm Mythic
		if lightningDashCount % 2 == 0 then
			self:CDBar(args.spellId, 42.0, CL.count:format(args.spellName, lightningDashCount))
		else
			self:CDBar(args.spellId, 17.3, CL.count:format(args.spellName, lightningDashCount))
		end
	end
	self:PlaySound(args.spellId, "alarm")
end

do
	local function printTarget(self, name, guid)
		self:TargetMessage(424148, "red", name, CL.count:format(self:SpellName(424148), chainLightningCount - 1))
		if self:Me(guid) then
			self:Say(424148, nil, nil, "Chain Lightning")
		end
		self:PlaySound(424148, "alert", nil, name)
	end

	function mod:ChainLightning(args)
		self:StopBar(CL.count:format(args.spellName, chainLightningCount))
		chainLightningCount = chainLightningCount + 1
		self:GetUnitTarget(printTarget, 0.1, args.sourceGUID)
		if self:Story() then
			if chainLightningCount % 4 == 2 then
				self:CDBar(args.spellId, 13.0, CL.count:format(args.spellName, chainLightningCount))
			elseif chainLightningCount % 4 == 3 then
				self:CDBar(args.spellId, 28.0, CL.count:format(args.spellName, chainLightningCount))
			elseif chainLightningCount % 4 == 0 then
				self:CDBar(args.spellId, 10.0, CL.count:format(args.spellName, chainLightningCount))
			else
				self:CDBar(args.spellId, 9.0, CL.count:format(args.spellName, chainLightningCount))
			end
		else -- Normal, Heroic
			-- TODO confirm Mythic
			if chainLightningCount % 3 == 2 then
				self:CDBar(args.spellId, 13.0, CL.count:format(args.spellName, chainLightningCount))
			elseif chainLightningCount % 3 == 0 then
				self:CDBar(args.spellId, 38.0, CL.count:format(args.spellName, chainLightningCount))
			else
				self:CDBar(args.spellId, 9.0, CL.count:format(args.spellName, chainLightningCount))
			end
		end
	end
end

-- Mythic

do
	local function printTarget(self, name, guid)
		self:TargetMessage(420739, "yellow", name, CL.count:format(self:SpellName(420739), unstableChargeCount - 1))
		if self:Me(guid) then
			self:Say(420739, nil, nil, "Unstable Charge")
			self:PlaySound(420739, "warning", nil, name)
		else
			self:PlaySound(420739, "info", nil, name)
		end
	end

	function mod:UnstableCharge(args)
		self:StopBar(CL.count:format(args.spellName, unstableChargeCount))
		unstableChargeCount = unstableChargeCount + 1
		self:GetUnitTarget(printTarget, 0.3, args.sourceGUID)
		-- TODO recheck when Mythic is available
		self:CDBar(args.spellId, 31.5, CL.count:format(args.spellName, unstableChargeCount))
	end
end

function mod:UnstableChargeApplied(args)
	if self:Me(args.destGUID) then
		self:SayCountdown(args.spellId, 6)
	end
end

function mod:UnstableChargeRemoved(args)
	if self:Me(args.destGUID) then
		self:CancelSayCountdown(args.spellId)
	end
end
