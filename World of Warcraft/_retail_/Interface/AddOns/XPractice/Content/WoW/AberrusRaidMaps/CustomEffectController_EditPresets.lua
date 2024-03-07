do

	local class=XPRACTICE.ABERRUSRAIDMAPS.CustomEffectController


	
	function class:SetupEditButtons(x,y,scenario,buttons)
	
	
		local edit_y=self.presetbuttons[#self.presetbuttons].position.y-56

		local menubutton
		menubutton=XPRACTICE.Button.new()
		menubutton:Setup(scenario.game.environment_gameplay)		
		menubutton.position={x=self.x,y=edit_y,z=0}
		menubutton:SetSize(200,50)
		menubutton:SetText("Edit effects")
		local alpha=0
		if(scenario.customeffectbutton and scenario.customeffectbutton.selected)then alpha=1 end
		menubutton:SetLockedStartingAlpha(alpha)
		menubutton:EnableMouse((scenario.customeffectbutton and scenario.customeffectbutton.selected))			
		menubutton.scenario=scenario
		local wmc=self
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
				if(button=="LeftButton" and down)then
					for j=1,#wmc.presetbuttons do
						if(wmc.presetbuttons[j]==menubutton)then
							menubutton:Select(not menubutton.selected)							
							if(wmc.mousepicker)then 
								-- do this first -- despawning mousepicker will clear statuslabel
								wmc.mousepicker.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
							end							
							if(menubutton.selected)then
								scenario.statuslabel:SetText("You are now in edit mode.\nSelect a preset to edit, or click the edit button again to stop.",20.0)
								--local radius=string.byte(string.sub(presetcode,4,4))-48							
							else
								scenario.statuslabel:SetText("",3.0)
								scenario.tempmenu:UnloadCurrentMenu()
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
			local a
			if(self.selected)then a=1 else a=0 end
			local editbutton=wmc.editbuttons[1]
			editbutton:SetLockedStartingAlpha(a)
			editbutton:EnableMouse(self.selected)	
		end					
		local old=menubutton.SetLockedStartingAlpha
		menubutton.SetLockedStartingAlpha=function(self,alpha)
			old(self,alpha)
			local a=alpha
			if(not self.selected)then a=0 end
			local editbutton=wmc.editbuttons[1]
			editbutton:SetLockedStartingAlpha(a)
			editbutton:EnableMouse((a==1))
		end
		tinsert(buttons,menubutton)		
		tinsert(self.presetbuttons,menubutton)
		tinsert(self.allbuttons,menubutton)
		self.maineditbutton=menubutton
		
		
		self.editbuttons={}
		for i=1,1 do			
			local menubutton
			menubutton=XPRACTICE.Button.new()
			menubutton:Setup(scenario.game.environment_gameplay)		
			menubutton.position={x=self.x,y=self.presetbuttons[1].position.y+56,z=0}
			menubutton:SetSize(200,50)
			menubutton:SetText("Add new effect")
			local alpha=0
			--if(scenario.customeffectbutton and scenario.customeffectbutton.selected)then alpha=1 end
			menubutton:SetLockedStartingAlpha(alpha)
			menubutton:EnableMouse(false)			
			menubutton.scenario=scenario
			local wmc=self
			menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
					if(button=="LeftButton" and down)then
						local effectcode="GBR"..string.char(1+48)						
						local index=scenario.mapindex
						local varname="CustomEffectPresets"..tostring(index)			
						local effects=XPRACTICE_SAVEDATA[scenario.savedataname][varname]
						--print("Effects:",effects,effectcode)
						tinsert(effects,1,effectcode)
						XPRACTICE_SAVEDATA[scenario.savedataname][varname]=effects	--not sure if this step is necessary
						
						scenario.customeffectbutton.buttons=scenario.customeffectcontroller:QuickButtons(nil,nil,scenario)
						XPRACTICE.CustomEffectEditInterface_Statics.bossindex=index
						XPRACTICE.CustomEffectEditInterface_Statics.effectindex=i
						XPRACTICE.CustomEffectEditInterface_Statics.originalcode=effectcode
						XPRACTICE.CustomEffectEditInterface_Statics.originaltext="\"New Effect\""
						XPRACTICE.CustomEffectEditInterface_Statics.newcode=effectcode
						scenario.tempmenu:LoadMenu(XPRACTICE.CustomEffectEditInterface)
						
					end
				end)		

			--tinsert(buttons,menubutton)		
			tinsert(self.editbuttons,menubutton)
			tinsert(self.allbuttons,menubutton)
		end

	
	end

end