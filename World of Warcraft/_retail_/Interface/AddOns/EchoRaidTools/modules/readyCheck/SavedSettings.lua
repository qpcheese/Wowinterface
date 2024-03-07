local _AddonName, _EchoRaidTools = ...
local _ReadyCheck = _EchoRaidTools:GetModule("readyCheck")

function _ReadyCheck:LoadSettings()
    local data = EchoRaidToolsDB.ReadyCheck

    data.EnableModule = not not data.EnableModule
    data.WindowPositionX = data.WindowPositionX or 0
    data.WindowPositionY = data.WindowPositionY or 0
    data.WindowScale = data.WindowScale or 100
    if data.ShowMinimisedFrame == nil then
        data.ShowMinimisedFrame = false
    end

    _ReadyCheck.GetModuleEnabled = function()
        return data.EnableModule
    end
    _ReadyCheck.ToggleModuleEnabled = function()
        data.EnableModule = not data.EnableModule
        if data.EnableModule then
            _ReadyCheck.SetupEvents()
        else
            _ReadyCheck.UnregisterEvents()
        end
    end

    _ReadyCheck.GetWindowPosition = function()
        return data.WindowPositionX, data.WindowPositionY
    end
    _ReadyCheck.SetWindowPosition = function()
        local left, bottom = _ReadyCheck.ReadyCheckWindow:GetRect()
        local x = Round(left - (GetScreenWidth()/2))
        local y = Round(bottom - (GetScreenHeight()/2))
        data.WindowPositionX = x
        data.WindowPositionY = y
    end

    _ReadyCheck.GetWindowScale = function()
        return data.WindowScale
    end
    _ReadyCheck.SetWindowScale = function(value)
        data.WindowScale = value
        _ReadyCheck.UpdateScale(value)
    end

    _ReadyCheck.GetShowMinimisedWindow = function()
        return data.ShowMinimisedFrame
    end
    _ReadyCheck.SetShowMinimisedWindow = function(value)
        data.ShowMinimisedFrame = value
    end
end
