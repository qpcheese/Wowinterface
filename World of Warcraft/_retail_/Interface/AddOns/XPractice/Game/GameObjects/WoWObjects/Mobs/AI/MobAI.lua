do
	local i=0
	XPRACTICE.MobAIState={}
	XPRACTICE.MobAIState.UNPULLED=i
	i=i+1;XPRACTICE.MobAIState.PULLED=i
	i=i+1;XPRACTICE.MobAIState.PHASE1=i
	i=i+1;XPRACTICE.MobAIState.PHASE2=i
	i=i+1;XPRACTICE.MobAIState.PHASE3=i


end

do
	XPRACTICE.MobAI = {}
	local class=XPRACTICE.MobAI
	class.__index = class

	function class.new()
		local self=setmetatable({}, class)
		return self
	end

	
	function class:Setup(mob)
		self.mob=mob
		self.targetposition=nil
		self.targetradial=nil
		self.changeorientationtomovementdirection=false	-- NPCs usually use this, player characters don't
		self.moveinputvector={x=0,y=0}
		--TODO: we haven't worked out whether "pulled" should be a unique flag, or an AI state
		self.pulled=false
		self.state=XPRACTICE.MobAIState.UNPULLED
		self.mob:SetFacepullRadiusViaOwner(self)
		self.suggestmode=false
	end

	
	function class:Pull(pullermob)
		if(self.pulled==false)then
			self.pulled=true
			self.state=XPRACTICE.MobAIState.PULLED	
			--TODO: do something with pullermob
			self:OnPull()
		end
	end	
	
	function class:OnPull()
		--override
	end

	function class:SetTargetPosition(x,y)
		if(not x)then error("Invalid target coordinate x == nil") end
		if(not y)then error("Invalid target coordinate y == nil") end
		self.targetposition={x=x,y=y}
	end

	function class:ApproachPosition(x,y,elapsed)
		--returns true if mob is moving,
		--false if mob is close enough to position.
		if(not self:CloseEnoughToTarget(x,y,elapsed))then
			--print("distsqr",distsqr)
			local distx=(x-self.mob.position.x)
			local disty=(y-self.mob.position.y)			
			self.moveinputvector.x=distx
			self.moveinputvector.y=disty
			if(self.changeorientationtomovementdirection)then
				self.mob.orientation.yaw=math.atan2(disty,distx)
				--self.mob.orientation_displayed.yaw=math.atan2(disty,distx)--!!!
			end
			return true
		else			
			self.moveinputvector.x=0
			self.moveinputvector.y=0
			return false
		end
	end
	
	function class:CloseEnoughToTarget(x,y,elapsed)
		--WARNING: player.ai.targetposition vector must increase with movespeed
		--         otherwise player's targetposition will be too close at high movespeeds
		if(not x)then print("NOT X!") end
		if(not self.mob.position.x)then print("NOT SELF.MOB.POSITION.X!") end
		local distx=(x-self.mob.position.x)
		local disty=(y-self.mob.position.y)
		local distsqr=distx*distx+disty*disty
		--TODO: use self:GetFinalMoveSpeed() ^ 2 instead
		local movespeed=self.mob:GetFinalMoveSpeed()
		local movespeedelapsed=movespeed*(2*elapsed)
		local dist=math.sqrt(distsqr)	
		--print("CETT",dist,math.sqrt(movespeedelapsed*movespeedelapsed))
		return (distsqr<=movespeedelapsed*movespeedelapsed)
	end
	
	function class:AIStep(elapsed)
		if(self.targetposition)then
			local moving=self:ApproachPosition(self.targetposition.x,self.targetposition.y,elapsed)
			if(not moving)then	
				--TODO: don't set targetposition nil if forced movement occurs
				-- (not sure how to properly do this yet.  check that xspeed and yspeed are 0?)
				self.targetposition=nil
				self.mob:OnArrivedAtAIDestination()
			end
		elseif(self.targetradial)then			
			local targetx
			local targety
			local targetangle=self.targetradial.angle
			local targetdistance
			local currentangle=math.atan2(self.mob.position.y-self.targetradial.y,self.mob.position.x-self.targetradial.x)
			local distsqr=XPRACTICE.distsqr(self.mob.position.x,self.mob.position.y,self.targetradial.x,self.targetradial.y)
			local dist=math.sqrt(distsqr)						
			local diff=XPRACTICE.AngleDifference(targetangle,currentangle)			
			local signum=XPRACTICE.signum(diff)
			
			if(distsqr<self.targetradial.mindistance*self.targetradial.mindistance)then
				targetdistance=self.targetradial.mindistance+self.mob:GetFinalMoveSpeed()*(2*elapsed)
				local idealtargetx=self.targetradial.x+targetdistance*math.cos(targetangle)
				local idealtargety=self.targetradial.y+targetdistance*math.sin(targetangle)									
				local orthangle=currentangle+math.pi*0.5*(signum)
				local orthtargetx=self.mob.position.x+dist*math.cos(orthangle)
				local orthtargety=self.mob.position.y+dist*math.sin(orthangle)
				local playertoidealangle=math.atan2(idealtargety-self.mob.position.y,idealtargetx-self.mob.position.x)
				local orthtoidealdiff=XPRACTICE.AngleDifference(playertoidealangle,orthangle)
				if(XPRACTICE.signum(orthtoidealdiff)~=signum)then
					targetx=idealtargetx
					targety=idealtargety
				else
					targetx=orthtargetx
					targety=orthtargety					
				end
			elseif(distsqr>self.targetradial.maxdistance*self.targetradial.maxdistance)then			
				targetdistance=self.targetradial.maxdistance-self.mob:GetFinalMoveSpeed()*(2*elapsed)			
				local idealtargetx=self.targetradial.x+targetdistance*math.cos(targetangle)
				local idealtargety=self.targetradial.y+targetdistance*math.sin(targetangle)					
				local righttriangley=targetdistance
				hypotenusedistx=(self.targetradial.x-self.mob.position.x)
				hypotenusedisty=(self.targetradial.y-self.mob.position.y)
				local hypotenusedistsqr=hypotenusedistx*hypotenusedistx+hypotenusedisty*hypotenusedisty
				if(hypotenusedistsqr>righttriangley*righttriangley)then
					righttrianglex=math.sqrt(hypotenusedistsqr-righttriangley*righttriangley)
				else
					righttrianglex=0
				end
				local idealtargetx=self.targetradial.x+targetdistance*math.cos(targetangle)
				local idealtargety=self.targetradial.y+targetdistance*math.sin(targetangle)		
				local idealdistx=idealtargetx-self.mob.position.x
				local idealdisty=idealtargety-self.mob.position.y
				local idealdistsqr=idealdistx*idealdistx+idealdisty*idealdisty
				local tangentangle=math.atan2(righttriangley,righttrianglex)*signum
				local playertoidealangle=math.atan2(idealtargety-self.mob.position.y,idealtargetx-self.mob.position.x)
				local tangenttoidealdiff=XPRACTICE.AngleDifference(playertoidealangle,tangentangle)
				
				if(idealdistsqr<=righttrianglex*righttrianglex)then
					targetx=idealtargetx
					targety=idealtargety
				else										
					local hypotenusedist=math.sqrt(hypotenusedistsqr)
					if(hypotenusedist<0.01)then hypotenusedist=0.01 end
					local sineangle=math.asin(righttrianglex/hypotenusedist)*signum
					targetx=self.targetradial.x+targetdistance*math.cos(currentangle+sineangle)
					targety=self.targetradial.y+targetdistance*math.sin(currentangle+sineangle)
				end
			else
				targetdistance=dist
				local idealtargetx=self.targetradial.x+targetdistance*math.cos(targetangle)
				local idealtargety=self.targetradial.y+targetdistance*math.sin(targetangle)					
				local signum=XPRACTICE.signum(diff)
				local orthangle=currentangle+math.pi*0.5*(signum)
				local idealtargetx=self.targetradial.x+targetdistance*math.cos(targetangle)
				local idealtargety=self.targetradial.y+targetdistance*math.sin(targetangle)
				if(not self:CloseEnoughToTarget(idealtargetx,idealtargety,elapsed))then		
					targetx=self.mob.position.x+dist*math.cos(orthangle)
					targety=self.mob.position.y+dist*math.sin(orthangle)
				else
					targetx=idealtargetx	--i.e., move nowhere
					targety=idealtargety
				end
			end		
			
			if(targetx and targety)then
				local moving=self:ApproachPosition(targetx,targety,elapsed)
				if(not moving)then
					self.targetradial=nil
					self.mob:OnArrivedAtAIDestination()
				end
			else
				--TODO: assertion failed?
				self.targetradial=nil
				self.mob:OnArrivedAtAIDestination()
			end
		else	-- else no target
			self.moveinputvector.x=0
			self.moveinputvector.y=0	
		end
	end

end