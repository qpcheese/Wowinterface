local PH=1

do
	XPRACTICE.VOTIRAIDMAPS.ChangeMap={}
	
	XPRACTICE.VOTIRAIDMAPS.ChangeMap.BossNames={"Eranog","Terros","Council","Sennarth","Dathea","Kurog","Diurna","Raszageth"}
	
	function XPRACTICE.VOTIRAIDMAPS.ChangeMap.QuickButtons(x,y,scenario)
		local buttons={}
		local xx=0
		local yy=0
		for i=1,8 do
			local text=XPRACTICE.VOTIRAIDMAPS.ChangeMap.BossNames[i]
			if(text)then
				local menubutton
				menubutton=XPRACTICE.Button.new()
				menubutton:Setup(scenario.game.environment_gameplay)		
				menubutton.position={x=x+xx,y=y+yy,z=0}
				menubutton:SetSize(80,50)				
				menubutton:SetLockedStartingAlpha(0)
				if(i==4)then
					menubutton.SetLockedStartingAlpha=function(self,alpha)
						alpha=XPRACTICE.Clamp(alpha,0,0.25)
						self.alpha=alpha
						self.targetalpha=alpha
						self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
					end
				end
				menubutton:EnableMouse(false)
				menubutton.scenario=scenario
				menubutton:SetText(text)
				if(i==1)then menubutton:Select(true) end
				local cm=self
				menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
						if(button=="LeftButton" and down)then
							if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
								scenario.statuslabel:SetText("Changing maps requires raid lead/assist.",3.0)
								return
							end
							if(scenario.waitingforcommstimer)then
								return
							end
							if(i==4)then 						
								scenario.statuslabel:SetText("Sennarth's map is unavailable at this time.  Spiral staircases are too confusing.",5.0)
								return
							end
							if(not menubutton.selected)then
								for j=1,#buttons do
									buttons[j]:Select(false)
								end
								menubutton:Select(true)
								args={string.char(i)}
								scenario.multiplayer:FormatAndSendCustom("CHANGEMAP",unpack(args))
							end							
						end
					end)				
				
				tinsert(buttons,menubutton)
			end
			xx=xx+86
			if(i==4)then
				xx=0
				yy=yy-56
			end
		end

		return buttons
	end



end