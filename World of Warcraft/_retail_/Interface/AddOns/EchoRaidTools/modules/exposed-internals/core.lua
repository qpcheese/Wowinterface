local addonName, _EchoRaidTools = ...;

local _ExposedInternal = _EchoRaidTools:NewModule("ExposedInternal")

function _ExposedInternal:ADDON_LOADED()
    if not EchoInternal then
        local LibReadOnly = LibStub:GetLibrary("LibReadOnly")
        _EchoRaidTools.fakeInternal = {}

        function tSClone(orig)
            local orig_type = type(orig);
            local copy;
            if orig_type == 'table' then
                copy = {};
                for orig_key, orig_value in pairs(orig) do
                    copy[orig_key] = orig_value;
                end
            else -- number, string, boolean, etc
                copy = orig;
            end
            return copy;
        end

        function tDClone(orig)
            local orig_type = type(orig);
            local copy;
            if orig_type == 'table' then
                copy = {};
                for orig_key, orig_value in next, orig, nil do
                    copy[tDClone(orig_key)] = tDClone(orig_value);
                end
                setmetatable(copy, tDClone(getmetatable(orig)));
            else -- number, string, boolean, etc
                copy = orig;
            end
            return copy;
        end

        ----------------------------------------------------------------------------------------------------------------------

        function _EchoRaidTools.fakeInternal:UnitName(unit)
            local name, server = UnitName(unit);

            if (not name) then
                return nil;
            elseif (server and server ~= "") then
                name = name .."-".. server;
            end

            return name;
        end

        ----------------------------------------------------------------------------------------------------------------------

        local additionalTargetUnits = { "targettarget", "mouseovertarget", "focustarget" };

        for i = 1, 4 do
            table.insert(additionalTargetUnits, "party" .. i .. "target");
        end
        for _, v in ipairs({ "raid", "nameplate" }) do
            for i = 1, 40 do
                table.insert(additionalTargetUnits, v .. i .. "target");
            end
        end

        function _EchoRaidTools.fakeInternal:GetUnitID(GUID)
            local unit = UnitTokenFromGUID(GUID);
            if (not unit) then
                for _, maybeUnit in ipairs(additionalTargetUnits) do
                    ---@diagnostic disable-next-line: param-type-mismatch
                    if (UnitGUID(maybeUnit) == GUID) then
                        unit = maybeUnit;
                        break;
                    end
                end
            end
            return unit;
        end

        ----------------------------------------------------------------------------------------------------------------------

        local function noop()
        end

        _EchoRaidTools.fakeInternal.RemoteLog = noop;
        _EchoRaidTools.fakeInternal.SortTableByPrioList = noop;

        elog, eLog, Elog, ELog, ELOG = noop, noop, noop, noop, noop
        elogl, eLogl, Elogl, ELogl, ELOGL = noop, noop, noop, noop, noop
        vdt, VDT = noop, noop

        _ExposedInternal:ExposeInspect()
        _ExposedInternal:ExposeGlow()
        _ExposedInternal:ExposeMarker()
        _ExposedInternal:ExposeNoteParsing()

        _G["EchoInternal"] = LibReadOnly:New(_EchoRaidTools.fakeInternal)
    end
end