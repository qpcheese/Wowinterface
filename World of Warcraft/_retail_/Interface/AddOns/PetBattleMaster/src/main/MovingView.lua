--[[
	Copyright (C) Udorn (Blackhand)
--]]

petbm = petbm or {}

petbm.MovingView = {}

local log = petbm.Debug:new("MovingView")

local function _RestoreWindowPosition(frame)
	log:Debug("_RestoreWindowPosition [%s]", frame:GetName())
	local save = frame.profile.windowPosition
	if (save) then
		if (save.point) then
			frame:ClearAllPoints()
			frame:SetPoint(save.point, UIParent, save.relativePoint, save.x, save.y)
		end
	end
end

local function _SaveWindowPosition(frame)
	log:Debug("_SaveWindowPosition [%s]", frame:GetName())
	if (not frame.profile.windowPosition) then
		frame.profile.windowPosition = {}
	end
	local save = frame.profile.windowPosition
	local point, relativeTo, relativePoint, x, y = frame:GetPoint(1)
	save.point = point
	save.relativePoint = relativePoint
	save.x = math.floor(x + 0.5)
	save.y = math.floor(y + 0.5)
end

local function _GetMovable(frame)
	if (frame:IsMovable()) then
		return frame
	end
	if (frame:GetParent()) then
		return _GetMovable(frame:GetParent())
	end
end

local function _StopMovingOrSizing(frame)
	local movable = _GetMovable(frame)
	if (movable) then
		movable:StopMovingOrSizing()
		if (movable.SaveWindowPosition) then
			movable:SaveWindowPosition()
		end
	end
end

local function _StartMoving(frame)

	if (petbm.PetBattleMaster.db.profile.locked) then
		return
	end
	
	local movable = _GetMovable(frame)
	if (movable) then
		movable:StartMoving() 
	end
end

local function RegisterChildFrame(childFrame)
	childFrame:SetScript("OnMouseDown", _StartMoving)
	childFrame:SetScript("OnMouseUp", _StopMovingOrSizing)
end

local function RegisterFrame(frame)
	local name = frame:GetName()
	assert(name)
	if (name) then
		if (not petbm.PetBattleMaster.db.profile.frames[name]) then
			petbm.PetBattleMaster.db.profile.frames[name] = {}
		end
		frame.profile = petbm.PetBattleMaster.db.profile.frames[name]
		frame:SetMovable(true)
		frame.SaveWindowPosition = _SaveWindowPosition
		frame.RestoreWindowPosition = _RestoreWindowPosition
		frame:SetScript("OnMouseDown", _StartMoving)
		frame:SetScript("OnMouseUp", _StopMovingOrSizing)
	end
end

local function UnregisterFrame(frame)
	frame:SetMovable(false)
	frame.SaveWindowPosition = nil
	frame.RestoreWindowPosition = nil
	frame:SetScript("OnMouseDown", nil)
	frame:SetScript("OnMouseUp", nil)
end

petbm.MovingView.RegisterChildFrame = RegisterChildFrame
petbm.MovingView.RegisterFrame = RegisterFrame
petbm.MovingView.UnregisterFrame = UnregisterFrame