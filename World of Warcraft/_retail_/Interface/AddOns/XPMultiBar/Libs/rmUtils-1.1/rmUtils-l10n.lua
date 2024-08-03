--[=====[
		## RM Utils library ver. 1.1.2
		## rmUtils-l10n.lua - Localization sub-module
		Code for advanced localization logic
--]=====]

local U = LibStub("rmUtils-1.1")

local rawget = rawget
local setmetatable = setmetatable

-- Remove all known globals after this point
-- luacheck: std none

--[[ Debug Localization ]]

U.DebugL = function(L)
	return setmetatable(
		{},
		{
            __index = function(self, key)
				return L and rawget(L, key) or key
			end
        }
	)
end

--[[ Improved localization syntax: L"key" ]]

U.UpgradeL = function(L)
    return function(key)
        return L[key]
    end
end
