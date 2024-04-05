do
-- App locals
local appName,app = ...;
local L, contains, GetRelativeValue = app.L, app.contains, app.GetRelativeValue;

-- Global locals
local date, pairs, select, GetDifficultyInfo, IsInInstance, GetInstanceInfo
	= date, pairs, select, GetDifficultyInfo, IsInInstance, GetInstanceInfo;

-- Class Locals
local DifficultyColors = {
	[2] = "ff0070dd",
	[5] = "ff0070dd",
	[6] = "ff0070dd",
	[7] = "ff9d9d9d",
	[15] = "ff0070dd",
	[16] = "ffa335ee",
	[17] = "ff9d9d9d",
	[23] = "ffa335ee",
	[24] = "ffe6cc80",
	[33] = "ffe6cc80",
};
local DifficultyIcons = {
	[1] = app.asset("Difficulty_Normal"),
	[2] = app.asset("Difficulty_Heroic"),
	[3] = app.asset("Difficulty_Normal"),
	[4] = app.asset("Difficulty_Normal"),
	[5] = app.asset("Difficulty_Heroic"),
	[6] = app.asset("Difficulty_Heroic"),
	[7] = app.asset("Difficulty_LFR"),
	[9] = app.asset("Difficulty_Mythic"),
	[11] = app.asset("Difficulty_Normal"),
	[12] = app.asset("Difficulty_Heroic"),
	[14] = app.asset("Difficulty_Normal"),
	[15] = app.asset("Difficulty_Heroic"),
	[16] = app.asset("Difficulty_Mythic"),
	[17] = app.asset("Difficulty_LFR"),
	[18] = app.asset("Category_Event"),
	[23] = app.asset("Difficulty_Mythic"),
	[24] = app.asset("Difficulty_Timewalking"),
	[33] = app.asset("Difficulty_Timewalking"),
};
local DifficultyMap = {
	[1] = { 9, 148, 173 },
	[2] = { 174 },
	[3] = { 175, 198 },
	[4] = { 176 },
	[9] = { 1 },
	[148] = { 1 },
	[173] = { 1 },
	[174] = { 2 },
	[175] = { 3 },
	[176] = { 4 },
	[198] = { 3 },
};

-- Class Helpers
if not GetDifficultyInfo(3) then
	local difficultyData = {
		[1] = "Normal",
		[3] = "10-Player",
		[198] = "10-Player",
	};
	GetDifficultyInfo = function(difficultyID)
		return difficultyData[difficultyID] or UNKNOWN;
	end
end
local function GetDifficultyName(difficultyID)
	return GetDifficultyInfo(difficultyID) or UNKNOWN;
end

app.CreateDifficulty = app.CreateClass("Difficulty", "difficultyID", {
	["text"] = function(t)
        local parent = rawget(t, "parent");
		if parent and parent.instanceID then return t.name; end
		return t.sourceParent and ("%s [%s]"):format(t.name, t.sourceParent.text or UNKNOWN) or t.name;
	end,
	["name"] = function(t)
		return GetDifficultyName(t.difficultyID);
	end,
	["icon"] = function(t)
		return DifficultyIcons[t.difficultyID] or app.asset("Difficulty_Multi");
	end,
	["trackable"] = app.ReturnTrue,
	["saved"] = function(t)
		return t.locks;
	end,
	["locks"] = function(t)
		local locks = t.parent and t.parent.locks;
		if locks then
			if t.parent.isLockoutShared and not (t.difficultyID == 7 or t.difficultyID == 17) then
				t.locks = locks.shared;
				return locks.shared;
			else
				-- Look for this difficulty's lockout.
				for difficultyKey, lock in pairs(locks) do
					if difficultyKey == "shared" then
						-- ignore this one
					elseif difficultyKey == t.difficultyID then
						t.locks = lock;
						return lock;
					end
				end
				local difficulties = t.difficulties;
				if difficulties then
					local diffLocks = {};
					-- Look for matching difficulty lockouts.
					for difficultyKey, lock in pairs(locks) do
						if contains(difficulties, difficultyKey) then
							diffLocks[difficultyKey] = lock;
						end
					end
					if #diffLocks > 0 then
						t.locks = diffLocks;
						return diffLocks;
					end
				end
			end
		end
	end,
	["difficulties"] = function(t)
		return DifficultyMap[t.difficultyID];
	end,
	["e"] = function(t)
		if t.difficultyID == 24 or t.difficultyID == 33 then
			return 1271;	-- TIMEWALKING event constant
		end
	end,
	["hash"] = function(t)
		local key = t.key;
		if key then
			if t.parent then
				local parentKey = t.parent.key;
				if parentKey then return key .. t[key] .. "~" .. parentKey .. t.parent[parentKey]; end
			end
			return key .. t[key];
		end
	end,
},
"Group", {
	["name"] = function(t)
		local difficultyID = t.difficultyID;
		local name = GetDifficultyInfo(difficultyID);
		if not name then
			local difficulties = t.difficulties;
			if not difficulties then
				return UNKNOWN;
			else
				name = GetDifficultyName(difficulties[1])
				for i=2,#difficulties do
					name = name.." / "..GetDifficultyName(difficulties[i]);
				end
			end
		end
		return name;
	end,
}, (function(t) return t.difficulties; end));

-- External Functionality
local function SummarizeLockout(tooltipInfo, lockout, leftText, color)
	tinsert(tooltipInfo, {
		left = leftText,
		right = date("%c", lockout.reset),
		color = color,
	});
	for encounterIter,encounter in pairs(lockout.encounters) do
		tinsert(tooltipInfo, {
			left = " " .. encounter.name,
			right = app.GetCompletionIcon(encounter.isKilled),
		});
	end
end
app.AddEventHandler("OnLoad", function()
	app.Settings.CreateInformationType("locks", {
		priority = 10000,
		text = L.LOCKOUTS,
		Process = function(t, reference, tooltipInfo)
			if reference.instanceID then
				tinsert(tooltipInfo, {
					left = L.LOCKOUT,
					right = L[reference.isLockoutShared and "SHARED" or "SPLIT"],
				});
			end
			local locks = reference.locks;
			if locks then
				if locks.encounters then
					SummarizeLockout(tooltipInfo, locks, L.RESETS);
				elseif reference.isLockoutShared and locks.shared then
					SummarizeLockout(tooltipInfo, locks.shared, L.SHARED);
				else
					for key,lockout in pairs(locks) do
						if key == "shared" then
							-- Skip
						else
							SummarizeLockout(tooltipInfo, lockout, GetDifficultyInfo(key) or LOCK, DifficultyColors[key] or app.Colors.DefaultDifficulty);
						end
					end
				end
			end
		end,
	});
end);
app.GetCurrentDifficultyID = function()
	return IsInInstance() and select(3, GetInstanceInfo()) or 0;
end
app.GetRelativeDifficultyIcon = function(t)
	return DifficultyIcons[GetRelativeValue(t, "difficultyID") or 1];
end
end