do
	local super=XPRACTICE.ScenarioPlayerControls
	XPRACTICE.ScenarioPlayerControls_CharacterMode = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ScenarioPlayerControls_CharacterMode

	
	function class:CreateAssociatedObjects()	
		-- -- dubious
		-- local selection=XPRACTICE.Selection_ClickOnly.new()
		-- -- --TODO: better references than going through game
		-- selection:Setup(self.environment.game.environment_hud,self.environment.game.environment_gameplay)
		-- --print("selection:Setup")
	end

	function class:GetPlayerInput(elapsed)
		-- don't call super 
		--TODO: might have to call super after we rewrite base ScenarioPlayerControls class
		
		
		if(self.player)then		
			local vectorx,vectory
			
			--TODO: involuntarymovement shouldn't be in PlayerControls class
			vectorx,vectory=self:GetCharacterMovementInputUnitVector()
			self.player.attemptedmovementunitvectorx=vectorx
			self.player.attemptedmovementunitvectory=vectory

			
			
			-- arbitrary; we want this to be greater than max movement speed at least
			-- (it doesn't affect movement speed, only the AI's destination)
			local CHARACTERMODE_MOVE_VECTOR_LENGTH=1000
			vectorx=vectorx*CHARACTERMODE_MOVE_VECTOR_LENGTH
			vectory=vectory*CHARACTERMODE_MOVE_VECTOR_LENGTH

			--TODO: move targetlocation to AI? (should at least be in Mobile if it isn't already)
			if(vectorx==0 and vectory==0)then
				self.player.ai.targetlocation=nil
			else
				self.player.ai.targetlocation={}
				self.player.ai.targetlocation.x=self.player.x+vectorx
				self.player.ai.targetlocation.y=self.player.y+vectory				
				--print("!0",self.player.ai.targetlocation.x,self.player.ai.targetlocation.y)
			end

		end
			
			
		--Selection check
		--TODO: what's the point of Selection_ClickOnly if we have this check here too?
		--TODO: move selection check to its own function
		--TODO: mouse needs to be pressed and released over the same mob for it to count
		--TODO: depending on scenario, only select enemies
		--TODO: lmouse or rmouse should both work
		--TODO: comments (and code) are mostly copied from SelectionRectangle; comments may not necessarily apply here
		if(self.environment.game.keys.lmouse.released or self.environment.game.keys.rmouse.released)then
			--print("Selection check")
			
			--TODO: single-frame click can cause released to be called before pressed,
				-- at which point we crash because gamex,gamey, etc don't exist yet.
				-- initialize them in setup
			
			--TODO: move selection code to separate function in scenarioplayercontrols.lua
				-- and just send the list of highlighted objects to that function instead
			local env=self.environment.game.environment_gameplay
			local camera=env.camera	
			local frame=self.environment.game.window.frame		
			
			local globalx,globaly=GetCursorPosition()
			--TODO: rename vars
			--cursorx,cursory store mouse/window coordinates
			local cursorx,cursory=env:MouseCoordinatesToWindowCoordinates(globalx,globaly)

			local localx,localy
			localx,localy=env:WindowCoordinatesToCursorPosition(cursorx,cursory)
			
			--local x3,y3=camera:WindowCoordsToCameraCoords(self.x,self.y)
			--local x4,y4=camera:WindowCoordsToCameraCoords(self.x+self.width,self.y+self.height)
			
			--TODO: camera position (screen scroll) not accounted for 
			--	(maybe don't need to?)
			local x3,y3=localx,localy
			local w3=1
			local h3=1
			
			local totalselected=0
			--TODO: rename mouseovercoords to windowcoords?
			
			--print("SelectionRectangle coordinates/size:",x3,y3,w3,h3,#env.mobiles)
			
			--TODO: maybe env.players instead of env.mobiles?
			local objs=env:GetObjectsAtRectangleWindowCoordinates(env.mobiles,x3,y3,w3,h3)
			
			--we're in character mode, so limit 1 selected object
			-- also, use "sticky targeting" so don't change anything if 0 objects were selected
			if(#objs>0)then			
				for i=1,#env.mobiles,1 do
					env.mobiles[i].TEMP_SelectedByCursor=false
				end
				--print("Selection check")
				--print("#objs",#objs)
				for i=1,#objs,1 do
					objs[i].TEMP_SelectedByCursor=true
					if(self.player and self.player.combat)then
						self.player.combat.targetcombat=env.mobiles[i].combat
						if(self.environment.game.keys.rmouse.released)then
							--TODO: reenable autocasting
							--self.player.ai:StartAutoCasting()
						end
					end
					break
				end
							
				for i=1,#env.mobiles,1 do
					--TODO: reenable selection
					--env.mobiles[i]:Select(env.mobiles[i].TEMP_SelectedByCursor)	
				end
			end
		end		
		
	end

	function class:GetCharacterMovementInputUnitVector()
		local environment_gameplay=self.environment.game.environment_gameplay
		
		local vectorx,vectory=0,0

		if(self.environment.game.keys.leftA.current)then
			--print("leftA")
			vectorx=vectorx-1
		end		
		if(self.environment.game.keys.rightD.current)then
			--print("rightD")
			vectorx=vectorx+1
		end			
		if(self.environment.game.keys.downS.current)then			
			--print("downS")
			vectory=vectory-1
		end	
		if(self.environment.game.keys.upW.current)then
			--print("upW")
			vectory=vectory+1
		end
		
		--TODO: move to spellbutton
		if(self.environment.game.keys.mmouse.pressed)then
			--print("mmouse")
			--print("Combat:",self.player.combat
			--print("Roll:",self.player.combat.roll)
			
			--TODO: one-line create-queue-from-spellbook function.
			-- maybe "TryCastSpell"
			
			-- !!! we finally disabled roll.  TODO: reenable it
			-- local queuespell=self.player.combat.roll:NewQueue(nil)
			-- local errorcode=self.player.combat:TryQueue(queuespell)
		end

		if(self.environment.game.keys.lmouse.current and self.environment.game.keys.rmouse.current)then
			--print("LMB+RMB")
			--TODO: further consolidate redundant code with parent ScenarioPlayerControls
			local globalx,globaly=GetCursorPosition()
			--TODO: rename vars
			--cursorx,cursory store mouse/window coordinates
			local cursorx,cursory=environment_gameplay:MouseCoordinatesToWindowCoordinates(globalx,globaly)
			local targetlocation={}
			targetlocation.x,targetlocation.y=environment_gameplay:WindowCoordinatesToCursorPosition(cursorx,cursory)
			local dx,dy=targetlocation.x-self.player.x,targetlocation.y-self.player.y
			local length = math.sqrt(dx*dx+dy*dy)
			--TODO: define MOUSE_MOVEMENT_DEAD_ZONE elsewhere
			local MOUSE_MOVEMENT_DEAD_ZONE=10

			if(length>MOUSE_MOVEMENT_DEAD_ZONE)then
				vectorx=vectorx+(dx/length)
				vectory=vectory+(dy/length)
			end
		end	--LMB+RMB
		return vectorx,vectory
	end
	
	function class:FilterSelectableObjectList(player,objs)
		--TODO: WARNING: "player" is currently unused, AND existing functions that call this one pass in "nil" for player
		
		local objs2={}
		
		for i=1,#objs do
			--TODO: the final version of selectableobjectsfilter will need to be a BIT more complicated than this
			if(objs[i].faction==XPRACTICE.Factions.ENEMY)then
				tinsert(objs2,objs[i])
			end
			
		end
		return objs2
	end

	
end

