--[=====[
		## RM Utils library ver. 1.1.2
		## rmUtils-numbers.lua - Numbers sub-module
		Code for number formatting logic
--]=====]

local U = LibStub("rmUtils-1.1")

local math_floor = math.floor
local strformat = string.format
local tonumber = tonumber
local tostring = tostring
local type = type

local BreakUpLargeNumbers = BreakUpLargeNumbers
local GetLocale = GetLocale
local LARGE_NUMBER_SEPERATOR = LARGE_NUMBER_SEPERATOR

-- Remove all known globals after this point
-- luacheck: std none

--[[ Large number formatting ]]

local breakUpLargeNumber

local testNumber = 192837465
local locale = GetLocale()
local breakCount = 3

local classSeparators = {
	deDE = ".",
	frFR = "\194\160", -- NBSP
	esES = ".",
	ptBR = ".",
	ruRU = "\194\160" -- NBSP
}

local hasLargeNumberSeperator = LARGE_NUMBER_SEPERATOR and #LARGE_NUMBER_SEPERATOR > 0

if type(BreakUpLargeNumbers) == "function" and hasLargeNumberSeperator
        and BreakUpLargeNumbers(testNumber) ~= tostring(testNumber) then
	breakUpLargeNumber = BreakUpLargeNumbers
else
	local classSeparator = hasLargeNumberSeperator and LARGE_NUMBER_SEPERATOR or (classSeparators[locale] or ",")

	breakUpLargeNumber = function(num)
		if type(num) ~= "number" then
			return num
		end

		local strnum = tostring(num)
		local _, _, minus, whole, _, fraction = strnum:find("^(%-?)(%d+)(%.?)(%d*)")

		if #whole <= breakCount then
			return strnum
		end

		local fullBreaks = math_floor(#whole / breakCount)
		local remain = #whole % breakCount
		local broken = ""

		for i = 0, fullBreaks - 1 do
			if #broken > 0 then
				broken = classSeparator .. broken
			end
			local ind1, ind2 = -(i * 3 + 3), -(i * 3 + 1)
			broken = whole:sub(ind1, ind2) .. broken
		end

		if remain > 0 then
			broken = whole:sub(1, remain) .. classSeparator .. broken
		end

		-- add localized 'dot' to fraction digits
		fraction = strformat("%0." .. #fraction .. "F", tonumber("0." .. fraction)):sub(2)

		return minus .. broken .. fraction
	end
end

function U.Commify(num)
	if type(num) ~= "number" then
		return num
	end
	return breakUpLargeNumber(num)
end

function U.FormatPercents(dividend, divisor)
	dividend = dividend or 0
	divisor = divisor or 0
	if divisor == 0 then
		return 0
	end
	return ("%.1F%%%%"):format(dividend / divisor * 100)
end

function U.FormatRemainingPercents(dividend, divisor)
	dividend = dividend or 0
	divisor = divisor or 0
	if divisor == 0 then
		return 0
	end
	return ("%.1F%%%%"):format(100 - (dividend / divisor * 100))
end
