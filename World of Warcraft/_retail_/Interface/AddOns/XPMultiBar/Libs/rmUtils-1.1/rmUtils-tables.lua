--[=====[
		## RM Utils library ver. 1.1.2
		## rmEvent.lua - Tables sub-module
		Code for table manipulating logic
--]=====]

local U = LibStub("rmUtils-1.1")

local ipairs = ipairs
local pairs = pairs
local tinsert = table.insert
local tremove = table.remove
local type = type

-- Remove all known globals after this point
-- luacheck: std none

--[[ Table functions ]]
local u_override, u_merge, u_clone, u_allValues, u_namedValues

function u_override(target, source)
	if not source then
		target, source = {}, target
	elseif type(target) ~= "table" then
		target = {}
	end
	for k, v in pairs(source) do
		if type(v) == "table" then
			target[k] = u_override(target[k], v)
		else
			target[k] = v
		end
	end
	return target
end

function u_merge(target, source)
	if not source then
		target, source = {}, target
	elseif type(target) ~= "table" then
		target = {}
	end
	for k, v in pairs(source) do
		if target[k] == nil then
			if type(v) == "table" then
				target[k] = u_merge(target[k], v)
			else
				target[k] = v
			end
		end
	end
	return target
end

function u_clone(source)
	return u_merge(source)
end

function u_allValues(t)
	local res = {}
	for _, v in pairs(t) do
		tinsert(res, v)
	end
	return res
end

function u_namedValues(t, names)
	local res = {}
	for _, v in ipairs(names) do
		tinsert(res, t[v])
	end
	return res
end

function U.ForEach(t, forEachFunc)
	for k, v in pairs(t) do
		forEachFunc(v, k, t)
	end
end

function U.Filter(t, filterFunc)
	local res = {}
	for k, v in pairs(t) do
		if filterFunc(v, k, t) then
			if type(k) == "number" then
				tinsert(res, v)
			else
				res[k] = v
			end
		end
	end
	return res
end

function U.Map(t, mapFunc)
	local res = {}
	for k, v in pairs(t) do
		res[k] = mapFunc(v, k, t)
	end
	return res
end

function U.Append(...)
	local result, num, tbl = {}, 1, {...}
	for i = 1, #tbl do
		local t = tbl[i]
		if t then
			for j = 1, #t do
				result[num], num = t[j], num + 1
			end
		end
	end
	return result
end

function U.AppendTable(t, ...)
	local result, num, tbl = t or {}, 1, {...}
	for i = 1, #tbl do
		local tt = tbl[i]
		if tt then
			for j = 1, #tt do
				result[num], num = tt[j], num + 1
			end
		end
	end
	return result
end

function U.Slice(t, start, finish)
	local result = {}
	for i = start, finish do
		result[#result + 1] = t[i]
	end
	return result
end

function U.SliceLength(t, start, length)
	return U.Slice(t, start, start + length)
end

function U.Push(t, item)
	tinsert(t, item)
end

function U.Pop(t)
	return tremove(t)
end

function U.Shift(t)
	return tremove(t, 1)
end

function U.Unshift(t, item)
	tinsert(t, 1, item)
end

function U.Keys(t)
	local res = {}
	for k, _ in pairs(t) do
		tinsert(res, k)
	end
	return res
end

function U.Values(t, ...)
	local names = ...
	if not names then
		return u_allValues(t)
	elseif type(names) == "table" then
		return u_namedValues(t, names)
	else
		return u_namedValues(t, {...})
	end
end

U.Override = u_override
U.Merge = u_merge
U.Clone = u_clone
