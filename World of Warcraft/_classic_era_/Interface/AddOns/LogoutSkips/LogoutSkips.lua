local f = CreateFrame('frame', nil, WorldMapPlayerLower)
f:SetAllPoints()

local defaults = {
  ['logout_skip_notifier_pos'] = {['x'] = 0.0, ['y'] = 0.0},
  ['logout_skip_partition_color'] = {
    ['r'] = 1.0,
    ['g'] = 0.0,
    ['b'] = 0.0,
    ['a'] = 0.6,
  },
  ['logout_skip_target_color'] = {
    ['r'] = 1.0,
    ['g'] = 0.0,
    ['b'] = 0.0,
    ['a'] = 0.6,
  },
  ['death_skip_partition_color'] = {
    ['r'] = 1.0,
    ['g'] = 1.0,
    ['b'] = 1.0,
    ['a'] = 0.8,
  },
  ['death_skip_target_color'] = {
    ['r'] = 1.0,
    ['g'] = 1.0,
    ['b'] = 1.0,
    ['a'] = 0.8,
  },
}

logout_skip_settings = {
  ['disabled'] = true,
  ['gy_disabled'] = true,
  ['show_logout_skip_notifier'] = true,
  ['logout_skip_notifier_pos'] = {
    ['x'] = 0.0,
    ['y'] = 0.0,
  },
  ['logout_skip_partition_color'] = {
    ['r'] = 1.0,
    ['g'] = 0.0,
    ['b'] = 0.0,
    ['a'] = 0.6,
  },
  ['logout_skip_target_color'] = {
    ['r'] = 1.0,
    ['g'] = 0.0,
    ['b'] = 0.0,
    ['a'] = 0.6,
  },
  ['death_skip_partition_color'] = {
    ['r'] = 1.0,
    ['g'] = 1.0,
    ['b'] = 1.0,
    ['a'] = 0.8,
  },
  ['death_skip_target_color'] = {
    ['r'] = 1.0,
    ['g'] = 1.0,
    ['b'] = 1.0,
    ['a'] = 0.8,
  },
}

local showing = false
local gy_showing = false

local voronoi_lines_kalimdor = kalimdor_partitions
local voronoi_lines = eastern_kingdom_partitions
local gy_voronoi_lines = eastern_kingdom_gy_partitions
local gy_voronoi_lines_kalimdor = kalimdor_gy_partitions

-- This is all for drawing a line on the map in zones that we're not currently in
-- We could just draw our line outside of the scrollframe and rotate it, and to be honest that may even be a better approach

local function GetMapSize() -- Return dimensions and offset of current map
	local currentMapID = WorldMapFrame:GetMapID()
	if not currentMapID then return end
	
	local mapID, topleft = C_Map.GetWorldPosFromMapPos(currentMapID, {x = 0, y = 0})
	local mapID, bottomright = C_Map.GetWorldPosFromMapPos(currentMapID, {x = 1, y = 1})
	if not mapID then return end
	
	local left, top = topleft.y, topleft.x
	local right, bottom = bottomright.y, bottomright.x
	local width, height = left - right, top - bottom
	return left, top, right, bottom, width, height, mapID
end

local function GetIntersect(px, py, a, sx, sy, ex, ey)
	a = (a + PI / 2) % (PI * 2)
	local dx, dy = -math.cos(a), math.sin(a)
	local d = dx * (sy - ey) + dy * (ex - sx)
	if d ~= 0 and dx ~= 0 then
		local s = (dx * (sy - py) - dy * (sx - px)) / d
		if s >= 0 and s <= 1 then
			local r = (sx + (ex - sx) * s - px) / dx
			if r >= 0 then
				return sx + (ex - sx) * s, sy + (ey - sy) * s, r, s
			end
		end
	end
end

local function getRatio(x, x1, x2) 
  if (x2 - x1) == 0 then
    return 0 
  end
  return (x - x1)/(x2 - x1)
end

local function rectContains(px, py, bx1, by1, bx2, by2)
    if (px >= bx1 and px <= bx2) or (px <= bx1 and px >= bx2) then
      if py >= by1 and py <= by2 then
	return 1, getRatio(px, bx1, bx2),getRatio(py, by2, by1) 
      end
    end
    return nil
end

