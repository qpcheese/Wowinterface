--TODO: Border probably shouldn't have the exact same appearance as selection rectangle...

-- Special bordergraphic designed for use with DraggableGameWindow

-- Bordergraphic is intended to fit around the outside of the scrollframe
-- so we don't have to worry about the window contents overlapping the border.

XPRACTICE.BorderGraphicWithTitle = {}
XPRACTICE.BorderGraphicWithTitle.__index = XPRACTICE.BorderGraphicWithTitle

function XPRACTICE.BorderGraphicWithTitle.new()
	local self=setmetatable({}, XPRACTICE.BorderGraphicWithTitle)	
		
	return self
end


function XPRACTICE.BorderGraphicWithTitle:Setup(parentframe,titletext,titleheight)	

	self.parent=parentframe		
	self.titleheight=titleheight

	self.top=XPRACTICE.ReusableFrames:GetFrame()
	self.top:SetParent(parentframe)	
	self.top:SetWidth(parentframe:GetWidth()+2)
	self.top:SetHeight(2)
	self.top:SetPoint("TOPLEFT",parentframe,"TOPLEFT",-2,2)
	self.top.texture:SetColorTexture(1,1,1,1)
	self.top:Show()	
	self.top.texture:Show()	
	self.top:SetAlpha(1)

	self.titletext=XPRACTICE.ReusableLeftalignedTextFrames:GetFrame()
	self.titletext:SetParent(parentframe)
	self.titletext:SetWidth(parentframe:GetWidth()-2)
	self.titletext:SetHeight(titleheight)
	self.titletext:SetPoint("TOPLEFT",parentframe,"TOPLEFT",2,2)
	self.titletext:Show()		
	self.titletext.fontstring:SetText(titletext)
	self.titletext.fontstring:Show()
	self.titletext:SetAlpha(1)
	
	
	self.titlebar=XPRACTICE.ReusableFrames:GetFrame()
	self.titlebar:SetParent(parentframe)
	self.titlebar:SetWidth(parentframe:GetWidth())
	self.titlebar:SetHeight(2)
	self.titlebar:SetPoint("TOPLEFT",parentframe,"TOPLEFT",0,-(titleheight-2))
	self.titlebar.texture:SetColorTexture(1,1,1,1)
	self.titlebar:Show()	
	self.titlebar.texture:Show()	
	self.titlebar:SetAlpha(1)
	
	self.bottom=XPRACTICE.ReusableFrames:GetFrame()
	self.bottom:SetParent(parentframe)
	self.bottom:SetWidth(parentframe:GetWidth()+2)
	self.bottom:SetHeight(2)
	self.bottom:SetPoint("BOTTOMLEFT",parentframe,"BOTTOMLEFT",-2,-2)
	self.bottom.texture:SetColorTexture(1,1,1,1)
	self.bottom:Show()	
	self.bottom.texture:Show()	
	self.bottom:SetAlpha(1)
	
	self.left=XPRACTICE.ReusableFrames:GetFrame()
	self.left:SetParent(parentframe)
	self.left:SetWidth(2)
	self.left:SetHeight(parentframe:GetHeight()+4)
	self.left:SetPoint("TOPLEFT",parentframe,"TOPLEFT",-2,2)
	self.left.texture:SetColorTexture(1,1,1,1)
	self.left:Show()
	self.left.texture:Show()
	self.left:SetAlpha(1)
	
	self.right=XPRACTICE.ReusableFrames:GetFrame()
	self.right:SetParent(parentframe)
	self.right:SetWidth(2)
	self.right:SetHeight(parentframe:GetHeight()+4)
	self.right:SetPoint("TOPRIGHT",parentframe,"TOPRIGHT",2,2)
	self.right.texture:SetColorTexture(1,1,1,1)
	self.right:Show()	
	self.right.texture:Show()	
	self.right:SetAlpha(1)
end

function XPRACTICE.BorderGraphicWithTitle:Cleanup()
	-- XPRACTICE.ReusableFrames.removeFrame(self.top)
	-- XPRACTICE.ReusableFrames.removeFrame(self.titletext)
	-- XPRACTICE.ReusableFrames.removeFrame(self.titlebar)
	-- XPRACTICE.ReusableFrames.removeFrame(self.bottom)
	-- XPRACTICE.ReusableFrames.removeFrame(self.left)
	-- XPRACTICE.ReusableFrames.removeFrame(self.right)	
	self.top:Cleanup()
	self.titletext:Cleanup()
	self.titlebar:Cleanup()
	self.bottom:Cleanup()
	self.left:Cleanup()
	self.right:Cleanup()
end

function XPRACTICE.BorderGraphicWithTitle:Resize(width,height)
	local parentframe=self.parent
	self.top:SetWidth(parentframe:GetWidth()+2)
	self.top:SetHeight(2)
	self.titlebar:SetWidth(parentframe:GetWidth())
	self.bottom:SetWidth(parentframe:GetWidth()+2)
	self.left:SetHeight(parentframe:GetHeight()+4)
	self.right:SetHeight(parentframe:GetHeight()+4)
end