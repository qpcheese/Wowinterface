local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local LibAceSerializer = LibStub:GetLibrary ("AceSerializer-3.0", true)
local LibDeflate = LibStub:GetLibrary ("LibDeflate", true)
local LibReadOnly = LibStub:GetLibrary("LibReadOnly")
local echoColor = CreateColor(unpack(_EchoRaidTools:GetEchoColor()))
local echostring = WrapTextInColor("EchoRaidTools", echoColor)

local profileSectionLines = {}
function _Cooldowns.BuildProfilesPanel()
    local sectionDetails = _Cooldowns.GetProfilesSettingsConfig()
    local section = _Cooldowns.ProfilesPanel
    section:SetPoint("TOPLEFT", _Cooldowns.mainWindow.Header, "BOTTOMLEFT")
    section:SetPoint("BOTTOMRIGHT")
    section:Hide()
    section.Update = function()
    end
    local controlTypesCreators = _Cooldowns.controlTypesCreators

    local thisSection = section
    for i, lineDetails in ipairs(profileSectionLines) do
        for j, control in ipairs(lineDetails.controls) do
            _Cooldowns.controlPools[control.type]:Release(control)
        end
        _Cooldowns.controlPools["LINE"]:Release(lineDetails.line)
    end
    wipe(profileSectionLines)

    local lastLine = nil
    for i, lineDetails in ipairs(sectionDetails.contents) do
        local newLine = controlTypesCreators["LINE"](lineDetails, thisSection.ScrollFrame.ScrollingPanel, i)
        newLine.name = lineDetails.name
        --section.ContentPanel[lineDetails.name] = newLine
        table.insert(profileSectionLines, {line = newLine, controls = {}})
        local lineTable = profileSectionLines[#profileSectionLines]
        if lastLine then
            newLine:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, 0)
        else
            newLine:SetPoint("TOPLEFT", thisSection.ScrollFrame.ScrollingPanel, 25, -25)
        end
        lastLine = newLine

        local lineAvailableWidth = 650
        local currentLineWidth = 0
        local multiLineHeight = 0
        local lineHeight = 0
        local lastControl
        for j, controlDetails in ipairs(lineDetails.contents) do
            local control = controlTypesCreators[controlDetails.type](controlDetails, lastLine, j)
            control.name = controlDetails.name
            table.insert(lineTable.controls, control)
            local controlHeight = control:GetHeight()
            controlHeight = controlDetails.useTopText and controlHeight + 6 or controlHeight
            if currentLineWidth + control:GetWidth() > lineAvailableWidth then
                currentLineWidth = 0
                multiLineHeight = multiLineHeight + lineHeight
                lineHeight = 0
                control:SetPoint("TOPLEFT", lastLine, "TOPRIGHT", 20,  - multiLineHeight)
                currentLineWidth = control:GetWidth()
            elseif lastControl then
                control:SetPoint("LEFT", lastControl, "RIGHT", controlDetails.padding or 20, 0)
            else
                control:SetPoint("TOPLEFT", lastLine, "TOPRIGHT", 20, 0)--16)
            end
            currentLineWidth = currentLineWidth + control:GetWidth() + (controlDetails.padding or 20)

            lineHeight = max(lineHeight, controlHeight)
            lastControl = control
        end
        newLine:SetHeight(lineHeight + multiLineHeight + (lineDetails.padding or 12))
        newLine:Update()
    end
end
function _Cooldowns:HasProfiles()
    return true
end
function _Cooldowns:GetProfilePanel(parent)
    if not _Cooldowns.ProfilesPanel then
        _Cooldowns.ProfilesPanel = CreateFrame("FRAME", nil, parent, "EchoRaidTools_CooldownsPanel")
    end
    _Cooldowns.BuildProfilesPanel()

    return _Cooldowns.ProfilesPanel
end

_Cooldowns.GetCopyOfTableWithoutFunctions = function(data)
    local function RemoveFunctions(t)
        for k, v in pairs(t) do
            if type(v) == "function" then
                t[k] = nil
            elseif type(v) == "table" then
                RemoveFunctions(v)
            end
        end
    end
    local myCopy = CopyTable(data)
    RemoveFunctions(myCopy)
    return myCopy
end

local configForDeflate = {level = 9}
local getExportStringForGroupIndex = function(index)
    local groupData = EchoRaidToolsDB.Cooldowns.groups[index]
    if not groupData then
        _EchoRaidTools:SetStatus("No Group data found", 5)
        return
    end
    groupData = CopyTable(groupData)
    groupData.version = EchoRaidToolsDB.Cooldowns.version
    local strippedData = _Cooldowns.GetCopyOfTableWithoutFunctions(groupData)
    local serialisedGroup = LibAceSerializer:Serialize(strippedData)
    local compressedGroup = LibDeflate:CompressDeflate(serialisedGroup, configForDeflate)
    local encoded = LibDeflate:EncodeForPrint(compressedGroup)
    local output = "!ECHO:CD:1!"..encoded
    return output
end
_Cooldowns.GetExportStringForGroup = function(index)
    local output = getExportStringForGroupIndex(index)
    _Cooldowns.currentExportString = output
    if  _Cooldowns.controls.ExportBoxCooldowns then
        _Cooldowns.controls.ExportBoxCooldowns:Update()
        _Cooldowns.controls.ExportBoxCooldowns:HighlightText()
    end
    _Cooldowns.currentExportString = nil
    _EchoRaidTools:SetStatus(format("Export string generated for Cooldowns Group: %s", _Cooldowns.GetGroupName(index)), 5)
