local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("CalendarFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["CalendarFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_Calendar") then
        self:Recolor(color1, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_Calendar" then
                self:Recolor(color1, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_Calendar") then
        self:Recolor(color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, desaturation)
    --window specific regions
    for _,frame in pairs({
        CalendarFrameTopLeftTexture,
        CalendarFrameTopMiddleTexture,
        CalendarFrameTopRightTexture,
        CalendarFrameRightTopTexture,
        CalendarFrameRightMiddleTexture,
        CalendarFrameRightBottomTexture,
        CalendarFrameBottomRightTexture,
        CalendarFrameBottomMiddleTexture,
        CalendarFrameBottomLeftTexture,
        CalendarFrameLeftBottomTexture,
        CalendarFrameLeftMiddleTexture,
        CalendarFrameLeftTopTexture,
        CalendarViewHolidayFrame.Header.LeftBG,
        CalendarViewHolidayFrame.Header.CenterBG,
        CalendarViewHolidayFrame.Header.RightBG,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    addon:SkinEdges(CalendarViewHolidayFrame.Border,color1)
end


