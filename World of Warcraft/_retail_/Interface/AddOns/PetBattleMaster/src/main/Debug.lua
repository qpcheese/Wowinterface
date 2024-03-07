--[[
	Copyright (C) Udorn (Blackhand)
--]]

--[[
	Debugging functionallity copied from AceDebug-2.0 for the ACe3 migration.
--]]

petbm = petbm or {}

petbm.Debug = {}
petbm.Debug.prototype = {}
petbm.Debug.metatable = {__index = petbm.Debug.prototype}

petbm.Debug.debug = true

--[[
	Returns whether the given logger is debugging.
--]]
local function _IsDebugging(name)
	return PetBattleMasterDb and PetBattleMasterDb.debug
end

--[[
	Sets the debugging state for the given debugger
--]]
local function _SetDebugging(name, d)
	 PetBattleMasterDb.debug = d
--	if (name) then
--    	if (not AuctionMasterMiscDb.debuggers) then
--    		AuctionMasterMiscDb.debuggers = {}
--    	end
--    	if (not AuctionMasterMiscDb.debuggers[name]) then
--    		AuctionMasterMiscDb.debuggers[name] = {}
--    	end
--    	AuctionMasterMiscDb.debuggers[name].debugging = d
--    end
end

local options = {
	type = "multiselect",
	name = "Debug",
	values = {},
	get = function(info, name)
		return _IsDebugging(name)
	end,
	set = function(info, name, state)
		_SetDebugging(name, state)
	end,
}

local function safecall(func,...)
	local success, err = pcall(func,...)
	if not success then geterrorhandler()(err:find("%.lua:%d+:") and err or (debugstack():match("\n(.-: )in.-\n") or "") .. err) end
end

--[[ 
	Creates a new instance.
--]]
function petbm.Debug:new(name)
	local instance = setmetatable({}, self.metatable)
	instance.name = name
	options.values[name] = name
	return instance
end


local function log(text, r, g, b, frame, delay)
	if (not  PetBattleMasterDb.debuglog) then
		 PetBattleMasterDb.debuglog = {}
	end
	tinsert( PetBattleMasterDb.debuglog, text);
	(frame or DEFAULT_CHAT_FRAME):AddMessage(text, r, g, b, 1, delay or 5)
end

local tmp = {}

function petbm.Debug.prototype:CustomDebug(r, g, b, frame, delay, a1, ...)
	if (not _IsDebugging(self.name))  then
		return
	end

	local output = self:GetDebugPrefix()
	
	a1 = tostring(a1)
	if a1:find("%%") and select('#', ...) >= 1 then
		for i = 1, select('#', ...) do
			tmp[i] = tostring((select(i, ...)))
		end
		output = output .. " " .. a1:format(unpack(tmp))
		for i = 1, select('#', ...) do
			tmp[i] = nil
		end
	else
		-- This block dynamically rebuilds the tmp array stopping on the first nil.
		tmp[1] = output
		tmp[2] = a1
		for i = 1, select('#', ...) do
			tmp[i+2] = tostring((select(i, ...)))
		end
		
		output = table.concat(tmp, " ")
		
		for i = 1, select('#', ...) + 2 do
			tmp[i] = nil
		end
	end

	log(output, r, g, b, frame or self.debugFrame, delay)
end

function petbm.Debug.prototype:Debug(...)
	local logging = getglobal("Logging")
	self:CustomDebug(nil, nil, nil, nil, logging, ...)
end

function petbm.Debug.prototype:IsDebugging()
	return _IsDebugging(self.name)
end

function petbm.Debug.prototype:SetDebugging(d)
	_SetDebugging(self.name, d)
end

function petbm.Debug.prototype:GetDebugPrefix()
	return ("|cff7fff7f(DEBUG) %s:[%s.%3d]|r"):format( self.name, date("%H:%M:%S"), (GetTime() % 1) * 1000)
end

function petbm.Debug.prototype:PrintHistory()
	if ( PetBattleMasterDb.debuglog) then
		local n = getn( PetBattleMasterDb.debuglog)
		for i=1,n do
			print( PetBattleMasterDb.debuglog[i])
		end
	end
end

function petbm.Debug.prototype:ClearHistory()
	if ( PetBattleMasterDb) then
		 PetBattleMasterDb.debuglog = nil
	end
end
