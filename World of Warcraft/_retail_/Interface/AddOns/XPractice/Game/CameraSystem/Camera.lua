do

	--TODO: some of these functions should be moved out of default camera
	local super=XPRACTICE.GameObject
	XPRACTICE.Camera = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Camera

	function class:SetCustomInfo()
		XPRACTICE.GameObject.SetCustomInfo(self)
		
		self.cdist=10
		self.orientation={yaw=0,pitch=0,roll=0}
		
		self.visible=false
		
		--TODO:
		-- this is currently used for mouse coordinate calculations
		-- we need to standardize this somehow
		self.objectanchor="CENTER"
		
		--TODO: change y to z everywhere?
		self.zoom=1	-- the multiplier applied to scrollframe
		self.zoomlevel=1 -- an arbitrary-ish number, affected by mousewheel, used to calculate zoom
		self.targetzoom=1
		
		self.ZOOM_CHANGE_SPEED=0.05	
		
		self.MIN_ZOOM=0.35			-- not used, apparently.  adjust PlayerCharacter's MIN_DIST and MAX_DIST instead.
		self.MAX_ZOOM=2.5
		
		
		
		self.x=0
		self.y=0
		self.targetlocation=nil
		self.snaptotarget=false
		
		--self.ystretch=0.5	
		
		self.heightangle=-math.pi*0.25	--standard
		--self.heightangle=-math.pi*0		-- for boss height-comparison purposes only
		
		self.ystretch=math.cos(-self.heightangle)
		--TODO: verify zstretch is correct
		self.zstretch=math.sin(-self.heightangle)
		--self.ystretch=1
		
		self.ysort=true

		
		--TODO: framelayer system is a bunch of special hardcoded cases
		--TODO: if drawable is ysortable, it currently goes in ysortframelevel regardless of drawable.setframelayer
		
		self:CreateFrameLayers()
		
		
		
		self.postysortframelevel=nil
		
		
		
		self.nextysorttime=0			-- ysort doesn't necessarily run every frame	
		--self.nextysortinterval=8/30.0		-- (unless the framerate is low enough)
		self.nextysortinterval=4/30.0		-- (unless the framerate is low enough)
			-- ysortinterval is added to CURRENT time (not scheduled time), so ysort will run slightly less often than expected.
										--TODO: if framerate is very low, throttle ysort rate
											--(sort "once every X frames" at low framerates instead)
		-- we also keep track of the total ysort frame level so we can put (eg) resource bars on top.
			-- that's "post" as in "after"
		-- postysort stores the highest historic sorted frame level.
		-- it never decreases.
		-- (this prevents "z-fighting" (not really z-fighting) among objects that try to set their framelayer every frame
		--  even though we don't call ysort on every frame.)
		self.postysortframelayer = self.ysortframelayer
		
		
		self.focus=nil
		self.phase=1	--TODO: XPRACTICE.Phases enum?
		
		self.environment.cameramanager:HookUpCamera(self)
		
	end

	function XPRACTICE.Camera:CreateFrameLayers()
	--TODO: framelayers should be recycled between our 3+ varieties of Camera
		
		local topframelevel=100		
		self.topframelevel=topframelevel
		local layer=topframelevel
		self.nameplateframelayer=XPRACTICE.FrameLayer.QuickSetup(self.topframelevel)
		-- if ysort is turned on, sorted objects will be drawn starting at this layer
		local ysortframelevel=50	
		self.ysortframelevel=ysortframelevel
		layer=ysortframelevel
		self.ysortframelayer=XPRACTICE.FrameLayer.QuickSetup(layer)
		layer=layer-1
		-- telegraphs, voidzones, etc are placed below the first ysorted object
		self.movementarrowframelayer=XPRACTICE.FrameLayer.QuickSetup(layer)
		layer=layer-1
		self.telegraphframelayer=XPRACTICE.FrameLayer.QuickSetup(layer)
		layer=layer-1
		self.voidzoneframelayer=XPRACTICE.FrameLayer.QuickSetup(layer)
		layer=layer-1
		self.targetcircleframelayer=XPRACTICE.FrameLayer.QuickSetup(layer)
		layer=layer-1
		self.shadowframelayer=XPRACTICE.FrameLayer.QuickSetup(layer)
		-- arena shape needs 2 layers (one for border, one for fill)
		layer=layer-1
		layer=layer-1
		self.arenaborderframelayer=XPRACTICE.FrameLayer.QuickSetup(layer)
		layer=layer-1
		self.floorframelayer=XPRACTICE.FrameLayer.QuickSetup(layer)	
		layer=layer-1
		self.skybox2framelayer=XPRACTICE.FrameLayer.QuickSetup(layer)		
		layer=layer-1
		self.skyboxframelayer=XPRACTICE.FrameLayer.QuickSetup(layer)	
		
		self.defaultframelayer=XPRACTICE.FrameLayer.QuickSetup(100)
	end


	function XPRACTICE.Camera:Step(elapsed)
		--!!!		disabled player input for aggramar.  100% auto-cam!
		-- also, apparently GetPlayerInput is called from Environment, so we shouldn't have called it from here anyway

		self:MoveToFocus(elapsed)
		self:PursueTargetZoom(elapsed)
		self:PursueTargetCoords(elapsed)
	end


	function XPRACTICE.Camera:MoveToFocus(elapsed)
	--TODO: smooth scrolling
	
		if(true)then return end	--!!!
		if(#self.focus==0)then return end

		local xmin,ymin,xmax,ymax
		local xtotal=0
		local ytotal=0
		for i=1,#self.focus do
			local focus=self.focus[i]
			if((not xmin) or (xmin>focus.x))then xmin=focus.x end
			if((not xmax) or (xmax<focus.x))then xmax=focus.x end
			if((not ymin) or (ymin>focus.y))then ymin=focus.y end
			if((not ymax) or (ymax<focus.y))then ymax=focus.y end
			xtotal=xtotal+focus.x
			ytotal=ytotal+focus.y
		end
		local extra=XPRACTICE.Mobile_ConvertYardsToTGUnits(5)
		xmin=xmin-extra
		ymin=ymin-extra
		xmax=xmax+extra
		ymax=ymax+extra
		--print(xmin,xmax,ymin,ymax)
		-- local xavg=xtotal/#self.focus	--TODO: maybe just (max+min)/2
		-- local yavg=ytotal/#self.focus
		local xavg=(xmax+xmin)/2
		local yavg=(ymax+ymin)/2
		
		self.targetlocation={x=xavg,y=yavg}

		local xdiff=xmax-xmin
		local ydiff=(ymax-ymin)*self.ystretch
		local maxdiff=math.max(xdiff,ydiff)
		if(maxdiff<1)then maxdiff=1 end
		--local zoom=600.0/maxdiff
		local zoom=450.0/maxdiff
		if(zoom>1.0)then zoom=1.0 end
		if(zoom<0.4)then zoom=0.4 end
		--print("Diff:",maxdiff,"Zoom:",zoom)
		
		
		self.targetzoom=zoom
		--!!!
		--self.zoom=zoom
		
		

	end





	function XPRACTICE.Camera:PursueTargetZoom(elapsed)
		if(self.zoom~=self.targetzoom)then
			local newzoom=self.zoom
			if(self.zoom>self.targetzoom)then
				newzoom=newzoom-1*(self.zoom-self.targetzoom)*elapsed
				if(newzoom<self.targetzoom)then
					newzoom=self.targetzoom
				end
			elseif(self.zoom<self.targetzoom)then
				newzoom=newzoom+1*(self.targetzoom-self.zoom)*elapsed
				if(newzoom>self.targetzoom)then
					newzoom=self.targetzoom
				end
			end
			self.zoom=newzoom
			--TODO:
			if(self.zoom<self.MIN_ZOOM)then self.zoom=self.MIN_ZOOM; self.targetzoom=self.zoom end
			if(self.zoom>self.MAX_ZOOM) then self.zoom=self.MAX_ZOOM; self.targetzoom=self.zoom end 	--!!!
		end
	end

	function XPRACTICE.Camera:PursueTargetCoords(elapsed)
		if(not self.targetlocation)then return end
		
		local distx=(self.targetlocation.x-self.x)
		local disty=(self.targetlocation.y-self.y)
		local distsqr=distx*distx+disty*disty
		if(self.snaptotarget)then
			--if(distsqr>XPRACTICE.Mobile_ConvertYardsToTGUnits(7*3)*elapsed)then
			if(distsqr>XPRACTICE.Mobile_ConvertYardsToTGUnits(7*5)*elapsed)then
				self.snaptotarget=false
			else
				self.x=self.targetlocation.x
				self.y=self.targetlocation.y
			end
		end
		if(not self.snaptotarget)then
			--if(distsqr<=XPRACTICE.Mobile_ConvertYardsToTGUnits(7)*elapsed)then
			if(distsqr<=XPRACTICE.Mobile_ConvertYardsToTGUnits(7*2)*elapsed)then
				self.snaptotarget=true
				self.x=self.targetlocation.x
				self.y=self.targetlocation.y			
			else
				self.x=self.x+(self.targetlocation.x-self.x)*elapsed*5.0
				self.y=self.y+(self.targetlocation.y-self.y)*elapsed*5.0
			end
		end
		

		--!!!
		--TODO: just give Camera an AI module...
		-- local vx,vy
		-- local unitvectorx=0
		-- local unitvectory=0
		-- local movespeed=XPRACTICE.Mobile_ConvertYardsToTGUnits(14)
		
		-- if(self.targetlocation)then
			-- --print("targetlocation")
			-- local distx=(self.targetlocation.x-self.x)
			-- local disty=(self.targetlocation.y-self.y)
			-- local distsqr=distx*distx+disty*disty
			-- --TODO: use self:GetFinalMoveSpeed() ^ 2 instead
			-- local movespeedelapsed=movespeed*(2*elapsed)
			-- local dist=math.sqrt(distsqr)	
			-- if(distsqr>movespeedelapsed*movespeedelapsed)then
				-- vx=distx
				-- vy=disty
			-- else			
				-- --TODO: don't set targetlocation nil if forced movement occurs
				-- -- (not sure how to properly do this yet.  check that xspeed and yspeed are 0?)
				-- self.targetlocation=nil
				-- vx=0
				-- vy=0
			-- end
		-- else	-- else no targetlocation
			-- vx=0
			-- vy=0	
		-- end
		-- if(vx~=0 or vy~=0)then
			-- local dist=math.sqrt(vx*vx+vy*vy)
			-- unitvectorx=vx/dist
			-- unitvectory=vy/dist
		-- end
		-- --print(movespeed,unitvectory,self.y)
		-- self.x=self.x+movespeed*unitvectorx*elapsed
		-- self.y=self.y+movespeed*unitvectory*elapsed
		
	end

	function XPRACTICE.Camera:AdjustZoomViaScrollWheel(delta)
		self.targetzoom=self.targetzoom+delta*self.ZOOM_CHANGE_SPEED	
		--TODO:
		if(self.targetzoom<self.MIN_ZOOM-0.2) then self.targetzoom=self.MIN_ZOOM-0.2 end
		--local maxzoom=1.5+.2
		local maxzoom=self.MAX_ZOOM+0.2
		--local maxzoom=6	
		if(self.targetzoom>maxzoom) then self.targetzoom=maxzoom end
		-- while it's possible to set target beyond min/max here,
		-- step event will automatically snap target to min/max when camera zoom reaches those limits
		
	end

	function XPRACTICE.Camera:SetScrollAndZoom()
		local hscroll,vscroll=self:GetScrollAmounts()
		
		
		--print(self,"0arrangeall",self.x,hscroll,self.environment.frame.scrollframe)
		--print(self,"GetHorizontalScroll:", self.environment.frame.scrollframe:GetHorizontalScroll())
		
		--TODO:
			-- SetScale breaks models but we fixed it with SetModelScale.
			-- Particle (i.e. spelleffect) graphics might still be broken		<-- yes.
		
		--print("Scrollframe",self.environment.frame.scrollframe)
		
		self.environment.frame.scrollframe:SetHorizontalScroll(hscroll)
		
		--TODO: at some point we should consider making vscroll negative to begin with rather than flipping it here
		self.environment.frame.scrollframe:SetVerticalScroll(-vscroll)
		
		-- SetScale affects 3D models in an unexpected way, but we fix them in Drawable_CharacterModel
			--TODO: it also affects non-character models in an even more unexpected way
		self.environment.frame:SetScale(self.zoom)	
	end

	function XPRACTICE.Camera:ArrangeAllGameObjects(objs)
		--self.x=self.x+1	-- self-evidently dubious
		if(not self.rot)then self.rot=0 end
		--self.rot=self.rot+0.04 -- self-evidently dubious

		self:SetScrollAndZoom()
		
		--print("VScroll:",self.environment.frame.scrollframe:GetVerticalScroll())
		--self.environment.frame:ClearAllPoints()
		--self.environment.frame:SetPoint("CENTER",self.environment.frame:GetParent(),"CENTER",hscroll,-vscroll)
		--print("SetPoint:",self.environment.frame:GetParent(),hscroll,-vscroll)
			
		
		for i=1,#objs,1 do
			local obj=objs[i]		
			--obj.x=obj.x+1 -- self-evidently dubious, but the other way around

			-- if(obj.drawable.frame.name=="XPRACTICE.ReusableFrame0")then
				-- print("ReusableFrame0:",obj.visible,obj.drawable.visible)
			-- end		
			
			--"obj.drawable" is the Drawable to be drawn (i.e. we're checking "does such a drawable exist")
			if(obj.drawable)then
				--print("obj.drawable")
				--"obj.visible" is a property (i.e. we're checking "is this drawn object currently visible")
				if(obj.drawable.visible)then
					--print("obj.drawable.visible")
					if(not obj.drawable.frame) then
						error("Object ",obj," drawable ",obj.drawable," does not have a frame (did we forget to run setup?)")
					end				

					--TODO: obj.drawable.x/y, not obj.x/y
						--(we thought we made this change a long time ago, but apparently changed it only very recently? keep an eye on it)
					local x,y=(obj.drawable.x),(obj.drawable.y)*self.ystretch
					y=y+(obj.screenyoffset)
					y=y+(obj.drawable.z)*self.zstretch
					
					
					if(XPRACTICE.Scrollframes_Broken)then
						x=x-hscroll
						y=y-vscroll
					end
					
						
					--TODO: obj.z
					--TODO: store width/height in obj instead of obj.drawable?
						-- (would make switching out drawables easier)
					local wid,hgt=obj.drawable.width,obj.drawable.height
					local yaw,pitch=obj.currentfacing,self.heightangle
					
					--print("camera calls ArrangeFrame",obj,self.objectanchor,x,y,wid,hgt,yaw,pitch,self.zoom)				
					obj.drawable:ArrangeFrame(self.objectanchor,x,y,wid,hgt,yaw,pitch,self.zoom)
					
					--obj.drawable:ArrangeFrame(self.objectanchor,x,y,200,200,yaw,pitch,self.zoom) -- dubious
				
					obj.drawable:ShowFrames()
					--obj.drawable.frame:SetAlpha(1)
				
					-- if(obj.shadowframe)then
						-- obj.shadowframe:SetWidth(obj.shadowdiameter*self.zoom)
						-- obj.shadowframe:SetHeight(obj.shadowdiameter*self.ystretch*self.zoom)
					-- end
					
					
					
					-- if(obj.modelframe)then
						
						-- local modelinfo=obj:GetModelInfo()
						
						-- local cameradistance=modelinfo.cameradistance
						-- local modelframescale=modelinfo.framescale
						-- local shadowscale=modelinfo.shadowscale
					
						-- obj.modelframe:SetWidth(obj.width*modelframescale*shadowscale)
						-- obj.modelframe:SetHeight(obj.height*modelframescale*shadowscale)
						
						-- --obj.modelframe:SetModelScale(1)
						-- obj.modelframe:SetCustomCamera(1)
								
						-- --local heightangle=-math.pi*0.45
						
						-- --local heightangle=-math.pi*0

						-- --obj:SetOrientation(cameradistance,obj.currentfacing,self.heightangle)
						-- obj:SetOrientation(cameradistance,0,self.heightangle)
						-- obj.modelframe:SetFacing(obj.currentfacing)
						-- obj.modelframe:SetCameraTarget(0,0,0)
						
						-- --obj.modelframe:SetAnimation(0)

						-- local pivotx,pivoty,pivotz=0,0,0
						
						-- local ox,oy
						-- local angle=-self.rot
						

						-- obj.modelframe:ClearAllPoints(obj.frame)
						-- obj.modelframe:SetPoint("CENTER",obj.frame,"BOTTOM",0,0)
						
						-- obj.modelframe:SetModelScale(1)				
					-- end
				else	-- end visible check
					obj.drawable:HideFrames()
					--obj.drawable.frame:SetAlpha(0)
				end
			end	-- end drawable-exists check
		end		-- end arrange loop
		
		
		local toplayer=self.ysortframelevel
		if(self.ysort) then	
			--TODO: maybe self.realtime instead of self.game.realtime?			
			if(self.environment.game.realtime>self.nextysorttime)then
				self.nextysorttime=self.environment.game.realtime+self.nextysortinterval
				local tempysort={}
				for i=1,#objs,1 do 
					if(objs[i].ysortable==true)then
						tinsert(tempysort,objs[i]) 					
					end
				end
				--print("Ysorting",#tempysort,"objects")
				table.sort(tempysort, function(a,b) return a.y>b.y end)			
				--print("Camera: ysorting",#tempysort,"of",#objs)
				for k,v in ipairs(tempysort) do 	
					--TODO: move to overrideable function that takes layer number as argument and returns number of used layer
							-- (or maybe not, since we separated shadows+hpbars from character models)
					
					toplayer=v.drawable:SetSortedFrameLevels(toplayer)

					-- if(self.player~=nil and v==self.player)then
						--print("Environment.lua: Player is now on layer "..layer)
					-- end
				end
			end		
		end
		
		if((not self.postysortframelevel) or toplayer>self.postysortframelevel)then self.postysortframelevel=toplayer end
		
		
		for i=1,#objs,1 do 
			if(objs[i].drawable)then
				if(not objs[i].ysortable)then
					if(objs[i].drawable.updateframelevel)then
						objs[i].drawable:SetFrameLevel()
						objs[i].drawable.updateframelevel=false
						--print("GetFrameLevel",objs[i].drawable.framelayer.level,objs[i].drawable.frame:GetFrameLevel())
					end			
				end
			end
		end
		
		-- --TODO: leave reminder, somewhere appropriate, that this is called every frame whereas ysort is not
		-- for i=1,#objs,1 do
			-- local obj=objs[i]
			-- if(obj.visible and obj.drawable)then			
				-- obj.drawable:SetCustomFrameLevels(self.ysortframelayer,self.postysortframelayer)			
			-- end
		-- end	
	end


	function XPRACTICE.Camera:GetScrollAmounts()

		-- There is an issue with scrollframes in that objects are apparently
		-- scaled from the top left corner rather than from the center.
			
		-- Thus in addition to scrolling based on camera's position, we also
		-- calculate an offset based on current zoom and screen size.
			
		-- for example, if a character is supposed to be in the middle of the screen:
			-- zoom=0.1: character at 5%, offset 45%
			-- zoom=0.5: character at 25%, offset 25%
			-- zoom=1: character at 50%, offset 0
			-- zoom=1.5: character at 75%, offset -25%

		--TODO: wait, is this function breaking 3Dcamera?  should be disabled for it...
			
		local multiplier=(0.5-(self.zoom*0.5))/self.zoom
		local hoffset=-multiplier*self.environment.frame.scrollframe:GetWidth()	
			--voffset is negative of what we'd expect, since scrollframe works from TOP left corner
		local voffset=multiplier*self.environment.frame.scrollframe:GetHeight()
			
		return self.x+hoffset,self.y*self.ystretch+voffset
	end

	-- NOT USED
	function XPRACTICE.Camera:SetObjectVisibility(objs)
		if(true)then return end
		--TODO LATER: this doesn't take camera clipping into account
		-- (might not need to worry about that if the 3D camera overrides this function entirely)
		for i=1,#objs,1 do
			local obj=objs[i]
			if(obj.frame)then
				if(obj.visible~=obj.frameisvisible)then
					if(obj.visible)then
						obj.frame:Show()					
					else
						obj.frame:Hide()
					end
					--TODO LATER: this line may or may not cause problems later because of clipping reasons
					obj.visible=obj.frameisvisible
				end
			end
		end
	end

	--TODO: rename LocalCoordsToYStretchCoords
	-- also, check if we still use this function or not
	function XPRACTICE.Camera:LocalCoordsToCameraCoords(x,y)
		if(true)then return x,y end --dubious, maybe (maybe not)
		--local xoffset,yoffset=self:GetScrollOffset()
		local xoffset,yoffset=0,0
		x=(x-xoffset)/self.zoom
		y=(y-yoffset)/self.zoom
		y=y/self.ystretch
		return x,y
	end

	function XPRACTICE.Camera:ConvertObjectCoordsToMouseoverCoords(x,y,obj)
		local envoffsetx,envoffsety
		local objoffsetx,objoffsety
		if(self.objectanchor=="CENTER") then
			envoffsetx=0;envoffsety=0
		end
		if(self.objectanchor=="TOPLEFT")then
			--TODO: don't hardcode screen size
			--TODO: current screen size is wrong anyway
			--return x+640/2,y+480/2
			envoffsetx=-640/2;envoffsety=480/2
		end
		
		if(obj.alignment=="CENTER")then
			objoffsetx=0;objoffsety=0
		end
		if(obj.alignment=="TOPLEFT")then
			objoffsetx=obj.frame:GetWidth()/2;objoffsety=-obj.frame:GetHeight()
			--objoffsetx=0;objoffsety=0
		end	
		
		return x+envoffsetx+objoffsetx,y+envoffsety+objoffsety	
	end

	function XPRACTICE.Camera:WindowCoordsToCameraCoords(x,y)
		local camerax,cameray=x,y
		local adjustedzoom=self.zoom
		camerax=camerax*(1/adjustedzoom)
		cameray=cameray*(1/adjustedzoom)
		cameray=cameray*(1/self.ystretch)
		return camerax,cameray
	end

	function class:Draw()
		local msf=self.environment.modelsceneframe
		-- local msf_floor=self.environment.modelsceneframe_floor
		
		self.position.x,self.position.y,self.position.z=XPRACTICE.MatrixMultiplicationRotation2(-self.cdist,0,0,0,self.orientation.pitch,self.orientation.yaw)
		self.position.z=self.position.z+1
				--print(self.position.x,self.position.y,self.position.z)
		
		-- TODO: move to camerafocus.position
		if(self.focus)then
			self.position.x=self.position.x+self.focus.position.x
			self.position.y=self.position.y+self.focus.position.y
			self.position.z=self.position.z+self.focus.position.z		
			self.phase=self.focus.phase
		end
		
		msf:SetCameraPosition(self.position.x,self.position.y,self.position.z)
		msf:SetCameraOrientationByYawPitchRoll(self.orientation.yaw,self.orientation.pitch,self.orientation.roll)
		-- msf_floor:SetCameraPosition(self.position.x,self.position.y,self.position.z)
		-- msf_floor:SetCameraOrientationByYawPitchRoll(self.orientation.yaw,self.orientation.pitch,self.orientation.roll)
		
		
		
	end
end