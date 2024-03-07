
do
	
	local super=XPRACTICE.MultiSolid
	XPRACTICE.ABERRUSRAIDMAPS.CustomEffectController=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ABERRUSRAIDMAPS.CustomEffectController
	
	local MAX_EFFECTS=1000
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.buttons={}
		self.allbuttons={}
		self.state="FULLVIEW"
		self.presetbuttons={}
		self.eraserbuttons={}
		self.editbuttons={}
		self.mousepicker=nil
	end
	
	function class:LoadAll(scenario)
		if(not scenario.mapindex)then return end
		if(scenario.multiplayer)then
			local index=scenario.mapindex
			local varname="CustomEffectPresets"..tostring(index)			
			if(XPRACTICE_SAVEDATA[scenario.savedataname][varname]==nil or #XPRACTICE_SAVEDATA[scenario.savedataname][varname]==0)then
			--if(true)then --!!!
				local defaults=XPRACTICE.ABERRUSRAIDMAPS_CustomEffectDefaults.GetDefaults(index)
				for i=1,#defaults do
					if(defaults[i][1]~="END")then
						defaults[i]=defaults[i][1]..defaults[i][2]..defaults[i][3]..string.char(defaults[i][4]+48)
					else
						defaults[i]=nil
					end
				end
				XPRACTICE_SAVEDATA[scenario.savedataname][varname]=defaults
				
			end
		end
	end
	

	
	function class:QuickButtons(x,y,scenario)
		self.x=x or self.x
		self.y=y or self.y
		
		--Important: since mousepicker closure links to button index, we have to kill mousepicker right away if button layout changes
		if(self.mousepicker)then 
			self.mousepicker.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
		end
	
		for i=1,#self.allbuttons do
			self.allbuttons[i]:Die()
		end
		self.allbuttons={}
		self.presetbuttons={}
	
		self:LoadAll(scenario)
	
		if(not scenario.mapindex)then return end
		local index=scenario.mapindex
		local varname="CustomEffectPresets"..tostring(index)			
		local presets=XPRACTICE_SAVEDATA[scenario.savedataname][varname]
		--print("CMC qb: ",varname,presets)
	
		local buttons={}
		local LISTOFFSET=0
		if(#presets>7)then LISTOFFSET=-150 end
		
		if(varname and index)then
			for i=1,#presets do
				local presetcode=presets[i]
				if(presetcode[1]~="END")then					
					--print("CMC code: ",varname,i,presetcode)
					local menubutton
					menubutton=XPRACTICE.Button.new()
					menubutton:Setup(scenario.game.environment_gameplay)		
					menubutton.position={x=self.x,y=self.y+((#presets-i)-.5)*56+LISTOFFSET,z=0}
					menubutton:SetSize(200,50)
					menubutton:SetText(XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(presetcode))
					local alpha=0
					if(scenario.customeffectbutton and scenario.customeffectbutton.selected)then alpha=1 end
					menubutton:SetLockedStartingAlpha(alpha)
					menubutton:EnableMouse((scenario.customeffectbutton and scenario.customeffectbutton.selected))			
					menubutton.scenario=scenario
					menubutton.presetcode=presetcode				
					local wmc=self
					menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
							if(button=="LeftButton" and down)then
								if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
									scenario.statuslabel:SetText("Placing effects requires raid lead/assist.",3.0)
									return									
								end					
								--wmc:SetWM(scenario,i,0,0,true)
								if(not wmc.maineditbutton.selected)then
									for j=1,#wmc.presetbuttons do
										--print("clicked on",i,"compare",j)
										if(i==j)then
											wmc.presetbuttons[j]:Select(not wmc.presetbuttons[j].selected)											
											if(wmc.presetbuttons[j].selected)then											
												scenario.statuslabel:SetText("You are now painting \""..XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(presetcode).."\".\nTo stop painting, click the same button again or right-click on the canvas.")
												local radius=string.byte(string.sub(presetcode,4,4))-48
												local picker=XPRACTICE.MousePicker.new()										
												picker:Setup(scenario.game.environment_gameplay,0,0,0)
												picker.scenario=scenario
												if(string.sub(presetcode,1,1)=="P")then
													picker.behavior="PLAYER"
												elseif(string.sub(presetcode,1,1)=="E")then
													picker.behavior="ENEMY"
												end
												picker.singleuse=false
												picker.presetcode=presetcode
												picker.callback=function(s)
													wmc:PaintEffect(picker)
												end	
												picker.circle.scale=radius/4.0
												local old=picker.OnProjectileDespawning
												picker.OnProjectileDespawning=function(self)
													old(self)
													menubutton:Select(false)
													scenario.statuslabel:SetText("",3.0)
												end
												wmc.mousepicker=picker
											else	-- else button[j] isn't selected
												scenario.statuslabel:SetText("",3.0)
												if(wmc.mousepicker)then 
													--wmc.mousepicker:Die(); wmc.mousepicker.circle:Die() 
													wmc.mousepicker.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
												end
											end
										else	-- else this isn't the button we clicked on
											wmc.presetbuttons[j]:Select(false)
										end
										--print(j,"is now",wmc.presetbuttons[j].selected)
									end	--end for loop
								else	-- else we ARE in edit mode
									XPRACTICE.CustomEffectEditInterface_Statics.bossindex=index
									XPRACTICE.CustomEffectEditInterface_Statics.effectindex=i
									XPRACTICE.CustomEffectEditInterface_Statics.originalcode=presetcode
									XPRACTICE.CustomEffectEditInterface_Statics.originaltext="\""..XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(presetcode).."\""
									XPRACTICE.CustomEffectEditInterface_Statics.newcode=presetcode
									scenario.tempmenu:LoadMenu(XPRACTICE.CustomEffectEditInterface)
								end
							end
						end)	
					local old=menubutton.Select
					menubutton.Select=function(self,selected)
						old(self,selected)
						local selectedbutton=nil
						wmc.targetallbutton:SetLockedStartingAlpha(0)
						wmc.targetallbutton:EnableMouse(false)						
						for j=1,#wmc.presetbuttons do
							local b=wmc.presetbuttons[j]
							if(b.selected)then 
							--print("selected")
								if(b.presetcode)then
								--print("?",b.presetcode)
									local behavior=string.sub(b.presetcode,1,1)
									if(behavior=="P" or behavior=="E")then
										selectedbutton=b 
									end
								end
							end
						end
						if(selectedbutton)then
							wmc.targetallbutton:SetLockedStartingAlpha(1)
							wmc.targetallbutton:EnableMouse(true)
							wmc.targetallbutton.position.x=selectedbutton.position.x+200+6
							wmc.targetallbutton.position.y=selectedbutton.position.y
						end
					end					
					tinsert(buttons,menubutton)	--TODO: most menu systems appear to double up on tinserts when there should be only one
					tinsert(self.allbuttons,menubutton)
					tinsert(self.presetbuttons,menubutton)
				end
			end
		end

		self:SetupEraserButtons(x,y,scenario,buttons)
		self:SetupEditButtons(x,y,scenario,buttons)
		
	
		local menubutton
		menubutton=XPRACTICE.Button.new()
		menubutton:Setup(scenario.game.environment_gameplay)		
		menubutton.position={x=self.x,y=self.y+(-2.5)*56,z=0}
		menubutton:SetSize(50,50)
		menubutton:SetText("Target ALL")
		local alpha=0
		--if(scenario.customeffectbutton and scenario.customeffectbutton.selected)then alpha=1 end
		menubutton:SetLockedStartingAlpha(alpha)
		menubutton:EnableMouse(false)			
		menubutton.scenario=scenario
		local wmc=self
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
				if(button=="LeftButton" and down)then
						if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
							scenario.statuslabel:SetText("Placing effects requires raid lead/assist.",3.0)
							return									
						end					
					for i=1,#wmc.presetbuttons do
						local b=wmc.presetbuttons[i]
						if(b.selected and b.presetcode)then
							local behavior=string.sub(b.presetcode,1,1)
							if(behavior=="P" or behavior=="E")then
								local args={behavior,string.sub(b.presetcode,2,2),string.sub(b.presetcode,3,3),string.sub(b.presetcode,4,4),"ALL-XXXXXXXXXXXX"}
								scenario.multiplayer:FormatAndSend("CUSTOMEFFECT_ATTACH",unpack(args))
								wmc:SetAttachEffect(wmc.scenario.player.paddedguid,args[1],args[2],args[3],args[4],args[5])
								if(wmc.mousepicker)then
									wmc.mousepicker.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
								end
								b:Select(false)
							end
						end
					end
				end
			end)						
		self.targetallbutton=menubutton
		tinsert(self.allbuttons,menubutton)
		--TODO: hide targetallbutton if effects menu is collapsed (but then somehow show it if menu is uncollapsed iff we're still in paint mode)
		
		
	
		--print("Buttons:",buttons)
		self.buttons=buttons
		return buttons
	end
	
	
	function class:Step(elapsed)
		super.Step(self,elapsed)

		for i=#self.actors,1,-1 do
			local actor=self.actors[i]
			if(actor.attach)then
				if(actor.attach.dead)then
					actor.dying=true
				else
					local x,y,z=actor:GetPosition()
					local scale=actor:GetScale()
					if(scale~=0)then
						actor:SetPosition(actor.attach.position.x/scale,actor.attach.position.y/scale,z)
					end
				end
			end
			if(actor.dying)then
				actor.dying=false
				XPRACTICE.ReusableModelSceneFrames:RemoveActor(actor.frame,actor)				
				tremove(self.actors,i)
			end
		end
	end

	
	function class:PaintEffect(picker)
		local scenario=self.scenario
		local behavior=picker.behavior
		local code=picker.presetcode
		if(behavior=="GROUND")then
			local args={string.sub(code,1,1),string.sub(code,2,2),string.sub(code,3,3),string.sub(code,4,4),picker.position.x,picker.position.y}
			self.scenario.multiplayer:FormatAndSend("CUSTOMEFFECT_GROUND",unpack(args))			
			self:SetGroundEffect(self.scenario.player.paddedguid,args[1],args[2],args[3],args[4],args[5],args[6])
		elseif(behavior=="PLAYER")then
			local attach=picker:GetTargetInRange()
			if(not attach)then
				scenario.statuslabel:SetText("This effect attaches to players. Click on a player character!",3.0)
			else
				local args={string.sub(code,1,1),string.sub(code,2,2),string.sub(code,3,3),string.sub(code,4,4),attach.paddedguid}
				self.scenario.multiplayer:FormatAndSend("CUSTOMEFFECT_ATTACH",unpack(args))			
				self:SetAttachEffect(self.scenario.player.paddedguid,args[1],args[2],args[3],args[4],args[5])
			end
		elseif(behavior=="ENEMY")then
			local attach=picker:GetTargetInRange()
			if(not attach)then
				scenario.statuslabel:SetText("This effect attaches to enemies. Click on an enemy character!",3.0)
			else
				local bossindex="001"
				for i=1,#scenario.bosses do
					if(scenario.bosses[i]==attach)then
						bossindex=string.format("%0.3d",i)
						i=#scenario.bosses+1
					end
				end
				local args={string.sub(code,1,1),string.sub(code,2,2),string.sub(code,3,3),string.sub(code,4,4),"ENEMY-"..bossindex.."-XXXXXXX"}
				self.scenario.multiplayer:FormatAndSend("CUSTOMEFFECT_ATTACH",unpack(args))			
				self:SetAttachEffect(self.scenario.player.paddedguid,args[1],args[2],args[3],args[4],args[5])
			end				
		end				
	end
	
	function class:SetGroundEffect(playerguid, c1,c2,c3,c4, x, y)
		if(#self.actors>=MAX_EFFECTS)then
			self.scenario.statuslabel:SetText("Too many effects in world!  Erase some before placing another.",3.0)
			return
		end
		local code=c1..c2..c3..c4
		local effect=XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.MakeActorFromCode(self,code,x,y)
		effect.code=code
		self.scenario.statuslabel:SetText(self.scenario.multiplayer.guidpointers[playerguid].playername.." places \""..XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(code).."\".",3.0)
		
	end
	

	
	function class:SetAttachEffect(playerguid, c1,c2,c3,c4, attachguid)
		if(#self.actors>=MAX_EFFECTS)then
			self.scenario.statuslabel:SetText("Too many effects in world!  Erase some before placing another.",3.0)
			return
		end
		local code=c1..c2..c3..c4
		if(string.sub(code,1,1)=="P")then
			if(string.sub(attachguid,1,4)=="ALL-")then			
				for k,v in pairs(self.scenario.multiplayer.allplayers) do						
					local guid=v.paddedguid	
					local effect=XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.MakeActorFromCode(self,code,v.position.x,v.position.y)
					effect.attach=v				
				end
				self.scenario.statuslabel:SetText(self.scenario.multiplayer.guidpointers[playerguid].playername.." places \""..XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(code).."\".",3.0)
			else
				local v=self.scenario.multiplayer.guidpointers[attachguid]
				if(v)then
					local guid=v.paddedguid				
					local effect=XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.MakeActorFromCode(self,code,v.position.x,v.position.y)
					effect.attach=v				
					self.scenario.statuslabel:SetText(self.scenario.multiplayer.guidpointers[playerguid].playername.." places \""..XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(code).."\".",3.0)
				end
			end
		elseif(string.sub(code,1,1)=="E")then
			if(string.sub(attachguid,1,4)=="ALL-")then			
				for i=1,#self.scenario.bosses do				
					local v=self.scenario.bosses[i]
					local effect=XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.MakeActorFromCode(self,code,v.position.x,v.position.y)
					--print("ALL-?",k,v,v.position.x,v.position.y)
					effect.attach=v				
				end
				self.scenario.statuslabel:SetText(self.scenario.multiplayer.guidpointers[playerguid].playername.." places \""..XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(code).."\".",3.0)
			else
		
				local bossindex=tonumber(string.sub(attachguid,7,9))		-- ENEMY-###-X...
				if(bossindex)then
					local boss=self.scenario.bosses[bossindex]
					if(boss)then					
						local effect=XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.MakeActorFromCode(self,code,boss.position.x,boss.position.y)
						effect.attach=boss
						self.scenario.statuslabel:SetText(self.scenario.multiplayer.guidpointers[playerguid].playername.." places \""..XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(code).."\".",3.0)
					end
				end		
			end
		end
	end
	

end

