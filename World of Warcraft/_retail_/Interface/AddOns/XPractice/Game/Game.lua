
SetScreenResolution_old = SetScreenResolution
SetScreenResolution=function(index)
	--TODO LATER: do something when we detect screen resolution was changed
	SetScreenResolution_old(index)
end



XPRACTICE.Game = {}
XPRACTICE.Game.__index = XPRACTICE.Game

function XPRACTICE.Game.new()
	local self=setmetatable({}, XPRACTICE.Game)	
	return self
end

function XPRACTICE.Game:Setup(xpractice)	

	if(not XPRACTICE_SAVEDATA.Config)then
		XPRACTICE_SAVEDATA.Config={}	
	end
	if(not XPRACTICE_SAVEDATA.Config.OriginalMouseSpeed)then
		XPRACTICE.MouseWatchdog.RecordMouseInfo()
	end
	XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=XPRACTICE_SAVEDATA.Config.SCREEN_SIZE or XPRACTICE.Config.SCREEN_SIZE
	XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH or XPRACTICE.Config.SCREEN_WIDTH
	XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT or XPRACTICE.Config.SCREEN_HEIGHT
	XPRACTICE_SAVEDATA.Config.FrameStrata=XPRACTICE_SAVEDATA.Config.FrameStrata or XPRACTICE.Config.FrameStrata

	XPRACTICE_SAVEDATA.Config.Keybinds=XPRACTICE_SAVEDATA.Config.Keybinds or {}
	XPRACTICE_SAVEDATA.Config.Camera=XPRACTICE_SAVEDATA.Config.Camera or {}
	XPRACTICE_SAVEDATA.Config.Camera.CameraSpeed=XPRACTICE_SAVEDATA.Config.Camera.CameraSpeed or XPRACTICE.Config.Camera.CameraSpeed
	
	
	if(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="1920")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=1920
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=1080
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="1600")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=1600
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=900
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="1280")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=1280
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=720
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="1024")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=1024
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=768	
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="800")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=800
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=600				
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="FULLSCREEN")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=UIParent:GetWidth()
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=UIParent:GetHeight()				
	else
		-- else custom; do nothing
	end

	self.SCREEN_WIDTH=XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH
	self.SCREEN_HEIGHT=XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT	
	
	local TITLEHEIGHT=20
	
	local titletext=XPRACTICE.TitleText
	
	self.xpractice=xpractice
	
	--XPRACTICE.PlayerCharacter.SetupCanPlayerDW()
	--XPRACTICE.Class.SetupClasses()
	
	self.windows={}
	self.window=XPRACTICE.DraggableGameWindow.new()
	self.window:Setup(self,self.SCREEN_WIDTH,self.SCREEN_HEIGHT,titletext,nil,true,function()self:Shutdown() end)	
	tinsert(self.windows,self.window)
	
	self.window.background:SetFrameStrata(XPRACTICE_SAVEDATA.Config.FrameStrata) --!!!
	self.InitialChatFrameStrata={}
	if(XPRACTICE.Config.ChatFrameStrata)then
		for i=1,8 do
			local framename="ChatFrame"..tostring(i)
			if(_G[framename])then
				self.InitialChatFrameStrata[i]=_G[framename]:GetFrameStrata()
				_G[framename]:SetFrameStrata(XPRACTICE.Config.ChatFrameStrata)
			end
		end
	end
	
	--TODO: each window gets its own screentransition object?
	
	
	-- self.hotbarwindow=XPRACTICE.DraggableGameWindow.new()
	-- self.hotbarwindow:Setup(self,xpractice,self.SCREEN_WIDTH,100,"",nil,false)
	-- self.hotbarwindow.background:ClearAllPoints()
	-- self.hotbarwindow.background:SetPoint("TOP",UIParent,"CENTER",0,-240)	
	
	self.rawinput=XPRACTICE.RawInput.new()
	self.keys=XPRACTICE.Keys.new()
	self.keys:Setup(self.rawinput)	
	
	self.environments={}
	
	
	-- realtime is only used for non-gameplay functions such as mouse highlight scanning
	-- reminder: GetTime is measured in SECONDS, not milliseconds
	self.realtime=GetTime()
	-- currenttime is the sum of all elapsed time each frame.  this is probably very close to realtime minus starting time.
	-- note that each environment tracks its own currenttime separately.  (TODO LATER: track environment.currenttime)
	self.currenttime=0
	
	self.nextmousehighlighttargetscantime=GetTime()			-- mouseover detection doesn't run every frame
	self.nextmousehighlighttargetscaninterval=0.100

	if(not XPRACTICE.DEBUG.quickloadscenario)then
		self:LoadScenarioByClass(XPRACTICE.Scenario_Menu)
		--self:LoadScenarioByClass(XPRACTICE.DEFAULTSCENARIO.Scenario)
	else		
		self:LoadScenarioByClass(XPRACTICE.ScenarioList[#XPRACTICE.ScenarioList].class)
	end
	
end


function XPRACTICE.Game:LoadScenarioByClass(scenarioclass)
	--if(self.scenario)then
		--self.scenario:Cleanup()
	--end
	self.currentscenarioclass=scenarioclass
	
	self.window:ClearVisibilityForScenarioLoad()
	
	for i=1,#self.environments do
		--TODO: if environments ever become unusable after cleanup, this will break things
		self.environments[i]:Cleanup()
	end
	
	self:RecreateEnvironments()
	
	local scenario=scenarioclass.new()
	--print("New scenario:",scenario)
	scenario:Setup(self)
	self.scenario=scenario
end

function XPRACTICE.Game:ReloadSameScenario()
	if(self.currentscenarioclass)then
		self:LoadScenarioByClass(self.currentscenarioclass)
	end
end

function XPRACTICE.Game:RecreateEnvironments()
	--WARNING: call cleanup on existing environments first
	--TODO: do this automatically somehow
	
	self.environments={}

	local environment_gameplay=XPRACTICE.Environment.new()	
	self.environment_gameplay=environment_gameplay
	environment_gameplay:Setup(self,self.window.frame)
	self.window.background:SetFrameLevel(1)	
	self.window.inputframe:SetFrameLevel(2)	
	environment_gameplay.frame:SetFrameLevel(3)
	tinsert(self.window.environments,environment_gameplay)
	
	-- local environment_scenario=XPRACTICE.Environment.new()
	-- self.environment_scenario=environment_scenario
	-- environment_scenario:Setup(self,self.window.frame)
	-- tinsert(self.window.environments,environment_scenario)	
	
	-- local environment_hud=XPRACTICE.Environment_HUD.new()
	-- self.environment_hud=environment_hud
	-- environment_hud:Setup(self,self.window.frame)
	-- environment_hud.frame:SetFrameLevel(255)
	-- tinsert(self.window.environments,environment_hud)
	
	
	-- local environment_hotbar=XPRACTICE.Environment_HUD.new()	--XPRACTICE.Environment_Menu.new()	
	-- self.environment_hotbar=environment_hotbar
	-- --!!!
	-- --environment_hotbar:Setup(self,self.hotbarwindow.frame)
	-- environment_hotbar:Setup(self,self.window.frame)
	-- environment_hotbar.cameramanager.camera.objectanchor="BOTTOMLEFT"
	-- --!!!
	-- self.hotbarwindow.background:Hide()
	-- tinsert(self.window.environments,environment_hotbar)	
	
	-- --TODO: move to environment_hotbar (which does not exist yet)
	-- --TODO: rename to hotbar_controller / environment_hotbar?
	-- local spellbuttoncontroller=XPRACTICE.SpellButtonController.new()
	-- spellbuttoncontroller:Setup(environment_hotbar)
	-- self.spellbuttoncontroller=spellbuttoncontroller
end


function XPRACTICE.Game:OnMouseChange(window,button,state)
	--OnMouseUp events are broken in patch 10.1.  as a workaround, we are using IsMouseButtonDown in Keys:BeginStep
	-- we still use OnMouseDown events so that buttons don't "click through"
	if(button=="LeftButton")then
		self.rawinput:SetKey("LMOUSE",state)
	elseif(button=="RightButton")then
		self.rawinput:SetKey("RMOUSE",state)		
	elseif(button=="MiddleButton")then
		self.rawinput:SetKey("MMOUSE",state)
	end
	
end
function XPRACTICE.Game:OnMouseWheel(window,delta)
	--TODO: window
	self.rawinput.keys["WMOUSE"]:SetMouseWheel(delta)
end
function XPRACTICE.Game:OnKeyChange(window,keycode,binding,state)
	--print("OnKeyDown",keycode,binding,state)
	--print(keycode,self.rawinput.keys[keycode])
	
	--TODO LATER: shift/ctrl/alt compatibility
	if(state==true and self.pendingkeybindbutton)then
		if(keycode=="ESCAPE")then
			-- cancel assignment, but don't exit the options menu
			state=false
		else
			self.keys:ReplaceKey(self.pendingkeybindbutton.keybindname,keycode)
			local buttons=self.pendingkeybindbutton.scenario.keybindbuttons
			for i=1,#buttons do
				buttons[i]:Set()
			end
		end
		--TODO: actually set the keybind
		--TODO: unselect button
		self.pendingkeybindbutton:Select(false)
		self.pendingkeybindbutton=nil
	end
	
	if(self.rawinput.keys[keycode])then
		self.rawinput.keys[keycode]:SetKey(state)
	end
	
	if(keycode=="ESCAPE" and state==true)then
		--TODO: this triggers esc key for both scenario and playercontroller at the same time
		self.scenario:OnEscapeKey()
	end
end

function XPRACTICE.Game:MainGameLoop(elapsed)
	--elapsed=elapsed*2.0	--do-it-yourself speed multiplier
	self.realtime=GetTime()
	self.currenttime=self.currenttime+elapsed

	self.rawinput:BeginStep()

	for i=1,#self.windows,1 do
		self.windows[i]:Step(elapsed)
	end
	
	--TODO: environment:StartOfFrame -- increment environment.currenttime there
	for i=1,#self.environments,1 do
		self.environments[i]:IncrementTime(elapsed)
	end		
	
	--TODO: preferably loop through playercontrol objects only
	for i=1,#self.environments,1 do
		self.environments[i]:GetPlayerInput(elapsed)
	end		
	-- --TODO: rename to AIStep or AIPhase?
	-- for i=1,#self.environments,1 do
		-- self.environments[i]:AI(elapsed)
	-- end		
	
	if(self.scenario)then
		self.scenario:Step(elapsed)
	end
	

	for i=1,#self.environments,1 do
		self.environments[i]:Step(elapsed)
	end	
	-- for i=1,#self.environments,1 do
		-- self.environments[i]:PreMove(elapsed)
	-- end
	-- for i=1,#self.environments,1 do
		-- self.environments[i]:Move(elapsed)
	-- end	
	-- for i=1,#self.environments,1 do
		-- self.environments[i]:PostMove(elapsed)
	-- end

	-- for i=1,#self.environments,1 do
		-- self.environments[i]:CombatPhase_CollisionCheck_VoidZone(elapsed)
	-- end	
	for i=1,#self.environments,1 do
		self.environments[i]:CombatPhase(elapsed)
	end			
	-- for i=1,#self.environments,1 do	
		-- --TODO LATER: rename to Animate, or write separate Animate function
		-- self.environments[i]:PreDraw(elapsed)
	-- end			
	for i=1,#self.environments,1 do
		self.environments[i]:Draw(elapsed)
	end		
	for i=1,#self.environments,1 do
		self.environments[i]:EndOfFrame(elapsed)
	end
	
	self.rawinput:EndStep()
	self.keys:EndStep()
	

end

function XPRACTICE.Game:ResetModelsAfterScreenRatioChange()
	for i=1,#self.environments,1 do
		self.environments[i]:ResetModelsAfterScreenRatioChange()
	end
end

function XPRACTICE.Game:SetScreenDimensionsFromSavedata()
	if(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="1920")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=1920
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=1080
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="1600")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=1600
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=900
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="1280")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=1280
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=720
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="1024")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=1024
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=768	
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="800")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=800
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=600				
	elseif(XPRACTICE_SAVEDATA.Config.SCREEN_SIZE=="FULLSCREEN")then
		XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH=UIParent:GetWidth()
		XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT=UIParent:GetHeight()				
	else
		-- else custom; do nothing
	end

	self.SCREEN_WIDTH=XPRACTICE_SAVEDATA.Config.SCREEN_WIDTH
	self.SCREEN_HEIGHT=XPRACTICE_SAVEDATA.Config.SCREEN_HEIGHT	
	
	self:Resize(self.SCREEN_WIDTH,self.SCREEN_HEIGHT)
