--TODO: volatile code reuse -- only use function in multiplayer/messagehandler.lua
-- local function IsRealOfficer(unit)
	-- unit=strsplit("-",unit)
	-- return ((UnitIsGroupLeader(unit)==true) or (UnitIsGroupAssistant(unit)==true) or not IsInGroup(unit))
-- end

do
	XPRACTICE.SMOLDERON.wmnumbers={{1,"BLUESQUARE"},{2,"GREENTRIANGLE"},{3,"PURPLEDIAMOND"},{4,"REDX"},{5,"YELLOWSTAR"},{6,"ORANGECIRCLE"},{7,"SILVERMOON"},{8,"WHITESKULL"}}
	XPRACTICE.SMOLDERON.wmmodels={REDX=456041,PURPLEDIAMOND=456039,GREENTRIANGLE=456037,YELLOWSTAR=456043,SILVERMOON=1014628,BLUESQUARE=456035,ORANGECIRCLE=1014619,WHITESKULL=1014641}

	XPRACTICE.SMOLDERON.wmtext={
	BLUESQUARE="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_6:24\124t",
	REDX="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_7:24\124t",
	PURPLEDIAMOND="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_3:24\124t",
	YELLOWSTAR="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_1:24\124t",
	GREENTRIANGLE="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_4:24\124t",
	ORANGECIRCLE="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_2:24\124t",
	SILVERMOON="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_5:24\124t",
	WHITESKULL="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_8:24\124t"}
	
	local super=XPRACTICE.GameObject
	XPRACTICE.SMOLDERON.WorldMarkerController=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SMOLDERON.WorldMarkerController
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.wms={}
	end
	
	function class:SetWM(scenario,index,x,y,send)
		local picker=XPRACTICE.MousePicker.new()
		picker:Setup(scenario.game.environment_gameplay,0,0,0)
		picker.callback=function(s)
			self:SetWMConfirm(scenario,index,picker.position.x,picker.position.y,send)
		end
	end
	
	function class:SetWMConfirm(scenario,index,x,y,send)
		if(send)then
			if(scenario.multiplayer)then
				if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					scenario.multiplayer:FormatAndSend("WORLDMARKER",tostring(index),x,y)
				end
			end
		end		
	end
	
	function class:ClearWM(scenario,index,send)
		if(send)then
			if(scenario.multiplayer)then
				if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					scenario.multiplayer:FormatAndSend("CLEARWORLDMARKER",tostring(index))
				end
			end
		end
	end	
	
	function class:ClearWMAll(scenario,send)
		if(send)then
			if(scenario.multiplayer)then
				if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
					scenario.multiplayer:FormatAndSend("CLEARWORLDMARKER",tostring(9))
				end
			end
		end
	end		
	
	function class:ClearAllWithoutSaving()
		for index=1,8 do
			if(self.wms[index])then
				self.wms[index].animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
				self.wms[index].despawning=true
			end	
		end
	end
	
	function class:LoadAll(scenario,send)
		-- if(scenario.multiplayer)then
		if(true)then
			for index=1,8 do		--TODO: some code overlap with Handle_WORLDMARKER
				local wmname=XPRACTICE.SMOLDERON.wmnumbers[index][2]
				local varname="WorldMarker"..wmname.."pos"		
				local x=XPRACTICE_SAVEDATA[scenario.savedataname][varname.."x"]
				local y=XPRACTICE_SAVEDATA[scenario.savedataname][varname.."y"]
				if(x and y)then
					if(self.wms[index] and not self.wms[index].despawning and not self.wms[index].dead)then
						self.wms[index].animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
						self.wms[index].despawning=true
					end
					
					local obj=XPRACTICE.WoWObject.new();obj:Setup(scenario.game.environment_gameplay)		
					obj.displayobject.drawable:SetModelByFileID(XPRACTICE.SMOLDERON.wmmodels[wmname])	-- raid_ui_fx_
					
					obj.position={x=x,y=y,z=0}
					obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
					obj.projectilespawncustomduration=2.0;obj.projectileloopcustomduration=nil;obj.projectiledespawncustomduration=2.0
					self.wms[index]=obj	
				end
			end
		end
		-- if(scenario.multiplayer)then
			-- if(send)then
				-- self:SendAll(scenario)
			-- end
		-- end
	end	
	
	function class:SendAll(scenario)
		if(scenario.multiplayer)then
			if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				local viscount=0
				local args={}
				for i=1,8 do
					if(self.wms[i] and not self.wms[i].dead and not self.wms[i].despawning)then 
						viscount=viscount+1
						tinsert(args,true) 
						tinsert(args,self.wms[i].position.x)
						tinsert(args,self.wms[i].position.y)
					else 
						tinsert(args,false) 
						tinsert(args,0)
						tinsert(args,0)
					end
				end
				-- don't clear everyone's markers if you have zero markers placed
				if(viscount>0)then
					scenario.multiplayer:FormatAndSend("ALLWORLDMARKERS",unpack(args))
				end
			end
		end
	end
	
	
	function class:QuickButtons(x,y,scenario)
		local buttons={}
		for i=1,8 do
			local menubutton
			menubutton=XPRACTICE.Button.new()
			menubutton:Setup(scenario.game.environment_gameplay)		
			menubutton.position={x=x+(i-1)*56,y=y,z=0}
			menubutton:SetSize(50,50)
			menubutton.icontext=XPRACTICE.SMOLDERON.wmtext[XPRACTICE.SMOLDERON.wmnumbers[i][2]]
			menubutton:SetText("")	
			local alpha=0
			--TODO: why do icons not respect alpha=0 unless we do this?
			menubutton.SetLockedStartingAlpha=function(self,alpha)
				self.alpha=alpha
				self.targetalpha=alpha
				self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
				if(alpha==0)then
					self:SetText("")
				else
					self:SetText(self.icontext)
				end
			end
			menubutton:SetLockedStartingAlpha(alpha)
			menubutton:EnableMouse(false)			
			tinsert(buttons,menubutton)
			menubutton.scenario=scenario
			local wmc=self
			menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
					if(button=="LeftButton" and down)then
							if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
								scenario.statuslabel:SetText("Adjusting world markers requires raid lead/assist.",3.0)
								return
							end					
						wmc:SetWM(scenario,i,0,0,true)
					end
				end)
					
			tinsert(buttons,menubutton)
		end
		local menubutton
		menubutton=XPRACTICE.Button.new()
		menubutton:Setup(scenario.game.environment_gameplay)		
		menubutton.position={x=x+(9-1)*56,y=y,z=0}
		menubutton:SetSize(80,50)
		menubutton:SetText("Clear")
		local alpha=0
		menubutton:SetLockedStartingAlpha(alpha)
		menubutton:EnableMouse(false)
		tinsert(buttons,menubutton)
		menubutton.scenario=scenario
		local wmc=self
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
				if(button=="LeftButton" and down)then
							if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
								scenario.statuslabel:SetText("Adjusting world markers requires raid lead/assist.",3.0)
								return
							end							
					wmc:ClearWMAll(scenario,true)
				end
			end)
		
		tinsert(buttons,menubutton)		
		return buttons
	end
	
	

	-- TODO NEXT: move WorldMarkers to Multiplayer folder
	-- local prev=SlashCmdList.XPRACTICE
	-- function SlashCmdList.XPRACTICE(msg,editbox)
		-- local args={}
		-- local i=1
		-- for arg in string.gmatch(msg, "%S+") do	
			-- args[i]=arg
			-- i=i+1
			-- --print(arg)
		-- end	
		-- if(#XPRACTICE.games>0)then
			-- local game=XPRACTICE.games[1]
			-- if(game.scenario and game.scenario.worldmarkercontroller and game.scenario.player)then 		
				-- if(#args==2 and args[1]=="wm")then
					-- local number=tonumber(args[2])
					-- if(number)then
						-- if(number>=1 and number<=8)then
							-- local pos=game.scenario.player.position
							-- game.scenario.worldmarkercontroller:SetWM(game.scenario,number,pos.x,pos.y,true)
						-- end
					-- end
				-- elseif(#args==2 and args[1]=="cwm")then
					-- local number=tonumber(args[2])
					-- if(number)then
						-- if(number>=1 and number<=8)then
							-- local pos=game.scenario.player.position
							-- game.scenario.worldmarkercontroller:ClearWM(game.scenario,number,true)
						-- end
					-- elseif(args[2]=="all")then
						-- for i=1,8 do
							-- local pos=game.scenario.player.position
							-- game.scenario.worldmarkercontroller:ClearWMAll(game.scenario,true)
						-- end						
					-- end
				-- end
			-- end
		-- end
		
		-- prev(msg,editbox)		
	-- end
end

