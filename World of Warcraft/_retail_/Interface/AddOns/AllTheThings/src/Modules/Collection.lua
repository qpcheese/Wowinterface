local appName, app = ...
local L = app.L

-- Dependencies: Locales, Modules.RetrievingData

local wipe, pairs, coroutine_yield
	= wipe, pairs, coroutine.yield

local IsRetrieving = app.Modules.RetrievingData.IsRetrieving;
local StartCoroutine = app.StartCoroutine;

-- Collection Events
local Callback = app.CallbackHandlers.Callback
local FanfareFunctions = setmetatable({
	Mount = app.Audio.PlayMountFanfare
}, { __index = function(t,key)
	return app.Audio.PlayFanfare
end})

app.AddEventHandler("OnThingCollected", function(type)
	if type and not app.Settings:Get("Thing:"..type) then return end

	Callback(FanfareFunctions[type])
	if app.Settings:GetTooltipSetting("Screenshot") then
		Callback(Screenshot)
	end
end)

app.AddEventHandler("OnThingRemoved", function(type)
	if type and not app.Settings:Get("Thing:"..type) then return end

	Callback(app.Audio.PlayRemoveSound)
end)

local pendingCollection, pendingRemovals, retrievingCollection, pendingCollectionCooldown = {},{},{},0;
local function PendingCollectionCoroutine()
	while not app.IsReady do coroutine_yield(); end
	while pendingCollectionCooldown > 0 do
		-- app.PrintDebug("PCC",pendingCollectionCooldown)
		pendingCollectionCooldown = pendingCollectionCooldown - 1;
		coroutine_yield();

		-- If any of the collection objects is retrieving data, try again.
		local anyRetrieving = false;
		for hash,thing in pairs(retrievingCollection) do
			local retries = thing[1];
			if retries > 0 then
				retries = retries - 1;
				thing[1] = retries;
				if IsRetrieving(thing[2].text) then
					retrievingCollection[hash] = nil;
					anyRetrieving = true;
				end
			end
		end
		if anyRetrieving then
			pendingCollectionCooldown = pendingCollectionCooldown + 1;
		end
	end

	-- Report new things to your collection!
	local any,allTypes = false,{};
	local reportCollected = app.Settings:GetTooltipSetting("Report:Collected");
	for hash,t in pairs(pendingCollection) do
		local f = t.f;
		if f then allTypes[f] = true; end
		if reportCollected then
			app.print(L.ITEM_ID_ADDED:format((t.text or UNKNOWN), t[t.key] or "???"));
		end
		any = true;
	end
	if any then
		wipe(pendingCollection);

		-- Check if there was a mount.
		if allTypes[app.FilterConstants.MOUNTS] then
			app.Audio:PlayMountFanfare();
		else
			app.Audio:PlayFanfare();
		end
	end

	-- Report removed things from your collection...
	any = false;
	for hash,t in pairs(pendingRemovals) do
		if reportCollected then
			app.print(L.ITEM_ID_REMOVED:format((t.text or UNKNOWN), t[t.key] or "???"));
		end
		any = true;
	end
	if any then
		wipe(pendingRemovals);
		app.Audio:PlayRemoveSound();
	end
end
local function AddToCollection(group)
	if not group then return; end
	local hash = group.hash;
	if IsRetrieving(group.text) then
		retrievingCollection[hash] = { 5, group };
	end

	if pendingRemovals[hash] then
		pendingRemovals[hash] = nil;
	-- Do not add the item to the pending list if it was already in it.
	elseif not pendingCollection[hash] then
		pendingCollection[hash] = group;
		pendingCollectionCooldown = 10;
		StartCoroutine("Pending Collection", PendingCollectionCoroutine);
	end
end
local function RemoveFromCollection(group)
	if not group then return; end
	local hash = group.hash;
	if IsRetrieving(group.text) then
		retrievingCollection[hash] = { 5, group };
	end

	if pendingCollection[hash] then
		pendingCollection[hash] = nil;
	-- Do not add the item to the pending list if it was already in it.
	elseif not pendingRemovals[hash] then
		pendingRemovals[hash] = group;
		pendingCollectionCooldown = 10;
		StartCoroutine("Pending Collection", PendingCollectionCoroutine);
	end
end

