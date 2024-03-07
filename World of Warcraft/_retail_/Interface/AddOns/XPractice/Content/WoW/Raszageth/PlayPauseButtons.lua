do


	local roomnumber=XPRACTICE.RASZAGETH.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASZAGETH.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="PAUSE"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.RASZAGETH.Multiplayer	
	function class.HandleCustom_PAUSE(self,sender,args)		
		local scenario=self.scenario
		if(not scenario.pauseallmechanics)then
			scenario.statuslabel:SetText(sender.." paused the game.",3.0)
		end
		scenario.pauseallmechanics=true
		scenario.playbutton:Select(false)
		scenario.pausebutton:Select(true)
	end	
	
	local roomnumber=XPRACTICE.RASZAGETH.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASZAGETH.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="UNPAUSE"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.RASZAGETH.Multiplayer	
	function class.HandleCustom_UNPAUSE(self,sender,args)		
		local scenario=self.scenario
		if(scenario.pauseallmechanics)then
			scenario.statuslabel:SetText(sender.." unpaused the game.",3.0)
		end
		scenario.pauseallmechanics=false
		scenario.playbutton:Select(true)
		scenario.pausebutton:Select(false)
		local ghost=self.allplayers[sender]
		if(ghost==scenario.player)then
			self.host=true
		else
			self.host=false
		end
	end			
		
		
		
		
		

	
	local function Button(scenario,label,x,y,wid,hgt,func)
		wid=wid or 80
		hgt=hgt or 50
		local menubutton
		menubutton=XPRACTICE.Button.new()
		menubutton:Setup(scenario.game.environment_gameplay)
		menubutton.position={x=x,y=y,z=0}
		local alpha=0
		menubutton:SetLockedStartingAlpha(alpha)
		menubutton:EnableMouse((alpha==1))
		menubutton.buttongroup=scenario.bosscontrolbuttons
		tinsert(scenario.bosscontrolbuttons,menubutton)
		menubutton.scenario=scenario
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
				if(button=="LeftButton" and down)then
					func()					
				end
			end)
		menubutton:SetSize(wid,hgt)
		menubutton:SetText(label)
		menubutton.buttons={}
		return menubutton
	end

	function XPRACTICE.RASZAGETH.SetupPlayPauseButtons(scenario)
		scenario.playbutton=Button(scenario,"Play",25,355+45,nil,nil,function()
														scenario.multiplayer:FormatAndSendCustom("UNPAUSE") end)
		scenario.pausebutton=Button(scenario,"Pause",25+80+14,355+45,nil,nil,function()
														scenario.multiplayer:FormatAndSendCustom("PAUSE") end)
		scenario.pausebutton:Select(true)
	end






end