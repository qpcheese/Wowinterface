
ArkInventory.Debug = { }

function ArkInventory.Debug.Frame_Hide( )
	
	local frame = ArkInventory.Debug.frame
	
	if frame then
		frame:Hide( )
	end
	
end
	
function ArkInventory.Debug.Frame_Show( )
	
	local frame = ArkInventory.Debug.frame
	
	if frame then
		ArkInventory.Debug.Frame_Paint( )
		frame:Show( )
		ArkInventory.Frame_Main_Level( frame )
	end
	
end

function ArkInventory.Debug.Frame_Toggle( )
	
	local frame = ArkInventory.Debug.frame
	
	if frame then
		if frame:IsVisible( ) then
			ArkInventory.Debug.Frame_Hide( )
		else
			ArkInventory.Debug.Frame_Show( )
		end
	else
		--ArkInventory.OutputWarning( ArkInventory.Localise["MISC_ALERT_SEARCH_NOT_LOADED"] )
	end
	
end

local function paint_Background( frame, config )
	local obj = _G[string.format( "%s%s", frame:GetName( ), "Background" )]
	if obj then
		style = config.background.style or ArkInventory.Const.Texture.BackgroundDefault
		if style == ArkInventory.Const.Texture.BackgroundDefault then
			colour = config.background.colour
			ArkInventory.SetTexture( obj, true, colour.r, colour.g, colour.b, colour.a )
		else
			file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND, style )
			ArkInventory.SetTexture( obj, file )
		end
	end
end

local function paint_Border( frame, config )
	
	local style = config.border.style or ArkInventory.Const.Texture.BorderDefault
	local file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BORDER, style )
	local size = config.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size
	local offset = config.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offsetdefault.window
	local scale = config.border.scale or 1
	local colour = config.border.colour or { }
	
	local obj = frame.ArkBorder
	if obj then
		if config.border.style ~= ArkInventory.Const.Texture.BorderNone then
			ArkInventory.Frame_Border_Paint( obj, file, size, offset, scale, colour.r, colour.g, colour.b, 1 )
			obj:Show( )
		else
			obj:Hide( )
		end
	end
	
	for _, c1 in pairs( { frame:GetChildren( ) } ) do
		if c1:GetName( ) then
			for _, c2 in pairs( { c1:GetChildren( ) } ) do
				if c2:GetName( ) then
					local obj = c2.ArkBorder
					if obj then
						if config.border.style ~= ArkInventory.Const.Texture.BorderNone then
							ArkInventory.Frame_Border_Paint( obj, file, size, offset, scale, colour.r, colour.g, colour.b, 1 )
							obj:Show( )
						else
							obj:Hide( )
						end
					end
				end
			end
		end
	end
	
end

function ArkInventory.Debug.Frame_Paint( )
	
	local frame = ArkInventory.Debug.frame
	if not frame then return end
	
	-- frameStrata
	if frame:GetFrameStrata( ) ~= ArkInventory.db.option.ui.debug.strata then
		frame:SetFrameStrata( ArkInventory.db.option.ui.debug.strata )
	end
	
	-- title
	local obj = _G[string.format( "%s%s", frame:GetName( ), "TitleWho" )]
	if obj then
		local t = string.format( "%s: %s %s", ArkInventory.Localise["DEBUG"], ArkInventory.Const.Program.Name, ArkInventory.Global.Version )
		obj:SetText( t )
	end
	
	-- font
	ArkInventory.MediaFrameDefaultFontSet( frame )
	
	-- scale
	frame:SetScale( ArkInventory.db.option.ui.debug.scale or 1 )
	
	paint_Background( frame, ArkInventory.db.option.ui.debug )
	paint_Border( frame, ArkInventory.db.option.ui.debug )
	
	for _, z in pairs( { frame:GetChildren( ) } ) do
		paint_Background( z, ArkInventory.db.option.ui.debug )
		paint_Border( z, ArkInventory.db.option.ui.debug )
	end
	
end
