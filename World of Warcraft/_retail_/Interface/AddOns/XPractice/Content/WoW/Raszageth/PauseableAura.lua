do
	local super=XPRACTICE.Aura
	XPRACTICE.PauseableAura=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.PauseableAura
	

	--TODO: rename "localtime" arg to "aurastarttime"?
	function class:Setup(castercombat,targetcombat,localtime)
		self.localtime=0
		self.ignorepauses=false
		
		self.stacks=1	

		self.castercombat=castercombat
		self.targetcombat=targetcombat				
		--TODO: aura category sorting function, do the same thing GameObject does

		self:SetCustomInfo()
		if(self.baseduration)then
			--TODO: use timeremaining instead of expirytime
			self.expirytime=self.localtime+self.baseduration
			--print("Expiry:",localtime,self.baseduration,self.expirytime)
		else
			self.expirytime=nil
		end				
		self.starttime=self.localtime
		self.startrealtime=0	-- used for cooldowns/LOCA
		
		-- flag set by voidzones, not by the aura itself
		self.inrangeofvoidzone=false
		
		self.dying=false
		self.dead=false
		
		self:SetupNewauraLists(targetcombat.auras)
		
		--TODO: timing of AddAuraToCombatModule is quite important and probably wrong as-written
		--print("Aura.setup about to call AddNewAura on",targetcombat)
		self:AddAuraToCombatModule(targetcombat,localtime)

	end
	
	
	
	function class:AddAuraToCombatModule(targetcombat,localtime)
		--override, don't call super
		targetcombat:AddNewAura(self)		
		self:OnApply(localtime)
	end
	
	function class:SetCustomInfo()
		self.baseduration=nil
		
		self.tickdelay=0.0
		self.basetickrate=nil
		self.usepartialticks=true
		self.dontzeropercenttick=true
		self.removeondeadingame=true
		
		-- if maximumdisplayedtimeremaining is not nil, and the aura has more time remaining, no duration will be displayed by aura trackers 
		self.maximumdisplayedtimeremaining=nil
		self.name="UNNAMED AURA"
		self.icon="interface/icons/inv_misc_questionmark.blp"		
		-- if minimumflashstacks is not nil, aura trackers will flash the stack number at this number of stacks
		self.minimumflashstacks=nil
	end

	
	--reminder: auramodulelists is a list of references to the lists in AuraModule
	function class:SetupNewauraLists(auramodule)
		--override, call super when overriding		
		self.auramodulelists={}
		tinsert(self.auramodulelists,auramodule.allauras)
	end

	--reminder: auramodulelists is a list of references to the lists in AuraModule
	function class:TransferFromNewauraLists()
		for i=1,#self.auramodulelists,1 do
			--TODO: consider checking if aura is dead for whatever reason
			--print("Moving to list",self.auramodulelists[i])
			tinsert(self.auramodulelists[i],self)
		end
	end
	
	function class:GetName()
		return self.name		
	end
	function class:GetIcon()
		return self.icon		
	end
	
	function class:Step(elapsed)
		if(self.scenario.pauseallmechanics==false or self.ignorepauses==true)then
			self.localtime=self.localtime+elapsed
			if(self.basetickrate)then
				local nextticktime=self:GetNextTickTime()
				if(self.localtime>=nextticktime)then
					self:Tick(nextticktime)
				end
			end
		end

		if(self.removeondeadingame)then
			if(self.targetcombat.mob:IsDeadInGame())then
				self:Die()
			end
		end
		
		if(self.expirytime)then		
			--print("Aura will expire ",self.localtime,self.expirytime)
			if(self.localtime>=self.expirytime)then
				--print("Aura expires, localtime",self.localtime)
				self:OnExpiry()
			end
		end
	end	

	
	--TODO: not clear if every aura needs tick functions by default
		-- or if this should be one of those pure-virtual-override situations
	function class:GetNextTickTime()
		local result
		if(self.previousticktime)then
			--TODO: GetCurrentTickRate()			
			result=self.previousticktime+self.basetickrate				
		else
			result=self.starttime+self.tickdelay
			--print("(first tick)")
		end
		--print("GetNextTickTime:",result)
		return result
		
	end		
		
	function class:GetPartialTickPercentage()
		if(self.previousticktime)then
															--TODO: GetCurrentTickRate()
			return (self.localtime-self.previousticktime)/self.basetickrate
		else
			return math.min(0, (self.localtime-self.starttime-self.tickdelay)/self.basetickrate)
		end
	end
	
	function class:OnApply(combattime)
		--override, call super
		self.startrealtime=GetTime()
	end
	
	function class:Tick(ticktime)
		self:OnTick(ticktime,1.0)
	end
	
	-- (PartialTick is called by AuraModule when aura expires)
	function class:PartialTick(ticktime)
		if(self.usepartialticks)then
			if(self.tickrate)then
				local percentage=GetPartialTickPercentage()
				self:OnTick(ticktime,percentage)
			end
		end
	end
	
	
	
	-- protected-ish function to be called by Tick and PartialTick only
		--(derived classes should still override ontick instead of tick/partialtick)
		-- REMEMBER TO CALL SUPER WHEN OVERRIDING ONTICK
			-- OTHERWISE WEIRD THINGS WILL HAPPEN (e.g. tick every frame) WITHOUT CRASHING OUTRIGHT
				--TODO: separate ontick's change-next-tick-time from ontick's tick-effects function
	function class:OnTick(ticktime,percentage)
		if(percentage<=0.0 and self.dontzeropercenttick)then return end
		
		self.previousticktime=ticktime
	end
	
	--TODO: still lots of uncertainty whether this is the best way to go about this
	function class:OnExpiry()		
		self:Die()
		-- override
		-- MOST auras will want to call super on override
	end	
	
	--TODO: OnRemove should probably take localtime as parameter
	--TODO: Cloak of Shadows check, somehow (not looking forward to this)
	function class:OnRemove()
		-- override
	end
	
	function class:Die()		
		self.dying=true
	end
	
	function class:Cleanup()
		self:OnRemove()
		
		self.dead=true
	end
	
	--TODO: "instance" instead of "obj"?
	function class:FatalErrorObjNotDeadAfterCleanup()
		error("ERROR: aura not properly flagged as dead after calling Cleanup")
	end
end