local function GetIntersect2(p1x, p1y, p2x, p2y, p3x, p3y, p4x, p4y)
    local denom = (p4y-p3y)*(p2x-p1x) - (p4x-p3x)*(p2y-p1y)
    if denom == 0 then
        return nil
    end
    local ua = ((p4x-p3x)*(p1y-p3y) - (p4y-p3y)*(p1x-p3x)) / denom
    if ua < 0 or ua > 1 then 
        return nil
    end
    local ub = ((p2x-p1x)*(p1y-p3y) - (p2y-p1y)*(p1x-p3x)) / denom
    if ub < 0 or ub > 1 then
        return nil
    end
    x = p1x + ua * (p2x-p1x)
    y = p1y + ua * (p2y-p1y)
    return x, y, (x - p3x) / (p4x - p3x), (y - p3y) / (p4y - p3y)
end

local WorldMapButton = WorldMapFrame:GetCanvas()

local WorldMapUpdated, PlayerFacing = false, 0


local function drawIcon(px, py, tex, cont_id) 
	if mapMapID == pMapID or onMap or sameInstanceish then else return end
	if not px then return end -- we somehow do not have coordinates
	--local left, top, right, bottom, width, height, mapMapID = GetMapSize()
	local left, top, right, bottom, width, height, mapMapID = GetMapSize()
	if not width or width == 0 then return end -- map has no size?


	local currentMapID = WorldMapFrame:GetMapID()
	local uiMapID, pos = C_Map.GetMapPosFromWorldPos(cont_id, {['x'] = px, ['y'] = py}, currentMapID)

	if pos.x < 0 or pos.x > 1  then return end
	if pos.y < 0 or pos.y > 1  then return end


	local mWidth, mHeight = WorldMapFrame:GetCanvas():GetSize()
	tex:SetPoint('CENTER', WorldMapButton, 'TOPLEFT', mWidth* pos.x, mHeight*-pos.y)
	tex:Show()
end

local function drawLine(px, py, p2x, p2y, _line, start_point, end_point) 
		start_point:ClearAllPoints()
		end_point:ClearAllPoints()
		_line:Hide()
		if mapMapID == pMapID or onMap or sameInstanceish then else return end
		if not px then return end -- we somehow do not have coordinates
		--local left, top, right, bottom, width, height, mapMapID = GetMapSize()
		local left, top, right, bottom, width, height, mapMapID = GetMapSize()
		if not width or width == 0 then return end -- map has no size?
		
		
		local sameInstanceish = pMapID == mapMapID
		local onMap = false
		if sameInstanceish and (px <= left and px >= right and py <= top and py >= bottom) then
			mx, my = (left - px) / width, (top - py) / height
			onMap = true
		end

		local function findAndSetPoint(_point_frame, px, py, ox, oy, left, bottom, right, top, mWidth, mHeight)
			local rectx, recty, _inside, _top, _bottom, _left, _right
			_inside, rectx, recty = rectContains(px,py, left, bottom, right, top)
			if _inside then
			  _point_frame:SetPoint('CENTER', WorldMapButton, 'TOPLEFT', mWidth * rectx, -mHeight * recty)
			  return 1
			end
			_top, _, rectx, recty = GetIntersect2(px,py, ox, oy, left, top, right, top)
			if _top then
			  _point_frame:SetPoint('CENTER', WorldMapButton, 'TOPLEFT', mWidth * rectx, 0)
			  return 1
			end

			_bottom,_, rectx, recty = GetIntersect2(px,py, ox, oy, left, bottom, right, bottom)
			if _bottom then
			  _point_frame:SetPoint('CENTER', WorldMapButton, 'BOTTOMLEFT', mWidth * rectx, 0)
			  return 1
			end

			_left,_, rectx, recty = GetIntersect2(px,py, ox, oy, left, top, left, bottom)
			if _left then
			  _point_frame:SetPoint('CENTER', WorldMapButton, 'TOPLEFT', 0, -mHeight * recty)
			  return 1
			end

			_right,_, rectx, recty = GetIntersect2(px,py, ox, oy, right, top, right, bottom)
			if _right then
			  _point_frame:SetPoint('CENTER', WorldMapButton, 'TOPRIGHT', 0, -mHeight * recty)
			  return 1
			end
			return nil
		end

		local mWidth, mHeight = WorldMapFrame:GetCanvas():GetSize()
		if findAndSetPoint(start_point, px, py, p2x, p2y, left, bottom, right, top, mWidth, mHeight) and findAndSetPoint(end_point, p2x, p2y, px, py, left, bottom, right, top, mWidth, mHeight) then
			_line:Show()
		end
