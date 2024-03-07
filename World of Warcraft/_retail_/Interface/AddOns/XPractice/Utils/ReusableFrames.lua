-- The ReusableFrames family doesn't behave like the other classes in this program.
-- Treat these as global, static functions.


--TODO: NOTE: changing defaultparent doesn't prevent frame flash after game restart

_XPRACTICE_ReusableFrames_DefaultParent=UIParent
--XPRACTICE.ReusableFrames_DefaultParent=nil		-- pretty much confirmed client crash.

_XPRACTICE_ReusableFrames = {}
_XPRACTICE_ReusableFrames.__index = _XPRACTICE_ReusableFrames

function _XPRACTICE_ReusableFrames.new()
	local self=setmetatable({}, _XPRACTICE_ReusableFrames)	
	return self
end

--TODO LATER: inactiveframes/activeframes/nextframeid are apparently part of THIS instance only
-- and not part of "base" ReusableFrames (which is intended to act as a singleton).
-- is this a problem?  should we care if this is a problem?
XPRACTICE.ReusableFrames=_XPRACTICE_ReusableFrames.new()
XPRACTICE.ReusableFrames.inactiveframes={}
XPRACTICE.ReusableFrames.activeframes={}
XPRACTICE.ReusableFrames.nextframeid=0

----TODO: restore this function if it's unrelated to the particleframe issue

function _XPRACTICE_ReusableFrames:GetFrame()
	local f=tremove(self.inactiveframes)
	if not f then
		local framename=self:NextFrameName()
		f=self:CreateNewFrame(framename)
		--print("Created a new frame",f.name)
		-- if(framename=="XPRACTICE.ReusableFrame49")then
			-- error("breakpoint: frame 49")
		-- end

		-- most gameobjects expect to have a "self.frame", but they aren't required to keep track of what type of frame that is
		-- (could be normal frame, buttonframe, modelframe, scrollframe, etc)
		-- so we'll store a reference to the cleanup function in the frame itself
		f.framefamily=self
		f.Cleanup=function(self)f.framefamily:RemoveFrame(f)end
		-- we can now call f:Cleanup()
		
		
		self.nextframeid=self.nextframeid+1
	else
		--print("Recycled an existing frame",f.name)
		--
		if(f:GetParent()~=_XPRACTICE_ReusableFrames_DefaultParent)then
			print("WARNING: frame "..tostring(f:GetName()).."'s parent is not defaultparent but "..tostring(f:GetParent():GetName()).." instead")
		end
	end
	--print("ReusableFrames getting a frame ",f.name)
	tinsert(self.activeframes,f)

	-- NEW
	-- This might break something else
	f:Show()
	
	return f
end


function _XPRACTICE_ReusableFrames:NextFrameName()
	return "XPRACTICE.ReusableFrame"..tostring(self.nextframeid);	
end

-------------------------PRIVATE FUNCTION-------------------------
function _XPRACTICE_ReusableFrames:CreateNewFrame(framename)
	local f=self:ReturnCreateFrameDetails(framename)
	f.id=self.nextframeid
	f.name=framename
	f.tag="(no tag)"		
	--TODO: maybe move texture to its own function too, maybe
	f.texture = f:CreateTexture()
	f.fontstring=f:CreateFontString(nil, "ARTWORK")
	self:ResetProperties(f)
	return f
end

function _XPRACTICE_ReusableFrames:ReturnCreateFrameDetails(framename)
	return CreateFrame("Frame",framename,_XPRACTICE_ReusableFrames_DefaultParent)
end

