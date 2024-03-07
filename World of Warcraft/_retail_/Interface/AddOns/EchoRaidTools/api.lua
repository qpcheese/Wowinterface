local _AddonName, _EchoRaidTools = ...

local LibReadOnly = LibStub:GetLibrary("LibReadOnly");

local Debug = function(arg1, arg2)
    if ViragDevTool_AddData then
        ViragDevTool_AddData(arg1, arg2)
    end
end

function _EchoRaidTools:Hash(value)
    local type = type(value);
    if (type == "string") then
        local len = #value;
        local hash = len;
        local step = bit.rshift(len, 5) + 1;
        for i=len,step,-step do
            hash = bit.bxor(hash, bit.lshift(hash, 5) + bit.rshift(hash, 2) + string.byte(value, i));
        end
        return hash;
    elseif (type == "number") then
        local hash = math.floor(value);
        if (hash ~= value) then
            hash = bit.bxor(value * 0xFFFFFFFF);
        end
        while (value > 0xFFFFFFFF) do
            value = value / 0xFFFFFFFF;
            hash = bit.bxor(hash, value);
        end
        return hash;
    elseif (type == "bool") then
        return value and 1 or 2;
    elseif (type == "table") then
        local hash = 0xFFF3;
        for k,v in pairs(value) do
            hash = hash + _EchoRaidTools:Hash(k) - _EchoRaidTools:Hash(v) - 1;
        end
        return _EchoRaidTools:Hash(math.abs(hash));
    end

    return 0;
end

function _EchoRaidTools:FindValueInList(list, value)
    for index, entry in ipairs(list or {}) do
        if entry == value then
            return index
        end
    end

    return nil
end

function _EchoRaidTools:SetupModuleApi(target, module, api)
    if not target then
        return
    end

    if not module then
        return
    end

    if target[module.name] then
        return
    end

    --[[local module_api = {}
    _EchoRaidTools.documentation[module.name] = {}
    local moduleDoc = _EchoRaidTools.documentation[module.name]

    for _, entry in ipairs(api or {}) do
        local value = module[entry.name]
        if type(value) == "function" then
            module_api[entry.name] = function(...) return value(module, ...) end
            if entry.documentation then
                moduleDoc[entry.name] = _EchoRaidTools:ParseDocString(entry.documentation)
            end
        end
    end]]

    target[module.name] = LibReadOnly:New(module_api)
end

function _EchoRaidTools:SetupApi()
    --_EchoRaidTools.documentation = {}

    _EchoRaidTools.api = {
        NewModule = function(name)
            return _EchoRaidTools:NewModule(name)
        end,

        RegisterApi = function(module, api)
            if nil ~= _EchoRaidTools:FindValueInList(_EchoRaidTools.modules, module) then
                _EchoRaidTools:SetupModuleApi(_EchoRaidTools.api, module, api)
                EchoRaidTools = LibReadOnly:New(_EchoRaidTools.api)
            end
        end,

        --[[GetDocumentation = function(name, moduleName)
            if not _EchoRaidTools.documentation then
                return ""
            end

            if moduleName then
                if not _EchoRaidTools.documentation[moduleName] then
                    return ""
                end

                return _EchoRaidTools.documentation[moduleName][name] or ""
            else
                return _EchoRaidTools.documentation[name] or ""
            end
        end]]
    }

    -- Setup Global
    EchoRaidTools = LibReadOnly:New(_EchoRaidTools.api)
end

-- Setup initial API, which contains especially the NewModule function!
_EchoRaidTools:SetupApi()