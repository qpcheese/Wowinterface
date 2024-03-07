-- Each scrollframe comes with its own parent frame.  frame is f; scrollframe is f.scrollframe
-- BE SURE TO MANUALLY CALL SETSCROLLCHILD AFTER CALLING GETFRAME(),
-- EVEN IF IT LOOKS LIKE WE'RE CALLING SETSCROLLCHILD DURING THAT VERY FUNCTION.
-- We call SetScrollChild during getFrame, but it tends to break if we make any adjustments afterwards.

-- Important: 3D modelframes, such as DressUpModel, must each have a UNIQUE SetFrameLevel in order to respect scrollframe boundaries.
	-- so, for example, you can't place multiple telegraph models on the same framelevel
	-- (unless you use a 3D camera, where the frame doesn't move outside of the window).
		-- Apprently, modelframe.texture must also be visible (but colortexture can be 0,0,0,0)
		

_XPRACTICE_ReusableScrollFrames = XPRACTICE.inheritsFrom(_XPRACTICE_ReusableFrames)

XPRACTICE.ReusableScrollFrames=_XPRACTICE_ReusableScrollFrames.new()
XPRACTICE.ReusableScrollFrames.inactiveframes={}
XPRACTICE.ReusableScrollFrames.activeframes={}
XPRACTICE.ReusableScrollFrames.nextframeid=0

function _XPRACTICE_ReusableScrollFrames:NextFrameName()	
	return "XPRACTICE.ReusableScrollFrame"..tostring(self.nextframeid);
end

function _XPRACTICE_ReusableScrollFrames:ReturnCreateFrameDetails(framename)
	local f = CreateFrame("Frame",framename.."_scrollchild",UIParent)
	f.scrollframe=CreateFrame("ScrollFrame",framename.."_scrollframe",UIParent)
	-- REMEMBER, DON'T TRUST THIS LINE.  CALL SETSCROLLCHILD YOURSELF AFTER ADJUSTING FRAME APPEARANCE.
	f.scrollframe:SetScrollChild(f)
	
	return f
end

XPRACTICE.NullFrame=CreateFrame("FRAME")

function _XPRACTICE_ReusableScrollFrames:ResetProperties(f)	
	XPRACTICE.ReusableFrames.ResetProperties(self,f)
	if(XPRACTICE.TOCVersion>=100000)then
		f.scrollframe:SetScrollChild(XPRACTICE.NullFrame)		
	else
		f.scrollframe:SetScrollChild(nil)
	end
	f.scrollframe:SetHorizontalScroll(0)
	f.scrollframe:SetVerticalScroll(0)
	f.scrollframe:SetParent(f)
	f:SetScale(1)	
end