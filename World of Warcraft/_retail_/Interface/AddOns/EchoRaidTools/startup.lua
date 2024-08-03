local _AddonName, _EchoRaidTools = ...;

local function registerEventsForEntity(object)
	for potentialFuncName,potentialFunction in pairs(object)do
		if(type(potentialFunction) == "function" and strupper(potentialFuncName) == potentialFuncName)then
			object:RegisterEvent(potentialFuncName);
		end
	end
end

registerEventsForEntity(_EchoRaidTools);
for _, module in ipairs(_EchoRaidTools.modules) do
	registerEventsForEntity(module);
end