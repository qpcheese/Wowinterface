local addon = {};
local LibReadOnly = LibStub:GetLibrary("LibReadOnly");

function addon:Initialize(parent, name)
    parent.name = name
    parent.frame = CreateFrame("Frame")
    parent.modules = {}

    function parent:RegisterEvent(event)
        parent.frame:RegisterEvent(event)
    end

    function parent:NewModule(name,defaultDisabled)
        -- TODO: Its not an assosiative array
        if parent.modules[name] then
            error("EchoAddon module '"..name.."' already created!",2);
        end

        local module = addon:NewModule(name,defaultDisabled);
        table.insert(parent.modules, module)
        return module
    end

    function parent:GetModule(name)
        for _, module in ipairs(parent.modules) do
          if module.name == name then
            return module
          end
        end
        error("EchoAddon module '"..name.."' does not exist!",2);
    end

    parent.frame:SetScript("OnEvent", function(self, event, ...)
        if parent[event] and type(parent[event]) == "function" then
            parent[event](parent, ...)
        end
    end)
end

function addon:NewModule(name,defaultDisabled)
    local module = {
        name = name,
        enabled = not (defaultDisabled == true),
        frame = CreateFrame("Frame"),
    };

    function module:RegisterEvent(event)
        self.frame:RegisterEvent(event);
    end

    function module:Enable()
        self.enabled = true;
    end

    function module:Disable()
        self.enabled = false;
    end

    module.frame:SetScript("OnEvent", function(self, event, ...)
        if module.enabled and module[event] and type(module[event]) == "function" then
            module[event](self, ...);
        end
    end);

    return module;
end

EchoAddon = LibReadOnly:New(addon);