end


local LineFrame = CreateFrame('frame', nil, WorldMapButton)
LineFrame:SetAllPoints()
LineFrame:SetFrameLevel(15000)


line_frames = {}
start_points = {}
end_points = {}
eastern_kingdom_lines = {}

local function applyLinesColor(lines, color)
  for i=1,#lines do
    lines[i]:SetVertexColor(color['r'], color['g'], color['b'], color['a'])
  end
end

local function applyTargetsColor(targets, color)
  for i=1,#targets do
    targets[i]:SetVertexColor(color['r'], color['g'], color['b'], color['a'])
  end
end

for i=1,#voronoi_lines do
	local start_point = CreateFrame('frame', nil, LineFrame)
	start_point:SetSize(1, 1)
	table.insert(start_points, start_point)
	local end_point = CreateFrame('frame', nil, LineFrame)
	end_point:SetSize(1, 1)
	table.insert(end_points, end_point)
	local Line = LineFrame:CreateLine(nil, 'OVERLAY')
	Line:Hide()
	Line:SetTexture('interface/buttons/white8x8')
	Line:SetThickness(2)
	Line:SetStartPoint('CENTER', start_point, 0, 0)
	Line:SetEndPoint('CENTER', end_point, 0, 0)
	table.insert(eastern_kingdom_lines, Line)
end
applyLinesColor(eastern_kingdom_lines, logout_skip_settings['logout_skip_partition_color'])

gy_start_points = {}
gy_end_points = {}
gy_lines = {}

for i=1,#gy_voronoi_lines do
	local start_point = CreateFrame('frame', nil, LineFrame)
	start_point:SetSize(1, 1)
	table.insert(gy_start_points, start_point)
	local end_point = CreateFrame('frame', nil, LineFrame)
	end_point:SetSize(1, 1)
	table.insert(gy_end_points, end_point)
	local Line = LineFrame:CreateLine(nil, 'OVERLAY')
	Line:Hide()
	Line:SetTexture('interface/buttons/white8x8')
	Line:SetVertexColor(0.0, 0.0, 0.0, 0.8)
	Line:SetThickness(2)
	Line:SetStartPoint('CENTER', start_point, 0, 0)
	Line:SetEndPoint('CENTER', end_point, 0, 0)
	table.insert(gy_lines, Line)
end
applyLinesColor(gy_lines, logout_skip_settings['death_skip_partition_color'])

line_frames_kalimdor = {}
start_points_kalimdor = {}
end_points_kalimdor = {}
lines_kalimdor= {}

for i=1,#voronoi_lines_kalimdor do
	local start_point = CreateFrame('frame', nil, LineFrame)
	start_point:SetSize(1, 1)
	table.insert(start_points_kalimdor, start_point)
	local end_point = CreateFrame('frame', nil, LineFrame)
	end_point:SetSize(1, 1)
	table.insert(end_points_kalimdor, end_point)
	local Line = LineFrame:CreateLine(nil, 'OVERLAY')
	Line:Hide()
	Line:SetTexture('interface/buttons/white8x8')
	Line:SetThickness(2)
	Line:SetStartPoint('CENTER', start_point, 0, 0)
	Line:SetEndPoint('CENTER', end_point, 0, 0)
	table.insert(lines_kalimdor, Line)
end
applyLinesColor(lines_kalimdor, logout_skip_settings['logout_skip_partition_color'])

gy_start_points_kalimdor = {}
gy_end_points_kalimdor = {}
gy_lines_kalimdor = {}

for i=1,#gy_voronoi_lines_kalimdor do
	local start_point = CreateFrame('frame', nil, LineFrame)
	start_point:SetSize(1, 1)
	table.insert(gy_start_points_kalimdor, start_point)
	local end_point = CreateFrame('frame', nil, LineFrame)
	end_point:SetSize(1, 1)
	table.insert(gy_end_points_kalimdor, end_point)
	local Line = LineFrame:CreateLine(nil, 'OVERLAY')
	Line:Hide()
	Line:SetTexture('interface/buttons/white8x8')
	Line:SetVertexColor(0.0, 0.0, 0.0, 0.8)
	Line:SetThickness(2)
	Line:SetStartPoint('CENTER', start_point, 0, 0)
	Line:SetEndPoint('CENTER', end_point, 0, 0)
	table.insert(gy_lines_kalimdor, Line)
