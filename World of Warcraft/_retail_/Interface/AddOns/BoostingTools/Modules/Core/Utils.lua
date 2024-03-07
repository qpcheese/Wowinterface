-----------------------------------------------------------------------------------------------------------------------
--  Title:   Utils                                                                                                   --
--  Author:  Zaazu                                                                                                   --
--  Date:    June 2021                                                                                               --
--  Website: https://zaazu.dev                                                                                       --
--  About:   A list of helpful utility functions that can be called from BTools.                                     --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
local LibParse = LibStub("LibParse")

local function SanitizeInputCSV(input)
    input = input and tostring(input) or ""
    return "\"" .. input:gsub("[\n\r\"]", " ") .. "\""
end

---@class Utils
BTools.Utils = {
    --- Takes unformated table values and assigns them to the table variable names given
    ---@param values table
    ---@vararg string @variable names
    ---@return table
    varArgsToTable = function(values, ...)
        local varArgs = {...}
        local t = {}

        for i = 1, #varArgs do
            if (varArgs[i]) then
                t[varArgs[i]] = values[i]
            else
                break
            end
        end

        return t
    end,

    --- Returns the length of a table. Used where # can't be used
    ---@param t table
    ---@return number
    getTableLength = function(t)
        local count = 0

        if (type(t) == "table") then
            for _, _ in pairs(t) do
                count = count + 1
            end
        end

        return count
    end,

    ---Copies a table recursively
    ---@param orig table
    ---@return table
    tableDeepCopy = function(orig)
        local orig_type = type(orig)
        local copy
        if orig_type == "table" then
            copy = {}
            for orig_key, orig_value in next, orig, nil do
                copy[BTools.Utils.tableDeepCopy(orig_key)] = BTools.Utils.tableDeepCopy(orig_value)
            end
            setmetatable(copy, BTools.Utils.tableDeepCopy(getmetatable(orig)))
        else -- number, string, boolean, etc
            copy = orig
        end
        return copy
    end,

    ---Returns CSV string from given table
    ---@param keys table
    ---@param data table
    ---@return string
    encodeCSV = function(keys, data)
        for _, entry in ipairs(data) do
            for _, key in ipairs(keys) do
                entry[key] = SanitizeInputCSV(entry[key])
            end
        end

        return LibParse:CSVEncode(keys, data)
    end,

    ---Returns JSON string from given table
    ---@param t table
    ---@return string
    encodeJSON = function(t)
        return LibParse:JSONEncode(t)
    end,

    ---Returns table from given JSON string
    ---@param s string
    ---@return table
    decodeJSON = function(s)
        return LibParse:JSONDecode(s)
    end
}
