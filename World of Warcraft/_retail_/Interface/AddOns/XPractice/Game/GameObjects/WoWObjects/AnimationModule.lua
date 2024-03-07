do
	XPRACTICE.AnimationList={}
end

do
	XPRACTICE.AnimationTemplate = {}
	local class=XPRACTICE.AnimationTemplate
	class.__index = class

	function class.new()
		local self=setmetatable({}, class)
		return self 
	end
	
	-- static global
	function XPRACTICE.AnimationTemplate.QuickSetup(animationlist,name,index,subindex,priority,duration,nextanimation,speed)
		local template=XPRACTICE.AnimationTemplate.new()
		template.name=name
		template.index=index
		template.subindex=subindex
		template.priority=priority
		template.duration=duration
		template.nextanimation=nextanimation
		template.speed=speed
		
		--if set to true, the animation in this priority slot will be set to nil
		-- if an animation with stronger priority interrupts it.
		template.cancelonoverride=false
		
		animationlist[name]=template
		return template
	end	
end
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
do
	XPRACTICE.Animation = {}
	local class=XPRACTICE.Animation
	class.__index = class
	
	function class.new()
		local self=setmetatable({}, class)
		return self 
	end
	
	function class:Setup(template)
		for k,v in pairs(template) do
			self[k]=v	-- read: "self[k]=template[k]"
		end
		self.time=0
		--print("Animation.Setup",self)
	end
	
end

-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

do
	XPRACTICE.AnimationPriorities={}
	-- Priority animations (such as rolling).
	tinsert(XPRACTICE.AnimationPriorities,"Priority")
	-- Attacks and priority movement (such as jumping).
	tinsert(XPRACTICE.AnimationPriorities,"Active")
	-- Movement.
	tinsert(XPRACTICE.AnimationPriorities,"Passive")
	-- At the moment, used only for ShuffleLeft/ShuffleRight animations.
	-- (Necessary to have its own group to avoid conflict with JumpEnd.)
	tinsert(XPRACTICE.AnimationPriorities,"Shuffle")
	-- Idle/combat stances.
	tinsert(XPRACTICE.AnimationPriorities,"Idle")
	
	
	XPRACTICE.AnimationPriorityNumbers={}
	local i=1
	for k,v in ipairs(XPRACTICE.AnimationPriorities) do
		XPRACTICE.AnimationPriorityNumbers[v]=i
		i=i+1
	end
end