end
applyLinesColor(gy_lines_kalimdor, logout_skip_settings['death_skip_partition_color'])

points_ = {}
texs_ = {}

for _,v in ipairs(eastern_kingdom_locs) do
  local p = CreateFrame('frame', nil, LineFrame)
  p:SetHeight(40)
  p:SetWidth(40)
  local tex = p:CreateTexture(nil, 'OVERLAY')
  tex:SetTexture("Interface\\Addons\\LogoutSkips\\Media\\icon_x.blp")
  tex:SetDrawLayer("OVERLAY", 4)
  tex:SetHeight(15)
  tex:SetWidth(15)
  tex:Hide()
  table.insert(points_, p)
  table.insert(texs_, tex)
end

eastern_kingdom_gy_points_ = {}
eastern_kingdom_gy_texs_ = {}

for _,v in ipairs(eastern_kingdom_gy_locs) do
  local p = CreateFrame('frame', nil, LineFrame)
  p:SetHeight(40)
  p:SetWidth(40)
  local tex = p:CreateTexture(nil, 'OVERLAY')
  tex:SetTexture("Interface\\Addons\\LogoutSkips\\Media\\icon_x.blp")
  tex:SetDrawLayer("OVERLAY", 4)
  tex:SetHeight(15)
  tex:SetWidth(15)
  tex:Hide()
  tex:SetVertexColor(0,0,0,1)
  table.insert(eastern_kingdom_gy_points_, p)
  table.insert(eastern_kingdom_gy_texs_, tex)
end

points_kalimdor_ = {}
texs_kalimdor_ = {}

for _,v in ipairs(kalimdor_locs) do
  local p = CreateFrame('frame', nil, LineFrame)
  p:SetHeight(40)
  p:SetWidth(40)
  local tex = p:CreateTexture(nil, 'OVERLAY')
  tex:SetTexture("Interface\\Addons\\LogoutSkips\\Media\\icon_x.blp")
  tex:SetDrawLayer("OVERLAY", 4)
  tex:SetHeight(15)
  tex:SetWidth(15)
  tex:Hide()
  table.insert(points_kalimdor_, p)
  table.insert(texs_kalimdor_, tex)
end

kalimdor_gy_points_ = {}
kalimdor_gy_texs_ = {}

for _,v in ipairs(kalimdor_gy_locs) do
  local p = CreateFrame('frame', nil, LineFrame)
  p:SetHeight(40)
  p:SetWidth(40)
  local tex = p:CreateTexture(nil, 'OVERLAY')
  tex:SetTexture("Interface\\Addons\\LogoutSkips\\Media\\icon_x.blp")
  tex:SetDrawLayer("OVERLAY", 4)
  tex:SetHeight(15)
  tex:SetWidth(15)
  tex:Hide()
  tex:SetVertexColor(0,0,0,1)
  table.insert(kalimdor_gy_points_, p)
  table.insert(kalimdor_gy_texs_, tex)
end

