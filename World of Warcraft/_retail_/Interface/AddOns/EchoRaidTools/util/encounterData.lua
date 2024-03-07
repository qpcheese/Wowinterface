local addonName, _EchoRaidTools = ...;
local LibReadOnly = LibStub:GetLibrary("LibReadOnly");

local encounterData = {};
local encounterIDToJournalID = {};
local journalIDToEncounterID = {};

local tiersWeCareAbout = {7,8,9,10};
function _EchoRaidTools:InitializeEncounterData()
	local lastSelectedTier = EJ_GetCurrentTier();
	for _,tier in ipairs(tiersWeCareAbout) do
		EJ_SelectTier(tier);

		for _,isRaid in ipairs({true,false}) do
			local instanceIndex = 1;
			local instanceID = EJ_GetInstanceByIndex(instanceIndex, isRaid);

			while(instanceID)do
				EJ_SelectInstance(instanceID);
				encounterData[instanceID] = {};
				encounterData[instanceID].name = EJ_GetInstanceInfo(instanceID);

				local encounterIndex = 1;
				local bossName, description, journalEncounterID, rootSectionID, journalLink, journalInstanceID, encounterID = EJ_GetEncounterInfoByIndex(encounterIndex, instanceID);

				while(bossName)do
					local newEncounterData = {
						name = bossName,
						description = description,
						journalEncounterID = journalEncounterID,
						rootSectionID = rootSectionID,
						journalLink = journalLink,
						journalInstanceID = journalInstanceID,
						encounterID = encounterID,
					};

					table.insert(encounterData[instanceID],newEncounterData);

					if(encounterID)then
						encounterIDToJournalID[encounterID] = journalEncounterID;
					end

					if(journalEncounterID)then
						journalIDToEncounterID[journalEncounterID] = encounterID;
					end

					encounterIndex = encounterIndex + 1;
					bossName, description, journalEncounterID, rootSectionID, journalLink, journalInstanceID, encounterID = EJ_GetEncounterInfoByIndex(encounterIndex, instanceID);
				end

				instanceIndex = instanceIndex + 1;
				instanceID = EJ_GetInstanceByIndex(instanceIndex, isRaid);
			end
		end
	end
	EJ_SelectTier(lastSelectedTier);
end

function _EchoRaidTools:GetEncounterData()
	return LibReadOnly:New(encounterData);
end

function _EchoRaidTools:GetEncountersInInstance(instanceID)
	return instanceID and LibReadOnly:New(encounterData[instanceID]);
end

function _EchoRaidTools:GetJournalIDForEncounterID(encounterID)
	return encounterID and encounterIDToJournalID[encounterID];
end

function _EchoRaidTools:GetEncounterIDforJournalID(journalEncounterID)
	return journalEncounterID and journalIDToEncounterID[journalEncounterID];
end

local function findEncounterByID(data,encounterID)
	if(data)then
		for _,encounterData in ipairs(data) do
			if(encounterData.encounterID == encounterID)then
				return LibReadOnly:New(encounterData);
			end
		end
	end
end

function _EchoRaidTools:GetEncounterDataByEncounterID(encounterID,instanceID)
	if(encounterID)then
		if(instanceID)then
			return findEncounterByID(encounterData[instanceID],encounterID);
		else
			for instanceID,instanceData in pairs(encounterData) do
				local encounterData = findEncounterByID(instanceData,encounterID);
				if(encounterData)then
					return encounterData;
				end
			end
		end
	end
end

local function findEncounterIndexByID(data,encounterID)
	if(data)then
		for index,encounterData in ipairs(data) do
			if(encounterData.encounterID == encounterID)then
				return index;
			end
		end
	end
end

function _EchoRaidTools:GetEncounterIndexByEncounterID(encounterID,instanceID)
	if(encounterID)then
		if(instanceID)then
			return findEncounterIndexByID(encounterData[instanceID],encounterID);
		else
			for instanceID,instanceData in pairs(encounterData) do
				local bossIndex = findEncounterIndexByID(instanceData,encounterID);
				if(bossIndex)then
					return bossIndex;
				end
			end
		end
	end
end