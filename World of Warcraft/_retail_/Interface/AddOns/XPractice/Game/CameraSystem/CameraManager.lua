
-- CameraManager provides a way for objects to say "I belong to the ______ framelayer"
	-- without needing a single unchanging camera to point to.

do

	XPRACTICE.CameraManager = {}
	local class=XPRACTICE.CameraManager
	class.__index = class

	function class.new()
		local self=setmetatable({}, class)	
		return self
	end

	function class:Setup(environment)
		self.environment=environment
		self.layerlist={"default",
						"nameplate",
						"ysort",
						"telegraph",
						"voidzone",
						"arenaborder",						
						"movementarrow",
						"shadow",
						"targetcircle",
						"floor",
						"skybox2",
						"skybox"}
		for i=1,#self.layerlist do
			local layername=self.layerlist[i].."framelayer"
			self[layername]={level=1}
		end
		
		local defaultcamera=self.environment.CreateDefaultCamera()
		defaultcamera:Setup(self.environment)
		self:HookUpCamera(defaultcamera)
		
		--print("cameramanager setup")
	end
	
	function class:HookUpCamera(camera)
		--TODO: if previous camera exists, call Die() on it?
		
		self.camera=camera
		for i=1,#self.layerlist do
			local layername=self.layerlist[i].."framelayer"
			if(camera[layername])then
				--we want this to POINT TO camera layer number
				-- while still preserving the pointer in case we change cameras later
				self[layername].level=camera[layername].level
			end
		end		
	end

end

