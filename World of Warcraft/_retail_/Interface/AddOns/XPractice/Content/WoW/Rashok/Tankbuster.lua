do
	--TODO: move to a more appropriate location
	function XPRACTICE.QuickCast(spell,scenario,boss,args)
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=boss.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=boss.combatmodule
		spellinstance.args=args
		spellinstance.scenario=scenario
		spellinstance.spellbookspell:StartCasting(boss.environment.localtime,spellinstance)		
		boss.combatmodule.castedspell=spellinstance					
	end	

	local roomnumber=XPRACTICE.RASHOK.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.RASHOK.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="TANKBUSTER"
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
	
	local class=XPRACTICE.RASHOK.Multiplayer	
	function class.HandleCustom_TANKBUSTER(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[1]
		XPRACTICE.QuickCast(boss.combatmodule.tankbuster,scenario,boss,args)
	end			
		

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.RASHOK.Spell_Tankbuster=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.Spell_Tankbuster
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Electrified Jaws"
			self.icon="interface/icons/ability_thunderking_balllightning.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=1.5;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
		function class:Broadcast_v2(scenario)						
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end
			self.scenario.multiplayer:FormatAndSendCustom("TANKBUSTER")
		end
		function class:CompleteCastingAnimationFunction(spellinstancepointer)
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.RASHOK.AnimationList.Bite)
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
	
		end
	end
	
	
	
	

end