do
	XPRACTICE.AnimationModule = {}
	local class=XPRACTICE.AnimationModule
	class.__index = class

	function class.new()
		local self=setmetatable({}, class)
		return self 
	end
	
	function class:Setup(owner_wowobject)
		self.owner=owner_wowobject
		self.animations={}
		--TODO LATER: this loop doesn't do anything, but it's included for readability...
		for k,v in ipairs(XPRACTICE.AnimationPriorities) do
			self.animations[v]=nil
		end
		
		self.currentanimation=nil
		
		
		self:PlayAnimation(XPRACTICE.AnimationList.Idle)
	end
	

	function class:ResetAnimation(animationtemplate)
		self:PlayAnimation(animationtemplate)
		self.owner.displayobject.animation=nil
		self.owner.displayobject.sequence=nil
	end

	function class:PlayAnimation(animationtemplate)
		reset=reset or false
		local animation=XPRACTICE.Animation.new()
		animation:Setup(animationtemplate)	
		self:CheckOverride(animation,reset)
		self.animations[animation.priority]=animation		
		self.currentanimation=animation

		if(animation.name=="ProjectileDespawnCustomDuration"
		or animation.name=="Projectile2DespawnCustomDuration"
		or animation.name=="Projectile3DespawnCustomDuration"
		or animation.name=="Projectile4DespawnCustomDuration")then
			self.owner:OnProjectileDespawning()
		end		
	end
	
	function class:PlayOrContinueAnimation(animationtemplate)
		local animation=XPRACTICE.Animation.new()
		animation:Setup(animationtemplate)
		--if(self.animations[animation.priority] and self.animations[animation.priority].name==animation.name)then
		if(animation.priority==animationtemplate.priority and self.animations[animation.priority] and self.animations[animation.priority].name==animationtemplate.name)then
			-- do nothing
		else
			self:CheckOverride(animation)
			self.animations[animation.priority]=animation
			self.currentanimation=animation
		end
	end	
	
	function class:CheckOverride(newanimation)
		--TODO: still have to compare animation priorities  (did we do this already?)
		if(self.currentanimation)then
			if(newanimation~=self.currentanimation)then
				-- reminder: lower number == stronger priority
				if(XPRACTICE.AnimationPriorityNumbers[newanimation.priority]<=XPRACTICE.AnimationPriorityNumbers[self.currentanimation.priority])then
					if(self.currentanimation.cancelonoverride)then
						self.animations[self.currentanimation.priority]=nil
					end
				end
			end
		end
	end
	
	function class:SendAnimationToDisplayObject(animation)
		--animation can be Animation or AnimationTemplate.
		-- if(self.currentanimation)then
			-- if(self.currentanimation~=animation)then
				-- if(self.currentanimation.cancelonoverride)then
					-- self.animations[self.currentanimation.priority]=nil
				-- end
			-- end
		-- end
		self.owner.displayobject:PlayAnimation(animation.index,animation.subindex,animation.speed)
		self.currentanimation=animation
	end
	
	function class:Step(elapsed)	
		-- first, check for auras
		local auraanimationtemplate=self.owner:GetAuraAnimation()
		if(auraanimationtemplate)then
			--self:PlayAuraAnimation(auraanimationtemplate)
			
			--animation:Setup(auraanimationtemplate)
			--print("ANIMATION",auraanimationtemplate.index,auraanimationtemplate.subindex)
			
			
			self:SendAnimationToDisplayObject(auraanimationtemplate)
		else
			-- else no auras.
			-- choose the highest priority animation and play it
			-- do this BEFORE checking if animation has ended to avoid glitches at very low framerates
			for k,v in ipairs(XPRACTICE.AnimationPriorities) do
				local animation=self.animations[v]
				if(animation)then	
					self:SendAnimationToDisplayObject(animation)
					--if(self.owner:Isa(XPRACTICE.PlayerCharacter))then print("anim",animation.name) end
					
					break
				end
			end
			--if(self.owner:Isa(XPRACTICE.PlayerCharacter) and self.animations["Shuffle"])then print("SHUFFLE",self.animations["Shuffle"].name) end
			-- then check if each animation has ended
			-- by the way, we have to loop through ipairs(priorities) instead of pairs(animations) because we might set animations to nil later
			for k,v in ipairs(XPRACTICE.AnimationPriorities) do
				local animation=self.animations[v]
				if(animation)then					
					animation.time=animation.time+elapsed
					--if(self.owner:Isa(XPRACTICE.PlayerCharacter))then print("time",self.animations[v].name,animation.duration,animation.time) end
					local animationduration=animation.duration
					if(animation.name=="ProjectileSpawnCustomDuration" 
					or animation.name=="Projectile2SpawnCustomDuration"
					or animation.name=="Projectile3SpawnCustomDuration"
					or animation.name=="Projectile4SpawnCustomDuration")then
						animationduration=self.owner.projectilespawncustomduration
					elseif(animation.name=="ProjectileLoopCustomDuration" 
					or animation.name=="Projectile2LoopCustomDuration"
					or animation.name=="Projectile3LoopCustomDuration"
					or animation.name=="Projectile4LoopCustomDuration")then
						animationduration=self.owner.projectileloopcustomduration
					elseif(animation.name=="ProjectileDespawnCustomDuration" 
					or animation.name=="Projectile2DespawnCustomDuration"
					or animation.name=="Projectile3DespawnCustomDuration"
					or animation.name=="Projectile4DespawnCustomDuration")then
						animationduration=self.owner.projectiledespawncustomduration
					end
					if(animationduration~=nil)then
						if(animation.time>animationduration)then
							-- if so, call nextanimation
							-- note that nextanimation is not necessarily the same priority as the existing animation						
							self.animations[v]=nil
							if(animation.nextanimation~=nil)then
								--WARNING: this could act weirdly if timedout animation has lower priority than current animation
										-- and nextanimation has >= priority than current animation!
								self:PlayAnimation(animation.nextanimation)
							end
							if(animation.name=="ProjectileDespawnCustomDuration" 
							or animation.name=="Projectile2DespawnCustomDuration"
							or animation.name=="Projectile3DespawnCustomDuration"
							or animation.name=="Projectile4DespawnCustomDuration")then
								self.owner:OnProjectileDespawned()
							end								
						end
					end
				end
			end
		end		
	end
	
	function class:TryDirectedSpellcast()
		self:PlayAnimation(XPRACTICE.AnimationList.ReadySpellDirected)
	end	
	function class:TryCompleteDirectedSpellcast()	
		--TODO: NYI
		--self:PlayAnimation(XPRACTICE.AnimationList.SpellCastDirected)
	end	
	function class:TryOmniSpellcast()
		self:PlayAnimation(XPRACTICE.AnimationList.ReadySpellOmni)
	end
	function class:TryCompleteOmniSpellcast()
		self:PlayAnimation(XPRACTICE.AnimationList.SpellCastOmni)
	end	
	function class:TryDirectedChannel()
		self:PlayAnimation(XPRACTICE.AnimationList.ChannelCastDirected)
	end		
	function class:TryOmniChannel()
		self:PlayAnimation(XPRACTICE.AnimationList.ChannelCastOmni)
	end	


