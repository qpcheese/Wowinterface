_XPRACTICE_ReusableModelSceneFrames = XPRACTICE.inheritsFrom(_XPRACTICE_ReusableFrames)

XPRACTICE.ReusableModelSceneFrames=_XPRACTICE_ReusableModelSceneFrames.new()
XPRACTICE.ReusableModelSceneFrames.inactiveframes={}
XPRACTICE.ReusableModelSceneFrames.activeframes={}
XPRACTICE.ReusableModelSceneFrames.nextframeid=0

function _XPRACTICE_ReusableModelSceneFrames:NextFrameName()	
	return "XPRACTICE.ReusableModelSceneFrame"..tostring(self.nextframeid);
end

function _XPRACTICE_ReusableModelSceneFrames:ReturnCreateFrameDetails(framename)
	local f=CreateFrame("ModelScene",framename,UIParent)
	f.inactiveactors={}
	f.activeactors={}
	f.nextactorid=0
	return f
	--return CreateFrame("PlayerModel",framename,UIParent)
end

function _XPRACTICE_ReusableModelSceneFrames:ResetProperties(f)	
	XPRACTICE.ReusableFrames.ResetProperties(self,f)
	f:SetCameraOrientationByYawPitchRoll(0,0.1,0)
	f:SetCameraPosition(0,0,0)
	f:SetLightPosition(0,0,0)
	f:SetLightDirection(0,1,0)
	f:SetLightAmbientColor(0.7,0.7,0.7)			
	f:SetLightDiffuseColor(0.8,0.8,0.64)
	f:Hide()	
	for i=#f.activeactors,1,-1 do
		local a=f.activeactors[i]
		a:Cleanup()
	end
end

function _XPRACTICE_ReusableModelSceneFrames:ResetActorProperties(a)
	--print("reset a:",a)
	--a:SetModelByFileID(1)		--TODO NEXT: this now causes a forced DC in 100002.  find a substitute -- does ClearModel do anything?
	a:SetSpellVisualKit(nil)			
	a:SetPosition(0,0,0)
	a:SetPitch(0)
	a:SetRoll(0)
	a:SetYaw(0)
	a:SetScale(1)
	--a:SetAlpha(1)
	a:SetAlpha(0)
	a:SetDesaturation(0.0)
	a:SetUseCenterForOrigin(false)
	a:Hide()	
end

function _XPRACTICE_ReusableModelSceneFrames:GetActor(f)
	local a=tremove(f.inactiveactors)
	if not a then
		local actorname=XPRACTICE.ReusableModelSceneFrames:NextActorName(f)
		a=f:CreateActor()		
		a.name=actorname
		a.tag="(tag)"
		a.frame=f
		--print("CreateActor a,f:",a,f)
		--print("Created a new frame",f.name)
		-- if(framename=="XPRACTICE.ReusableFrame49")then
			-- error("breakpoint: frame 49")
		-- end

		a.Cleanup=function(self)XPRACTICE.ReusableModelSceneFrames:RemoveActor(f,a)end

		f.nextactorid=f.nextactorid+1
	else
		--print("Recycled an existing actor",a.name)
		--
	end
	--print("ReusableModelSceneFrames getting an actor ",a.name)
	tinsert(f.activeactors,a)

	-- NEW
	-- This might break something else
	a:Show()
	
	return a
end

function _XPRACTICE_ReusableModelSceneFrames:NextActorName(f)
	return "XPRACTICE.ReusableModelSceneActor"..tostring(f.nextactorid);	
end


function _XPRACTICE_ReusableModelSceneFrames:CreateNewActor(f)
	local a=f:CreateActor()
	a.Cleanup=function(self)XPRACTICE.ReusableModelSceneFrames:RemoveActor(f,a)end
end


function _XPRACTICE_ReusableModelSceneFrames:RemoveActor(f,a)	
	self:ResetActorProperties(a)

	local activecount=#f.activeactors
	XPRACTICE.tremovebyval(f.activeactors,a)	
	if(#f.activeactors==activecount)then
		print("tremovebyval:",f.activeactors,a)
		print("WARNING: failed to remove an actor from XPRACTICE.ReusableModelSceneFrames.activeactors")
		error(0)
	end
	if(XPRACTICE.tcontains(f.inactiveactors,a))then		
		local errorstring="XPRACTICE.ReusableModelSceneFrames.inactiveactors already contains "..tostring(a).." "..a.name.." "..a.tag
		print("WARNING: "..errorstring)
	else
		tinsert(f.inactiveactors,a)
	end	
end
