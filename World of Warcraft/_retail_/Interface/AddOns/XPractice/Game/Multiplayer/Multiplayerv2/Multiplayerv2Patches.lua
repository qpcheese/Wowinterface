do
	local class=XPRACTICE.PlayerNameplate
	function class:SetTextonlySize(size)
		--print("!!!")
		if(size<10)then size=10 end
		local multiplier=self.scalemultiplier or 1
		size=size*multiplier
		local scale=size/100 --tentative
		--print("Textonly scale",scale)		
		if(scale<0.1)then scale=0.1 end
		self.displayobject.textonly.fontstring:SetScale(scale)	--!!!
		self.displayobject.textonly:SetWidth(size*4)				--!!!
		self.displayobject.textonly:SetHeight(53) --!!!  --TODO: without this line, why does height change after closing+reopening xpractice?
	end	
	

	function class:Draw()
		local x1,y1,z1,x2,y2,z2=self.mob.displayobject:GetActiveBoundingBox()
		if(not z2)then z2=0 end
		local x3D,y3D,z3D
		x3D=self.mob.position.x
		y3D=self.mob.position.y
		z3D=self.mob.position.z+z2*self.mob.scale
		local x2D,y2D,z2D=self.environment.modelsceneframe:Project3DPointTo2D(x3D,y3D,z3D)
		
		-- adjust projected point for large screen size
		-- (we're not sure why this works, but it does)
		local multiplier
		local l1,b1,w1,h1=UIParent:GetRect()
		local l2,b2,w2,h2=UIParent:GetScaledRect()
		multiplier=w1/w2		
		x2D=x2D*multiplier
		y2D=y2D*multiplier
		-- do NOT multiply z2D by multiplier
		
		local NEAR_CLIP=1.0		
		if(z2D<NEAR_CLIP)then
			self.displayobject.drawable:SetPoint("BOTTOM",self.displayobject.parentframe,"BOTTOMLEFT",x2D,y2D)
			self.in_front_of_camera=true			
		else
			self.in_front_of_camera=false
		end
		self.zsort=z2D
		
		local camerafocus=self.mob.environment.cameramanager.camera.focus
		--if(self.selected==true or self.selectsize>0)then
		if(self.selectsize>0)then
			self:SetNearby()
		else
			if(camerafocus)then
				local distx=camerafocus.position.x-self.mob.position.x
				local disty=camerafocus.position.y-self.mob.position.y
				local distsqr=distx*distx+disty*disty
				local LONGRANGE_CUTOFF=60	 --TODO: 50 or 60?
				if(distsqr<=LONGRANGE_CUTOFF*LONGRANGE_CUTOFF)then
					self:SetNearby()
				else
					self:SetLongrange()
				end
			end
		end

		if(self:IsVisibleToCamera())then
			local alpha=self.alpha or 1		--TODO: this should go in baseline Nameplate
			self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(alpha,0,1))
		else
			self.displayobject.drawable:SetAlpha(0)
		end		
	end	
end