end

local animationtemplate
--XPRACTICE.AnimationTemplate.QuickSetup(animationlist,				name,			index,	subindex,	priority,	duration,	nextanimation, speed)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Idle",			0,		0,			"Idle",		nil,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Death",			1,		0,			"Active",		nil,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Walk",				4,		0,			"Passive",	0.1,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Run",				5,		0,			"Passive",	0.1,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ShuffleLeft",		11,		0,			"Shuffle",	0.1,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ShuffleRight",	12,		0,			"Shuffle",	0.1,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Walkbackwards",	13,		0,			"Passive",	0.1,		nil)
--TODO: is there really no distinct "Runbackwards" animation?
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Stun",			14,		0,			"Active",	nil,		nil)
--TODO: jumpstart/jumpstart2 are locked to subindex 0
-- can't use subindex nil because they will flip between sequences mid-jump
--TODO: jumpstart duration is noticeably wrong length for certain races
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"JumpStart2",		37,		0,			"Passive",	0.333,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"JumpStart",		37,		0,			"Active",	0.500,		XPRACTICE.AnimationList.JumpStart2)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Jump",			38,		0,			"Idle",		nil,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"JumpEnd",			39,		0,			"Passive",	1.134,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"JumpLandRun",		187,	0,			"Active",	0.333,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Attack1H",		17,		0,			"Active",	1.0,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Attack2H",		18,		0,			"Active",	1.0,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ReadyUnarmed",	25,		0,			"Idle",		nil,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Ready1H",			26,		0,			"Idle",		nil,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Ready2H",			27,		0,			"Idle",		nil,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ReadySpellDirected",51,		0,			"Passive",	0.1,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"SpellCastDirected",53,		0,			"Active",	0.2,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"EmoteCheerOverride",68,		0,			"Active",	2.0,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"EmoteCryOverride",	77,		0,			"Active",	nil,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ReadySpellOmni",	52,		0,			"Passive",	0.1,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"SpellCastOmni",	54,		0,			"Active",	0.7,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"EmoteRoar",		74,		0,			"Idle",	3.0,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Knockdown",			121,	0,			"Priority",	2.0,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ChannelCastDirected",124,	0,			"Passive",	0.1,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ChannelCastOmni",	125,	0,			"Passive",	0.1,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Sprint",	143,	0,			"Passive",	0.1,		nil)

--XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Fly",		135,	0,			"Idle",	0.1,		nil)

XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ProjectileLoop",	158,	0,			"Idle",		nil,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ProjectileSpawn500ms",0,	0,			"Idle",		0.5,		XPRACTICE.AnimationList.ProjectileLoop)
--projectile CustomDuration names are HARD-CODED EXCEPTIONS.
-- Animation's owner will call OnExpiry after despawn animation completes.
-- Projectile 1 uses 0,158,159.
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ProjectileDespawnCustomDuration",159,	0,		"Idle",		nil,nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ProjectileLoopCustomDuration",158,	0,			"Idle",		nil,XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ProjectileSpawnCustomDuration",0,	0,			"Idle",		nil,XPRACTICE.AnimationList.ProjectileLoopCustomDuration)
-- Projectile 2 uses 127,0,159.
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Projectile2DespawnCustomDuration",159,	0,		"Idle",		nil,nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Projectile2LoopCustomDuration",0,	0,			"Idle",		nil,XPRACTICE.AnimationList.Projectile2DespawnCustomDuration)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Projectile2SpawnCustomDuration",127,0,			"Idle",		nil,XPRACTICE.AnimationList.Projectile2LoopCustomDuration)
-- Projectile 3 uses 0,0,144.
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Projectile3DespawnCustomDuration",159,	0,		"Idle",		nil,nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Projectile3LoopCustomDuration",0,	0,			"Idle",		nil,XPRACTICE.AnimationList.Projectile3DespawnCustomDuration)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Projectile3SpawnCustomDuration",0,0,			"Idle",		nil,XPRACTICE.AnimationList.Projectile3LoopCustomDuration)
-- Projectile 4 uses 0,158,1.
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Projectile4DespawnCustomDuration",159,	0,		"Idle",		nil,nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Projectile4LoopCustomDuration",158,	0,			"Idle",		nil,XPRACTICE.AnimationList.Projectile4DespawnCustomDuration)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Projectile4SpawnCustomDuration",0,	0,			"Idle",		nil,XPRACTICE.AnimationList.Projectile4LoopCustomDuration)
--TODO: customizable projectile animation index
	-- a lot of things use 127-158-159

XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Cower",225,	0,							"Idle",	nil,nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"FlyStand",229,	0,							"Idle",	nil,nil)

XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"Strangulate",474,	0,							"Priority",	nil,nil)

--XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"MountFlightStart",564,	0,					"Passive",	1.0,XPRACTICE.AnimationList.Fly)
--XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"MountFlightStart",564,	0,					"Passive",	1.0,nil)

--XPRACTICE.AnimationTemplate.QuickSetup(animationlist,				name,			index,	subindex,	priority,	duration,	nextanimation)
--TODO: ROLL_END_STANCE has higher priority than ShuffleLeft and ShuffleRight!
animationtemplate=XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ROLL_END_STANCE",668,	nil,		"Shuffle",		.700)
animationtemplate.cancelonoverride=true
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ROLL_END",		668,	nil,		"Priority",	.300,XPRACTICE.AnimationList.ROLL_END_STANCE)



XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ROLL_LOOP",		666,	nil,		"Priority",	nil,XPRACTICE.AnimationList.ROLL_END)
--XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ROLL_BEGIN_LOOP",664,	nil,		"Active",	0.250,XPRACTICE.AnimationList.ROLL_LOOP)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"ROLL_BEGIN_LOOP",664,	nil,		"Priority",	.500,XPRACTICE.AnimationList.ROLL_LOOP)

XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"CombatAbility2HBig01",810,	0,		"Active",		1.0,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"CombatAbility2H02",826,	0,		"Active",		1.0,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"PriReadySpellCast",874,	0,			"Idle",		nil,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"MagReadySpellCast",896,		0,		"Idle",	0.1,		nil)
--XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"CastOutStrong",1122,	0,		"Active",		0.5,		nil)
XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AnimationList,"CastOutStrong",1122,	0,		"Active",		0.75,		nil)