function _XPRACTICE_ReusableFrames:ResetProperties(f)
	-- override as necessary
	
	
	f.framelevel=0	
	f:SetParent(_XPRACTICE_ReusableFrames_DefaultParent)	
	f:SetFrameLevel(f.framelevel)	
	
	-- --!!!!!!!!!!!!!!! client crash was apparently related to SetParent(nil) without Hiding the frame.
	-- f:Show()
	-- -- f:Hide()
	-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	-- if(f.SetCustomCamera)then f:SetCustomCamera(0) end
	
	-- --f:SetAlpha(1)	--original line.  caused screen flash.  TODO: remove line as soon as we're sure we fixed anything that broke
	f:SetAlpha(0) 	-- does not cause screen flash, as far as we know
	
	-- --f:Show()		-- note: commenting f:Hide() above and uncommenting this line causes a client crash upon game shutdown
						-- -- commenting f:Hide() and NOT uncommenting this line also causes a client crash upon game shutdown!
	
	-- ----TODO LATER: vague memory that explicitly disabling mouse here causes problems; keep an eye on
	f:EnableMouse(false)
	f:EnableMouseWheel(false)
	-- -- Event handlers are not included here; must remove those manually.  (TODO LATER: are we unable to do that automatically?)	
	
	-- --TODO LATER: is it necessary to clearallpoints before setallpoints?
	f:ClearAllPoints()	
	
	-- --TODO: NOTE: calling setsize(1,1) doesn't prevent frame flash after game restart
	-- f:SetSize(1,1)
		
	-- polyframe textures don't use SetAllPoints, so we need to reset that property here
	-- TODO: *maybe* move poly frames to their own class?
	f.texture:Show()
	f.texture:ClearAllPoints()	
	f.texture:SetAllPoints(f)
	f.texture:SetTexture(nil)
	f.texture:SetColorTexture(0,1,1,0.5)		
	--f.texture:SetTexCoord(0,1,0,1)	--TODO: why did we comment this out instead of removing it
	
	f.texture:SetRotation(0)					--must call both SetRotation and SetTexCoord...
	f.texture:SetTexCoord(0,0, 0,1, 1,0, 1,1)	
	
										
	if(XPRACTICE.TOCVersion>=100000)then
								-- orientation, color1, color2
		f.texture:SetGradient("HORIZONTAL",XPRACTICE.Colors.SolidWhite,XPRACTICE.Colors.SolidWhite);
	else
								-- --  R G B A R G B A
		f.texture:SetGradientAlpha("HORIZONTAL",1,1,1,1,1,1,1,1);  --pre-100002
	end
	f.texture:Hide()

	
	f.fontstring:Show()
	f.fontstring:SetAllPoints(f)	
	f.fontstring:SetFont("Fonts\\FRIZQT__.TTF",14,"OUTLINE")
	f.fontstring:SetTextHeight(14)	
	f.fontstring:SetTextColor(1,1,1,1)
	f.fontstring:SetScale(1)	--TODO: apparently has no effect at this very moment (see Nameplate.lua -- we have to setscale(1) there too)
	f.fontstring:Hide()
	
	-- if(f.animgroup~=nil) then
		-- f.animgroup:Stop()
		-- f.animgroup=nil
	-- end
	-- if(f.texture.animgroup~=nil)then
		-- f.texture.animgroup:Stop()
		-- f.texture.animgroup=nil
	-- end	
	-- f.animgroup=nil
	
	-- -- Frame might also be given an "owner" property by the owning drawable.
	-- -- Don't reset that in case we need to track it and/or debug it later.

	
	-- OK so... Hide is still necessary here even though we fixed the SetParent(nil) crash.
	-- If we're calling this from a ReusableButtonFrame, we're about to call EnableMouse(true)
		-- and that's a problem because the frame is still somewhere on screen, able to catch mouse events, unseen with SetAlpha(0).
	-- So we're going to attempt to solve this by calling frame:Show after GetFrame.
	f:Hide()

end

