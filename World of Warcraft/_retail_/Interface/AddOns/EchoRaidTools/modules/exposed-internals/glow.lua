local addonName, _EchoRaidTools = ...;
local _ExposedInternal = _EchoRaidTools:GetModule("ExposedInternal")

function _ExposedInternal:ExposeGlow()
    local LCG = LibStub:GetLibrary("LibCustomGlow-1.0");
    local LGF = LibStub:GetLibrary("LibGetFrame-1.0");

    local dirtyFrames = {};

    local auraIDindex = 0;
    local function generateID()
        auraIDindex = auraIDindex + 1;
        return "EchoGlowIndex"..auraIDindex;
    end

    function _EchoRaidTools.fakeInternal:ShowGlow(frame,glowParams,id)
        if(type(frame) == "string")then
            frame = LGF.GetFrame(frame);
        end
        if(not frame) then return end

        id = id or generateID();

        if(not dirtyFrames[id])then
            dirtyFrames[id] = {};
        end

        if(not dirtyFrames[id][frame])then
            dirtyFrames[id][frame] = {};
        end

        dirtyFrames[id][frame].glowType = glowParams.glowType;

        if (glowParams.glowType) == "ACShine" then
            LCG.AutoCastGlow_Start(
                frame,
                glowParams.color,
                glowParams.particules,
                glowParams.frequency,
                glowParams.scale,
                glowParams.xoffset,
                glowParams.yoffset,
                id
            );
        elseif (glowParams.glowType) == "Pixel" then
            LCG.PixelGlow_Start(
                frame,
                glowParams.color,
                glowParams.lines,
                glowParams.frequency,
                glowParams.length,
                glowParams.thickness,
                glowParams.xoffset,
                glowParams.yoffset,
                glowParams.border,
                id
            );
        elseif (glowParams.glowType == "buttonOverlay") then
            LCG.ButtonGlow_Start(
                frame,
                glowParams.color,
                glowParams.frequency
            );
        end

        local hideFunc = function()
            if (glowParams.glowType == "ACShine") then
                LCG.AutoCastGlow_Stop(frame, id);
            elseif (glowParams.glowType == "Pixel") then
                LCG.PixelGlow_Stop(frame, id);
            elseif (glowParams.glowType == "buttonOverlay") then
                LCG.ButtonGlow_Stop(frame);
            end

            dirtyFrames[id][frame].glowType = nil;
        end

        return hideFunc, id;
    end

    function _EchoRaidTools.fakeInternal:ShowGlowForTimePeriod(frame, glow, duration, id)
        local hideFunc, glowID = _EchoRaidTools.fakeInternal:ShowGlow(frame, glow, id);
        if(hideFunc)then
            C_Timer.After(duration, hideFunc);
        end

        return hideFunc, glowID;
    end

    function _EchoRaidTools.fakeInternal:CleanAllGlows()
        for id, frames in pairs(dirtyFrames) do
            for frame, data in pairs(frames) do
                if data.glowType == "ACShine" then
                    LCG.AutoCastGlow_Stop(frame, id);
                elseif data.glowType == "Pixel" then
                    LCG.PixelGlow_Stop(frame, id);
                elseif data.glowType == "buttonOverlay" then
                    LCG.ButtonGlow_Stop(frame);
                end
                dirtyFrames[id][frame].glowType = nil;
            end
        end
    end
end