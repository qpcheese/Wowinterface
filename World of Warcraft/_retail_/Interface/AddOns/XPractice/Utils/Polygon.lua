do
	--TODO: triangle.tga is currently 256x256; does it need to be?

	-- SOURCE: Code is adapted from triangle-drawing routine found in NPCScan.Overlay.lua
	-- which was written by Daniel Stephens <iriel@vigilance-committee.org>
	-- Warcraft's own TaxiFrame.lua may use (or have used) some of this code.  Details unclear.

	
		--- Applies an affine transformation to Texture.
	-- @param Texture  Texture to set TexCoords for.
	-- @param ...  First 6 elements of transformation matrix.
	local function ApplyTransform( Texture, A, B, C, D, E, F )
		Det = A * E - B * D;
		if ( Det == 0 ) then
			--TODO: is hiding texture here going to break anything when frame is recycled?
			return Texture:Hide(); -- Scaled infinitely small
		end
		AF, BF, CD, CE = A * F, B * F, C * D, C * E;

		ULx, ULy = ( BF - CE ) / Det, ( CD - AF ) / Det;
		LLx, LLy = ( BF - CE - B ) / Det, ( CD - AF + A ) / Det;
		URx, URy = ( BF - CE + E ) / Det, ( CD - AF - D ) / Det;
		LRx, LRy = ( BF - CE + E - B ) / Det, ( CD - AF - D + A ) / Det;

		-- Bounds to prevent "TexCoord out of range" errors
		if ( ULx < -1e4 ) then ULx = -1e4; elseif ( ULx > 1e4 ) then ULx = 1e4; end
		if ( ULy < -1e4 ) then ULy = -1e4; elseif ( ULy > 1e4 ) then ULy = 1e4; end
		if ( LLx < -1e4 ) then LLx = -1e4; elseif ( LLx > 1e4 ) then LLx = 1e4; end
		if ( LLy < -1e4 ) then LLy = -1e4; elseif ( LLy > 1e4 ) then LLy = 1e4; end
		if ( URx < -1e4 ) then URx = -1e4; elseif ( URx > 1e4 ) then URx = 1e4; end
		if ( URy < -1e4 ) then URy = -1e4; elseif ( URy > 1e4 ) then URy = 1e4; end
		if ( LRx < -1e4 ) then LRx = -1e4; elseif ( LRx > 1e4 ) then LRx = 1e4; end
		if ( LRy < -1e4 ) then LRy = -1e4; elseif ( LRy > 1e4 ) then LRy = 1e4; end

		
		--print("SetTexCoord",ULx,ULy,LLx,LLy,URx,URy,LRx,LRy)
		return Texture:SetTexCoord( ULx, ULy, LLx, LLy, URx, URy, LRx, LRy );
		
	end
	
	
	local min, max = min, max;
	local MinX, MinY, WindowX, WindowY;
	local ABx, ABy, BCx, BCy;
	local ScaleX, ScaleY, ShearFactor, Sin, Cos;
	local Parent, Width, Height;
	local SinScaleX, SinScaleY, CosScaleX, CosScaleY;
	local BorderScale, BorderOffset = 512 / 510, -1 / 512; -- Removes one-pixel transparent border
	local TrianglePath = "Interface\\AddOns\\XPractice\\Assets\\Graphics\\Misc\\triangle.tga"

	--- Draw a triangle texture with vertices at relative coords.  (0,0) is top-left, (1,1) is bottom-right.
	function XPRACTICE.TAXIFRAME_TextureAdd ( frame, Layer, R, G, B, Ax, Ay, Bx, By, Cx, Cy )
		ABx, ABy, BCx, BCy = Ax - Bx, Ay - By, Bx - Cx, By - Cy;
		ScaleX = ( BCx * BCx + BCy * BCy ) ^ 0.5;
		if ( ScaleX == 0 ) then
			--TODO: debug warning
			return; -- Points B and C are the same
		end
		ScaleY = ( ABx * BCy - ABy * BCx ) / ScaleX;
		if ( ScaleY == 0 ) then
			--TODO: debug warning
			return; -- Points are co-linear
		end
		ShearFactor = -( ABx * BCx + ABy * BCy ) / ( ScaleX * ScaleX );
		Sin, Cos = BCy / ScaleX, -BCx / ScaleX;

		-- Note: The texture region is made as small as possible to improve framerates.
		MinX, MinY = min( Ax, Bx, Cx ), min( Ay, By, Cy );
		WindowX, WindowY = max( Ax, Bx, Cx ) - MinX, max( Ay, By, Cy ) - MinY;


		-- Get a texture
		--local Texture = frame.TextureCreate( frame, Layer, R, G, B );
		--local Texture = frame:CreateTexture( frame );
		local Texture=frame.texture;		
		Texture:SetTexture( TrianglePath );
		Width, Height = frame:GetSize();
		--TODO: set other 3 corner points, if possible, or otherwise rig things so size is updated when frame is resized
		Texture:ClearAllPoints()
		Texture:SetPoint( "TOPLEFT", MinX * Width, -MinY * Height );
		Texture:SetSize( WindowX * Width, WindowY * Height );
	-- print("WindowX/Y, width, height:",WindowX,WindowY,Width,Height)
	-- print("Frame size:",frame:GetWidth(),frame:GetHeight())
	-- print("Texture size:",Texture:GetWidth(),Texture:GetHeight())
	-- print("Frame clamp:",frame:IsClampedToScreen())
		--TODO: if possible, don't show texture until transform is applied		
		Texture:Show()
		-- --SetGradient would go here, if we want to use it here
		
		


		--[[ Transform parallelogram so its corners lie on the tri's points:
		local Matrix = Identity;
		-- Remove transparent border
		Matrix = Matrix:Scale( BorderScale, BorderScale );
		Matrix = Matrix:Translate( BorderOffset, BorderOffset );
		Matrix = Matrix:Shear( ShearFactor ); -- Shear the image so its bottom left corner aligns with point A
		Matrix = Matrix:Scale( ScaleX, ScaleY ); -- Scale X by the length of line BC, and Y by the length of the perpendicular line from BC to point A
		Matrix = Matrix:Rotate( Sin, Cos ); -- Align the top of the triangle with line BC.
		Matrix = Matrix:Translate( Bx - MinX, By - MinY ); -- Move origin to overlap point B
		Matrix = Matrix:Scale( 1 / WindowX, 1 / WindowY ); -- Adjust for change in texture size
		ApplyTransform( unpack( Matrix, 1, 6 ) );
		]]

		-- Common operations
		WindowX, WindowY = BorderScale / WindowX, BorderScale / WindowY;
		SinScaleX, SinScaleY = -Sin * ScaleX, Sin * ScaleY;
		CosScaleX, CosScaleY =  Cos * ScaleX, Cos * ScaleY;

		return ApplyTransform( Texture,
			WindowX * CosScaleX,
			WindowX * ( SinScaleY + CosScaleX * ShearFactor ),
			WindowX * ( ( SinScaleY + CosScaleX * ( 1 + ShearFactor ) ) * BorderOffset + Bx - MinX ) / BorderScale,
			WindowY * SinScaleX,
			WindowY * ( CosScaleY + SinScaleX * ShearFactor ),
			WindowY * ( ( CosScaleY + SinScaleX * ( 1 + ShearFactor ) ) * BorderOffset + By - MinY ) / BorderScale );
	end
	local Det, AF, BF, CD, CE;
	local ULx, ULy, LLx, LLy, URx, URy, LRx, LRy;

end