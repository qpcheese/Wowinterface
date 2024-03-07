do

	local class=XPRACTICE.ABERRUSRAIDMAPS.CustomEffectController

	local radiuses={1,5,20,"ALL"}

	
	function class:SetupEraserButtons(x,y,scenario,buttons)
		local eraser_y=self.presetbuttons[#self.presetbuttons].position.y-56

		local menubutton
		menubutton=XPRACTICE.Button.new()
		menubutton:Setup(scenario.game.environment_gameplay)		
		menubutton.position={x=self.x,y=eraser_y,z=0}
		menubutton:SetSize(200,50)
		menubutton:SetText("Eraser")
		local alpha=0
		if(scenario.customeffectbutton and scenario.customeffectbutton.selected)then alpha=1 end
		menubutton:SetLockedStartingAlpha(alpha)
		menubutton:EnableMouse((scenario.customeffectbutton and scenario.customeffectbutton.selected))			
		menubutton.scenario=scenario
		local wmc=self
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
				if(button=="LeftButton" and down)then
						if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
							scenario.statuslabel:SetText("This action requires raid lead/assist.",3.0)
							return									
						end		
					for j=1,#wmc.presetbuttons do
						--print("clicked on",i,"compare",j)
						if(wmc.presetbuttons[j]==menubutton)then
							menubutton:Select(not menubutton.selected)
							if(menubutton.selected)then
								scenario.statuslabel:SetText("You are now in eraser mode.\nTo stop, click the same button again or right-click on the canvas.\n\nNOTE: The eraser can desync easily.\nPlease have all characters stand still before erasing attached effects.")
								--local radius=string.byte(string.sub(presetcode,4,4))-48
								local radius=wmc:GetEraserRadius()
								local picker=XPRACTICE.MousePicker.new()										
								picker:Setup(scenario.game.environment_gameplay,0,0,0)
								picker.scenario=scenario
								picker.singleuse=false
								--picker.presetcode=presetcode
								picker.callback=function(s)
									wmc:EraseEffect(picker)
								end	
								picker.circle.scale=radius/4.0
								local old=picker.OnProjectileDespawning
								picker.OnProjectileDespawning=function(self)
									old(self)
									menubutton:Select(false)
									scenario.statuslabel:SetText("",3.0)
								end
								wmc.mousepicker=picker
							else
								scenario.statuslabel:SetText("",3.0)
								if(wmc.mousepicker)then 
									--wmc.mousepicker:Die(); wmc.mousepicker.circle:Die() 
									wmc.mousepicker.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
								end
							end			
						else
							wmc.presetbuttons[j]:Select(false)
						end
					end					
				end
			end)		
		local old=menubutton.Select
		menubutton.Select=function(self,selected)
			old(self,selected)
			local alpha=0
			if(self.selected)then alpha=1 end
			for i=1,#wmc.eraserbuttons do
				local eraserbutton=wmc.eraserbuttons[i]
				eraserbutton:SetLockedStartingAlpha(alpha)
				eraserbutton:EnableMouse(self.selected)	
			end
		end
		local old=menubutton.SetLockedStartingAlpha
		menubutton.SetLockedStartingAlpha=function(self,alpha)
			old(self,alpha)
			local a=alpha
			if(not self.selected)then a=0 end
			for i=1,#wmc.eraserbuttons do			
				local eraserbutton=wmc.eraserbuttons[i]
				eraserbutton:SetLockedStartingAlpha(a)
				eraserbutton:EnableMouse((a==1))
			end
		end
		tinsert(buttons,menubutton)		
		tinsert(self.allbuttons,menubutton)
		tinsert(self.presetbuttons,menubutton)
		
		self.eraserbuttons={}
		for i=1,#radiuses do
			local r=radiuses[i]
			local menubutton
			menubutton=XPRACTICE.Button.new()
			menubutton:Setup(scenario.game.environment_gameplay)		
			menubutton.position={x=self.x+206+(i-1)*56,y=eraser_y,z=0}
			menubutton:SetSize(50,50)
			local text=""
			if(r~="ALL")then text="y" end
			text=r..text
			menubutton:SetText(text)
			local alpha=0
			--if(scenario.customeffectbutton and scenario.customeffectbutton.selected)then alpha=1 end
			menubutton:SetLockedStartingAlpha(alpha)
			menubutton:EnableMouse(false)			
			menubutton.scenario=scenario
			local wmc=self
			if(r~="ALL")then
				menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
						if(button=="LeftButton" and down)then
							for j=1,#wmc.eraserbuttons do
								if(i==j)then
									wmc.eraserbuttons[j]:Select(true)
								else
									wmc.eraserbuttons[j]:Select(false)
								end
							end
							if(wmc.mousepicker)then
								wmc.mousepicker.circle.scale=r/4.0
							end				
						end
					end)		
			else --else r=="ALL"
				menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
					if(button=="LeftButton" and down)then			
						if((not scenario.tempmenu.currentmenu) or scenario.tempmenu.currentmenu.menuclass~=XPRACTICE.CustomEffects_EraseAllInterface)then
							scenario.tempmenu:LoadMenu(XPRACTICE.CustomEffects_EraseAllInterface)
						else
							scenario.tempmenu:UnloadCurrentMenu()
						end					
					end
				end)
			end
			--tinsert(buttons,menubutton)		
			tinsert(self.eraserbuttons,menubutton)
			tinsert(self.allbuttons,menubutton)
		end
		-- if(self:GetEraserRadius()==1)then	-- if NO buttons are selected, OR if 1st button is already selected.  suspiciously convenient.
			self.eraserbuttons[1]:Select(true)	
		-- end
	
	end


	function class:GetEraserRadius()
		local r=1
		
		for i=1,#self.eraserbuttons do
			if(self.eraserbuttons[i].selected)then
				r=radiuses[i]
			end
		end
		
		return r
	end
	
	
	function class:EraseEffect(picker)
		local scenario=self.scenario
		local radius=self:GetEraserRadius()

		local args={string.char(radius+48),picker.position.x,picker.position.y}
		self.scenario.multiplayer:FormatAndSend("CUSTOMEFFECT_ERASE",unpack(args))			
		self:SetEraseEffect(self.scenario.player.paddedguid,args[1],args[2],args[3],args[4],args[5],args[6])
	end	
	
	
	function class:SetEraseEffect(playerguid, c1, x, y)
		local radius=string.byte(c1)-48
		for i=1,#self.actors do
			local actorradius=self.actors[i].radius
			local x2,y2=self.actors[i]:GetPosition()
			local scale=self.actors[i]:GetScale()
			x2=x2*scale
			y2=y2*scale
			local distsqr=XPRACTICE.distsqr(x,y,x2,y2)
			--print("D/R:",distsqr,radius,actorradius)
			if(distsqr<=(radius+actorradius)*(radius+actorradius))then
				self.actors[i].dying=true
			end
		end
		
		self.scenario.statuslabel:SetText(self.scenario.multiplayer.guidpointers[playerguid].playername.." is using the eraser, hold still please.",3.0)		
	end

	function class:SetEraseAll(playerguid)
		for i=1,#self.actors do
			if(true)then
				self.actors[i].dying=true
			end
		end		
		self.scenario.statuslabel:SetText(self.scenario.multiplayer.guidpointers[playerguid].playername.." cleared the canvas.",3.0)
		if(self.mousepicker and not self.mousepicker.dead)then 
			--wmc.mousepicker:Die(); wmc.mousepicker.circle:Die() 
			self.mousepicker.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
		end		
	end

end