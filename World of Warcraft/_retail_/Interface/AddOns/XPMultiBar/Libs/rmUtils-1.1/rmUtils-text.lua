--[=====[
		## RM Utils library ver. 1.1.2
		## rmUtils-text.lua - Text sub-module
		Code for text formatting and manipulation logic
--]=====]

local U = LibStub("rmUtils-1.1")

local setmetatable = setmetatable
local type = type

local CreateColor = CreateColor
local BLACK_FONT_COLOR = BLACK_FONT_COLOR
local RED_FONT_COLOR = RED_FONT_COLOR
local ORANGE_FONT_COLOR = ORANGE_FONT_COLOR
local LIGHTBLUE_FONT_COLOR = LIGHTBLUE_FONT_COLOR
local GREEN_FONT_COLOR = GREEN_FONT_COLOR
local NORMAL_FONT_COLOR = NORMAL_FONT_COLOR

-- Remove all known globals after this point
-- luacheck: std none

--[[ Message formatting ]]
local function ts(icon, color)
    return {icon = icon, color = color}
end

local iconFormat = "|T%s:0|t\32"
local textSettings = {
    fatal = ts([[interface\targetingframe\ui-raidtargetingicon_8]], BLACK_FONT_COLOR),
    error = ts([[interface\targetingframe\ui-raidtargetingicon_7]], RED_FONT_COLOR),
    warning = ts([[interface\targetingframe\ui-raidtargetingicon_2]], ORANGE_FONT_COLOR),
    info = ts([[interface\targetingframe\ui-raidtargetingicon_5]], LIGHTBLUE_FONT_COLOR),
    instruction = ts([[interface\targetingframe\ui-raidtargetingicon_4]], GREEN_FONT_COLOR),
    key = ts(nil, CreateColor(1, 1, 0.125, 1)),
    normal = ts(nil, NORMAL_FONT_COLOR)
}

local function getIndex(_, index)
    if type(index) == "string" then
        local key = index:match("^Get(%w+)"):lower()
        local textSetting = textSettings[key]
        if not textSetting.func then
            local icon, color = textSetting.icon, textSetting.color
            textSetting.func = function(text)
                local iconTag = icon and iconFormat:format(icon) or ""
                return iconTag .. color:WrapTextInColorCode(text)
            end
        end
        return textSetting.func
    end
end

U.Text = setmetatable({}, {__index = getIndex})

--[[ Text formatting and replacing ]]

function U.MultiReplace(text, replacements)
	if not text or text == "" then
		return ""
	end
	local result = text
	U.ForEach(
		replacements,
		function(value, pattern)
			result = result:gsub(pattern, value)
		end
	)
	return result
end
