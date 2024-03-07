-- This window is hardcoded to expect a XPRACTICE.Game.

XPRACTICE.DraggableGameWindow = {}
XPRACTICE.DraggableGameWindow.__index = XPRACTICE.DraggableGameWindow

function XPRACTICE.DraggableGameWindow.new()
	local self=setmetatable({}, XPRACTICE.DraggableGameWindow)	
		
	return self
end

--TODO: resizable

function XPRACTICE.DraggableGameWindow:Setup(game,width,height,titletext,titleheight,closebutton,onclose)		


	--TODO: figure out how we want to handle window framelevels

	if(not titleheight)then titleheight=20 end
	self.titleheight=titleheight

	self.game=game	
	self.environments={}
	
	self:ClearVisibilityForScenarioLoad()
	
			
	self.background=XPRACTICE.ReusableFrames:GetFrame()
	self.background.parent=UIParent
	self.background:SetParent(self.background.parent)
	self.background:SetWidth(width)	
	self.background:SetHeight(height+(titleheight+2))
	
	self.background:SetPoint("CENTER",self.background.parent,"CENTER",0,(titleheight/2))
	self.background.texture:SetColorTexture(0,0,0,0.5)
	self.background:Show()
	self.background.texture:Show()		
	--self.background:SetAlpha(1)	
	self.background:SetAlpha(0)--!!!
	
	self.inputframe=XPRACTICE.ReusableFrames:GetFrame()
	self.inputframe:SetParent(self.background)
	self.inputframe.parent=self.background; self.inputframe:SetParent(self.inputframe.parent)
	self.inputframe:SetPoint("BOTTOM",self.inputframe.parent,"BOTTOM",0,0) 
	self.inputframe:SetWidth(width);self.inputframe:SetHeight(height)	
	self.inputframe:Show()
	self.inputframe:SetAlpha(1)
			
--/run _XPRACTICE_game.window.background:Hide()
--/run SetupFullscreenScale(_XPRACTICE_game.window.background)
	self.frame=XPRACTICE.ReusableFrames:GetFrame()
	self.frame.parent=self.background; self.frame:SetParent(self.frame.parent)
	
	self.frame:SetPoint("BOTTOM",self.frame.parent,"BOTTOM",0,0) 
	self.frame:SetWidth(width);self.frame:SetHeight(height)
	
	self.frame:Show()	
	self.frame:SetAlpha(1)

	
	self.inputframe:EnableMouse(true)
	--TODO: EnableMouseWheel not locking mouse wheel controls -- do we need to set an event before it locks?
	--TODO: state in future comments whether setting an event is necessary
	self.inputframe:EnableMouseWheel(true)	
	-- SetScript calls functions from the perspective of the frame, not the DraggableGameWindow itself
	-- so we must remind frame who it's supposed to be
	self.inputframe.parentwindow=self
	self.inputframe:SetScript("OnMouseDown", self.OnMouseDown)
	self.inputframe:SetScript("OnMouseUp", self.OnMouseUp)		
	self.inputframe:SetScript("OnMouseWheel", self.OnMouseWheel)	
	self.inputframe:SetScript("OnKeyDown", self.OnKeyDown)
	self.inputframe:SetScript("OnKeyUp", self.OnKeyUp)		
	
	local OnUpdate=function(self,elapsed)
		XPRACTICE.xpcall(function()game.MainGameLoop(game,elapsed)end)
	end
	self.inputframe:SetScript("OnUpdate", OnUpdate)
	
	
	
	self.bordergraphic=XPRACTICE.BorderGraphicWithTitle.new()
	self.bordergraphic:Setup(self.background,titletext,titleheight)	
	

	
	----Background texture is now handled by BorderGraphicWithTitle
	--TODO: rename BorderGraphicWithTitle to bordergraphicWithTitle
	--self.frame.texture:SetColorTexture(0,0,0,0.5)
	--self.frame.texture:Show()
	
	--XPRACTICE.FrameVisibilityCheck(self.frame)
	
	--TitleRegion removed in 7.1!
	--use RegisterForDrag instead
	--self.titleregion=self.frame:CreateTitleRegion()	
	--self.titleregion:SetPoint("TOPLEFT",self.frame,"TOPLEFT",0,0)		-- remember, this is the draggable title bar we're setting,
	--self.titleregion:SetPoint("TOPRIGHT",self.frame,"TOPRIGHT",0,0)	-- so use TOPLEFT/TOPRIGHT instead of BOTTOMLEFT/BOTTOMRIGHT
	--self.titleregion:SetHeight(titleheight)

	self.titleregion=XPRACTICE.ReusableFrames:GetFrame()
	self.titleregion.parent=self.background; self.titleregion:SetParent(self.titleregion.parent)
	self.titleregion:SetPoint("TOPLEFT",self.titleregion.parent,"TOPLEFT")
	self.titleregion:SetPoint("TOPRIGHT",self.titleregion.parent,"TOPRIGHT")
	self.titleregion:SetWidth(width)
	self.titleregion:SetHeight(titleheight)	
	self.titleregion:Show()
	self.titleregion:RegisterForDrag("LeftButton")	
	self.titleregion:SetAlpha(1)
	self.background:SetMovable(true)
	self.titleregion:SetScript("OnDragStart", function()
		self.background:StartMoving()
	end)
	self.titleregion:SetScript("OnDragStop", function()
		self.background:StopMovingOrSizing()
	end)	
	--mouse must be enabled to drag window
	self.titleregion:EnableMouse(true)
	

	
	if(closebutton)then
		self.closebutton=XPRACTICE.ReusableButtonFrames:GetFrame()
		self.closebutton:SetParent(self.titleregion)
		self.closebutton:SetWidth(16)
		self.closebutton:SetHeight(16)
		self.closebutton:SetPoint("TOPRIGHT",-3,-2)
		--self.closebutton:SetFrameLevel(255)
		self.closebutton.texture=self.closebutton:CreateTexture()
		self.closebutton.texture:SetAllPoints(self.closebutton)		
		self.closebutton.texture:SetTexture("Interface\\AddOns\\XPractice\\Assets\\Graphics\\Misc\\closebutton.tga")			
		self.closebutton:SetHighlightTexture("Interface\\AddOns\\XPractice\\Assets\\Graphics\\Misc\\square.tga")	
		
		self.closebutton.texture:Show()		
		self.closebutton:Show()	
		self.closebutton:SetAlpha(1)		
		
		self.closebutton:SetScript("OnClick",function(self,button,down)
				onclose()
			end)
	end
