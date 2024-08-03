--[=====[
		## RM Utils library ver. 1.1.2
		## rmUtils.lua - main lib. module
		Code for rmUtils lib
--]=====]

local RMUTILS11 = "rmUtils-1.1"
local RMUTILS11_MINOR = 2 -- Bump on changes

if not LibStub then
	error(RMUTILS11 .. " requires LibStub.")
end

local U = LibStub:NewLibrary(RMUTILS11, RMUTILS11_MINOR)
if not U then return end

local unpack = unpack

-- Remove all known globals after this point
-- luacheck: std none

--[[ Empty Function ]]
U.EmptyFn = function() end

--[[ Function functions ]]

function U.Bind(func, ...)
	local presetArgs = { ... }
	return function(...)
		func(unpack(U.Append(presetArgs, { ... })))
	end
end