local function update()
	if logout_skip_settings['disabled'] and showing then
	  for _,v in ipairs(eastern_kingdom_lines) do
	      v:Hide()
	  end
	  for _,v in ipairs(lines_kalimdor) do
	      v:Hide()
	  end

	  for i,v in ipairs(eastern_kingdom_locs) do
	    texs_[i]:Hide()
	  end
	  for i,v in ipairs(kalimdor_locs) do
	    texs_kalimdor_[i]:Hide()
	  end
	  showing = false
	  return 
	end

	if logout_skip_settings['gy_disabled'] and gy_showing then
	  for _,v in ipairs(gy_lines) do
	      v:Hide()
	  end
	  for _,v in ipairs(gy_lines_kalimdor) do
	      v:Hide()
	  end

	  for i,v in ipairs(eastern_kingdom_gy_locs) do
	    eastern_kingdom_gy_texs_[i]:Hide()
	  end
	  for i,v in ipairs(kalimdor_gy_locs) do
	    kalimdor_gy_texs_[i]:Hide()
	  end
	  gy_showing = false
	  return 
	end

	if logout_skip_settings['disabled'] == false then
		local currentMapID = WorldMapFrame:GetMapID()
		local cont, _ = C_Map.GetWorldPosFromMapPos(currentMapID, {x = 0, y = 0})

		if cont == 0 and currentMapID ~= 947 then 
		  for i,v in ipairs(voronoi_lines) do
			drawLine(v[1], v[2], v[3], v[4], eastern_kingdom_lines[i], start_points[i], end_points[i])
		  end
		  for _,v in ipairs(lines_kalimdor) do
		      v:Hide()
		  end
		elseif cont == 1 and currentMapID ~= 947 then
		  for i,v in ipairs(voronoi_lines_kalimdor) do
			drawLine(v[1], v[2], v[3], v[4], lines_kalimdor[i], start_points_kalimdor[i], end_points_kalimdor[i])
		  end
		  for _,v in ipairs(eastern_kingdom_lines) do
		      v:Hide()
		  end
		else
		  for _,v in ipairs(eastern_kingdom_lines) do
		      v:Hide()
		  end
		  for _,v in ipairs(lines_kalimdor) do
		      v:Hide()
		  end
		end

		for i,v in ipairs(eastern_kingdom_locs) do
		  texs_[i]:Hide()
		  if cont == 0 and currentMapID ~= 947 then
			  drawIcon(v[2], v[1], texs_[i], 0)
		  end
		end

		for i,v in ipairs(kalimdor_locs) do
		  texs_kalimdor_[i]:Hide()
		  if cont == 1 and currentMapID ~= 947 then
			  drawIcon(v[2], v[1], texs_kalimdor_[i], 1)
		  end
		end

		WorldMapUpdated = false
		showing = true
      end

      if logout_skip_settings['gy_disabled'] == false then
	      local currentMapID = WorldMapFrame:GetMapID()
	      local cont, _ = C_Map.GetWorldPosFromMapPos(currentMapID, {x = 0, y = 0})

	      if cont == 0 and currentMapID ~= 947 then 
		for i,v in ipairs(gy_voronoi_lines) do
		      drawLine(v[1], v[2], v[3], v[4], gy_lines[i], gy_start_points[i], gy_end_points[i])
		end
		for _,v in ipairs(gy_lines_kalimdor) do
		    v:Hide()
		end
	      elseif cont == 1 and currentMapID ~= 947 then
		for i,v in ipairs(gy_voronoi_lines_kalimdor) do
		      drawLine(v[1], v[2], v[3], v[4], gy_lines_kalimdor[i], gy_start_points_kalimdor[i], gy_end_points_kalimdor[i])
		end
		for _,v in ipairs(gy_lines) do
		    v:Hide()
		end
	      else
		for _,v in ipairs(gy_lines) do
		    v:Hide()
		end
		for _,v in ipairs(gy_lines_kalimdor) do
		    v:Hide()
		end
	      end

	      for i,v in ipairs(eastern_kingdom_gy_locs) do
		eastern_kingdom_gy_texs_[i]:Hide()
		if cont == 0 and currentMapID ~= 947 then
			drawIcon(v[2], v[1], eastern_kingdom_gy_texs_[i], 0)
		end
	      end

	      for i,v in ipairs(kalimdor_gy_locs) do
		kalimdor_gy_texs_[i]:Hide()
		if cont == 1 and currentMapID ~= 947 then
			drawIcon(v[2], v[1], kalimdor_gy_texs_[i], 1)
		end
	      end

	      WorldMapUpdated = false
	      gy_showing = true
    end
end


LineFrame:SetScript('OnUpdate', function(self, elapsed)
  if WorldMapUpdated == false then 
    return 
  end
  update()
end)

hooksecurefunc(WorldMapFrame, 'OnMapChanged', function()
	WorldMapUpdated = true
end)

if logout_skip_settings['disabled'] then
  LogoutSkips_Toggle:SetText("Show LogoutSkips")
else
  LogoutSkips_Toggle:SetText("Hide LogoutSkips")
end

function LogoutSkips_Toggle_Click()
  logout_skip_settings['disabled'] = not logout_skip_settings['disabled']
  if logout_skip_settings['disabled'] then
    LogoutSkips_Toggle:SetText("Show LogoutSkips")
  else
    LogoutSkips_Toggle:SetText("Hide LogoutSkips")
  end
  update()
end

function DeathSkips_Toggle_Click()
  logout_skip_settings['gy_disabled'] = not logout_skip_settings['gy_disabled']
  if logout_skip_settings['gy_disabled'] then
    DeathSkips_Toggle:SetText("Show DeathSkips")
  else
    DeathSkips_Toggle:SetText("Hide DeathSkips")
  end
  update()