end

function XPRACTICE.DraggableGameWindow:ClearVisibilityForScenarioLoad()
	self.alivetime=0
	self.aliveframes=0
	self.alpha=0	
end

function XPRACTICE.DraggableGameWindow:Resize(width,height)
	self.background:SetWidth(width)	
	self.background:SetHeight(height+(self.titleheight+2))
	self.inputframe:SetWidth(width);self.inputframe:SetHeight(height)	
	self.frame:SetWidth(width);self.frame:SetHeight(height)
	self.titleregion:SetWidth(width)
	self.bordergraphic:Resize(width,height)
end

function XPRACTICE.DraggableGameWindow:Step(elapsed)
	--TODO: more elegant solution
	self.alivetime=self.alivetime+elapsed
	self.aliveframes=self.aliveframes+1
	if(self.alpha==0)then		
		if(self.alivetime>0.5 or self.aliveframes>=10)then
			self.alpha=1			
		end	
		self.background:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
	end
end


-- reminder: these events are called from the perspective of self.frame
function XPRACTICE.DraggableGameWindow:OnMouseDown(button)
	self.parentwindow.game:OnMouseChange(self,button,true)			
end

function XPRACTICE.DraggableGameWindow:OnMouseUp(button)
	self.parentwindow.game:OnMouseChange(self,button,false)		
end

function XPRACTICE.DraggableGameWindow:OnMouseWheel(delta)
	self.parentwindow.game:OnMouseWheel(self,delta)
end
function XPRACTICE.DraggableGameWindow:OnKeyDown(keycode,binding)
	--if(keycode=="ENTER" or keycode=="/" or keycode==XPRACTICE.DEBUG.extrapassthrukeycode) then
	
	--TODO NEXT: --!!!
	if(keycode=="ENTER" or keycode=="/" or keycode==XPRACTICE.DEBUG.extrapassthrukeycode or (XPRACTICE.DEBUG.extrapassthrukeycode and keycode=="V")) then
		-- ENTER and / keys pass through so the player can still access chat
		self:SetPropagateKeyboardInput(true)
	else
		-- (we still can't believe this works.  would not be surprised if it breaks in a future patch)
		self:SetPropagateKeyboardInput(false)
	end
	
	if(keycode=="ESCAPE") then
		if(XPRACTICE.DEBUG.instantquit==true) then
			if(_XPRACTICE)then
				print("XPRACTICE.DEBUG.instantquit")
				_XPRACTICE:Shutdown()
			end
			return
		end
		-- if(XPRACTICE.DEBUG.instantshiftquit==true)then
			-- if(XPRACTICE.game.keys.shift.current==true)then
				-- XPRACTICE:Shutdown()
				-- return
			-- end
		-- end
		-- if(XPRACTICE.forceshutdowntimer==nil)then
			-- XPRACTICE.forceshutdowntimer=XPRACTICE.FORCESHUTDOWNDURATION --TODO: const
		-- end
	end

	self.parentwindow.game:OnKeyChange(self,keycode,binding,true)
end
function XPRACTICE.DraggableGameWindow:OnKeyUp(keycode,binding)
	self.parentwindow.game:OnKeyChange(self,keycode,binding,false)
end


function XPRACTICE.DraggableGameWindow:Cleanup(game,xpractice)	
	self.environments={}
	self.inputframe.parentwindow=nil	
	self.inputframe:SetScript("OnMouseDown", nil)
	self.inputframe:SetScript("OnMouseUp", nil)		
	self.inputframe:SetScript("OnMouseWheel", nil)
	self.inputframe:SetScript("OnKeyDown", nil)
	self.inputframe:SetScript("OnKeyUp", nil)
	self.inputframe:SetScript("OnUpdate", nil)
	self.inputframe:Cleanup()
	self.frame:Cleanup()	
	self.titleregion:Cleanup()
	-- we did some extra things with titleregion that ReusableFrames isn't expecting; clean that up here
	self.titleregion:SetScript("OnDragStart", nil);self.titleregion:SetScript("OnDragStop", nil)	
	self.titleregion:RegisterForDrag();
	self.frame:SetMovable(false)
	self.bordergraphic:Cleanup()
	self.background:Cleanup()
	if(self.closebutton)then
		self.closebutton:Cleanup()
	end
	self.game=nil
	self.xpractice=nil
end

	
