
XPRACTICE.Environment = {}
XPRACTICE.Environment.__index = XPRACTICE.Environment

function XPRACTICE.Environment.new()
	local self=setmetatable({}, XPRACTICE.Environment)	
	return self
end

-- every environment needs a parent frame (though not necessarily a visible one) 
-- (TODO LATER: check if parentframe invisibility messes with character modelframe properties)
-- Parent frame object is responsible for adding this environment to its event caller list

function XPRACTICE.Environment:Setup(game,gameframe)
	self.game=game
	-- Environment has its own ReusableScrollFrame which is anchored to the parent frame.
	-- We don't use scrollframe's built-in scrolling functions.
	--  (TODO LATER: okay, actually we do use scrollframe's built-in scrolling functions.
	--				figure out to what extent we use the built-in scrolling functions.)
	
	self.frame=XPRACTICE.ReusableScrollFrames:GetFrame()
	--print("Environment frame:",self.frame)
	self.frame:SetWidth(gameframe:GetWidth())
	self.frame:SetHeight(gameframe:GetHeight())
	self.frame.parent=gameframe
	self.frame:SetParent(self.frame.parent)
	self.frame.scrollframe:SetParent(self.frame.parent)
	self.frame.scrollframe:SetWidth(self.frame:GetWidth())
	self.frame.scrollframe:SetHeight(self.frame:GetHeight())
	self.frame:SetAllPoints(gameframe)
	self.frame.scrollframe:SetAllPoints(gameframe)
	self.frame:Show()
	self.frame.scrollframe:Show()
	self.frame.scrollframe:SetScrollChild(self.frame)
	self.frame:SetAlpha(1)
	
	
	-- each Environment also has its own ModelScene frame(s)
	self.modelsceneframe=XPRACTICE.ReusableModelSceneFrames:GetFrame()
	self.modelsceneframe:SetParent(self.frame)
	self.modelsceneframe:SetAllPoints(self.frame)
	self.modelsceneframe:Show()
	self.modelsceneframe:SetAlpha(1)
	self.modelsceneframe:SetCameraPosition(0,-10,1)
	self.modelsceneframe:SetCameraOrientationByYawPitchRoll(math.pi/2,0,0)
	self.modelsceneframe:SetFrameLevel(100)
	--!!!
	--self.modelsceneframe:SetFogColor(1,1,1,1)
	--print(self.modelsceneframe:GetFogFar())
	--self.modelsceneframe:SetFogFar(100)
	--print(self.modelsceneframe:GetCameraFarClip())
	
	self.modelsceneframe:SetCameraFarClip(200)
	
	
	self.hudframe=XPRACTICE.ReusableFrames:GetFrame()
	self.hudframe:SetParent(self.frame)
	self.hudframe:SetAllPoints(gameframe)
	self.hudframe:Show()
	self.hudframe:SetAlpha(1)
	
	
	-- self.modelsceneframe_floor=XPRACTICE.ReusableModelSceneFrames:GetFrame()
	-- self.modelsceneframe_floor:SetParent(self.frame)
	-- self.modelsceneframe_floor:SetAllPoints(self.frame)
	-- self.modelsceneframe_floor:Show()
	-- self.modelsceneframe_floor:SetAlpha(1)
	-- self.modelsceneframe_floor:SetCameraPosition(0,-10,1)
	-- self.modelsceneframe_floor:SetCameraOrientationByYawPitchRoll(math.pi/2,0,0)
	-- self.modelsceneframe_floor:SetFrameLevel(90)
	
	
	self.newgameobjects={}
	
	self.objectlists={}
	self.gameobjects={}
	tinsert(self.objectlists,self.gameobjects)
	self.mobs={}
	tinsert(self.objectlists,self.mobs)
	self.nameplates={}
	tinsert(self.objectlists,self.nameplates)
	self.mobclickzones={}
	tinsert(self.objectlists,self.mobclickzones)
	self.raiders={}
	tinsert(self.objectlists,self.raiders)
	self.voidzones={}
	tinsert(self.objectlists,self.voidzones)
	
	
	self.localtime=0
	
	self:SetCameraManager()
	--self:CreateMainCastingBar() --!!!
	
	
	tinsert(game.environments,self)
