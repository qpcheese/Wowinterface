local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceGUI = LibStub("AceGUI-3.0")
local LDB = LibStub("LibDataBroker-1.1", true)
local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
local icon_loaded = false
local icon_name = "BisTooltipIcon"

local sources = {
    wh = "wh",
}


local db_defaults = {
    char = {
        class_index = 1,
        spec_index = 1,
        phase_index = 1,
        filter_specs = {},
        highlight_spec = {},
        data_source = nil,
        minimap_icon = true,
        tooltip_with_ctrl = false
    }
}

local configTable = {
    type = "group",
    args = {
        minimap_icon = {
            name = "Show minimap icon",
            order = 0,
            desc = "Shows/hides minimap icon",
            type = "toggle",
            set = function(info, val)
                BiSTooltip.db.char.minimap_icon = val
                if val == true then
                    if icon_loaded == true then
                        LDBIcon:Show(icon_name)
                    else
                        BiSTooltip:addMapIcon()
                    end
                else
                    LDBIcon:Hide(icon_name)
                end
            end,
            get = function(info)
                return BiSTooltip.db.char.minimap_icon
            end
        },
        filter_class_names = {
            name = "Hide class names",
            order = 1,
            desc = "Removes class name separators from item tooltips",
            type = "toggle",
            set = function(info, val)
                BiSTooltip.db.char.filter_class_names = val
            end,
            get = function(info)
                return BiSTooltip.db.char.filter_class_names
            end
        },
        tooltip_with_ctrl = {
            name = "Show item tooltips with Ctrl",
            order = 2,
            desc = "Show item tooltips only when holding Ctrl key",
            type = "toggle",
            width = "double",
            set = function(info, val)
                BiSTooltip.db.char.tooltip_with_ctrl = val
            end,
            get = function(info)
                return BiSTooltip.db.char.tooltip_with_ctrl
            end
        },
        data_source = {
            name = "Data source",
            order = 3,
            desc = "Changes bis data source",
            type = "select",
            style = "dropdown",
            width = "double",
            values = BisTooltip_Source_To_URL,
            set = function(info, key, val)
                BiSTooltip.db.char.data_source = key
                BiSTooltip:changeSpec(key)
            end,
            get = function(info, key)
                return BiSTooltip.db.char.data_source
            end
        },
        filter_specs = {
            name = "Hide specs",
            order = 4,
            desc = "Removes unselected specs from item tooltips",
            type = "multiselect",
            values = nil,
            set = function(info, key, val)
                local ci, si = strsplit(":", key)
                ci = tonumber(ci)
                si = tonumber(si)
                local class_name = Bistooltip_classes[ci].name
                local spec_name = Bistooltip_classes[ci].specs[si]
                BiSTooltip.db.char.filter_specs[class_name][spec_name] = val
            end,
            get = function(info, key)
                local ci, si = strsplit(":", key)
                ci = tonumber(ci)
                si = tonumber(si)
                local class_name = Bistooltip_classes[ci].name
                local spec_name = Bistooltip_classes[ci].specs[si]
                if (not BiSTooltip.db.char.filter_specs[class_name]) then
                    BiSTooltip.db.char.filter_specs[class_name] = {}
                end
                if (BiSTooltip.db.char.filter_specs[class_name][spec_name] == nil) then
                    BiSTooltip.db.char.filter_specs[class_name][spec_name] = true
                end
                return BiSTooltip.db.char.filter_specs[class_name][spec_name]
            end
        },
        highlight_spec = {
            name = "Highlight spec",
            order = 5,
            desc = "Highlights selected spec in item tooltips",
            type = "multiselect",
            values = nil,
            set = function(info, key, val)
                if val then
                    local ci, si = strsplit(":", key)
                    ci = tonumber(ci)
                    si = tonumber(si)
                    local class_name = Bistooltip_classes[ci].name
                    local spec_name = Bistooltip_classes[ci].specs[si]
                    BiSTooltip.db.char.highlight_spec = {
                        key = key,
                        class_name = class_name,
                        spec_name = spec_name
                    }
                else
                    BiSTooltip.db.char.highlight_spec = {
                    }
                end
            end,
            get = function(info, key)
                return BiSTooltip.db.char.highlight_spec.key == key
            end
        }
    }
}

local function buildFilterSpecOptions()
    local filter_specs_options = {}
    for ci, class in ipairs(Bistooltip_classes) do
        for si, spec in ipairs(Bistooltip_classes[ci].specs) do
            local option_val = "|T" .. Spec_Icons[class.name][spec] .. ":16|t " .. class.name .. " " .. spec
            local option_key = ci .. ":" .. si
            filter_specs_options[option_key] = option_val
        end
    end
    configTable.args.filter_specs.values = filter_specs_options
    configTable.args.highlight_spec.values = filter_specs_options
end

