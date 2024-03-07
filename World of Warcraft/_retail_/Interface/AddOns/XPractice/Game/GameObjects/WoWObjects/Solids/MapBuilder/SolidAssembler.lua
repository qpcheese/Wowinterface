do
	local rect={}
	local lefttri={}
	local midlefttri={}
	local midtri={}
	local midrighttri={}
	local righttri={}
	local shapes={rect,lefttri,midlefttri,midtri,midrighttri,righttri}

	for i=1,#shapes do
		shapes[i]["4x"]={}
		shapes[i]["3x"]={}
		shapes[i]["2x"]={}
		shapes[i]["1x"]={}
		shapes[i]["0.5x"]={}		
		shapes[i]["0.33x"]={}
		shapes[i]["0.25x"]={}
		shapes[i]["R"]={}
	end
	for k,v in pairs(shapes)do
		for k2,v2 in pairs(v)do
			v2.class="ERROR: "..k..k2
		end
	end
	local codesuffix={}
	codesuffix["4x"]="4"
	codesuffix["3x"]="3"
	codesuffix["2x"]="2"
	codesuffix["1x"]="1"
	codesuffix["0.5x"]="h"
	codesuffix["0.33x"]="t"
	codesuffix["0.25x"]="q"
	codesuffix["R"]="r"
	for k,v in pairs(rect)do v.name="rect_"..k; v.codename="Q"..codesuffix[k] end
	for k,v in pairs(lefttri)do v.name="lefttri_"..k; v.codename="L"..codesuffix[k] end
	for k,v in pairs(midlefttri)do v.name="midlefttri_"..k; v.codename="R"..codesuffix[k] end
	for k,v in pairs(midtri)do v.name="midtri_"..k; v.codename="m"..codesuffix[k] end
	for k,v in pairs(midrighttri)do v.name="midrighttri_"..k; v.codename="r"..codesuffix[k] end
	for k,v in pairs(righttri)do v.name="righttri_"..k; v.codename="l"..codesuffix[k] end

	rect["4x"].class="Rectangle003"
	rect["2x"].class="Rectangle002"
	rect["1x"].class="Rectangle001"
	rect["R"].class="Rectangle001"		
	rect["0.5x"].class="Rectangle002"		
	rect["0.25x"].class="Rectangle003"			
	lefttri["3x"].class="Ramp003"
	lefttri["2x"].class="Ramp004"
	lefttri["1x"].class="Ramp002"
	lefttri["0.5x"].class="Ramp004"
	lefttri["0.33x"].class="Ramp003"
	midlefttri["0.5x"].class="Ramp004"			
	midlefttri["0.33x"].class="Ramp003"			
	righttri["3x"].class="Ramp003"
	righttri["2x"].class="Ramp004"
	righttri["1x"].class="Ramp002"
	righttri["0.5x"].class="Ramp004"
	righttri["0.33x"].class="Ramp003"
	midrighttri["0.5x"].class="Ramp004"			
	midrighttri["0.33x"].class="Ramp003"			
	midtri["1x"].class="Ramp002"
	midtri["R"].class="Ramp002"

	XPRACTICE.ASSEMBLYSHAPES={}
	XPRACTICE.ASSEMBLYSHAPES.Q4=rect["4x"]
	XPRACTICE.ASSEMBLYSHAPES.Q2=rect["2x"]
	XPRACTICE.ASSEMBLYSHAPES.Q1=rect["1x"]
	XPRACTICE.ASSEMBLYSHAPES.Qr=rect["R"]
	XPRACTICE.ASSEMBLYSHAPES.Qh=rect["0.5x"]
	XPRACTICE.ASSEMBLYSHAPES.Qq=rect["0.25x"]
	XPRACTICE.ASSEMBLYSHAPES.L3=lefttri["3x"]
	XPRACTICE.ASSEMBLYSHAPES.L2=lefttri["2x"]
	XPRACTICE.ASSEMBLYSHAPES.L1=lefttri["1x"]
	XPRACTICE.ASSEMBLYSHAPES.Lh=lefttri["0.5x"]
	XPRACTICE.ASSEMBLYSHAPES.Lt=lefttri["0.33x"]
	XPRACTICE.ASSEMBLYSHAPES.R3=righttri["3x"]
	XPRACTICE.ASSEMBLYSHAPES.R2=righttri["2x"]
	XPRACTICE.ASSEMBLYSHAPES.R1=righttri["1x"]
	XPRACTICE.ASSEMBLYSHAPES.Rh=righttri["0.5x"]
	XPRACTICE.ASSEMBLYSHAPES.Rt=righttri["0.33x"]
	XPRACTICE.ASSEMBLYSHAPES.lh=midlefttri["0.5x"]
	XPRACTICE.ASSEMBLYSHAPES.lt=midlefttri["0.33x"]
	XPRACTICE.ASSEMBLYSHAPES.rh=midrighttri["0.5x"]
	XPRACTICE.ASSEMBLYSHAPES.rt=midrighttri["0.33x"]
	XPRACTICE.ASSEMBLYSHAPES.m1=midtri["1x"]

	
	-- local Q4,Q2,Q1,Qr,Qh,Qq,L3,L2,L1,Lh,Lt,R3,R2,R1,Rh,Rt,lh,lt,rh,rt,m1,END=XPRACTICE.ASSEMBLYSHAPES.Q4,XPRACTICE.ASSEMBLYSHAPES.Q2,XPRACTICE.ASSEMBLYSHAPES.Q1,XPRACTICE.ASSEMBLYSHAPES.Qr,XPRACTICE.ASSEMBLYSHAPES.Qh,XPRACTICE.ASSEMBLYSHAPES.Qq,XPRACTICE.ASSEMBLYSHAPES.L3,XPRACTICE.ASSEMBLYSHAPES.L2,XPRACTICE.ASSEMBLYSHAPES.L1,XPRACTICE.ASSEMBLYSHAPES.Lh,XPRACTICE.ASSEMBLYSHAPES.Lt,XPRACTICE.ASSEMBLYSHAPES.R3,XPRACTICE.ASSEMBLYSHAPES.R2,XPRACTICE.ASSEMBLYSHAPES.R1,XPRACTICE.ASSEMBLYSHAPES.Rh,XPRACTICE.ASSEMBLYSHAPES.Rt,XPRACTICE.ASSEMBLYSHAPES.lh,XPRACTICE.ASSEMBLYSHAPES.lt,XPRACTICE.ASSEMBLYSHAPES.rh,XPRACTICE.ASSEMBLYSHAPES.rt,XPRACTICE.ASSEMBLYSHAPES.m1,"END"
	
	do

		local super=XPRACTICE.GameObject
		XPRACTICE.SolidAssembler=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SolidAssembler
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)
			self.solids={}
			self.pivotx=0
			self.pivoty=0
			self.offsetx=0
			self.offsety=0
			self.offsetz=0
			self.angle=0
		end
		
		function class:A(z,c,s,d)
			self:Assemble(z,c,s,d)
		end
		
		function class:Assemble(z,c,s,d)
			local set=d			-- careful, this isn't a separate copy of the table, so don't change anything
			set.zoffset=z or 0		-- zoffset is not actually used at the moment, because we're already baking z coordinate
			set.coloraffix=c or ""
			set.svk=s or nil
			tinsert(self.solids,set)
		end
		
		function class:Activate()
			self.state=0
			self.currentset=1
			self.currentsolid=1			
			self.timer=0
			self.shapecount=0
			self.active=true
			
			self.multisolid.TEMP_centerx=self.centerx
			self.multisolid.TEMP_centery=self.centery
			self.multisolid.TEMP_centerz=self.TEMP_centerz
			
			
		end
		
		function class:Step(elapsed)
			self.timer=self.timer-elapsed
			if(self.timer<0)then
				self.timer=self.timer+0.03
				--for i=1,15 do				
				while(self.active)do
					if(self.active)then						
						if(self.state==0)then		
							local set=self.solids[self.currentset]
							local solid=set[self.currentsolid]				
							--print(solid,solid[1])
							if(solid[1]~="END")then
								--print("Try",self.currentset,"-",self.currentsolid,"...",solid,solid[1].class)	
								--print(self.currentsolid,class)
								local class=XPRACTICE.SOLIDS[solid[1].class..set.coloraffix]
								local x,y,z,scale,yaw,pitch=solid[2],solid[3],solid[4],solid[5],solid[6],solid[7]
								--print(x,y,z,scale,yaw,pitch)
								x,y=XPRACTICE.Transform_Rotate2D(x,y,self.angle,self.pivotx,self.pivoty)
								x=x+self.offsetx-self.centerx
								y=y+self.offsety-self.centery
								z=z+self.offsetz
								yaw=yaw+self.angle
								local roll=0			
								local INITIAL_Z_OFFSET=10.0
								local a=self.multisolid:AddActorByClass(class,x,y,z,scale,yaw,pitch,roll)								
								a.x=x;a.y=y;a.targetz=z;a.scale=scale
								a:SetAlpha(0)
								if(set.svk and set.svk>0)then
									a:SetSpellVisualKit(set.svk)
								end
								self.shapecount=self.shapecount+1
							end
							self.currentsolid=self.currentsolid+1					
							if(self.currentsolid>#self.solids[self.currentset])then
								self.currentsolid=1
								self.currentset=self.currentset+1
								if(self.currentset>#self.solids)then
									self.state=1
									self.active=false
									if(self.multisolid.FinishAssemblyCallback) then self.multisolid:FinishAssemblyCallback() end
									self:Die()									
									--print("Added",self.shapecount,"solids.")
								end
							end
						end				
					end
				end
			end		
		end
	end	
end