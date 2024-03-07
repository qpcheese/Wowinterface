do

	local roomnumber=XPRACTICE.RASHOK.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASHOK.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="GOTO_TIME"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.RASHOK.Multiplayer	
	function class.HandleCustom_GOTO_TIME(self,sender,args)				
		local scenario=self.scenario
		displayedtime=args[1]
		scenario.schedule:GotoTime(displayedtime)
		scenario.pauseallmechanics=true
		scenario.playbutton:Select(false)
		scenario.pausebutton:Select(true)
		local minutes=math.floor(displayedtime/60)
		local seconds=string.format("%02d",math.floor(displayedtime-minutes*60))		
		scenario.statuslabel:SetText(sender.." changed the time to "..minutes..":"..seconds..".",3.0)
	end			



	local function MakeTimestamp(m,s,name)
		local timestamp={}
		timestamp.m=m;timestamp.s=s;timestamp.name=name
		timestamp.time=m*60+s
		timestamp.label=tostring(m)..":"..string.format("%02d",s).." "..timestamp.name
		
		return timestamp
	end
	
	local function Button(scenario,timestamp,x,y,wid,hgt)
		wid=wid or 200
		hgt=hgt or 30
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
					scenario.multiplayer:FormatAndSendCustom("GOTO_TIME",timestamp.m*60+timestamp.s)
				end
			end)
		menubutton:SetSize(wid,hgt)
		menubutton:SetText(timestamp.label)
		menubutton.buttons={}
		return menubutton
	end

	function XPRACTICE.RASHOK.SetupTimestamps(scenario)
		local timestamps={}
	
		tinsert(timestamps,MakeTimestamp(0,0,"Start"))
		tinsert(timestamps,MakeTimestamp(0,14,"Bombs + Breath + Sparks"))
		tinsert(timestamps,MakeTimestamp(0,34,"Pushback 1 + Easy Breath"))
		tinsert(timestamps,MakeTimestamp(1,09,"Pushback 2 + Sparks"))
		tinsert(timestamps,MakeTimestamp(1,59,"Bombs + Sparks"))
		tinsert(timestamps,MakeTimestamp(2,19,"Pushback 4 + Scary Breath"))		
		tinsert(timestamps,MakeTimestamp(2,54,"Pushback 5 (Everything Combo)"))
		
		local y=650
		for i=1,#timestamps do
			timestamps[i].button=Button(scenario,timestamps[i],25,y)
			y=y-38
		end	
	
		return timestamps
	end






end