end


function XPRACTICE.Environment:CreateDefaultCamera()
	-- this function is called from CameraManager
	--override, don't call super
	return XPRACTICE.Camera.new()
end

function XPRACTICE.Environment:SetCameraManager()
	self.cameramanager=XPRACTICE.CameraManager.new()
	self.cameramanager:Setup(self)
end

-- --TODO: maybe only environment_gameplay gets a maincastingbar?
-- function XPRACTICE.Environment:CreateMainCastingBar()
	-- self.maincastingbar=XPRACTICE.CastingBar.new()
	-- self.maincastingbar:Setup(self)
	-- self.maincastingbar.position={x=50,y=50,z=0}
-- end

function XPRACTICE.Environment:IncrementTime(elapsed)
	self.localtime=self.localtime+elapsed
	-- for i=1,#self.gameobjects,1 do
		-- self.gameobjects[i]:IncrementTime(elapsed)
	-- end
end

function XPRACTICE.Environment:GetPlayerInput(elapsed)	
	for i=1,#self.gameobjects,1 do
		--TODO: preferably loop through playercontrolled objects only
		--print("GetPlayerInput:",self.gameobjects[i])
		self.gameobjects[i]:GetPlayerInput(elapsed)
	end
end
-- function XPRACTICE.Environment:AI(elapsed)
	-- for i=1,#self.gameobjects,1 do
		-- self.gameobjects[i]:AI(elapsed)
	-- end
-- end

function XPRACTICE.Environment:Step(elapsed)
	for i=1,#self.gameobjects,1 do
		self.gameobjects[i]:Step(elapsed)
	end
end
-- function XPRACTICE.Environment:PreMove(elapsed)
	-- for i=1,#self.gameobjects,1 do
		-- self.gameobjects[i]:PreMove(elapsed)
	-- end
-- end
-- function XPRACTICE.Environment:Move(elapsed)
	-- for i=1,#self.gameobjects,1 do
		-- self.gameobjects[i]:Move(elapsed)
	-- end
-- end
-- function XPRACTICE.Environment:PostMove(elapsed)
	-- for i=1,#self.gameobjects,1 do
		-- self.gameobjects[i]:PostMove(elapsed)
	-- end
-- end
-- --TODO: split CombatPhase up into multiple steps (even more steps than we have now)
-- function XPRACTICE.Environment:CombatPhase_CollisionCheck_VoidZone(elapsed)
	-- for i=1,#self.mobs,1 do	
		-- self.mobs[i]:CombatPhase_CollisionCheck_VoidZone(elapsed)
	-- end
-- end
function XPRACTICE.Environment:CombatPhase(elapsed)
	for i=1,#self.mobs,1 do	
		self.mobs[i]:CombatPhase(elapsed)
	end
end
-- function XPRACTICE.Environment:PreDraw(elapsed)
	-- for i=1,#self.gameobjects,1 do
		-- self.gameobjects[i]:PreDraw(elapsed)
	-- end
-- end
function XPRACTICE.Environment:Draw(elapsed)
	for i=1,#self.gameobjects,1 do
		self.gameobjects[i]:Draw(elapsed)
	end
	
	-- --print("environment.cameramanager.camera:",self.camera)
	-- if(self.cameramanager.camera)then		
		-- self.cameramanager.camera:ArrangeAllGameObjects(self.gameobjects)	
	-- end
	

end
-- function XPRACTICE.Environment:SetObjectVisibility(elapsed)
	-- for i=1,#self.gameobjects,1 do
		-- --TODO: move to camera instead?
	-- end
-- end



function XPRACTICE.Environment:SelectMob(mob)
	for i=1,#self.mobs do
		self.mobs[i]:SetSelected(false)
	end
	if(mob)then
		mob:SetSelected(true)
	end

end

