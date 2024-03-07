local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

journal.importData = {};
journal.manifest = {};

function journal:AddImportData(data)
	for k,v in pairs(data) do
		journal.importData[k] = v;
	end
end

function journal:AddManifestData(data,instanceID,encounterID)
	if(data and instanceID and encounterID)then
		journal.manifest[instanceID] = journal.manifest[instanceID] or {};
		journal.manifest[instanceID][encounterID] = journal.manifest[instanceID][encounterID] or {};

		local store = journal.manifest[instanceID][encounterID];

		local indexLookup = {};
		for i,v in ipairs(store) do
			indexLookup[v.id] = i;
		end

		for i,v in ipairs(data)do
			if(indexLookup[v.id])then
				store[indexLookup[v.id]] = v;
			else
				table.insert(store,v);
			end
		end
	end
end