app.AddEventHandler("OnSavedVariablesAvailable", function(currentCharacter, accountWideData, accountWideSettings)
	-- Returns the cached status for this Account for a given field ID
	local function IsAccountCached(field, id)
		return accountWideData[field][id] or nil
	end
	-- Returns the cached status for this Character for a given field ID
	local function IsCached(field, id)
		return currentCharacter[field][id] or nil
	end
	-- Assigns the cached status for this Character for a given field ID without causing any related events
	local function SetCached(field, id, state)
		currentCharacter[field][id] = state
	end
	-- Returns the tracked status for this Account for a given field ID
	local function IsAccountTracked(field, id)
		return accountWideSettings[field] and accountWideData[field][id] or nil
	end
	-- Allows directly saving a cached state for a table of ids for a given field at the Account level
	-- Note: This does not include reporting of collected things. It should be used in situations where this is not desired (onstartup refresh, etc.)
	local function SetBatchAccountCached(field, ids, state)
		-- app.PrintDebug("SBC:A",field,state)
		local container = accountWideData[field]
		for id,_ in pairs(ids) do
			container[id] = state
		end
	end
	-- Allows directly saving a cached state for a table of ids for a given field.
	-- Note: This does not include reporting of collected things. It should be used in situations where this is not desired (onstartup refresh, etc.)
	local function SetBatchCached(field, ids, state)
		-- app.PrintDebug("SBC",field,state)
		local container = currentCharacter[field]
		for id,_ in pairs(ids) do
			container[id] = state
		end
	end
	local function SetAccountCollected(t, field, id, collected)
		-- app.PrintDebug("SC:A",t and t.hash,field,id,collected)
		local container = accountWideData[field];
		local oldstate = container[id];
		if collected then
			if not oldstate then
				AddToCollection(t);
				container[id] = 1;
				-- if t exists, then AddToCollection does some handling of collection stuff...
				if not t then
					app.HandleEvent("OnThingCollected", field)
				end
			end
			return 1;
		elseif oldstate then
			RemoveFromCollection(t);
			container[id] = nil;
			-- if t exists, then RemoveFromCollection does some handling of collection stuff...
			if not t then
				app.HandleEvent("OnThingRemoved", field)
			end
		end
	end
	local function SetAccountCollectedForSubType(t, field, subtype, id, collected)
		-- app.PrintDebug("SCS:A",t and t.hash,field,subtype,id,collected)
		local container = accountWideData[field];
		local oldstate = container[id];
		if collected then
			if not oldstate then
				AddToCollection(t);
				container[id] = 1;
				-- if t exists, then AddToCollection does some handling of collection stuff...
				if not t then
					app.HandleEvent("OnThingCollected", field)
				end
			end
			return 1;
		elseif oldstate then
			RemoveFromCollection(t);
			container[id] = nil;
			-- if t exists, then RemoveFromCollection does some handling of collection stuff...
			if not t then
				app.HandleEvent("OnThingRemoved", field)
			end
		end
	end
	local function SetCollected(t, field, id, collected)
		-- app.PrintDebug("SC",t and t.hash,field,id,collected)
		local container = currentCharacter[field];
		local oldstate = container[id];
		if collected then
			if not oldstate then
				if t and accountWideSettings[field] and not accountWideData[field][id] then
					AddToCollection(t);
				else
					-- if t exists, then AddToCollection does some handling of collection stuff...
					app.HandleEvent("OnThingCollected", field)
				end
				container[id] = 1;
				accountWideData[field][id] = 1;
			else
				accountWideData[field][id] = 1;
			end
			return 1;
		elseif oldstate then
			container[id] = nil;
			-- this is handled by RecalculateAccountWideData
			-- for guid,other in pairs(characterData) do
			-- 	local otherContainer = other[field];
			-- 	if otherContainer and otherContainer[id] then
			-- 		accountWideData[field][id] = 1;
			-- 		return accountWideSettings[field] and 2;
			-- 	end
			-- end
			if accountWideData[field][id] then
				RemoveFromCollection(t);
				accountWideData[field][id] = nil;
				-- if t exists, then RemoveFromCollection does some handling of collection stuff...
				if not t then
					app.HandleEvent("OnThingRemoved", field)
				end
			end
		end
		return accountWideData[field][id] and 2 or nil
	end
	local function SetCollectedForSubType(t, field, subtype, id, collected)
		-- app.PrintDebug("SCS",t and t.hash,field,subtype,id,collected)
		local container = currentCharacter[field];
		local oldstate = container[id];
		if collected then
			if not oldstate then
				if t and accountWideSettings[subtype] and not accountWideData[field][id] then
					AddToCollection(t);
				else
					-- if t exists, then AddToCollection does some handling of collection stuff...
					app.HandleEvent("OnThingCollected", field)
				end
				container[id] = 1;
				accountWideData[field][id] = 1;
			else
				accountWideData[field][id] = 1;
			end
			return 1;
		elseif oldstate then
			container[id] = nil;
			-- this is handled by RecalculateAccountWideData
			-- for guid,other in pairs(characterData) do
			-- 	local otherContainer = other[field];
			-- 	if otherContainer and otherContainer[id] then
			-- 		accountWideData[field][id] = 1;
			-- 		return accountWideSettings[subtype] and 2;
			-- 	end
			-- end
			if accountWideData[field][id] then
				RemoveFromCollection(t);
				accountWideData[field][id] = nil;
				-- if t exists, then RemoveFromCollection does some handling of collection stuff...
				if not t then
					app.HandleEvent("OnThingRemoved", field)
				end
			end
		end
		return accountWideData[subtype][id] and 2 or nil
	end
	app.SetAccountCollected = SetAccountCollected;
	app.SetAccountCollectedForSubType = SetAccountCollectedForSubType;
	app.SetCached = SetCached
	app.SetCollected = SetCollected;
	app.SetCollectedForSubType = SetCollectedForSubType;
	app.IsCached = IsCached
	app.IsAccountCached = IsAccountCached
	app.IsAccountTracked = IsAccountTracked
	app.SetBatchAccountCached = SetBatchAccountCached
	app.SetBatchCached = SetBatchCached
end)