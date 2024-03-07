local name, Plugin = ...;

do
    local frame = CreateFrame('Frame');
    frame:HookScript('OnEvent', function(_, _, addonName) Plugin:ADDON_LOADED(addonName); end);
    frame:RegisterEvent('ADDON_LOADED');
end

function Plugin:ADDON_LOADED(addonName)
    if addonName ~= name then return; end
    local compatible = false;

    --- @type BlizzMoveAPI
    local BlizzMoveAPI = _G.BlizzMoveAPI;
    if(BlizzMoveAPI and BlizzMoveAPI.GetVersion and BlizzMoveAPI.RegisterAddOnFrames) then
        local _, _, _, _, versionInt = BlizzMoveAPI:GetVersion();
        if (versionInt == nil or versionInt >= 30200) then
            compatible = true;
        end
    end

    if(not compatible) then
        print(name .. ' is not compatible with the current version of BlizzMove, please update.');
        return;
    end

    local subFrames;
    if RematchJournal then
        subFrames = {
            RematchJournal = {
                MinVersion = 0,
                SubFrames = {
                    ['RematchTeamPanel.List.ScrollFrame.CaptureButton'] = {
                        MinVersion = 0,
                    },
                },
            },
        };
    elseif RematchFrame then
        subFrames = {
            RematchFrame = {
                MinVersion = 0,
                SubFrames = {
                    ['RematchFrame.TeamsPanel.List.ScrollBox'] = {
                        MinVersion = 0,
                    },
                    ['RematchFrame.TargetsPanel.List.ScrollBox'] = {
                        MinVersion = 0,
                    },
                    ['RematchFrame.QueuePanel.List.ScrollBox'] = {
                        MinVersion = 0,
                    },
                    ['RematchFrame.OptionsPanel.List.ScrollBox'] = {
                        MinVersion = 0,
                    },
                    ['RematchFrame.PetsPanel.List.ScrollBox'] = {
                        MinVersion = 0,
                    },
                },
            },
        };
    end

    if not subFrames then
        print(name .. ' current version of Rematch is not supported by this plugin. Please notify the author of this plugin on CurseForge or GitHub.');
        return;
    end
    local frameTable = {
        ['Blizzard_Collections'] =
        {
            ['CollectionsJournal'] =
            {
                MinVersion = 20000,
                SubFrames = subFrames,
            },
        },
    };
    BlizzMoveAPI:RegisterAddOnFrames(frameTable);
end