end

local logout_skip_notifier = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
logout_skip_notifier:SetPoint("CENTER")
logout_skip_notifier:SetSize(160, 40)
logout_skip_notifier:SetBackdrop(BACKDROP_TUTORIAL_16_16)

logout_skip_notifier:SetMovable(true)
logout_skip_notifier:EnableMouse(true)
logout_skip_notifier:RegisterForDrag("LeftButton")
logout_skip_notifier.title_text = logout_skip_notifier:CreateFontString(nil,"ARTWORK")
logout_skip_notifier.title_text:SetFont("Fonts\\ARIALN.ttf", 9, "OUTLINE")
logout_skip_notifier.title_text:SetPoint("CENTER",0,10)
logout_skip_notifier.title_text:SetText("LogoutSkip Target")
logout_skip_notifier.title_text:SetWidth(160)
logout_skip_notifier.title_text:SetWordWrap(false)

logout_skip_notifier.text = logout_skip_notifier:CreateFontString(nil,"ARTWORK")
logout_skip_notifier.text:SetFont("Fonts\\ARIALN.ttf", 10, "OUTLINE")
logout_skip_notifier.text:SetPoint("CENTER",0,-5)
logout_skip_notifier.text:SetText("LogoutSkip Target")
logout_skip_notifier.text:SetWidth(150)
logout_skip_notifier.text:SetWordWrap(false)
logout_skip_notifier.timer_handle = nil

function logout_skip_notifier:UpdateTarget()
  local function distanceSqFunc(x,y, x1, y1)
    return (x1-x)*(x1-x) + (y1-y)*(y1-y)
  end

  local map = C_Map.GetBestMapForUnit("player")
  local position = C_Map.GetPlayerMapPosition(map, "player")
  local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(map, position)
  if continentID == 0 then -- EK
    best_loc = nil
    loc_dist = nil
    for _,v in ipairs(eastern_kingdom_locs) do
      if v ~= nil then
	if best_loc == nil then
	  loc_dist = distanceSqFunc(worldPosition['x'], worldPosition['y'], v[2], v[1])
	  best_loc = v[3]
	end

	  local _loc_dist = distanceSqFunc(worldPosition['x'], worldPosition['y'], v[2], v[1])
	if _loc_dist < loc_dist then
	  best_loc = v[3]
	  loc_dist = _loc_dist
	end
      end
    end
    logout_skip_notifier.text:SetText(best_loc)
  elseif continentID == 1 then -- kalimdor
    best_loc = nil
    loc_dist = nil
    for _,v in ipairs(kalimdor_locs) do
      if v ~= nil then
	if best_loc == nil then
	  loc_dist = distanceSqFunc(worldPosition['x'], worldPosition['y'], v[2], v[1])
	  best_loc = v[3]
	end

	  local _loc_dist = distanceSqFunc(worldPosition['x'], worldPosition['y'], v[2], v[1])
	if _loc_dist < loc_dist then
	  best_loc = v[3]
	  loc_dist = _loc_dist
	end
      end
    end
    logout_skip_notifier.text:SetText(best_loc)
  end
end

logout_skip_notifier:SetScript("OnDragStart", function(self, button)
	self:StartMoving()
	local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint()
	local x,y = self:GetCenter()
	local px,py = self:GetParent():GetCenter();
	if logout_skip_settings['logout_skip_notifier_pos'] == nil then
	  logout_skip_settings['logout_skip_notifier_pos'] = {}
	end
	logout_skip_settings['logout_skip_notifier_pos']['x'] = x - px
	logout_skip_settings['logout_skip_notifier_pos']['y'] = y - py
end)
logout_skip_notifier:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()

	local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint()
	local x,y = self:GetCenter()
	local px,py = self:GetParent():GetCenter();
	if logout_skip_settings['logout_skip_notifier_pos'] == nil then
	  logout_skip_settings['logout_skip_notifier_pos'] = {}
	end
	logout_skip_settings['logout_skip_notifier_pos']['x'] = x - px
	logout_skip_settings['logout_skip_notifier_pos']['y'] = y - py
end)

