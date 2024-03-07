-- A "gamepad" style key intended for arcade gameplay.
-- For spells, use Game\Spells\SpellButton instead.

XPRACTICE.Key = {}
XPRACTICE.Key.__index = XPRACTICE.Key

function XPRACTICE.Key:new()
	local self={}
	setmetatable(self, XPRACTICE.Key)	
	
	self.map=nil	-- used by rawinput to point to another key
	
	self.current=false		-- whether key is currently down
	self.pressed=false		-- true when OnKeyDown
	self.released=false		-- true when OnKeyUp
		-- (WoW is nice enough not to trigger repeat events when the key is held down)

	
	return self
end

function XPRACTICE.Key:Setup(keys,keycode)
	tinsert(keys.keys,self)
	keys.keycodes[keycode]=self
	
	return self
end

function XPRACTICE.Key:SetKey(state)
	self.current=state
	if(state==true)then
		self.pressed=true
	else
		self.released=true
	end	
	
	if(self.map)then		
		self.map:SetKey(state)
	end
end

--special case for wmouse
function XPRACTICE.Key:SetMouseWheel(delta)
	self.pressed=delta
	if(self.map)then
		self.map:SetMouseWheel(delta)
	end
end