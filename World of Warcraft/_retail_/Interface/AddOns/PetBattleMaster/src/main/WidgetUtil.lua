--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}

petbm.WidgetUtil = {}

petbm.WidgetUtil.nextId = 1

local function _GetText(frame, text)
	if (type(text) == "function") then
		return text(frame)
	end
	return text
end

-- Adds a tooltip info to a widget
local function AddTooltip(frame, title, msg)
	if (msg) then
    	frame.tooltipText = msg
    	frame.titleText = title
    	frame:SetScript("OnEnter", function(frame) 
    		GameTooltip:SetOwner(frame, "ANCHOR_RIGHT"); 
    		GameTooltip:AddLine(_GetText(frame, frame.titleText), HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, 1, true)
    		GameTooltip:AddLine(_GetText(frame, frame.tooltipText), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1, true)
    		GameTooltip:Show()
    	end)
    	frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end	
end

-- Returns the next unique id.
local function GetNextId()
	local nextId = petbm.WidgetUtil.nextId
	petbm.WidgetUtil.nextId = nextId + 1
	return nextId
end

-- Returns the next unique name.
local function GetNextName()
	return "petbmWidget"..GetNextId()
end

petbm.WidgetUtil.AddTooltip = AddTooltip
petbm.WidgetUtil.GetNextId = GetNextId
petbm.WidgetUtil.GetNextName = GetNextName