local function applyLogoutSkipNotifierSettings()
    if logout_skip_settings["show_logout_skip_notifier"] ~= nil and logout_skip_settings["show_logout_skip_notifier"] == false then
      logout_skip_notifier:Hide()
      logout_skip_notifier.text:Hide()
      if logout_skip_notifier.timer_handle ~= nil then
	logout_skip_notifier.timer_handle:Cancel()
	logout_skip_notifier.timer_handle = nil
      end

    else
      logout_skip_notifier:Show()
      logout_skip_notifier.text:Show()

      if logout_skip_notifier.timer_handle ~= nil then
	logout_skip_notifier.timer_handle:Cancel()
	logout_skip_notifier.timer_handle = nil
      end

	logout_skip_notifier.timer_handle = C_Timer.NewTicker(2.0, function()
	  logout_skip_notifier:UpdateTarget()
	end)
    end
end

local options = {
	name = "LogoutSkips Options",
	handler = Hardcore,
	type = "group",
	args = {
		logout_skip_options_header = {
			type = "group",
			name = "LogoutSkips",
			order = 1,
			inline = true,
			args = {
				logoutskip_partition_colorpicker = {
					type = "color",
					name = "Partition Color",
					desc = "Pick LogoutSkip partition color",
					hasAlpha = true,
					get = function()
					  if logout_skip_settings['logout_skip_partition_color'] then
					  return logout_skip_settings['logout_skip_partition_color']['r'], logout_skip_settings['logout_skip_partition_color']['g'], logout_skip_settings['logout_skip_partition_color']['b'], logout_skip_settings['logout_skip_partition_color']['a']

					  else
					    return defaults['logout_skip_partition_color']
					  end
					end,
					set = function(info, r,g,b,a)

					  if logout_skip_settings['logout_skip_partition_color'] == nil then
					    logout_skip_settings['logout_skip_partition_color'] = {}
					  end
					  logout_skip_settings['logout_skip_partition_color']['r'] = r 
					  logout_skip_settings['logout_skip_partition_color']['g'] = g
					  logout_skip_settings['logout_skip_partition_color']['b'] = b
					  logout_skip_settings['logout_skip_partition_color']['a'] = a
					  applyLinesColor(eastern_kingdom_lines, logout_skip_settings['logout_skip_partition_color'])
					  applyLinesColor(lines_kalimdor, logout_skip_settings['logout_skip_partition_color'])
					end,
					order = 1,
				},
				logoutskip_target_colorpicker = {
					type = "color",
					name = "Target Color",
					desc = "Pick target color",
					hasAlpha = true,
					get = function()
					  if logout_skip_settings['logout_skip_target_color'] then
					  return logout_skip_settings['logout_skip_target_color']['r'], logout_skip_settings['logout_skip_target_color']['g'], logout_skip_settings['logout_skip_target_color']['b'], logout_skip_settings['logout_skip_target_color']['a']

					  else
					    return defaults['logout_skip_target_color']
					  end
					end,
					set = function(info, r,g,b,a)

					  if logout_skip_settings['logout_skip_target_color'] == nil then
					    logout_skip_settings['logout_skip_target_color'] = {}
					  end
					  logout_skip_settings['logout_skip_target_color']['r'] = r 
					  logout_skip_settings['logout_skip_target_color']['g'] = g
					  logout_skip_settings['logout_skip_target_color']['b'] = b
					  logout_skip_settings['logout_skip_target_color']['a'] = a
					  applyTargetsColor(texs_, logout_skip_settings['logout_skip_target_color'])
					  applyTargetsColor(texs_kalimdor_, logout_skip_settings['logout_skip_target_color'])
					end,
					order = 1,
				},
				logoutskip_notifier = {
					type = "toggle",
					name = "Notifier",
					desc = "Turn on and off notifier",
					get = function()
					  if logout_skip_settings['show_logout_skip_notifier'] == nil then
					    return true;
					  end
					  return logout_skip_settings['show_logout_skip_notifier']
					end,
					set = function(info, value)
					  if logout_skip_settings['show_logout_skip_notifier'] == nil then
					    logout_skip_settings['show_logout_skip_notifier'] = false
					  end
					  logout_skip_settings['show_logout_skip_notifier'] = not logout_skip_settings['show_logout_skip_notifier'] 
					  applyLogoutSkipNotifierSettings()
					end,
					order = 1,
				},
			},
		},
		death_skip_options_header = {
			type = "group",
			name = "DeathSkips",
			order = 2,
			inline = true,
			args = {
				death_alerts = {
					type = "color",
					name = "Partition Color",
					desc = "Pick death skip partition color",
					hasAlpha = true,
					get = function()
					  if logout_skip_settings['death_skip_partition_color'] then
					  return logout_skip_settings['death_skip_partition_color']['r'], logout_skip_settings['death_skip_partition_color']['g'], logout_skip_settings['death_skip_partition_color']['b'], logout_skip_settings['death_skip_partition_color']['a']
					  else
					    return 1,1,1,.4
					  end
					end,
					set = function(info, r,g,b,a)
					    if logout_skip_settings['death_skip_partition_color'] == nil then
					      logout_skip_settings['death_skip_partition_color'] = {}
					    end
					    logout_skip_settings['death_skip_partition_color']['r'] = r 
					    logout_skip_settings['death_skip_partition_color']['g'] = g
					    logout_skip_settings['death_skip_partition_color']['b'] = b
					    logout_skip_settings['death_skip_partition_color']['a'] = a
					  applyLinesColor(gy_lines, logout_skip_settings['death_skip_partition_color'])
					  applyLinesColor(gy_lines_kalimdor, logout_skip_settings['death_skip_partition_color'])
					end,
					order = 2,
				},
			},
			args = {
				deathskips_target_colorpicker = {
					type = "color",
					name = "Partition Color",
					desc = "Pick death skip target color",
					hasAlpha = true,
					get = function()
					  if logout_skip_settings['death_skip_target_color'] then
					  return logout_skip_settings['death_skip_target_color']['r'], logout_skip_settings['death_skip_target_color']['g'], logout_skip_settings['death_skip_target_color']['b'], logout_skip_settings['death_skip_target_color']['a']
					  else
					    return 1,1,1,.4
					  end
					end,
					set = function(info, r,g,b,a)
					    if logout_skip_settings['death_skip_target_color'] == nil then
					      logout_skip_settings['death_skip_target_color'] = {}
					    end
					    logout_skip_settings['death_skip_target_color']['r'] = r 
					    logout_skip_settings['death_skip_target_color']['g'] = g
					    logout_skip_settings['death_skip_target_color']['b'] = b
					    logout_skip_settings['death_skip_target_color']['a'] = a
					  applyTargetsColor(eastern_kingdom_gy_texs_, logout_skip_settings['death_skip_target_color'])
					  applyTargetsColor(kalimdor_gy_texs_, logout_skip_settings['death_skip_target_color'])
					end,
					order = 2,
				},
			},
		},
	},
}



