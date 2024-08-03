local _AddonName, _EchoRaidTools = ...;

local journal = _EchoRaidTools:GetModule("waJournal");

function journal:GetWADataByUid(uid)
	if(WeakAurasSaved and uid)then
		for _,waData in pairs(WeakAurasSaved.displays) do
			if(waData.uid == uid)then
				return waData;
			end
		end
	end
end

function journal:GetWADataByName(name)
	return (WeakAurasSaved and name) and WeakAurasSaved.displays[name];
end

function journal:GetWADataByAny(uid,name)
	return 	journal:GetWADataByUid(uid) or
			journal:GetWADataByName(name);
end