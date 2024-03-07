	do	
		local super=XPRACTICE.Spell
		XPRACTICE.LEGACY.Spell_GetPlayerPosition=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.LEGACY.Spell_GetPlayerPosition
		

		function class:SetCustomInfo()
			super.SetCustomInfo(self)

			self.name="(Get Player Position)"
			--self.icon="interface/icons/icon_treasuremap.blp"
			self.icon="interface/icons/inv_misc_map_01.blp"

			self.requiresfacing=false		
			self.projectileclass=nil	
			self.basecastduration=0.0
			self.basechannelduration=nil
			self.basechannelticks=nil
		end
		
		--/run WorldMapFrame:SetFrameStrata("BACKGROUND");ChatFrame1:SetFrameStrata("DIALOG")
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local player=self.scenario.player
			local camera=self.scenario.game.environment_gameplay.cameramanager.camera
			print("Player XYZ:",string.format("%0.2f",player.position.x),string.format("%0.2f",player.position.y),string.format("%0.2f",player.position.z))	
			--print("Player facing:",player.orientation_displayed.yaw)
			print("Player facing (degrees):",string.format("%0.2f",player.orientation.yaw/math.pi*180))
			print("Player distance from mid:",math.sqrt(player.position.x*player.position.x+player.position.y*player.position.y))			
			local playerangle=math.atan2(player.position.y,player.position.x)
			print("Player angle from X axis (degrees):",playerangle/math.pi*180)
			print("Camera distance from player:",camera.cdist)
			
			
			
			
			local safeangle=-math.pi/6
			local playerangle=math.atan2(player.position.x,player.position.y)
			local x1=10*math.cos(safeangle)
			local y1=10*math.sin(safeangle)
			local x2=40*math.cos(safeangle)
			local y2=40*math.sin(safeangle)
			-- print("1",XPRACTICE.LineCircleCollision(x1,y1,x2,y2,player.position.x,player.position.y,1))
			-- print("2",XPRACTICE.LineCircleCollision(x1,y1,x2,y2,player.position.x,player.position.y,2))
			-- print("3",XPRACTICE.LineCircleCollision(x1,y1,x2,y2,player.position.x,player.position.y,3))
			-- print("4",XPRACTICE.LineCircleCollision(x1,y1,x2,y2,player.position.x,player.position.y,4))
			-- print("5",XPRACTICE.LineCircleCollision(x1,y1,x2,y2,player.position.x,player.position.y,5))
			
			if(self.scenario.statuslabel)then
				self.scenario.statuslabel:SetText("Information about your current position has been printed to the chat window.",5.0)
			end
		end
	end