--[=====[
		## RM Utils library ver. 1.1.2
		## rmUtils-debug.lua - Debug sub-module
		Code for debug print logic
--]=====]

local U = LibStub("rmUtils-1.1")

local pairs = pairs
local print = print
local strrep = string.rep
local tostring = tostring
local type = type

-- Remove all known globals after this point
-- luacheck: std none

--[[ Debug functions ]]

function U.PrintThru(value, label)
	--@debug@
	local text = tostring(value)

	if label then
		text = label .. ": " .. text
	end

	print(text)
	--@end-debug@

	return value
end

function U.PrintTypes(tbl, title)
	if title and #title > 0 then
		print(title)
	end

	if type(tbl) == "table" then
		for k, v in pairs(tbl) do
			print(k, "(" .. type(v) .. "):", v)
		end
	else
		print("value (" .. type(tbl) .. "):", tbl)
	end
end

function U.PrintTable(table, tableName, maxLevel)
	--@debug@

	local function indent(i)
		return strrep("  ", i)
	end

	local function printIndent(i, s)
		print(indent(i) .. s)
	end

	local function printTableImpl(t, name, level, max)
		if level > max then
			return
		elseif t == nil then
			-- this is possible only for top level value
			printIndent(level, name .. " = nil,")
			return
		end

		printIndent(level, name .. " = {")

		for k, v in pairs(t) do
			local vType = type(v)
			if vType == "table" then
				printTableImpl(v, k, level + 1, max)
			elseif vType == "string" then
				printIndent(level + 1, k .. " = '" .. tostring(v) .. "',")
			else
				printIndent(level + 1, k .. " = " .. tostring(v) .. ",")
			end
		end

		printIndent(level, "},")
	end

	printTableImpl(table, tableName or "<unnamed>", 0, maxLevel or 16)

	--@end-debug@
end
