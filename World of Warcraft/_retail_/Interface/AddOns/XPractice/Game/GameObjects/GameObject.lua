do
	XPRACTICE.GameObject = {}
	local class=XPRACTICE.GameObject
	class.__index = class

	function class.new()
		local self=setmetatable({}, class)
		return self
	end

	local _XPRACTICE_GameObject_NextObjectID=0
	local function _XPRACTICE_GameObject_GetNextObjectIDAndIncrement()
		_XPRACTICE_GameObject_NextObjectID=_XPRACTICE_GameObject_NextObjectID+1
		return _XPRACTICE_GameObject_NextObjectID	
	end

	function class:Setup(environment,x,y,z)
		self.environment=environment
		
		self.id=_XPRACTICE_GameObject_GetNextObjectIDAndIncrement()
		
		
		if(x and y)then
			if(z==nil)then z=0 end
			self.position={x=x,y=y,z=z}
		else
			self.position={x=0,y=0,z=0}
		end
		self.localtime=0
		self.fadestarttime=nil
		self.alreadyfadestarted=false
		self.expirytime=nil
		
		self.alpha=1
	

		
		self.velocity={x=0,y=0,z=0}
		
		self.jumpvelocity={x,0,y=0,z=10}		
		self.gravity=-25
		
		-- Object's "true" orientation with respect to WASD tank controls.
		self.orientation={yaw=0,pitch=0,roll=0}
		-- Object's orientation as displayed on screen.
		self.orientation_displayed={yaw=0,pitch=0,roll=0}
		-- Object's orientation as *should be* displayed on screen, but maybe hasn't caught up yet.
			-- (Recalculated every frame while moving.)
		self.target_orientation_displayed={yaw=0,pitch=0,roll=0}
		self.scale=1
		
		self:SetCustomInfo()
		self:CreateDisplayObject()
		
		self:SetupEnvironmentObjectListIndexStorage()
		
		self:CreateAssociatedObjects()
		
		if(self:ExistsInPhase())then
			self.phasealpha=self.startingphasealpha
		else
			self.phasealpha=0
		end
		
		tinsert(environment.newgameobjects,self)
	end

	function class:SetCustomInfo()
		self.phase=1
		--GameObjects and WoWObjects start with alpha 1
		--Mobs start with alpha 0 and must fade in
		self.startingphasealpha=1
		--GameObjects are visible from all phases by default
		--WoWObjects and Mobs are not
		self.visiblefromallphases=true
		
		self.targetable=false
	end

	function class:CreateDisplayObject()
	end

	function class:CreateAssociatedObjects()
		-- for objects that should create other objects
		-- on the same frame as they are themselves created.
	end
	
	function class:SetupEnvironmentObjectListIndexStorage()
		--override, call super when overriding
		
		-- List of environment objectlists relevant to this object (gameobjects, mobs, nameplates, etc)
		self.environmentobjectlists={}
		tinsert(self.environmentobjectlists,self.environment.gameobjects)
		
		-- Objects are transferred from newgameobject list to currentobject lists by Environment at end of frame
		-- 			(next function)	
		-- Dead objects are removed from currentobject lists by Environment at end of frame
	end


	function class:TransferFromEnvironmentNewobjectLists(environment)
		for i=1,#self.environmentobjectlists,1 do
			tinsert(self.environmentobjectlists[i],self)
		end
	end 
	
	function class:GetPlayerInput()
		--override
	end
	
	function class:Step(elapsed)
		--override, call super		
		self.localtime=self.localtime+elapsed
		self:RecordPreviousPosition()
		self:Movement(elapsed)		
		if(self.fadestarttime and not self.alreadyfadestarted)then
			if(self.environment.localtime>=self.fadestarttime)then
				--TODO: move fade effect from wowobject to gameobject?				
				self.alreadyfadestarted=true
				self:OnFadeStart()
			end
		end
		if(self.expirytime)then
			if(self.environment.localtime>=self.expirytime)then
				--TODO: the child class still gets a Step event after this is called
				self:OnExpiry()
			end
		end
	end
	
	function class:RecordPreviousPosition()
		self.previousposition={x=self.position.x,y=self.position.y,z=self.position.z}
	end
	
	function class:Movement(elapsed)		
		self.position.x=self.position.x+self.velocity.x*elapsed
		self.position.y=self.position.y+self.velocity.y*elapsed		
		self.position.z=self.position.z+self.velocity.z*elapsed
	end
	
	function class:Draw()
		--override.
		--BE SURE TO CALL SetPositionAndScale SOMEWHERE
	end
	
	function class:OnFadeStart()
		--override
		--TODO: baseline fade animation?
	end
	
	function class:ExistsInPhase(phase)
		if(self.visiblefromallphases)then return true end
		
		--override as necessary
		if(not phase)then 
			local camera=self.environment.cameramanager.camera
			phase=camera.phase
		end
		if(phase==self.phase)then
			return true
		else
			return false
		end
	end
	
	function class:OnExpiry()		
		self:Die()
	end
	
	function class:Die()		
		self.dying=true
	end
	
	function class:Cleanup()
		if(self.displayobject)then
			self.displayobject:Cleanup()
		end
		self.dead=true
	end
end