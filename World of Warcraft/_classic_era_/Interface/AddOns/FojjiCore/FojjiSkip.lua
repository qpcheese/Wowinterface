local redColor = "|cFFFF0000"
local resetColor = "|r"

FojjiSkipWTF = FojjiSkipWTF or { skip = true }

local PlayMovie = MovieFrame_PlayMovie
MovieFrame_PlayMovie = function(...)
    local movieFrame, movieID = ...
    local mapID = C_Map.GetBestMapForUnit("player")
    local icecrownCitadelIDs = {186, 187, 188, 189, 190, 191, 192, 193}
    if FojjiSkipWTF.skip and tContains(icecrownCitadelIDs, mapID) then
        GameMovieFinished()
        print(redColor.."FojjiCore:"..resetColor.." Cinematic automatically skipped. Use /lkskip to toggle this feature.")
    else
        PlayMovie(...)
        print(redColor.."FojjiCore:"..resetColor.." Auto-skip is off. Use /lkskip to enable automatic cinematic skipping.")
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == "FojjiCore" then
        FojjiSkipWTF = FojjiSkipWTF or { skip = true }
    end
end)

SLASH_LKSKIP1 = "/lkskip"
SlashCmdList["LKSKIP"] = function(msg)
    FojjiSkipWTF.skip = not FojjiSkipWTF.skip
    if FojjiSkipWTF.skip then
        print(redColor.."FojjiCore:"..resetColor.." LK Cinematic will now be Skipped.")
    else
        print(redColor.."FojjiCore:"..resetColor.." LK Cinematic will now play.")
    end
end
