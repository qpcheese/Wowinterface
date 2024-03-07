do
	local super=XPRACTICE.GameObject
	XPRACTICE.MobClickZone=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.MobClickZone

	function class:Setup(environment,mob)
		super.Setup(self,environment)
		self.mob=mob
		--Mob is responsible for cleaning up clickzone when it dies!
		mob.mobclickzone=self
		self.zsort=1
		self.in_front_of_camera=false
	end
			
	function class:SetupEnvironmentObjectListIndexStorage()
		super.SetupEnvironmentObjectListIndexStorage(self)		
		tinsert(self.environmentobjectlists,self.environment.mobclickzones)
	end	
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.MobClickZoneDisplayObject.new()
		self.displayobject:Setup(self)
	end		

	function class:Draw()
		local x1,y1,z1,x2,y2,z2=self.mob.displayobject:GetActiveBoundingBox()
		if(not x1)then return end
		x1=x1*self.mob.scale
		y1=y1*self.mob.scale
		z1=z1*self.mob.scale
		x2=x2*self.mob.scale
		y2=y2*self.mob.scale
		z2=z2*self.mob.scale
		
		local x2D={}
		local y2D={}
		local z2D={}
		
		x2D[1],y2D[1],z2D[1]=self.environment.modelsceneframe:Project3DPointTo2D(self.mob.position.x+x1,self.mob.position.y+y1,self.mob.position.z+z1)
		x2D[2],y2D[2],z2D[2]=self.environment.modelsceneframe:Project3DPointTo2D(self.mob.position.x+x2,self.mob.position.y+y1,self.mob.position.z+z1)
		x2D[3],y2D[3],z2D[3]=self.environment.modelsceneframe:Project3DPointTo2D(self.mob.position.x+x2,self.mob.position.y+y2,self.mob.position.z+z1)
		x2D[4],y2D[4],z2D[4]=self.environment.modelsceneframe:Project3DPointTo2D(self.mob.position.x+x1,self.mob.position.y+y2,self.mob.position.z+z1)
		x2D[5],y2D[5],z2D[5]=self.environment.modelsceneframe:Project3DPointTo2D(self.mob.position.x+x1,self.mob.position.y+y1,self.mob.position.z+z2)
		x2D[6],y2D[6],z2D[6]=self.environment.modelsceneframe:Project3DPointTo2D(self.mob.position.x+x2,self.mob.position.y+y1,self.mob.position.z+z2)
		x2D[7],y2D[7],z2D[7]=self.environment.modelsceneframe:Project3DPointTo2D(self.mob.position.x+x2,self.mob.position.y+y2,self.mob.position.z+z2)
		x2D[8],y2D[8],z2D[8]=self.environment.modelsceneframe:Project3DPointTo2D(self.mob.position.x+x1,self.mob.position.y+y2,self.mob.position.z+z2)
		
		local x2D1=math.min(x2D[1],x2D[2],x2D[3],x2D[4],x2D[5],x2D[6],x2D[7],x2D[8])
		local y2D1=math.min(y2D[1],y2D[2],y2D[3],y2D[4],y2D[5],y2D[6],y2D[7],y2D[8])
		local z2D1=math.min(z2D[1],z2D[2],z2D[3],z2D[4],z2D[5],z2D[6],z2D[7],z2D[8])
		local x2D2=math.max(x2D[1],x2D[2],x2D[3],x2D[4],x2D[5],x2D[6],x2D[7],x2D[8])
		local y2D2=math.max(y2D[1],y2D[2],y2D[3],y2D[4],y2D[5],y2D[6],y2D[7],y2D[8])
		local z2D2=math.max(z2D[1],z2D[2],z2D[3],z2D[4],z2D[5],z2D[6],z2D[7],z2D[8])
		
		-- adjust projected point for large screen size
		-- (we're not sure why this works, but it does)
		local multiplier
		local l1,b1,w1,h1=UIParent:GetRect()
		local l2,b2,w2,h2=UIParent:GetScaledRect()
		multiplier=w1/w2		
		x2D1=x2D1*multiplier
		y2D1=y2D1*multiplier
		x2D2=x2D2*multiplier
		y2D2=y2D2*multiplier		
		-- do NOT multiply z2D by multiplier
		
		self.zsort=(z2D2+z2D1)/2
		local NEAR_CLIP=1.0		
		self.in_front_of_camera=(self.zsort<NEAR_CLIP)
		
		self.displayobject.drawable:SetPoint("BOTTOMLEFT",self.displayobject.parentframe,"BOTTOMLEFT",x2D1,y2D1)
		self.displayobject.drawable:SetSize(x2D2-x2D1,y2D2-y2D1)
		
		if(self.mob.nameplate)then			
			--local scale=(x2D2-x2D1)/500 	--TODO:
			local multiplier=self.scalemultiplier or 1
			self.mob.nameplate:SetTextonlySize(x2D2-x2D1)
		end
		
		
		-- -------------- VISIBILITY BLOCK -----------------------------------
		-- local NEAR_CLIP=1.0		
		-- if((z2D1+z2D2)/2<NEAR_CLIP)then
			-- self.displayobject.drawable:SetPoint("BOTTOM",self.displayobject.parentframe,"BOTTOMLEFT",x2D,y2D)
			-- self.displayobject.drawable:SetAlpha(1)
			-- self.in_front_of_camera=true
		-- else
			-- self.displayobject.drawable:SetAlpha(0)
			-- self.in_front_of_camera=false
		-- end
		-- ---------------------------------------------------------------------
		
	end
	
	function class:IsClickable()
		return self.in_front_of_camera and self.mob:ExistsInPhase() and self.mob.targetable
	end
	
	function class:IsUnderMouse(globalx,globaly)
		--TODO: some overlap with Nameplate:IsUnderMouse
		if(self:IsClickable())then
			local left,bottom,width,height=self.displayobject.drawable:GetScaledRect()
			local right=left+width
			local top=bottom+height
			local vertical_leeway=0
			top=top+vertical_leeway
			bottom=bottom-vertical_leeway
			--print(globalx,globaly,nameplate.displayobject.drawable:GetScaledRect())
			if(left<=globalx and globalx<=right)then
				if(bottom<=globaly and globaly<=top)then
					-- --nameplate:SetSelected(true)								
					-- self.player:SetTargetMob(mobclickzone.mob)
					-- self.environment:SelectMob(mobclickzone.mob)
					-- if(keys.rmouse.pressed)then
						-- self.player.combatmodule:StartAutoAttacking()
					-- end									
					-- break
					-- --TODO:
					-- --self.player:SetTarget({mobclickzone.mob})
					
					--tinsert(self.potentialtargetlist,mobclickzone.mob)
					
					return true
				end
			end
		end
	end
end


-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.MobClickZoneDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.MobClickZoneDisplayObject
	
	function class:CreateDrawable()
		self.drawable=XPRACTICE.ReusableFrames:GetFrame()		
		tinsert(self.drawables,self.drawable)
	end
	
	function class:SetAppearance()		
		self.parentframe=self.owner.environment.frame
		self.drawable:SetParent(self.parentframe);self.drawable:SetFrameLevel(200)		
		self.drawable:Show()
		self.drawable:SetSize(1,1)
		self.drawable.texture:Show()
		--TODO: debug toggle
		
		if(XPRACTICE.DEBUG.visiblemobclickzones)then
			self.drawable:SetAlpha(0.5)
		else		
			self.drawable:SetAlpha(0)
		end
	end
	
end