function _XPRACTICE_ReusableFrames:RemoveFrame(f)
	--print("RemoveFrame",f.name)
	self:ResetProperties(f)

	f:SetParent(_XPRACTICE_ReusableFrames_DefaultParent)	
	if(f:GetParent()~=_XPRACTICE_ReusableFrames_DefaultParent)then
		print("WARNING: after cleanup, frame "..tostring(f:GetName()).."'s parent is not defaultparent but "..tostring(f:GetParent():GetName()).." instead")
	end
	--if(f.texture:GetTexture()~="Color-0ffff80-CSimpleTexture")then	-- pre-8.1.5
	
	local defaulttexturestring,defaulttexture
	if(XPRACTICE.TOCVersion<=80100)then	
		defaulttexture=nil	
	else
		--defaulttexture="FileData ID 0"
		defaulttexture=nil
	end
	defaulttexturestring=defaulttexture
	--TODO: more graceful (or DEFINE_PTR)
	if(f.texture:GetTexture()~=defaulttexture and f.texture:GetTexture()~="FileData ID 0")then		-- 8.1.5+		
		print("WARNING: after cleanup, frame "..tostring(f:GetName()).."'s texture is not "..tostring(defaulttexturestring).." but "..tostring(f.texture:GetTexture()).." instead")
	end
	
	local activecount=#self.activeframes
	XPRACTICE.tremovebyval(self.activeframes,f)	
	if(#self.activeframes==activecount and not XPRACTICE.alreadyattemptederrorshutdown)then
		print("WARNING: failed to remove a frame from XPRACTICE.ReusableFrames.activeframes")
	end
	if(XPRACTICE.tcontains(self.inactiveframes,f) and not XPRACTICE.alreadyattemptederrorshutdown)then
		local errorstring="XPRACTICE.ReusableFrames.inactiveframes already contains "..tostring(f).." "..f.name.." "..f.tag
		print("WARNING: "..errorstring)
		--error(errorstring)
	else
		tinsert(self.inactiveframes,f)
	end	
end

function _XPRACTICE_ReusableFrames:ResetAllActiveFrames()
	local looping=true
	if(#self.activeframes>0 and not XPRACTICE.alreadyattemptederrorshutdown)then
		XPRACTICE.debugprint("WARNING: after cleanup on reusable frames, "..#self.activeframes.." frames remaining")
	end				
	while looping do
		looping=false
		local f
		f=nil		
		if(#self.activeframes>0) then			
			f=self.activeframes[1]
		end
		if not f then
			-- do nothing
		else
			--self.RemoveFrame(f)
			self:RemoveFrame(f)
			if(f:GetParent()~=_XPRACTICE_ReusableFrames_DefaultParent)then
				--XPRACTICE.debugprint("WARNING: during force cleanup, frame "..tostring(f:GetName()).."'s parent is not defaultparent but "..tostring(f:GetParent():GetName()).." instead")
			end
			--print("Force cleanup on ReusableFrames: "..f:GetName().." cleaned up, "..#self.activeframes.." frames remaining")

			looping=true
		end
	end
	-- --DO NOT SET NEXTFRAMEID TO ZERO DURING A STANDARD RESET.
	-- --NEXTFRAMEID IS USED TO SET THE INDEX OF A NEWLY-CREATED FRAME IN THE FRAME LIST.
	-- --IF NEXTFRAMEID IS SET TO ZERO, THE EXISTING RECYCLED FRAMES WILL BE OVERWRITTEN BY THE NEWLY-CREATED FRAMES
	-- --self.nextframeid=0   <-- DON'T DO THIS.
	-- --There's no way to force the frame names to appear in the same order every time the program is run
		-- --...not without sorting the entire inactive frame table by name after a reset.
	-- --Inactive frames are placed in their table in order they're cleaned up.
end

function _XPRACTICE_ReusableFrames.ResetAndReport()
	local oktotal=#XPRACTICE.ReusableFrames.inactiveframes
				+#XPRACTICE.ReusableModelFrames.inactiveframes
				+#XPRACTICE.ReusableModelSceneFrames.inactiveframes
				+#XPRACTICE.ReusableParticleFrames.inactiveframes
				+#XPRACTICE.ReusableButtonFrames.inactiveframes				
				+#XPRACTICE.ReusableScrollFrames.inactiveframes
	local leftovertotal=#XPRACTICE.ReusableFrames.activeframes
				+#XPRACTICE.ReusableModelFrames.activeframes
				+#XPRACTICE.ReusableModelSceneFrames.activeframes
				+#XPRACTICE.ReusableParticleFrames.activeframes
				+#XPRACTICE.ReusableButtonFrames.activeframes
				+#XPRACTICE.ReusableScrollFrames.activeframes
	--XPRACTICE.debugprint("Properly cleaned up "..tostring(oktotal).." frames.  Running force cleanup on "..tostring(leftovertotal).." frames.")
	if(leftovertotal==0)then
		--print("X Practice: successfully cleaned up all active frames.")
	else
		-- don't show warning if we think game crashed (if game crashes, leftover frames are to be expected)
		if(XPRACTICE and not XPRACTICE.alreadyattemptederrorshutdown)then
			print("WARNING: "..leftovertotal.." out of "..tostring(oktotal+leftovertotal).." frames remaining after cleanup.")
			print("Please /reload before running X Practice again.")
		end
	end
	
	XPRACTICE.ReusableFrames:ResetAllActiveFrames()
	XPRACTICE.ReusableModelFrames:ResetAllActiveFrames()
	XPRACTICE.ReusableModelSceneFrames:ResetAllActiveFrames()
	XPRACTICE.ReusableParticleFrames:ResetAllActiveFrames()
	XPRACTICE.ReusableButtonFrames:ResetAllActiveFrames()
	XPRACTICE.ReusableScrollFrames:ResetAllActiveFrames()
	XPRACTICE.ReusableLeftalignedTextFrames:ResetAllActiveFrames()
	
end

function _XPRACTICE_ReusableFrames:Report()
	XPRACTICE.debugprint("Checking ReusableFrames only...")
	XPRACTICE.debugprint(tonumber(#self.activeframes).." active frames")
	XPRACTICE.debugprint(tonumber(#self.inactiveframes).." inactive frames")
	for i=1,#self.inactiveframes,1 do
		local f=self.inactiveframes[i]
		if(f:GetParent()~=_XPRACTICE_ReusableFrames_DefaultParent)then
			XPRACTICE.debugprint("Frame "..tostring(f:GetName()).."'s parent is not defaultparent but "..tostring(f:GetParent():GetName()).." instead")
		end
		XPRACTICE.debugprint("Frame "..tostring(f:GetName()).."'s parent is "..tostring(f:GetParent():GetName()))
	end
end

function _XPRACTICE_ReusableFrames:ForceReset()
	self.inactiveframes={}
	self.activeframes={}
	self.nextframeid=0
end

-- TODO: prohibit using this unless debug option is enabled
function _XPRACTICE_ReusableFrames:ForceFullReset()
	XPRACTICE.ReusableFrames:ForceReset()
	XPRACTICE.ReusableModelFrames:ForceReset()
	XPRACTICE.ReusableModelSceneFrames:ForceReset()
	XPRACTICE.ReusableParticleFrames:ForceReset()
	XPRACTICE.ReusableButtonFrames:ForceReset()
	XPRACTICE.ReusableScrollFrames:ForceReset()
	XPRACTICE.ReusableLeftalignedTextFrames:ForceReset()
end

--/run XPRACTICE.ReusableFrames:Audit()
--/run print(XPRACTICE.ReusableFrame0.texture:GetTexture())
--/run print(XPRACTICE.ReusableFrame0.owner.owner.visible)
--/run print(XPRACTICE.ReusableFrame0:IsShown())
function _XPRACTICE_ReusableFrames:Audit()
	local uiparentcounter=0
	for i=1,#self.activeframes do
		local f=self.activeframes[i]	
		if(f:GetParent()==_XPRACTICE_ReusableFrames_DefaultParent)then
			uiparentcounter=uiparentcounter+1
			--print("Frame "..tostring(f:GetName()).."'s parent is defaultparent")
		end
	end	
	print(#XPRACTICE.ReusableFrames.activeframes,"active frames,",#XPRACTICE.ReusableFrames.inactiveframes,"inactive frames")
	--print(uiparentcounter,"active frames with parent UIParent")
	print(uiparentcounter,"active frames with defaultparent")
	print("Nextframeid",self.nextframeid)
	
end