do
	local super=XPRACTICE.GameObject
	XPRACTICE.CollisionLine=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.CollisionLine
	
	function class:Setup(environment,x1,y1,z1,x2,y2,z2)
		self.particlexoffset=0
		self.particleyoffset=0
		self.fileid=0
		
		super.Setup(self,environment,x1,y1,z1)

		self.linesegment={}

		self.linesegment.x1=x1
		self.linesegment.y1=y1
		self.linesegment.z1=z1
		self.linesegment.x2=x2
		self.linesegment.y2=y2
		self.linesegment.z2=z2

		self.normal2d=XPRACTICE.WrapAngle(math.atan2(y2-y1,x2-x1)+math.pi*0.5)

	end
	
	
	
end