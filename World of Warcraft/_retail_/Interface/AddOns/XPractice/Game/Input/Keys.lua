

-- TODO NEXT:
-- change key state during KeyDown/KeyUp events only
-- for one frame following a KeyDown event, current=true even if a KeyUp occurred afterwards
		-- (probably requires a logic rewrite)


-- new plan:
-- game keeps list of RawInput (keycode index)
-- 

XPRACTICE.RawInput = {}
XPRACTICE.RawInput.__index = XPRACTICE.RawInput

function XPRACTICE.RawInput:new()
	local self={}
	setmetatable(self, XPRACTICE.RawInput)	
	
	self.keys={}
	
	--mousewheel uses SetMouseWheel instead and the system expects it to exist already
	self.keys["WMOUSE"]=XPRACTICE.Key:new()
	
	return self
end

function XPRACTICE.RawInput:CreateKeycodeIfNotExists(keycode)
	if(not self.keys[keycode])then		
		self.keys[keycode]=XPRACTICE.Key.new()
	end
end

function XPRACTICE.RawInput:BeginStep()
	self.prevL=self.prevL or false
	self.prevR=self.prevR or false
	self.prevM=self.prevM or false
		
	-- mousedown events still work.  use IsMouseButtonDown for mouseUP events only.
	-- note that MousePicker triggers on mouseUP, so it still needs to check first whether the main screen has focus when a workaround mouseup occurs.
	local state=IsMouseButtonDown("LeftButton")
	if(state~=self.prevL and state==false)then
		self:SetKey("LMOUSE",state)
	end
	self.prevL=state
	local state=IsMouseButtonDown("RightButton")
	if(state~=self.prevR and state==false)then
		self:SetKey("RMOUSE",state)
	end
	self.prevR=state
	local state=IsMouseButtonDown("MiddleButton")
	if(state~=self.prevM and state==false)then
		self:SetKey("MMOUSE",state)
	end
	self.prevM=state
	
	
end

function XPRACTICE.RawInput:EndStep()
	--call at very end of frame to turn off pressed/released status.
	for k,v in pairs(self.keys) do
		v.pressed=false
		v.released=false
	end	
end

function XPRACTICE.RawInput:SetKey(keycode,state)
	--self:CreateKeycodeIfNotExists(keycode)
	--self.keys[keycode]:SetKey(state)
	if(self.keys[keycode])then self.keys[keycode]:SetKey(state) end
end

function XPRACTICE.RawInput:Cleanup()
	--
end

----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------


----------------------------------------------------------

-- WC3 controls: 
-- F1-F3 to select Heroes (change to boss units instead?)
-- number row: quick select keys
-- ctrl+number row: save currently selected units to quick select
-- RMB to attack or move
-- mousewheel or pgup/pgdn to zoom
-- insert/delete to rotate camera left/right (TODO LATER, maybe)
-- Alt+RMB to move as fast as possible (breaking formation) (does alt even work in WoW?)
										-- alt works in WoW but alt+F4 still force closes
-- Tab to switch between subgroups (mDPS/rDPS/heal/tank/boss?)
-- ULDR to scroll camera (not WASD)
-- (use A+LMB as alternative to RMB?)
-- (use QWER for boss abilities?)

----------------------------------------------------------

-- A collection of "gamepad" keys intended for arcade gameplay.
-- For spells, use Game>Spells>SpellButton instead.

-- (also stores mouse info)

XPRACTICE.Keys = {}
XPRACTICE.Keys.__index = XPRACTICE.Keys

function XPRACTICE.Keys:new()
	local self={}
	setmetatable(self, XPRACTICE.Keys)	
	
	-- most access to keys is done via rawinput.map,
	-- but we still need to keep a list of keys to reset pressed status at the end of frame
	self.keys={}
	self.keyaliases={}
	
	return self
end