function XPRACTICE.Environment:EndOfFrame(elapsed)
	for i=1,#self.newgameobjects,1 do
		self.newgameobjects[i]:TransferFromEnvironmentNewobjectLists(self)
		--print("New game object:",self.newgameobjects[i])
		--print(self.newgameobjects[i].x,self.newgameobjects[i].y)
	end
	self.newgameobjects={}
	
	for i=#self.gameobjects,1,-1 do
		local obj=self.gameobjects[i]
		if(obj.dying)then
			obj:Cleanup()	-- this SHOULD set dead to true
			if(not obj.dead) then
				-- jump into GameObject file before crashing noisily
				obj:FatalErrorObjNotDeadAfterCleanup()
			end
			--TODO: move tremove to proposed list of object lists below
			tremove(self.gameobjects,i)
		end
	end
	for j=1,#self.objectlists do
		local objectlist=self.objectlists[j]
		for i=#objectlist,1,-1 do
			local obj=objectlist[i]
			if(obj.dead)then
				tremove(objectlist,i)
			end
		end
	end
end


function XPRACTICE.Environment:ResetModelsAfterScreenRatioChange()
	--print("Resetting models...")
	for i=1,#self.gameobjects,1 do
		self.gameobjects[i]:ResetModelAfterGraphicsChange()
	end
end


function XPRACTICE.Environment:MouseCoordinatesToWindowCoordinates(x,y)
	local uiscale,globalx,globaly=UIParent:GetEffectiveScale(),x,y
	local gamescale=self.frame:GetScale()
	-- must divide by uiscale
	-- TODO: do we also need to divide by gamescale?  environment_world divides by gamescale
	-- (for now, we are dividing by gamescale)
	globalx=globalx/uiscale/gamescale
	globaly=globaly/uiscale/gamescale
	local left,bottom,width,height=self.frame:GetRect()
	--TODO: revise math and logic			
	local localx=globalx-left
	local localy=globaly-bottom		
	
	return localx,localy
end

--TODO: these are environmentcoordinates now, not windowcoordinates
function XPRACTICE.Environment:GetObjectsAtRectangleWindowCoordinates(objlist,x3,y3,w3,h3)
	local result={}
	local camera=self.cameramanager.camera
	local frame=self.game.window.frame
	local env=self

	for i=1,#objlist,1 do
		obj=objlist[i]
		
		-- --TODO: this changes depending on camera anchor						
		-- local x1=((obj.x-camera.x)+obj.drawable.clickarea.x-obj.drawable.clickarea.width/2)*camera.zoom+(frame:GetWidth()/2)
		-- local x2=((obj.x-camera.x)+obj.drawable.clickarea.x+obj.drawable.clickarea.width/2)*camera.zoom+(frame:GetWidth()/2)
		
		-- --TODO: should clickarea.y be affected by ystretch? (would need to adjust gameobject.screenyoffset too)
		-- local y1=(obj.y*camera.ystretch-camera.y*camera.ystretch+obj.drawable.clickarea.y)*camera.zoom+(frame:GetHeight()/2)
		-- local y2=(obj.y*camera.ystretch-camera.y*camera.ystretch+obj.drawable.clickarea.y+obj.drawable.clickarea.height)*camera.zoom+(frame:GetHeight()/2)
		
		-- --TODO: this changes depending on camera anchor						
		 -- local x1=((obj.x)+obj.drawable.clickarea.x-obj.drawable.clickarea.width/2)+(frame:GetWidth()/2)
		 -- local x2=((obj.x)+obj.drawable.clickarea.x+obj.drawable.clickarea.width/2)+(frame:GetWidth()/2)
		
		 -- --TODO: should clickarea.y be affected by ystretch? (would need to adjust gameobject.screenyoffset too)
		 -- local y1=(obj.y*camera.ystretch+obj.drawable.clickarea.y)+(frame:GetHeight()/2)
		 -- local y2=(obj.y*camera.ystretch+obj.drawable.clickarea.y+obj.drawable.clickarea.height)+(frame:GetHeight()/2)
		
		
		--TODO: this changes depending on camera anchor						
		 local x1=((obj.x)+obj.drawable.clickarea.x-obj.drawable.clickarea.width/2)
		 local x2=((obj.x)+obj.drawable.clickarea.x+obj.drawable.clickarea.width/2)
		
		 --TODO: should clickarea.y be affected by ystretch? (would need to adjust gameobject.screenyoffset too)
		 local y1=(obj.y+obj.drawable.clickarea.y)
		 local y2=(obj.y+obj.drawable.clickarea.y+obj.drawable.clickarea.height/camera.ystretch)
		
		--if(obj.clickbox.drawable)then	print("Env y2-y1:",y2-y1,"clickbox:",obj.clickbox.drawable.height,"y3:",y3)	end
		
		

		
		local w1=x2-x1
		local h1=y2-y1
		
		
		
		-- if(obj.TEMP_TAG)then	
			-- print("tagged")
			-- print("Obj",x1,y1,w1,h1)
			-- print("Select",x3,y3,w3,h3)
			-- --print("obj.y+offset:",obj.y+obj.drawable.clickarea.y,"y3:",y3)
			-- --print("height:",h1," == ",y1+h1)
			-- --print("obj.drawable:",obj.drawable,"camera:",camera,"ystretch:",camera.ystretch)
			
			-- print("which environment am i:",self)
			-- -- if(camera.ystretch==1)then
				-- -- error(0)
			-- -- end
		-- end		 
				
		
		if(XPRACTICE.RectangleRectangleCollision(x1,y1,w1,h1,x3,y3,w3,h3))then
			tinsert(result,obj)
		end
	end
	return result