local function openSourceSelectDialog()
    local frame = AceGUI:Create("Window")
    frame:SetWidth(300)
    frame:SetHeight(150)
    frame:EnableResize(false)
    frame:SetCallback("OnClose", function(widget)
        AceGUI:Release(widget)
        frame = nil
    end)
    frame:SetLayout("List")
    frame:SetTitle(BiSTooltip.AddonNameAndVersion)

    local labelEmpty = AceGUI:Create("Label")
    labelEmpty:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    labelEmpty:SetText(" ")
    frame:AddChild(labelEmpty)

    local label = AceGUI:Create("Label")
    label:SetText("Please select a bis data source to be used for this addon:")
    label:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    label:SetRelativeWidth(1)
    frame:AddChild(label)

    local labelEmpty2 = AceGUI:Create("Label")
    labelEmpty2:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    labelEmpty2:SetText(" ")
    frame:AddChild(labelEmpty2)

    local sourceDropdown = AceGUI:Create("Dropdown")
    sourceDropdown:SetCallback("OnValueChanged", function(_, _, key)
        BiSTooltip.db.char.data_source = key
        BiSTooltip:changeSpec(key)
    end)
    sourceDropdown:SetRelativeWidth(1)
    sourceDropdown:SetList(BisTooltip_Source_To_URL)
    sourceDropdown:SetValue(BiSTooltip.db.char["data_source"])
    frame:AddChild(sourceDropdown)
end

local function migrateAddonDB()
    if not BiSTooltip.db.char["version"] then
        BiSTooltip.db.char.version = 0.0
        BiSTooltip.db.char.highlight_spec = {}
        BiSTooltip.db.char.filter_specs = {}
        BiSTooltip.db.char.class_index = 1
        BiSTooltip.db.char.spec_index = 1
        BiSTooltip.db.char.phase_index = 1
    end
    if BiSTooltip.db.char["data_source"] == nil then
        BiSTooltip.db.char.data_source = sources.wh
        openSourceSelectDialog()
    end
    --[[ if BiSTooltip.db.char.version == 6.1 then
        BiSTooltip.db.char.version = 6.2
        if BiSTooltip.db.char.filter_specs["Death knight"] and BiSTooltip.db.char.filter_specs["Death knight"]["Blood dps"] == nil then
            BiSTooltip.db.char.filter_specs["Death knight"]["Blood dps"] = true
        end
    end ]]
end

local config_shown = false
function BiSTooltip:openConfigDialog()
    if config_shown then
        InterfaceOptionsFrame_Show()
    else
        InterfaceOptionsFrame_OpenToCategory(BiSTooltip.AceAddonName)
        InterfaceOptionsFrame_OpenToCategory(BiSTooltip.AceAddonName)
    end
    config_shown = not (config_shown)
end

local function enableSpec(spec_name)
    Bistooltip_bislists = BisTooltip_Bis_Lists;
    Bistooltip_items = Bistooltip_wh_items;
    Bistooltip_classes = BisTooltip_Classes;
    Bistooltip_phases = BisTooltip_Phases;
    Bistooltip_phases_string = ""
    for i, phase in ipairs(Bistooltip_phases) do
        if i ~= 1 then
            Bistooltip_phases_string = Bistooltip_phases_string .. "/"
        end
        Bistooltip_phases_string = Bistooltip_phases_string .. phase
    end

    buildFilterSpecOptions()
end

function BiSTooltip:addMapIcon()
    if BiSTooltip.db.char.minimap_icon then
        icon_loaded = true
        local LDB = LibStub("LibDataBroker-1.1", true)
        local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
        if LDB then
            local PC_MinimapBtn = LDB:NewDataObject(icon_name, {
                type = "launcher",
                text = icon_name,
                icon = "interface/icons/inv_staff_medivh.blp",
                OnClick = function(_, button)
                    if button == "LeftButton" then
                        BiSTooltip:createMainFrame()
                    end
                    if button == "RightButton" then
                        BiSTooltip:openConfigDialog()
                    end
                end,
                OnTooltipShow = function(tt)
                    tt:AddLine(BiSTooltip.AddonNameAndVersion)
                    tt:AddLine("|cffffff00Left click|r to open the BiS lists window")
                    tt:AddLine("|cffffff00Right click|r to open addon configuration window")
                end,
            })
            if LDBIcon then
                LDBIcon:Register(icon_name, PC_MinimapBtn, BiSTooltip.db.char)
            end
        end
    end
end

function BiSTooltip:changeSpec(spec_name)
    BiSTooltip.db.char.class_index = 1
    BiSTooltip.db.char.spec_index = 1
    BiSTooltip.db.char.phase_index = 1
    enableSpec(spec_name)

    BiSTooltip:initBislists()
    BiSTooltip:reloadData()
end

function BiSTooltip:initConfig()
    BiSTooltip.db = LibStub("AceDB-3.0"):New("BisTooltipDB", db_defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable(BiSTooltip.AceAddonName, configTable)
    AceConfigDialog:AddToBlizOptions(BiSTooltip.AceAddonName, BiSTooltip.AceAddonName)

    -- migrateAddonDB()

    Bistooltip_bislists = {};
    Bistooltip_items = {};

    enableSpec(BiSTooltip.db.char["data_source"])
end
