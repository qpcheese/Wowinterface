local addonName, _EchoRaidTools = ...;
local _ExposedInternal = _EchoRaidTools:GetModule("ExposedInternal")

function _ExposedInternal:ExposeMarker()
    ------ RaidIndexMarkers ------

    --[[
        1 = Yellow 4-point Star
        2 = Orange Circle
        3 = Purple Diamond
        4 = Green Triangle
        5 = White Crescent Moon
        6 = Blue Square
        7 = Red "X" Cross
        8 = White Skull
    ]]--

    local raidMarkers = {"{rt1}","{rt2}","{rt3}","{rt4}","{rt5}","{rt6}","{rt7}","{rt8}"};
    function _EchoRaidTools.fakeInternal:GetRaidMarkerByIndex(i)
        local rem = i % #raidMarkers;
        return raidMarkers[rem == 0 and #raidMarkers or rem];
    end

    local raidMarkersTextures =
    {
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_4",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_5",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_6",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8",
    };

    function _EchoRaidTools.fakeInternal:GetRaidMarkerTextureByIndex(i)
        local rem = i % #raidMarkersTextures;
        return raidMarkersTextures[rem == 0 and #raidMarkersTextures or rem];
    end

    ----- WorldMarkers -----

    --[[
        1 = Blue Square
        2 = Green Triangle
        3 = Purple Diamond
        4 = Red Cross
        5 = Yellow Star
        6 = Orange Circle
        7 = Pale Blue Moon
        8 = White Skull
    ]]--

    local worldMarkers = {"{rt6}","{rt4}","{rt3}","{rt7}","{rt1}","{rt2}","{rt5}","{rt8}"};
    function _EchoRaidTools.fakeInternal:GetWorldMarkerByIndex(i)
        local rem = i % #worldMarkers;
        return worldMarkers[rem == 0 and #worldMarkers or rem];
    end

    local worldMarkersTextures =
    {
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_6",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_4",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_5",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8",
    };

    function _EchoRaidTools.fakeInternal:GetWorldMarkerTextureByIndex(i)
        local rem = i % #worldMarkersTextures;
        return worldMarkersTextures[rem == 0 and #worldMarkersTextures or rem];
    end

    ----- VoiceMarkers -----

    local raidMarkerNames = {"Star","Circle","Diamond","Triangle","Moon","Square","Cross","Skull"};
    function _EchoRaidTools.fakeInternal:GetRaidMarkerNameByIndex(i)
        local rem = i % #raidMarkerNames;
        return raidMarkerNames[rem == 0 and #raidMarkerNames or rem];
    end

    local worldMarkerNames = {"Square","Triangle","Diamond","Cross","Star","Circle","Moon","Skull"};
    function _EchoRaidTools.fakeInternal:GetWorldMarkerNameByIndex(i)
        local rem = i % #worldMarkerNames;
        return worldMarkerNames[rem == 0 and #worldMarkerNames or rem];
    end

    ----- SayMarkers -----

    local raidSayMarkers = tSClone(raidMarkers);
    table.insert(raidSayMarkers,"XXX");
    table.insert(raidSayMarkers,"000");

    function _EchoRaidTools.fakeInternal:GetSayRaidMarkerByIndexExtended(i)
        local rem = i % #raidSayMarkers;
        return raidSayMarkers[rem == 0 and #raidSayMarkers or rem];
    end

    local worldSayMarkers = tSClone(worldMarkers);
    table.insert(worldSayMarkers,"XXX");
    table.insert(worldSayMarkers,"000");

    function _EchoRaidTools.fakeInternal:GetSayWorldMarkerByIndexExtended(i)
        local rem = i % #worldSayMarkers;
        return worldSayMarkers[rem == 0 and #worldSayMarkers or rem];
    end

    -- Marker to color
    local colorStringData = {
        "FFEAEA0D",
        "FFEAB10D",
        "FFCD00FF",
        "FF06D425",
        "FFB3E3D8",
        "FF0CD2EA",
        "FFD6210B",
        "FFFFFFFF",
    };

    -- ARGB
    function _EchoRaidTools.fakeInternal:GetRaidTargetColorStringByIndex(i)
        if(i == nil or i == 0)then
            return "FFBBBBBB";
        end

        local rem = i % #colorStringData;
        return colorStringData[rem == 0 and #colorStringData or rem];
    end

    local colorData = {
        {0xEA/255,0xEA/255,0x0D/255,1},
        {0xEA/255,0xb1/255,0x0D/255,1},
        {0xCD/255,0x00/255,0xFF/255,1},
        {0x06/255,0xD4/255,0x25/255,1},
        {0xB3/255,0xE3/255,0xD8/255,1},
        {0x0C/255,0xD2/255,0xEA/255,1},
        {0xD6/255,0x21/255,0x0B/255,1},
        {1,1,1,1},
    };

    -- RGBA
    function _EchoRaidTools.fakeInternal:GetRaidTargetColorByIndex(i)
        if(i == nil or i == 0)then
            return 187/255,187/255,187/255,1;
        end

        local rem = i % #colorData;
        return unpack(colorData[rem == 0 and #colorData or rem]);
    end

    function _EchoRaidTools.fakeInternal:GetRaidTargetFromRaidFlags(raidFlags)
        local raidTarget = bit.band(raidFlags, COMBATLOG_OBJECT_RAIDTARGET_MASK);
        if (raidTarget == 0) then
            return nil;
        end

        for i=1,8 do
            if(raidTarget == _G["COMBATLOG_OBJECT_RAIDTARGET"..i])then
                return i;
            end
        end
    end

    -- StoneLegionBullshit
    local stoneLegionBullshitTextures =
    {
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_6",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_4",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_5",
        "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8",
        "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura113",
    };

    function _EchoRaidTools.fakeInternal:GetStoneLegionTextureByIndex(i)
        local rem = i % #stoneLegionBullshitTextures;
        return stoneLegionBullshitTextures[rem == 0 and #stoneLegionBullshitTextures or rem];
    end

    function _EchoRaidTools.fakeInternal:GetTargetMarkerFromString(key)
        local lowerKey = string.lower(key);

        if(lowerKey == "{skull}" or lowerKey == "{rt8}")then
            return 8;
        elseif(lowerKey == "{cross}" or lowerKey == "{x}" or lowerKey == "{rt7}")then
            return 7;
        elseif(lowerKey == "{square}" or lowerKey == "{rt6}")then
            return 6;
        elseif(lowerKey == "{moon}" or lowerKey == "{rt5}")then
            return 5;
        elseif(lowerKey == "{triangle}" or lowerKey == "{rt4}")then
            return 4;
        elseif(lowerKey == "{diamond}" or lowerKey == "{rt3}")then
            return 3;
        elseif(lowerKey == "{circle}" or lowerKey == "{coin}" or lowerKey == "{rt2}")then
            return 2;
        elseif(lowerKey == "{star}" or lowerKey == "{rt1}")then
            return 1;
        end

        return nil;
    end
end
