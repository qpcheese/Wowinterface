_XPRACTICE_ReusableLeftalignedTextFrames = XPRACTICE.inheritsFrom(_XPRACTICE_ReusableFrames)

XPRACTICE.ReusableLeftalignedTextFrames=_XPRACTICE_ReusableLeftalignedTextFrames.new()
XPRACTICE.ReusableLeftalignedTextFrames.inactiveframes={}
XPRACTICE.ReusableLeftalignedTextFrames.activeframes={}
XPRACTICE.ReusableLeftalignedTextFrames.nextframeid=0

function _XPRACTICE_ReusableLeftalignedTextFrames:NextFrameName()	
	return "XPRACTICE.ReusableLeftalignedTextFrame"..tostring(self.nextframeid);
end

function _XPRACTICE_ReusableLeftalignedTextFrames:ResetProperties(f)	
	XPRACTICE.ReusableFrames.ResetProperties(self,f)
	f.fontstring:SetJustifyH("LEFT")
end