LibStub("AceConfig-3.0"):RegisterOptionsTable("LogoutSkips", options)
optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("LogoutSkips", "LogoutSkips")

local logout_skip_event_handler = CreateFrame('frame', nil)

logout_skip_event_handler:SetScript("OnEvent", function(self, event, ...)
  if event == "PLAYER_ENTERING_WORLD" then
    applyLinesColor(eastern_kingdom_lines, logout_skip_settings['logout_skip_partition_color'] or defaults['logout_skip_partition_color'])
    applyLinesColor(lines_kalimdor, logout_skip_settings['logout_skip_partition_color'] or defaults['logout_skip_partition_color'])
    applyLinesColor(gy_lines, logout_skip_settings['death_skip_partition_color'] or defaults['death_skip_partition_color'])
    applyLinesColor(gy_lines_kalimdor, logout_skip_settings['death_skip_partition_color'] or defaults['death_skip_partition_color'])

    applyTargetsColor(kalimdor_gy_texs_, logout_skip_settings['death_skip_target_color'] or defaults['logout_skip_target_color'])
    applyTargetsColor(eastern_kingdom_gy_texs_, logout_skip_settings['death_skip_target_color'] or defaults['logout_skip_target_color'])
    applyTargetsColor(texs_, logout_skip_settings['logout_skip_target_color'] or defaults['death_skip_target_color'])
    applyTargetsColor(texs_kalimdor_, logout_skip_settings['logout_skip_target_color'] or defaults['death_skip_target_color'])

    applyLogoutSkipNotifierSettings()
    if logout_skip_settings["logout_skip_notifier_pos"] then
      logout_skip_notifier:SetPoint("CENTER", UIParent, "CENTER", logout_skip_settings["logout_skip_notifier_pos"]['x'], logout_skip_settings["logout_skip_notifier_pos"]['y'])
    end

    logout_skip_notifier:UpdateTarget()

  end
end)

logout_skip_event_handler:RegisterEvent("PLAYER_ENTERING_WORLD")
