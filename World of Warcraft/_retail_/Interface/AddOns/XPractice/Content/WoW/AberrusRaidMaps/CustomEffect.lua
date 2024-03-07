do
	
		
	-- local prev=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.CreateCombatModule
	-- function XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost:CreateCombatModule()	
		-- prev(self)
		-- local spell=XPRACTICE.Spell_CustomEffect.new()
		-- spell:Setup(self.combatmodule)
		-- self.combatmodule.spellbook.customeffect=spell
	-- end
	
	-- do	
		-- local super=XPRACTICE.Spell
		-- XPRACTICE.Spell_CustomEffect=XPRACTICE.inheritsFrom(super)
		-- local class=XPRACTICE.Spell_CustomEffect
		
		-- function class:SetCustomInfo()
			-- super.SetCustomInfo(self)
			-- self.name="Custom Measurement Effect"
			-- self.icon="interface/icons/inv_misc_questionmark.blp"
			-- self.requiresfacing=false;self.projectileclass=nil;self.basechannelduration=nil;self.basechannelticks=nil			
			-- self.basecastduration=0.0;self.basecooldown=0.0;self.usablewhilemoving=true
		-- end

		-- function class:CompleteCastingEffect(castendtime,spellinstancepointer)				
			-- local mob=spellinstancepointer.castercombat.mob
			-- if(mob:IsDeadInGame())then return end
			-- local scenario=mob.scenario	
				
			
			

		-- end
	-- end
	
		
	
	local super=XPRACTICE.GameObject
	XPRACTICE.ABERRUSRAIDMAPS.CustomEffect=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ABERRUSRAIDMAPS.CustomEffect
	
	-- function class:SetCustomInfo()
		-- super.SetCustomInfo(self)
		-- self.target=nil
		-- self.targettype="GROUND"
		-- self.attach=false
		-- self.appearance="R"
		-- self.color="R"		
		-- self.radius=3
		-- self.fileid=nil
		-- self.behavioronexpiry=nil
		-- self.followup=nil		
		
		-- self.alivetime=0
	-- end
	
	-- function class:CalcScale()
		-- self.scale = 1 --!!!
	-- end
	
	--static
	function XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.RadiusToChar(radius)
		return string.char(radius+48)
	end

	-- function class:SetActorAppearanceViaOwner(actor)
		-- self:CalcScale()			
		-- actor:SetModelByFileID(self.fileid)	
	-- end		
	-- function class:SetDefaultAnimation()
		-- if(true)then--if(self.fileid== )then
			-- self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileLoopCustomDuration)
			-- self.projectilespawncustomduration=0.25
			-- self.projectileloopcustomduration=nil
			-- self.projectiledespawncustomduration=0.25	
		-- end
	-- end
	
	-- function class:Step(elapsed)
		-- super.Step(self,elapsed)
		-- self.alivetime=self.alivetime+elapsed
		
		-- if(self.attach and self.target)then
			-- self.position.x=self.target.position.x
			-- self.position.y=self.target.position.y
		-- end
		
		-- if(self.alivetime>=self.duration)then
			-- self:Die();
			-- if(self.behavioronexpiry)then
			
			-- end
			-- if(self.followup)then
				
			-- end
		-- end
		
	-- end
	
	
	
	function XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(code)
		local result=""
		if(string.sub(code,1,1)=="E")then
			result=result.."Enemy"
		elseif(string.sub(code,1,1)=="P")then
			result=result.."Player"
		else
			result=result.."Ground"
		end
		if(string.sub(code,2,2)=="B")then
			result=result.." blue"
		elseif(string.sub(code,2,2)=="R")then
			result=result.." red"
		elseif(string.sub(code,2,2)=="G")then
			result=result.." gray"
		end
		if(string.sub(code,3,3)=="R")then
			result=result.." ring"
		elseif(string.sub(code,3,3)=="S")then
			result=result.." swirl"
		elseif(string.sub(code,3,3)=="B")then
			result=result.." combo"
		elseif(string.sub(code,3,3)=="C")then
			result=result.." solid"
		end
		result=result.." "..tostring(string.byte(string.sub(code,4,4))-48).."y"
		
		return result
	end
	
	
	function XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.MakeActorFromCode(multisolid,code,x,y)
		local target=string.sub(code,1,1)
		local color=string.sub(code,2,2)
		local shape=string.sub(code,3,3)
		--print("Code:",code)
		local radius=string.byte(string.sub(code,4,4))-48
		if(radius<1)then radius=1 end
		if(radius>50)then radius=50 end
		
		local targetz=0.05
		--local scalefactor=1.0/4.5	-- radius ends somewhere around middle of ring
		local scalefactor=1.0/4.0	-- radius ends at inside of ring
		local cylinderscalefactor=1/13.88788
		
		local fileid=3507005
		local svk=nil
		if(color=="B" and shape=="R")then
			fileid=3507005
		elseif(color=="B" and shape=="S")then
			fileid=3507002
		elseif(color=="B" and shape=="B")then
			fileid=3507001
		elseif(color=="B" and shape=="C")then
			fileid=996281
			svk=6526			
		elseif(color=="G" and shape=="R")then	
			--fileid=4180161		-- tried progenitor colors, turned out to be more gold than gray
			fileid=1012306
		elseif(color=="G" and shape=="S")then
			--fileid=4180158
			fileid=1034237
		elseif(color=="G" and shape=="B")then
			--fileid=4180157
			fileid=943463
		elseif(color=="G" and shape=="C")then
			fileid=3089968
			svk=6526
			scalefactor=cylinderscalefactor
		elseif(color=="R" and shape=="R")then
			--fileid=3642468				--revendreth swirl is wrong scale for whatever reason.  use fire instead
			fileid=1011918
		elseif(color=="R" and shape=="S")then
			--fileid=3642466			
			fileid=1034184
		elseif(color=="R" and shape=="B")then
			--fileid=3642464
			fileid=943427
		elseif(color=="R" and shape=="C")then
			fileid=3089937
			svk=6526
			scalefactor=cylinderscalefactor
		end		
		
		local verticalscalefactor=0.0
		
		if(shape=="R")then
			targetz=0.055
		elseif(shape=="S")then
			targetz=0.05
		elseif(shape=="B")then
			targetz=0.0525
		elseif(shape=="C")then
			targetz=0.25
		end
		if(shape=="C")then
			scalefactor=cylinderscalefactor
			verticalscalefactor=-0.1/cylinderscalefactor
		end
		
		local scale=scalefactor*radius
		local z=targetz+verticalscalefactor*scale
		--print("Z:",targetz,scale,verticalscalefactor,z)
		local actor=multisolid:AddActorByFileID(fileid,x,y,z,scale)
		actor:SetAnimation(158)
		actor:SetSpellVisualKit(svk)
		actor.dying=false;actor.attach=nil
		actor.radius=radius
		--print("AddActor:",fileid,x,y,targetz,scale)
		return actor
	end
	

	
	
	
end