end


function XPRACTICE.Environment:GetFirstAttackableTarget(objs)
	local enemies={}
	for i=1,#objs,1 do
		if(objs[i].faction==XPRACTICE.Factions.ENEMY)then
			tinsert(enemies,objs[i])
		end
	end
	if(#enemies>0)then
		table.sort(enemies, function(a,b) return a.y>b.y end)
		--TODO: make sure [#enemies] is indeed correct and not [1] instead
		return enemies[#enemies]
	else
		return nil
	end
end


function XPRACTICE.Environment:WindowCoordinatesToCursorPosition(cursorx,cursory)

	local camera=self.cameramanager.camera
	if(not camera)then return 0,0 end
	
	--localx,localy store environment coordinates
	local localx,localy=cursorx,cursory			
	localx=localx-self.frame:GetWidth()/2
	localy=localy-self.frame:GetHeight()/2		


	--apparently don't need to add camera.x/camera.y here
	-- due to poorly-understood scrollframe mechanics...	(TODO: research)
	-- local hscroll,vscroll=camera:GetScrollAmounts()	
	--...but sometimes we have to get them anyway because scrollframe breaks.	
	--TODO: recent changes to camera (i.e. setscale) may have broken XPRACTICE.Scrollframes_Broken
	if(XPRACTICE.Scrollframes_Broken)then
		localx=localx+hscroll
		localy=localy+vscroll
	end
	
	--TODO: research (getcursorposition?)
	
	localy=localy/camera.ystretch
	-- don't need to divide by zoom with new setscale camera

	return localx,localy
end

function XPRACTICE.Environment:ResizeToWindow(gameframe)
	self.frame:SetWidth(gameframe:GetWidth())
	self.frame:SetHeight(gameframe:GetHeight())
	self.frame.scrollframe:SetWidth(self.frame:GetWidth())
	self.frame.scrollframe:SetHeight(self.frame:GetHeight())
end

function XPRACTICE.Environment:Cleanup()
	--TODO: WARNING: make sure cleanup doesn't break game:LoadScenario

	--TODO: separate cleanup-all-objects function from environment:cleanup?
	
	----<s>TODO: environment.frame:cleanup has been moved to game:cleanup, where we're sure we won't be using environment.frame for a different scenario	</s>
	
	--TODO: make sure newgameobjects get cleaned up too
	local i
	for i=#self.gameobjects,1,-1 do
		self.gameobjects[i]:Cleanup()
	end
	self.gameobjects={}

	self.frame:Cleanup()
	--must do this AFTER gameobject cleanup, or else gameobjects will attempt to double-cleanup their actor displayobjects
	self.modelsceneframe:Cleanup()	
	--self.modelsceneframe_floor:Cleanup()	--TODO: this conflicts with individual actor.cleanup
	self.hudframe:Cleanup()
	
end