end
local getExportStringForAllGroups = function()
    local allGroups = EchoRaidToolsDB.Cooldowns.groups
    if not allGroups or #allGroups == 0 then
        _EchoRaidTools:SetStatus("No Groups found", 5)
        return
    end
    allGroups = CopyTable(allGroups)
    allGroups.version = EchoRaidToolsDB.Cooldowns.version
    local strippedData = _Cooldowns.GetCopyOfTableWithoutFunctions(allGroups)
    local serialisedGroup = LibAceSerializer:Serialize(strippedData)
    local compressedGroup = LibDeflate:CompressDeflate(serialisedGroup, configForDeflate)
    local encoded = LibDeflate:EncodeForPrint(compressedGroup)
    local output = "!ECHO:CD:2!"..encoded
    return output
end
_Cooldowns.ExportAllGroups = function()
    local output = getExportStringForAllGroups()
    _Cooldowns.currentExportString = output
    if  _Cooldowns.controls.ExportBoxCooldowns then
        _Cooldowns.controls.ExportBoxCooldowns:Update()
        _Cooldowns.controls.ExportBoxCooldowns:HighlightText()
    end
    _Cooldowns.currentExportString = nil
    _EchoRaidTools:SetStatus("Export string generated all Cooldowns Groups", 5)
end
_Cooldowns.ImportGroupsFromString = function(importString, external)
    importString = strtrim(importString)
    local _, _, isEcho, module, groupType, encoded = string.find(importString, "^(!ECHO):(.+):(%d+)!(.+)$")
    _Cooldowns.debug(isEcho, module, groupType, strlen(importString), strlen(encoded))
    if isEcho and module == "CD" then
        if groupType == "1" then
            local decoded = LibDeflate:DecodeForPrint(encoded)
            local decompressed = LibDeflate:DecompressDeflate(decoded)
            local success, deserialized = LibAceSerializer:Deserialize(decompressed)
            _Cooldowns.VDT(deserialized)
            if not success then
                _EchoRaidTools:SetStatus("There was a problem importing this group!", 5)
                return
            end
            local flagForModernise = false
            if deserialized.version and deserialized.version < EchoRaidToolsDB.Cooldowns.version then
                EchoRaidToolsDB.Cooldowns.version = deserialized.version
                flagForModernise = true
            end
            deserialized.version = nil
            local newGroupName = _Cooldowns.ImportGroup(deserialized)
            _EchoRaidTools:SetStatus(format([[New Cooldowns Group "%s" imported!]], newGroupName), 5)
            if external then
                print(echostring, "Cooldowns Group imported", newGroupName)
            end
            if _Cooldowns.IsConfigOpen() then
                _EchoRaidTools:ShowContent(_Cooldowns:GetCooldownsConfig(), "Cooldowns")
            end
        elseif groupType == "2" then
            local decoded = LibDeflate:DecodeForPrint(encoded)
            local decompressed = LibDeflate:DecompressDeflate(decoded)
            local success, deserialized = LibAceSerializer:Deserialize(decompressed)
            _Cooldowns.VDT(deserialized)
            if not success or #deserialized == 0 then
                _EchoRaidTools:SetStatus("There was a problem importing these groups!", 5)
                return
            end
            local flagForModernise = false
            if deserialized.version and deserialized.version < EchoRaidToolsDB.Cooldowns.version then
                EchoRaidToolsDB.Cooldowns.version = deserialized.version
                flagForModernise = true
            end
            _Cooldowns.ImportMultipleGroups(deserialized)
            _EchoRaidTools:SetStatus(format([[%s New Cooldowns Groups imported!]], #deserialized), 5)
            if external then
                print(echostring, #deserialized.. " Cooldowns Groups imported")
            end
            if _Cooldowns.IsConfigOpen() then
                _EchoRaidTools:ShowContent(_Cooldowns:GetCooldownsConfig(), "Cooldowns")
            end
        end
    else
        if external then
            print(echostring, "No valid import string found")
        end
        _EchoRaidTools:SetStatus("No valid import string found",5)
    end
end
local importStringExternal = function(string)
    if string then
        local popup = _Cooldowns.GetDialogPopup()
        popup:ClearAllPoints()
        popup:SetPoint("CENTER")
        popup:Show()
        popup.Text:SetText("An addon external to EchoRaidTools is attempting to import one or more Cooldowns Groups.\n\nDo you want to continue with the import?")
        popup.OKButton:SetScript("OnClick", function()
            popup.OKButton:SetScript("OnClick", nil)
            popup:Hide()
            _Cooldowns.ImportGroupsFromString(string, true)
        end)
        popup.CancelButton:SetScript("OnClick", function()
            popup.OKButton:SetScript("OnClick", nil)
            popup:Hide()
        end)
    end
end
_EchoRaidTools.Cooldowns = _EchoRaidTools.Cooldowns or {}
_EchoRaidTools.Cooldowns.getExportStringForGroupIndex = getExportStringForGroupIndex
_EchoRaidTools.Cooldowns.getExportStringForAllGroups = getExportStringForAllGroups
_EchoRaidTools.Cooldowns.importStringExternal = importStringExternal