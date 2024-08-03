local MAJOR = "LibReadOnly";
local MINOR = 5;

local LibReadOnly = LibStub:NewLibrary(MAJOR, MINOR);
if not LibReadOnly then return; end

-- Local unhookable copies
local setmetatable, type, select, next = setmetatable, type, select, next;

local makeReadOnly;

local function safePairs(lib,t,nonRecursive)
	local lastKey;
	local function iter()
		local nextKey, nextValue = next(t,lastKey or nil);
		if(nextValue)then
			lastKey = nextKey;
			if(not nonRecursive and type(nextValue) == "table")then
				return nextKey, makeReadOnly(lib,nextValue);
			else
				return nextKey, nextValue;
			end
		end
	end

	return iter;
end

local function safeIPairs(lib,t,nonRecursive)
	local lastIndex = 0;
	local function iter()
		lastIndex = lastIndex + 1;
		local value = t[lastIndex];
		if(value)then
			if(not nonRecursive and type(value) == "table")then
				return lastIndex, makeReadOnly(lib,value);
			else
				return lastIndex, value;
			end
		end
	end

	return iter;
end

function makeReadOnly(lib,t,nonRecursive)
	if(lib ~= LibReadOnly) then error("LibReadOnly calls need to be `self` call. `LibReadOnly:New(table)` instead of `LibReadOnly.New(table)`.",2); end
	local proxy = {};
	setmetatable(proxy, {
		__index = function(self, k)
			if(k == "pairs")then
				return function() return safePairs(lib,t,nonRecursive); end
			elseif(k == "ipairs")then
				return function() return safeIPairs(lib,t,nonRecursive); end
			elseif(k == "isReadOnly")then
				return true;
			end

			local requestedValue = t[k];
			if(not nonRecursive and type(requestedValue) == "table")then
				return makeReadOnly(lib,requestedValue);
			else
				return requestedValue;
			end
		end,
		__newindex = function(self, k, v)
			error("attempt to update " .. k .. " of read-only table.", 2);
		end,
		__metatable = false,
	});

	return proxy;
end

local function protectArguments(lib,...)
	if(lib ~= LibReadOnly) then error("LibReadOnly calls need to be `self` call. `LibReadOnly:ProtectArguments(table)` instead of `LibReadOnly.ProtectArguments(table)`.",2); end
	local argsCount = select("#",...);
	local args = {...};

	for i=1,argsCount do
		local arg = args[i];
		if(type(arg) == "table")then
			args[i] = LibReadOnly:New(arg);
		end
	end

	return args, argsCount;
end

LibReadOnly.New = makeReadOnly;
LibReadOnly.ProtectArguments = protectArguments;

local metatable = { __call = makeReadOnly; };
setmetatable(LibReadOnly,metatable);