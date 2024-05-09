local addonName, addonTable = ...
local addon = addonTable.addon
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local enabledWidth, classColorWidth, classReactionColorWidth, color1Width, color2Width, color3Width, color4Width = "full", 0.4, 0.8, 0.55, 0.75, 0.5, 0.5

local CopyTable = CopyTable

local function createOption(info)
    local option = {
        name = " ",
        type = "group",
        inline = true,  
        args = {
            enabled = {
                disabled = false,
                order = 1,
                name = WrapTextInColorCode(info.moduleName,"ff00ffff"),
                desc = "\n" .. info.moduleDesc .. "\n\n" .. L["module_status_desc"],
                type = "toggle",
                get = "GetModuleStatus",
                set = "SetModuleStatus",
                width = enabledWidth,
            },   
        },
    }
    if info.color1 then
        option.args.classcolored1 = {
            order = 2,
            name = L["module_classcolor_name"],
            desc = L["module_classcolor_desc"],
            type = "toggle",
            get = "GetStatus",
            set = "SetStatus",
            width = classColorWidth,
        }
        option.args.color1 = {
            order = 3,
            name = info.color1.name,
            desc = info.color1.desc,
            hasAlpha = info.color1.hasAlpha,
            type = "color",
            get = "GetColor",
            set = "SetColor",
            width = color1Width,
        }
    end
    if info.color2 then
        option.args.classcolored2 = {
            order = 4,
            name = L["module_classcolor_name"],
            desc = L["module_classcolor_desc"],
            type = "toggle",
            get = "GetStatus",
            set = "SetStatus",
            width = classColorWidth,
        }
        option.args.color2 = {
            order = 5,
            name = info.color2.name,
            desc = info.color2.desc,
            hasAlpha = info.color2.hasAlpha,
            type = "color",
            get = "GetColor",
            set = "SetColor",
            width = color2Width,
        }
    end
    if info.color3 then
        option.args.classcolored3 = {
            order = 6,
            name = L["module_classcolor_name"],
            desc = L["module_classcolor_desc"],
            type = "toggle",
            get = "GetStatus",
            set = "SetStatus",
            width = classColorWidth,
        }
        option.args.color3 = {
            order = 7,
            name = info.color3.name,
            desc = info.color3.desc,
            hasAlpha = info.color3.hasAlpha,
            type = "color",
            get = "GetColor",
            set = "SetColor",
            width = color3Width,
        }
    end
    if info.color4 then
        option.args.classcolored4 = {
            order = 8,
            name = L["module_classcolor_name"],
            desc = L["module_classcolor_desc"],
            type = "toggle",
            get = "GetStatus",
            set = "SetStatus",
            width = classColorWidth,
        }
        option.args.color4 = {
            order = 9,
            name = info.color4.name,
            desc = info.color4.desc,
            hasAlpha = info.color4.hasAlpha,
            type = "color",
            get = "GetColor",
            set = "SetColor",
            width = color4Width,
        }
    end
    return option
end

local function createModule(name)
    local module = addon:NewModule(name)
    module.GetColor1 = function()
        local dbObj = addon.db.profile.Skins[name]
        local color
        if dbObj.classcolored1 then
            color = addonTable.classColor
        else
            color = dbObj.color1
        end
        return color
    end
    module.GetColor2 = function()
        local dbObj = addon.db.profile.Skins[name]
        local color
        if dbObj.classcolored2 then
            color = addonTable.classColor
        else
            color = dbObj.color2
        end
        return color
    end
    module.GetColor3 = function()
        local dbObj = addon.db.profile.Skins[name]
        local color
        if dbObj.classcolored3 then
            color = addonTable.classColor
        else
            color = dbObj.color3
        end
        return color
    end
    module.GetColor4 = function()
        local dbObj = addon.db.profile.Skins[name]
        local color
        if dbObj.classcolored4 then
            color = addonTable.classColor
        else
            color = dbObj.color4
        end
        return color
    end
    module.RequestData = function(self, subgroup, module_name)
        local subgroup = type(subgroup) == "string" and subgroup or ""
        local module_name = type(module_name) == "string" and module_name or ""
        local dbObj = CopyTable(addon.db.profile[subgroup][module_name])
        return dbObj
    end
    return module
end

local function validate(info)
    local info = info
    info.moduleName = type(info.moduleName) == "string" and info.moduleName or ""
    info.moduleDesc = type(info.moduleDesc) == "string" and info.moduleDesc or ""
    info.followModule = type(info.followModule) == "string" and info.followModule or nil
    for i=1,4 do
        local option = "color" .. i
        if info[option] then
            info[option].name = type(info[option].name) == "string" and info[option].name or ""
            info[option].desc = type(info[option].desc) == "string" and info[option].desc or ""
            info[option].hasAlpha = info[option].hasAlpha and true or false
        end
    end
    return info
end

FrameColor_CreateSkinModule = function(info)
    local info = validate(info)
    --option
    local option = createOption(info)
    local options = addon:GetOptionsTable()
    options.args.Skins.args[info.moduleName] = option
    --module
    local module = addon:GetModule(info.moduleName, true)
    if not module then
        module = createModule(info.moduleName)
        if info.followModule then
            local target_module = addon:GetModule(info.followModule, true)
            if not target_module then
                return 
            end
            local orig_recolor = target_module.Recolor
            if not orig_recolor then
                return
            end
            target_module.Recolor = function(...)
                module.Recolor(...)
                return orig_recolor(...)
            end
        end
    end
    return module
end