end

function XPRACTICE.Game:Resize(width,height)
	self.window:Resize(width,height)
	self.SCREEN_WIDTH=width
	self.SCREEN_HEIGHT=height
	for i=1,#self.environments do
		self.environments[i]:ResizeToWindow(self.window.frame)
	end
end

function XPRACTICE.Game:Shutdown()
	self.dead=true
	self:Cleanup()
	self.xpractice:RemoveDeadGames()
end

function XPRACTICE.Game:Cleanup()
	if(XPRACTICE.Config.ChatFrameStrata and XPRACTICE.MULTIPLAYER.InitialChatFrameStrata)then
		for i=1,8 do
			local framename="ChatFrame"..tostring(i)
			if(_G[framename] and self.InitialChatFrameStrata[i])then
				_G[framename]:SetFrameStrata(XPRACTICE.MULTIPLAYER.InitialChatFrameStrata[i])
			end
		end
	end

	--TODO: maintain list of windows
	self.window:Cleanup()
	--self.hotbarwindow:Cleanup()
	self.keys:Cleanup()
	self.rawinput:Cleanup()
	
	for i=1,#self.environments,1 do
		local environment=self.environments[i]
		environment:Cleanup()
		--<s>TODO: environment.frame:cleanup was moved here from environment:cleanup so as not to break loadscenario.  however, it's not a great system by any stretch of the imagination		</s>
		--environment.frame:Cleanup()
	end
	
	--TODO LATER: more cleanup where necessary	
end