function XPRACTICE.Keys:Setup(rawinput)
	--TODO: do keycodes still work in other languages?

	self.rawinput=rawinput
	--TODO: rename directional keys, maybe WASDup etc?
	self:NewKey("upW","MoveForward")
	self:NewKey("leftA","StrafeLeft")
	self:NewKey("downS","MoveBackward")
	self:NewKey("rightD","StrafeRight")
	self:NewKey("turnQ","TurnLeft")
	self:NewKey("turnE","TurnRight")
	
	-- ULDR exist but are functionally useless at the moment; PlayerCharacter doesn't check if they're pressed
	self:NewKey("up","UP")
	self:NewKey("left","LEFT")
	self:NewKey("down","DOWN")
	self:NewKey("right","RIGHT")
	
	self:NewKey("esc","ESCAPE")
	
	self:NewKey("jump","Jump")
	
	self:NewKey("togglerunwalk","ToggleRunWalk")
	
	--mouse buttons work the same as other keys,
	--but they're set in OnMouseChange
	self.lmouse=self:NewKey("lmouse","LMOUSE")
	self.rmouse=self:NewKey("rmouse","RMOUSE")
	self.mmouse=self:NewKey("mmouse","MMOUSE")--mousewheel click
	--special case for mousewheel scroll, handled separately-ish.
	--"pressed" value contains delta for wheel scroll
	self.wmouse=self:NewKey("wmouse","WMOUSE")
	
end

function XPRACTICE.Keys:EndStep()
	--call at very end of frame to turn off pressed/released status.
	for k,v in ipairs(self.keys) do
		v.pressed=false
		v.released=false
	end	
end

function XPRACTICE.Keys:Cleanup()
	--
end



-- currently support to assign multiple pointers to one key, but only one key.
-- before calling AssignKey, make sure self.rawinput points to something
function XPRACTICE.Keys:NewKey(keyname,keyalias)	
	local keycode=""
	if(XPRACTICE_SAVEDATA.Config.Keybinds[keyalias])then 
		keycode=XPRACTICE_SAVEDATA.Config.Keybinds[keyalias]
	elseif(XPRACTICE.Config.Keybinds[keyalias])then
		keycode=XPRACTICE.Config.Keybinds[keyalias]
		XPRACTICE_SAVEDATA.Config.Keybinds[keyalias]=XPRACTICE.Config.Keybinds[keyalias]
		--print("!",keycode)
	else
		keycode=keyalias
	end
	
	local key=XPRACTICE.Key.new()
	key.keyalias=keyalias
	self[keyname]=key
	self.keyaliases[keyalias]=key
	
	self.rawinput:CreateKeycodeIfNotExists(keycode)
	self.rawinput.keys[keycode].map=key
	tinsert(self.keys,key)	
	
	return key
end


function XPRACTICE.Keys:ReplaceKey(keyname,newkeycode)
	local key=self[keyname]
	local keyalias=key.keyalias
	local oldkeycode=self:GetKeybind(keyname)
	if(oldkeycode)then		
		-- if newkeycode is already assigned to a key, swap that key's keycode to the old keycode of the key we're replacing
		if(self.rawinput.keys[newkeycode])then			
			local oldkeyalias=self:GetKeyaliasFromKeycode(newkeycode)
			XPRACTICE_SAVEDATA.Config.Keybinds[oldkeyalias]=oldkeycode
			self.rawinput.keys[oldkeycode]=nil
			self.rawinput:CreateKeycodeIfNotExists(oldkeycode)			
			self.rawinput.keys[oldkeycode].map=self.rawinput.keys[newkeycode].map
			--print(oldkeycode,"now points to",self.rawinput.keys[oldkeycode].map.keyalias)
		else				
			-- otherwise, remove the old keycode from rawinput		
			self.rawinput.keys[oldkeycode]=nil
		end
	end	
	if(self.rawinput.keys[newkeycode] and self.rawinput.keys[oldkeycode].map)then oldkeyabbrev=self.rawinput.keys[oldkeycode].map.keyabbreviation end			
	self.rawinput:CreateKeycodeIfNotExists(newkeycode)
	self.rawinput.keys[newkeycode].map=self[keyname]
	XPRACTICE_SAVEDATA.Config.Keybinds[keyalias]=newkeycode	
end

function XPRACTICE.Keys:GetKeybind(keyname)
	local keyalias=self[keyname].keyalias
	return XPRACTICE_SAVEDATA.Config.Keybinds[keyalias] 
end


function XPRACTICE.Keys:GetKeyaliasFromKeycode(keycode)
	for k,v in pairs(XPRACTICE_SAVEDATA.Config.Keybinds)do		
		if(v==keycode)then
			return k
		end
	end
end