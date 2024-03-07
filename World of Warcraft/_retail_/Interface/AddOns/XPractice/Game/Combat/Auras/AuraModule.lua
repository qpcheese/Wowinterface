do
	XPRACTICE.AuraModule = {}
	local class=XPRACTICE.AuraModule
	class.__index = class

	function class.new()
		local self=setmetatable({}, class)
		return self
	end

	function class:Setup(combat)
		self.combat=combat
		--self.allauras={}
		--self.allcategories={}

		-- self.allauras=TRAININGGROUNDS_AuraCategory.new()
		-- self.allauras:Setup(self)
		-- self.movement=TRAININGGROUNDS_AuraCategory.new()
		-- self.movement:Setup(self)
		-- --forcedmovement differs from knockback in that certain loss of control effects cancel forcedmovement but not knockback
		-- self.forcedmovement=TRAININGGROUNDS_AuraCategory.new()
		-- self.forcedmovement:Setup(self)
		-- self.damage=TRAININGGROUNDS_AuraCategory.new()
		-- self.damage:Setup(self)	
		
		self.newauras={}
		
		self.auralists={}
		self.allauras={}
		tinsert(self.auralists,self.allauras)		

		self.deadingame={}
		tinsert(self.auralists,self.deadingame)
		
		self.unskippablecutscene={}
		tinsert(self.auralists,self.unskippablecutscene)
		
		self.incapacitated={}
		tinsert(self.auralists,self.incapacitated)
				
		self.lossofcontrolalert={}
		tinsert(self.auralists,self.lossofcontrolalert)
				
		-- Animation auras apply the given animation on every frame.
		self.animation={}
		tinsert(self.auralists,self.animation)
		
		-- -- "Irrelevant" aura makes the object invisible and/or transparent/shadowless
		-- self.irrelevant={}
		-- tinsert(self.auralists,self.irrelevant)
		-- -- "Relevant" aura overrides the "irrelevant" aura and makes the object visible again.
		-- self.relevant={}
		-- tinsert(self.auralists,self.relevant)
		
		self.vacuum={}
		tinsert(self.auralists,self.vacuum)

		-- Multiplicative speed boost.  Highest boost overrides the others.
		self.speedboost={}
		tinsert(self.auralists,self.speedboost)
		
		-- TODO: We haven't yet decided how snares are going to stack (or how they work with speedboosts).
		self.snare={}
		tinsert(self.auralists,self.snare)		
		
			-- TODO: it turns out auras already have Step.  remove this category?
		-- -- "Step" auras have a Step event called on every frame.
		-- -- Probably best to use this one sparingly.
		-- self.step={}
		-- tinsert(self.auralists,self.step)
		
		self.damageovertime={}
		tinsert(self.auralists,self.damageovertime)
		self.visual_modellighting={}
		tinsert(self.auralists,self.visual_modellighting)
		self.visual_modelalpha={}
		tinsert(self.auralists,self.visual_modelalpha)

		self.facing={}		
		tinsert(self.auralists,self.facing)
		self.facing_telegraph={}
		tinsert(self.auralists,self.facing_telegraph)
		
		self.ignorewalls={}
		tinsert(self.auralists,self.ignorewalls)
		self.wind={}
		tinsert(self.auralists,self.wind)
		self.freezeboss={}
		tinsert(self.auralists,self.freezeboss)				
		
		-- we suspect grip will also be used for "pathed teleport" sequences
		self.grip={}		
		tinsert(self.auralists,self.grip)

		
		-- TODO: we're using this category for rolls and charges; rename SpecialMovementTechnique
		self.forcedmovement={}
		tinsert(self.auralists,self.forcedmovement)
	end


		
	function class:Step(elapsed)
		for i=1,#self.allauras,1 do
			self.allauras[i]:Step(elapsed)
		end
	end

	--TODO: auras and gameobjects should themselves be responsible for calling Die
		-- (even if we call the function that calls Die from this function)
	function class:CheckAuraExpiry()
		for i=1,#self.allauras,1 do
			--print("Comparing expiry",self.allauras[i].expiry,"to localtime",self.combat.localtime)
			if(self.allauras[i].expiry)then									
				if(self.combat.localtime>=self.allauras[i].expiry)then					
					--TODO: PartialTick()
					self.allauras[i]:PartialTick(self.combat.localtime)
					self.allauras[i]:Die()				
					--TODO: OnAuraExpiredEffect()
					--TODO: OnAuraRemovedEffect() somewhere, maybe not here				
				end
			end
		end
	end
	
	
	function class:DEBUG_DispelEntireAuraList(auralist)
		--WARNING: the "allauras" list doesn't include newauras!
		--WARNING: the "allauras" list DOES include damageflash!
		for i=1,#auralist do
			local aura=auralist[i]
			--TODO: self.allauras[i]:Dispel() or OnDispel()
			aura:Die()
		end
	end
	

	
	--TODO: rename EndOfFrame? (and move to end of frame)
	function class:EndOfFrame()
		for i=1,#self.newauras,1 do
			--print("Transfer new aura to lists:",self.newauras[i])
			self.newauras[i]:TransferFromNewauraLists(self)
		end
		self.newauras={}	

	
	
	
		for i=#self.allauras,1,-1 do
			local aura=self.allauras[i]
			if(aura.dying)then
				aura:Cleanup()	-- this SHOULD set dead to true
				if(not aura.dead) then
					-- jump into specific aura's file before crashing noisily
					aura:FatalErrorObjNotDeadAfterCleanup()
				end
			end
		end
		--TODO: iterate through list of aura lists
		for j=1,#self.auralists do
			local auralist=self.auralists[j]
			for i=#auralist,1,-1 do
				local aura=auralist[i]
				if(aura.dead)then
					tremove(auralist,i)
				end
			end
		end
	end
	
	
	function class:GetAurasByClassIfExist(auraclass,auralist)
		local result={}
		local list=auralist
		if(not list)then list=self.allauras end
		for i=1,#list do
			local aura=list[i]			
			if(aura:Class()==auraclass)then
				--print("aura:Class",aura:Class(),"auraclass",auraclass)
				tinsert(result,aura)
			end
		end
		return result
	end
	
	
	function class:GetAurasByClassIfExistIncludingNewAuras(auraclass,auralist)
		local result={}
		local list=auralist
		if(not list)then list=self.allauras end
		for i=1,#list do
			local aura=list[i]			
			if(aura:Class()==auraclass)then
				--print("aura:Class",aura:Class(),"auraclass",auraclass)
				tinsert(result,aura)
			end
		end
		list=self.newauras
		for i=1,#list do
			local aura=list[i]			
			if(aura:Class()==auraclass)then
				--print("aura:Class",aura:Class(),"auraclass",auraclass)
				tinsert(result,aura)
			end
		end		
		return result
	end
		
	
	
	function class:Cleanup()
		--TODO: is aura cleanup necessary?
	end
end
