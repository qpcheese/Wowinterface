local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


local function helper_DewdropMenuPosition( frame, relative )
	
	local p
	
	local y = frame:GetBottom( ) + ( frame:GetTop( ) - frame:GetBottom( ) ) / 2
	if ( y >= ( GetScreenHeight( ) / 2 ) ) then
		if relative then
			p = "BOTTOM"
		else
			p = "TOP"
		end
	else
		if relative then
			p = "TOP"
		else
			p = "BOTTOM"
		end
	end
	
	local x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
	if ( x >= ( GetScreenWidth( ) / 2 ) ) then
		if relative then
			p = p .. "LEFT"
		else
			p = p .. "RIGHT"
		end
	else
		if relative then
			p = p .. "RIGHT"
		else
			p = p .. "LEFT"
		end
	end
	
	return p
	
end

local function helper_DewdropMenuPositionCenter( frame, relative )
	local y = frame:GetBottom( ) + ( frame:GetTop( ) - frame:GetBottom( ) ) / 2
	if ( y >= ( GetScreenHeight( ) / 2 ) ) then
		if relative then
			return "BOTTOM"
		else
			return "TOP"
		end
	else
		if relative then
			return "TOP"
		else
			return "BOTTOM"
		end
	end
end

local function helper_CategoryIcon( catset )
	
	local icon = ""
	
	if catset and catset.action.t ~= ArkInventory.ENUM.ACTION.TYPE.DISABLED and catset.action.w ~= ArkInventory.ENUM.ACTION.WHEN.DISABLED then
		if ArkInventory.Const.Texture.Action[catset.action.t] then
			icon = ArkInventory.Const.Texture.Action[catset.action.t][catset.action.w] or icon
		end
	end
	
	return icon
	
end


function ArkInventory.MenuMainOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local loc_id = frame:GetParent( ):GetParent( ).ARK_Data.loc_id
	local codex = ArkInventory.GetLocationCodex( loc_id )
	
	local anchorpoints = {
		[ArkInventory.ENUM.ANCHOR.TOPRIGHT] = ArkInventory.Localise["TOPRIGHT"],
		[ArkInventory.ENUM.ANCHOR.BOTTOMRIGHT] = ArkInventory.Localise["BOTTOMRIGHT"],
		[ArkInventory.ENUM.ANCHOR.BOTTOMLEFT] = ArkInventory.Localise["BOTTOMLEFT"],
		[ArkInventory.ENUM.ANCHOR.TOPLEFT] = ArkInventory.Localise["TOPLEFT"],
	}
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			if level == 1 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Const.Program.Name,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Global.Version,
					"notClickable", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", ArkInventory.Const.Texture.Config,
					"text", ArkInventory.Localise["CONFIG"],
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Config_Show( )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Refresh].Texture,
					"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Refresh].Name,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["RELOAD"],
					"tooltipTitle", ArkInventory.Localise["RELOAD"],
					"tooltipText", ArkInventory.Localise["MENU_ACTION_RELOAD_DESC"],
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.ItemCacheClear( )
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Restack].Texture,
					"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Restack].Name( ),
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Restack( loc_id )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Search].Texture,
					"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Search].Name,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Search.Frame_Toggle( )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Rules].Texture,
					"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Rules].Name,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Rules_Toggle( )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"hidden", not ArkInventory.Global.actions_enabled,
					"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Actions].Texture,
					"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Actions].Name,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Actions_Toggle( )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.EditMode].Texture,
					"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.EditMode].Name,
					"closeWhenClicked", true,
					"checked", ArkInventory.Global.Mode.Edit,
					"func", function( )
						ArkInventory.ToggleEditMode( )
					end
				)
				
				
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", ArkInventory.Const.Texture.Blueprint,
					"text", string.format( "%s: %s", ArkInventory.Localise["CONFIG_BLUEPRINT"], ArkInventory.Global.Location[loc_id].Name ),
					"closeWhenClicked", true,
					"func", function( )
						local profile = string.format( "%i", codex.profile_id )
						local location = string.format( "%i", loc_id )
						ArkInventory.Frame_Config_Show( "general", "myprofiles", profile, "control", location )
					end
				)
				
				if ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].ClientCheck ) then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"icon", ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Texture,
						"text", string.format( "%s: %s", ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Name, ArkInventory.Localise["CONFIG"] ),
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Config_Show( "advanced", "ldb", "mounts" )
						end
					)
				end
				
				
				if ( loc_id == ArkInventory.Const.Location.Pet ) or ( loc_id == ArkInventory.Const.Location.Reputation ) then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["LDB"],
						"hasArrow", true,
						"value", "INSERT_LOCATION_LDB_MENU_ENTRIES_HERE"
					)
					
				end
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
			if ( loc_id == ArkInventory.Const.Location.Mount ) then
				ArkInventory.MenuLDBMountsEntries( 1, level, value )
			end
			
			if ( loc_id == ArkInventory.Const.Location.Pet ) then
				ArkInventory.MenuLDBPetsEntries( 1, level, value )
			end
			
			if ( loc_id == ArkInventory.Const.Location.Reputation ) then
				ArkInventory.MenuLDBTrackingReputationListHeaders( 1, level, value )
			end
			
		end
		
	)
	
end

function ArkInventory.MenuBarOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local loc_id = frame.ARK_Data.loc_id
	local bar_id = frame.ARK_Data.bar_id
	local codex = ArkInventory.GetLocationCodex( loc_id )
	local bar_name = codex.layout.bar.data[bar_id].name.text or ""
	
	local sid_def = codex.style.sort.method or 9999
	local sid = codex.layout.bar.data[bar_id].sort.method or sid_def
	
	if ArkInventory.db.option.sort.method.data[sid].used ~= "Y" then
		--ArkInventory.OutputWarning( "bar ", bar_id, " in location ", loc_id, " is using an invalid sort method.  resetting it to default" )
		codex.layout.bar.data[bar_id].sort.method = nil
		sid = sid_def
	end
	
	--ArkInventory.Output( "sid=[", sid, "] default=[", sid_def, "]" )
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			if level == 1 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( ArkInventory.Localise["MENU_BAR_TITLE"], bar_id ),
					"isTitle", true
				)
				
				if codex.style.window.list then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					local text = string.format( "%s* %s *%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["LOCKED"], FONT_COLOR_CODE_CLOSE )
					local desc = ArkInventory.Localise["MENU_LOCKED_LIST_DESC"]
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", text,
						"tooltipTitle", text,
						"tooltipText", desc
					)
					
				else
					
					if codex.layout.system then
						
						local text = string.format( "%s* %s *%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["LOCKED"], FONT_COLOR_CODE_CLOSE )
						local desc = string.format( ArkInventory.Localise["MENU_LOCKED_DESC"], ArkInventory.Localise["CONFIG_LAYOUT"], ArkInventory.Localise["CONFIG"], ArkInventory.Localise["CONTROLS"] )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", text,
							"tooltipTitle", text,
							"tooltipText", desc
						)
					
					else
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["NAME"], LIGHTYELLOW_FONT_COLOR_CODE, bar_name, FONT_COLOR_CODE_CLOSE ),
							"tooltipTitle", ArkInventory.Localise["NAME"],
							"tooltipText", string.format( ArkInventory.Localise["CONFIG_DESIGN_BAR_NAME_DESC"], bar_id ),
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", bar_name,
							"editBoxFunc", function( v )
								bar_name = string.trim( v )
								codex.layout.bar.data[bar_id].name.text = bar_name
								ArkInventory.Frame_Bar_Paint_All( )
							end
						)
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["COLOUR"],
							"hasArrow", true,
							"value", "BAR_COLOUR"
						)
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["WIDTH"],
							"hasArrow", true,
							"value", "BAR_WIDTH"
						)
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["ACTION"],
							"hasArrow", true,
							"value", "BAR_ACTION"
						)
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s:", ArkInventory.Localise["CONFIG_SORTING_METHOD"] ),
						"isTitle", true
					)
					
					if codex.layout.system then
						
						local text = string.format( "%s* %s *%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["LOCKED"], FONT_COLOR_CODE_CLOSE )
						local desc = string.format( ArkInventory.Localise["MENU_LOCKED_DESC"], ArkInventory.Localise["CONFIG_LAYOUT"], ArkInventory.Localise["CONFIG"], ArkInventory.Localise["CONTROLS"] )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", text,
							"tooltipTitle", text,
							"tooltipText", desc
						)
					
					else
						
						if sid ~= sid_def then
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", string.format( "%s: %s%s%s", ArkInventory.Localise["CURRENT"], GREEN_FONT_COLOR_CODE, ArkInventory.db.option.sort.method.data[sid].name, FONT_COLOR_CODE_CLOSE ),
								"hasArrow", true,
								"value", "SORTING_METHOD"
							)
							
							--ArkInventory.Lib.Dewdrop:AddLine( )
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.db.option.sort.method.data[sid_def].name, FONT_COLOR_CODE_CLOSE ),
								"tooltipTitle", ArkInventory.Localise["MENU_ITEM_ASSIGN_RESET"],
								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_SORTKEY_DEFAULT_RESET_DESC"], bar_id ),
								"closeWhenClicked", true,
								"func", function( )
									codex.layout.bar.data[bar_id].sort.method = nil
									ArkInventory.ItemSortKeyClear( loc_id )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
								end
							)
							
						else
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.db.option.sort.method.data[sid_def].name, FONT_COLOR_CODE_CLOSE ),
								"hasArrow", true,
								"value", "SORTING_METHOD"
							)
							
						end
						
					end
					
					
					if codex.layout.system then
						
						
						
					else
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_LABEL"], ArkInventory.Localise["CATEGORIES"], ArkInventory.Localise["ASSIGNED"] ),
							"isTitle", true
						)
						
						local has_entries = false
						for _, v in ipairs( ArkInventory.Const.Category.Headers ) do
							if ArkInventory.CategoryBarHasAssigned( loc_id, bar_id, v ) then
								has_entries = true
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", ArkInventory.Localise[string.format( "CATEGORY_%s", v )],
									"hasArrow", true,
									"value", string.format( "CATEGORY_CURRENT_%s", v )
								)
							end
						end
						
						for bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
							if codex.layout.bag[bag_id].bar == bar_id then
								has_entries = true
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", ArkInventory.Localise["BAG"],
									"hasArrow", true,
									"value", "BAG_CURRENT"
								)
							end
						end
						
						if not has_entries then
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise["NONE"],
								"disabled", true
							)
						end
						
					end
					
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_LABEL"], ArkInventory.Localise["CATEGORIES"], ArkInventory.Localise["ASSIGNABLE"] ),
						"isTitle", true
					)
					
					if codex.layout.system then
						
						local text = string.format( "%s* %s *%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["LOCKED"], FONT_COLOR_CODE_CLOSE )
						local desc = string.format( ArkInventory.Localise["MENU_LOCKED_DESC"], ArkInventory.Localise["CONFIG_LAYOUT"], ArkInventory.Localise["CONFIG"], ArkInventory.Localise["CONTROLS"] )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", text,
							"tooltipTitle", text,
							"tooltipText", desc
						)
					
					else
						
						for _, v in ipairs( ArkInventory.Const.Category.Headers ) do
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise[string.format( "CATEGORY_%s", v )],
								"hasArrow", true,
								"value", string.format( "CATEGORY_ASSIGN_%s", v )
							)
						end
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["BAG"],
							"hasArrow", true,
							"hidden", codex.layout.system,
							"value", "BAG_ASSIGN"
						)
						
					end
					
					if not codex.layout.system then
						
						if ArkInventory.Global.Options.MoveType == ArkInventory.Const.Move.Category then
							
							ArkInventory.Lib.Dewdrop:AddLine( )
							
							local cat = ArkInventory.Global.Category[ArkInventory.Global.Options.MoveSourceData]
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
								"tooltipTitle", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_MOVE_COMPLETE_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat.fullname, FONT_COLOR_CODE_CLOSE ), ArkInventory.Global.Options.MoveSourceBar, bar_id ),
								"closeWhenClicked", true,
								--fix me!!!!! - needs red text for illegal move destinations
								"disabled", ArkInventory.Global.Options.MoveLocation ~= loc_id or ( ArkInventory.Global.Options.MoveLocation == loc_id and ArkInventory.Global.Options.MoveSourceBar == bar_id ),
								"func", function( )
									ArkInventory.CategoryLocationSet( loc_id, cat.id, bar_id )
									ArkInventory.EditModeMove( )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)
							
						end
						
					end
					
				end
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
			
			if level == 2 and value then
				
				if value == "SORTING_METHOD" then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CONFIG_SORTING_METHOD"],
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					local x = ArkInventory.db.option.sort.method.data
					for k, v in ArkInventory.spairs( x, function(a,b) return a < b end ) do
						
						if v.used == "Y" then
							local n = v.name
							if v.system then
								n = string.format( "* %s", n )
							end
							n = string.format( "[%04i] %s", k, n )
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", n,
								"tooltipTitle", ArkInventory.Localise["CONFIG_SORTING_METHOD"],
								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_SORTKEY_DESC"], v.name, bar_id ),
								"isRadio", true,
								"checked", k == sid,
								"disabled", k == sid,
								"closeWhenClicked", true,
								"func", function( )
									if k == sid_def then
										codex.layout.bar.data[bar_id].sort.method = nil
									else
										codex.layout.bar.data[bar_id].sort.method = k
									end
									ArkInventory.ItemSortKeyClear( loc_id )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
								end
							)
						end
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CONFIG"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Config_Show( "settings", "sortmethod" )
						end
					)
				
				end
				
				
				if strsub( value, 1, 9 ) == "CATEGORY_" then
					
					local int_type, cat_type = string.match( value, "^CATEGORY_(.+)_(.+)$" )
					
					if cat_type ~= nil then
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise[string.format( "CATEGORY_%s", cat_type )],
							"isTitle", true
						)
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						for _, cat in ArkInventory.spairs( ArkInventory.Global.Category, function( a, b ) return ArkInventory.Global.Category[a].sort_order < ArkInventory.Global.Category[b].sort_order end ) do
							
							local t = cat.type_code
							local cat_bar, def_bar = ArkInventory.CategoryLocationGet( loc_id, cat.id )
							
							----ArkInventory.OutputDebug( "loc_id=[", loc_id, "], cat_id=[", cat.id, "], cat_bar=[", cat_bar, "], def_bar=[", def_bar, "]" )
							
							if int_type == "ASSIGN" and abs( cat_bar ) == bar_id and not def_bar then
								t = "DO_NOT_DISPLAY"
							end
							
							if int_type == "CURRENT" and ( abs( cat_bar ) ~= bar_id or def_bar ) then
								t = "DO_NOT_DISPLAY"
							end
							
							if cat_type == t then
								
								local cat_type2, cat_num = ArkInventory.CategoryIdSplit( cat.id )
								local catset = codex.catset.ca[cat_type2][cat_num]
								
								local c1 = ""
								
								if not def_bar then
									c1 = LIGHTYELLOW_FONT_COLOR_CODE
								end
								
								if not catset.active then
									c1 = RED_FONT_COLOR_CODE
								end
								
								local n = string.format( "%s%s", c1, cat.name )
								
								local c2 = GREEN_FONT_COLOR_CODE
								if cat_bar < 0 then
									c2 = RED_FONT_COLOR_CODE
								end
								if not def_bar then
									n = string.format( "%s %s[%s]", n, c2, abs( cat_bar ) )
								end
								
								local desc = ""
								local delete = false
								if abs( cat_bar ) ~= bar_id then
									desc = string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat.fullname, FONT_COLOR_CODE_CLOSE ), bar_id )
								else
									desc = string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_REMOVE_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat.fullname, FONT_COLOR_CODE_CLOSE ), cat_bar )
									delete = true
								end
								
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", n,
									"tooltipTitle", ArkInventory.Localise["CATEGORY"],
									"tooltipText", desc,
									"icon", helper_CategoryIcon( catset ),
									"hasArrow", true,
									"value", string.format( "CATEGORY_CURRENT_OPTION_%s_4", cat.id ),
									"func", function( )
										if delete then
											ArkInventory.CategoryLocationSet( loc_id, cat.id, nil )
										else
											ArkInventory.CategoryLocationSet( loc_id, cat.id, bar_id )
										end
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end
								)
								
							end
							
						end
						
					end
					
				end
				
				
				if strsub( value, 1, 4 ) == "BAG_" then
					
					local int_type = string.match( value, "^BAG_(.+)$" )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["BAG"],
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					for bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
						
						local cat_bar = codex.layout.bag[bag_id].bar
						
						if ( int_type == "ASSIGN" and bar_id ~= cat_bar ) or ( int_type == "CURRENT" and bar_id == cat_bar ) then
							
							local n = string.format( "%s", bag_id )
							
							if cat_bar then
								n = string.format( "%s%s%s [%s]%s", LIGHTYELLOW_FONT_COLOR_CODE, n, GREEN_FONT_COLOR_CODE, cat_bar, FONT_COLOR_CODE_CLOSE )
							end
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", n,
								"tooltipTitle", ArkInventory.Localise["BAG"],
								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_BAG_ASSIGN_DESC"], bag_id, bar_id ),
								"hasArrow", cat_bar,
								"value", string.format( "BAG_OPTION_%s", bag_id ),
								"func", function( )
									codex.layout.bag[bag_id].bar = bar_id
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)
							
						end
						
					end
					
				end
				
				
				if value == "BAR_COLOUR" then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["BORDER"],
						"isTitle", true
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["DEFAULT"],
						"tooltipTitle", ArkInventory.Localise["DEFAULT"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_COLOUR_BORDER_DEFAULT_DESC"], bar_id ),
						"isRadio", true,
						"checked", codex.layout.bar.data[bar_id].border.custom == 1,
						"disabled", codex.layout.bar.data[bar_id].border.custom == 1,
						"func", function( )
							codex.layout.bar.data[bar_id].border.custom = 1
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CUSTOM"],
						"tooltipTitle", ArkInventory.Localise["CUSTOM"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_COLOUR_BORDER_CUSTOM_DESC"], bar_id ),
						"isRadio", true,
						"checked", codex.layout.bar.data[bar_id].border.custom == 2,
						"disabled", codex.layout.bar.data[bar_id].border.custom == 2,
						"func", function( )
							codex.layout.bar.data[bar_id].border.custom = 2
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["COLOUR"],
						"tooltipTitle", ArkInventory.Localise["COLOUR"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_COLOUR_BORDER_DESC"], bar_id ),
						"hasColorSwatch", true,
						"hasOpacity", true,
						"disabled", codex.layout.bar.data[bar_id].border.custom ~= 2,
						"r", codex.layout.bar.data[bar_id].border.colour.r,
						"g", codex.layout.bar.data[bar_id].border.colour.g,
						"b", codex.layout.bar.data[bar_id].border.colour.b,
						"opacity", codex.layout.bar.data[bar_id].border.colour.a,
						"colorFunc", function( r, g, b, a )
							codex.layout.bar.data[bar_id].border.colour.r = r
							codex.layout.bar.data[bar_id].border.colour.g = g
							codex.layout.bar.data[bar_id].border.colour.b = b
							codex.layout.bar.data[bar_id].border.colour.a = a
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["BACKGROUND"],
						"isTitle", true
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["DEFAULT"],
						"tooltipTitle", ArkInventory.Localise["DEFAULT"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_COLOUR_BACKGROUND_DEFAULT_DESC"], bar_id ),
						"isRadio", true,
						"checked", codex.layout.bar.data[bar_id].background.custom == 1,
						"disabled", codex.layout.bar.data[bar_id].background.custom == 1,
						"func", function( )
							codex.layout.bar.data[bar_id].background.custom = 1
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CUSTOM"],
						"tooltipTitle", ArkInventory.Localise["CUSTOM"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_COLOUR_BACKGROUND_CUSTOM_DESC"], bar_id ),
						"isRadio", true,
						"checked", codex.layout.bar.data[bar_id].background.custom == 2,
						"disabled", codex.layout.bar.data[bar_id].background.custom == 2,
						"func", function( )
							codex.layout.bar.data[bar_id].background.custom = 2
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["COLOUR"],
						"tooltipTitle", ArkInventory.Localise["COLOUR"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_COLOUR_BACKGROUND_DESC"], bar_id ),
						"hasColorSwatch", true,
						"hasOpacity", true,
						"disabled", codex.layout.bar.data[bar_id].background.custom ~= 2,
						"r", codex.layout.bar.data[bar_id].background.colour.r,
						"g", codex.layout.bar.data[bar_id].background.colour.g,
						"b", codex.layout.bar.data[bar_id].background.colour.b,
						"opacity", codex.layout.bar.data[bar_id].background.colour.a,
						"colorFunc", function( r, g, b, a )
							--ArkInventory.Output( "background = [", r, "] [", g, "] [", b, "] [", a, "]")
							codex.layout.bar.data[bar_id].background.colour.r = r or 0
							codex.layout.bar.data[bar_id].background.colour.g = g or 0
							codex.layout.bar.data[bar_id].background.colour.b = b or 0
							codex.layout.bar.data[bar_id].background.colour.a = a or 1
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["NAME"],
						"isTitle", true
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["DEFAULT"],
						"tooltipTitle", ArkInventory.Localise["DEFAULT"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_COLOUR_NAME_DEFAULT_DESC"], bar_id ),
						"isRadio", true,
						"checked", codex.layout.bar.data[bar_id].name.custom == 1,
						"disabled", codex.layout.bar.data[bar_id].name.custom == 1,
						"func", function( )
							codex.layout.bar.data[bar_id].name.custom = 1
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["CUSTOM"],
						"tooltipTitle", ArkInventory.Localise["CUSTOM"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_COLOUR_NAME_CUSTOM_DESC"], bar_id ),
						"isRadio", true,
						"checked", codex.layout.bar.data[bar_id].name.custom == 2,
						"disabled", codex.layout.bar.data[bar_id].name.custom == 2,
						"func", function( )
							codex.layout.bar.data[bar_id].name.custom = 2
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["COLOUR"],
						"tooltipTitle", ArkInventory.Localise["COLOUR"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_COLOUR_NAME_DESC"], bar_id ),
						"hasColorSwatch", true,
						"disabled", codex.layout.bar.data[bar_id].name.custom ~= 2,
						"r", codex.layout.bar.data[bar_id].name.colour.r,
						"g", codex.layout.bar.data[bar_id].name.colour.g,
						"b", codex.layout.bar.data[bar_id].name.colour.b,
						"colorFunc", function( r, g, b, a )
							codex.layout.bar.data[bar_id].name.colour.r = r
							codex.layout.bar.data[bar_id].name.colour.g = g
							codex.layout.bar.data[bar_id].name.colour.b = b
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					)
					
				end
				
				
				if value == "BAR_ACTION" then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["ACTION"],
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["RESET"],
						"tooltipTitle", ArkInventory.Localise["RESET"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_RESET_DESC"], bar_id ),
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Bar_Clear( loc_id, bar_id )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["INSERT"],
						"tooltipTitle", ArkInventory.Localise["INSERT"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_INSERT_DESC"], bar_id ),
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Bar_Insert( loc_id, bar_id )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["DELETE"],
						"tooltipTitle", ArkInventory.Localise["DELETE"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_DELETE_DESC"], bar_id ),
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Bar_Remove( loc_id, bar_id )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					--[[
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MOVE"],
						"tooltipTitle", ArkInventory.Localise["MOVE"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_MOVE_START_DESC"], bar_id ),
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.EditModeMove( ArkInventory.Const.Move.Bar, loc_id, bar_id )
						end
					)
					
					if ArkInventory.Global.Options.MoveType == ArkInventory.Const.Move.Bar and ArkInventory.Global.Options.MoveLocation == loc_id and ArkInventory.Global.Options.MoveSourceBar ~= bar_id then
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipTitle", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_MOVE_COMPLETE_DESC"], ArkInventory.Global.Options.MoveSourceBar ),
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.Frame_Bar_Move( loc_id, ArkInventory.Global.Options.MoveSourceBar, bar_id )
								ArkInventory.EditModeMove( )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
					end
					]]--
					
				end
				
				
				if value == "BAR_WIDTH" then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["WIDTH"],
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					local c = codex.layout.bar.data[bar_id].width.min or 0
					local text = c
					if c == 0 then
						text = ArkInventory.Localise["AUTOMATIC"]
					end
					text = string.format( ArkInventory.Localise["MENU_BAR_WIDTH_MINIMUM"], ArkInventory.Localise["MINIMUM"], text )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", text,
						"tooltipTitle", ArkInventory.Localise["MINIMUM"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_WIDTH_MINIMUM_DESC"], bar_id ),
						"hasArrow", true,
						"hasEditBox", true,
						"editBoxText", c,
						"editBoxFunc", function( v )
							local v = math.floor( tonumber( v ) or 0 )
							if v < 0 then v = 0 end
							if v > 25 then v = 25 end
							if codex.layout.bar.data[bar_id].width.min ~= v then
								codex.layout.bar.data[bar_id].width.min = v
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						end
					)
					
					local c = codex.layout.bar.data[bar_id].width.max or 0
					local text = c
					if c == 0 then
						text = ArkInventory.Localise["AUTOMATIC"]
					end
					text = string.format( ArkInventory.Localise["MENU_BAR_WIDTH_MAXIMUM"], ArkInventory.Localise["MAXIMUM"], text )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", text,
						"tooltipTitle", ArkInventory.Localise["MAXIMUM"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_WIDTH_MAXIMUM_DESC"], bar_id ),
						"hasArrow", true,
						"hasEditBox", true,
						"editBoxText", c,
						"editBoxFunc", function( v )
							local v = math.floor( tonumber( v ) or 0 )
							if v < 0 then v = 0 end
							if v > 25 then v = 25 end
							if codex.layout.bar.data[bar_id].width.max ~= v then
								codex.layout.bar.data[bar_id].width.max = v
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						end
					)
					
				end
				
			end
			
			
			if level == 3 and value then
				
				local bag_id = tonumber( string.match( value, "^BAG_OPTION_(.+)" ) )
				if bag_id ~= nil then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s > %s", ArkInventory.Localise["BAG"], bag_id ),
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					local cv = codex.layout.bag[bag_id].bar
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["REMOVE"],
						"tooltipTitle", ArkInventory.Localise["REMOVE"],
--								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_REMOVE_DESC"], cat.fullname, bar_id ),
						"func", function( )
							codex.layout.bag[bag_id].bar = nil
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
				end
				
				
				ArkInventory.MenuItemCategoryAssignOpen( 3, level, value, i, loc_id, codex, bar_id, itemname, cat0, cat1, cat2 )
				
			end
			
			if level == 4 and value then
				ArkInventory.MenuItemCategoryAssignOpen( 3, level, value, i, loc_id, codex, bar_id, itemname, cat0, cat1, cat2 )
			end
			
		end
		
	)
	
end

function ArkInventory.MenuBarLabelOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	local loc_id = frame:GetParent( ).ARK_Data.loc_id
	local bar_id = frame:GetParent( ).ARK_Data.bar_id
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			if level == 1 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["MENU_BAR_TRANSFER"],
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				local dst_id = ArkInventory.Const.Location.Bank
				if loc_id == ArkInventory.Const.Location.Bank then
					dst_id = ArkInventory.Const.Location.Bag
				end
				
				local text = string.format( ArkInventory.Localise["MENU_BAR_TRANSFER_LOCATION"], ArkInventory.Global.Location[dst_id].Name )
				local desc = string.format( ArkInventory.Localise["MENU_BAR_TRANSFER_LOCATION_DESC"], bar_id, ArkInventory.Global.Location[dst_id].Name )
				local checked = ArkInventory.Global.Mode.Bank and ( loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"disabled", not checked,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.BarTransfer( loc_id, bar_id, dst_id )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
			end
			
		end
		
	)
	
end

function ArkInventory.MenuItemOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Global.Mode.Edit == false then
		return
	end
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local blizzard_id = ArkInventory.InternalIdToBlizzardBagId( loc_id, bag_id )
	local slot_id = frame.ARK_Data.slot_id
	local codex = ArkInventory.GetLocationCodex( loc_id )
	local i = ArkInventory.Frame_Item_GetDB( frame )
	local info = ArkInventory.GetObjectInfo( i.h, i )
	
	local isEmpty = false
	if not i or i.h == nil then
		isEmpty = true
	end
	
	
	local ic = select( 5, ArkInventory.GetItemQualityColor( info.q ) )
	local itemname = string.format( "%s%s%s", ic, info.name or "", FONT_COLOR_CODE_CLOSE )
	
	local cat0, cat1, cat2 = ArkInventory.ItemCategoryGet( i )
	local bar_id = math.abs( ArkInventory.CategoryLocationGet( loc_id, cat0 ) )
	
	cat0 = ArkInventory.Global.Category[cat0] or cat0
	if type( cat0 ) ~= "table" then
		cat0 = { id = cat0, fullname = string.format( ArkInventory.Localise["CONFIG_OBJECT_DELETED"], ArkInventory.Localise["CATEGORY"], cat0 ) }
	end
	
	if cat1 then
		cat1 = ArkInventory.Global.Category[cat1] or cat1
		if type( cat1 ) ~= "table" then
			cat1 = { id = cat1, fullname = string.format( ArkInventory.Localise["CONFIG_OBJECT_DELETED"], ArkInventory.Localise["CATEGORY"], cat1 ) }
		end
	end
	
	cat2 = ArkInventory.Global.Category[cat2] or cat2
	if type( cat2 ) ~= "table" then
		cat2 = { id = cat2, fullname = string.format( ArkInventory.Localise["CONFIG_OBJECT_DELETED"], ArkInventory.Localise["CATEGORY"], cat2 ) }
	end
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			if level == 1 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", itemname,
					"isTitle", true
				)
				
				if not isEmpty then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					local osd = info.osd
					local search_id = string.format( "%s:%s", osd.class, osd.id )
					
					local text = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT"]
					local desc = ArkInventory.Localise["MENU_ITEM_ITEMCOUNT_DESC"]
					
					if ArkInventory.db.option.tooltip.itemcount.ignore[search_id] then
						text = string.format( "%s: %s%s", text, RED_FONT_COLOR_CODE, ArkInventory.Localise["DISABLED"] )
						desc = string.format( ArkInventory.Localise["MENU_ITEM_ITEMCOUNT_STATUS_DESC"], desc, ArkInventory.Localise["ENABLE"] )
					else
						text = string.format( "%s: %s%s", text, GREEN_FONT_COLOR_CODE, ArkInventory.Localise["ENABLED"] )
						desc = string.format( ArkInventory.Localise["MENU_ITEM_ITEMCOUNT_STATUS_DESC"], desc, ArkInventory.Localise["DISABLE"] )
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", text,
						"tooltipTitle", text,
						"tooltipText", desc,
						"func", function( )
							ArkInventory.db.option.tooltip.itemcount.ignore[search_id] = not ArkInventory.db.option.tooltip.itemcount.ignore[search_id]
						end
					)
					
				end
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				if not codex.style.window.list then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						--"text", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_LABEL"], ArkInventory.Localise["CATEGORY"], ArkInventory.Localise["ASSIGNED"] ),
						"text", ArkInventory.Localise["CATEGORY"],
						"isTitle", true
					)
					
					if cat1 then
						
						-- item has a category, that means it's been specifically assigned away from the default
						
						-- items default category
						
						local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat2.id )
						local catset = codex.catset.ca[cat_type][cat_num]
						
						
						-- start changes !!!
						local disabled = false
						
						local txt = string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, cat2.fullname, FONT_COLOR_CODE_CLOSE )
						local desc = ""
						if cat0.type_code == "RULE" then
							desc = string.format( ArkInventory.Localise["MENU_ITEM_ASSIGN_CURRENT_DESC"], itemname, cat0.fullname )
							disabled = true
						else
							desc = string.format( ArkInventory.Localise["MENU_ITEM_ASSIGN_RESET_DESC"], itemname, cat2.fullname )
							disabled = false
						end
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", txt,
							"tooltipTitle", txt,
							"tooltipText", desc,
							"icon", helper_CategoryIcon( catset ),
							"hasArrow", true,
							"value", string.format( "CATEGORY_CURRENT_OPTION_%s_1", cat2.id ),
							"func", function( )
								if not disabled then
									ArkInventory.ItemCategorySet( i, nil )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									ArkInventory.Lib.Dewdrop:Close( )
								end
							end
						)
						
						-- items assigned category
						
						local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat1.id )
						local catset = codex.catset.ca[cat_type][cat_num]
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["ASSIGNED"], GREEN_FONT_COLOR_CODE, cat1.fullname, FONT_COLOR_CODE_CLOSE ),
							"icon", helper_CategoryIcon( catset ),
							"hasArrow", true,
							"value", string.format( "CATEGORY_CURRENT_OPTION_%s_0", cat1.id ),
							"func", function( )
								-- do nothing
							end
						)
						
						
					else
						
						local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat2.id )
						local catset = codex.catset.ca[cat_type][cat_num]
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, cat2.fullname, FONT_COLOR_CODE_CLOSE ),
							"icon", helper_CategoryIcon( catset ),
							"hasArrow", true,
							"value", string.format( "CATEGORY_CURRENT_OPTION_%s_2", cat2.id ),
							"func", function( )
								-- do nothing
							end
						)
						
					end
					
					
					
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_LABEL"], ArkInventory.Localise["CATEGORY"], ArkInventory.Localise["ASSIGNABLE"] ),
						"isTitle", true
					)
					
					if codex.catset.system then
						
						local text = string.format( "%s* %s *%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["LOCKED"], FONT_COLOR_CODE_CLOSE )
						local desc = string.format( ArkInventory.Localise["MENU_LOCKED_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET"], ArkInventory.Localise["CONFIG"], ArkInventory.Localise["CONTROLS"] )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", text,
							"tooltipTitle", text,
							"tooltipText", desc
						)
						
					else
						
						for _, v in ipairs( ArkInventory.Const.Category.Headers ) do
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise[string.format( "CATEGORY_%s", v )],
								"disabled", isEmpty,
								"hasArrow", true,
								"value", string.format( "CATEGORY_ASSIGN_%s", v )
							)
						end
						
					end
					
					if codex.layout.system then
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						local text = string.format( "%s* %s *%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["LOCKED"], FONT_COLOR_CODE_CLOSE )
						local desc = string.format( ArkInventory.Localise["MENU_LOCKED_DESC"], ArkInventory.Localise["CONFIG_LAYOUT"], ArkInventory.Localise["CONFIG"], ArkInventory.Localise["CONTROLS"] )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", text,
							"tooltipTitle", text,
							"tooltipText", desc
						)
						
					else
						
						--[[
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["MOVE"],
							"tooltipTitle", ArkInventory.Localise["MOVE"],
							"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_MOVE_START_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat0.fullname, FONT_COLOR_CODE_CLOSE ) ),
							--"disabled", ArkInventory.Global.Options.MoveLocation == loc_id and ArkInventory.Global.Options.MoveSourceBar ==  bar_id,
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.EditModeMove( ArkInventory.Const.Move.Category, loc_id, bar_id, cat0.id )
							end
						)
						
						if ArkInventory.Global.Options.MoveType == ArkInventory.Const.Move.Category and ArkInventory.Global.Options.MoveLocation == loc_id and ArkInventory.Global.Options.MoveSourceBar ~= bar_id then
							
							local cat = ArkInventory.Global.Category[ArkInventory.Global.Options.MoveSourceData]
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
								"tooltipTitle", string.format( "%s: %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_MOVE_COMPLETE_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat.fullname, FONT_COLOR_CODE_CLOSE ), ArkInventory.Global.Options.MoveSourceBar, bar_id ),
								"closeWhenClicked", true,
								"func", function( )
									ArkInventory.CategoryLocationSet( loc_id, cat.id, bar_id )
									ArkInventory.EditModeMove( )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)
							
						end
						--]]
						
					end
					
				end
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["DEBUG"],
					"hasArrow", true,
					"value", "DEBUG_INFO"
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
			
			if level == 2 and value then
				
				if value == "DEBUG_INFO" then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["DEBUG"],
						"isTitle", true
					)
					
					local bagtype = ArkInventory.Const.Slot.Data[ArkInventory.BagType( blizzard_id )].name
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["LOCATION"], LIGHTYELLOW_FONT_COLOR_CODE, loc_id, ArkInventory.Global.Location[loc_id].Name ) )
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["BAG"], LIGHTYELLOW_FONT_COLOR_CODE, bag_id, blizzard_id ) )
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["SLOT"], LIGHTYELLOW_FONT_COLOR_CODE, slot_id, bagtype ) )
					--ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s", "sort key", ArkInventory.ItemSortKeyGenerate( i, bar_id, codex ) ) )
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["CATEGORY_CLASS"], LIGHTYELLOW_FONT_COLOR_CODE, info.class ) )
					
					if i.h then
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["NAME"], LIGHTYELLOW_FONT_COLOR_CODE, info.name or "" ) )
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_ITEMSTRING"], LIGHTYELLOW_FONT_COLOR_CODE, info.osd.h ),
						"hasArrow", true,
						"hasEditBox", true,
						"editBoxText", info.osd.h
					)
					
					if i.h then
						
						if info.class == "item" then
							
--							ArkInventory.Lib.Dewdrop:AddLine(
--								"text", string.format( "%s (clean): %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_ITEMSTRING"], LIGHTYELLOW_FONT_COLOR_CODE, info.osd.h_rule ),
--								"hasArrow", true,
--								"hasEditBox", true,
--								"editBoxText", info.osd.h_rule
--							)
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ITEM_SOULBOUND, LIGHTYELLOW_FONT_COLOR_CODE, i.sb, ArkInventory.Localise[string.format( "ITEM_BIND%s", i.sb or ArkInventory.ENUM.BIND.NEVER )] ) )
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", QUALITY, LIGHTYELLOW_FONT_COLOR_CODE, info.q, _G[string.format( "ITEM_QUALITY%s_DESC", info.q )] ) )
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_LVL_ITEM"], LIGHTYELLOW_FONT_COLOR_CODE, info.ilvl ) )
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_LVL_USE"], LIGHTYELLOW_FONT_COLOR_CODE, info.uselevel ) )
							
							if info.osd.sourceid > 0 then
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_SOURCE"], LIGHTYELLOW_FONT_COLOR_CODE, info.osd.sourceid ) )
							end
							
							if info.osd.bonusids then
								local tmp = { }
								for k in pairs( info.osd.bonusids ) do
									table.insert( tmp, k )
								end
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_BONUS"], LIGHTYELLOW_FONT_COLOR_CODE, table.concat( tmp, ", " ) ) )
							end
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, info.itemtypeid, info.itemtype ) )
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["MENU_ITEM_DEBUG_SUBTYPE"], LIGHTYELLOW_FONT_COLOR_CODE, info.itemsubtypeid, info.itemsubtype ) )
							
							if info.equiploc ~= "" then
								local iloc = _G[info.equiploc] or ArkInventory.Localise["UNKNOWN"]
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["EQUIP"], LIGHTYELLOW_FONT_COLOR_CODE, info.equiploc, iloc ) )
							end
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", AUCTION_STACK_SIZE, LIGHTYELLOW_FONT_COLOR_CODE, info.stacksize ) )
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["TEXTURE"], LIGHTYELLOW_FONT_COLOR_CODE, info.texture ) )
							
							local ifam = GetItemFamily( i.h ) or 0
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_FAMILY"], LIGHTYELLOW_FONT_COLOR_CODE, ifam ) )
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["EXPANSION"], LIGHTYELLOW_FONT_COLOR_CODE, info.expansion or -1, _G[string.format( "EXPANSION_NAME%d", info.expansion )] or ArkInventory.Localise["UNKNOWN"] ) )
							
						elseif info.class == "battlepet" then
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", QUALITY, LIGHTYELLOW_FONT_COLOR_CODE, info.q, _G[string.format( "ITEM_QUALITY%s_DESC", info.q )] ) )
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_LVL_ITEM"], LIGHTYELLOW_FONT_COLOR_CODE, info.ilvl ) )
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, info.itemsubtypeid, ArkInventory.Collection.Pet.PetTypeName( info.itemsubtypeid ) or ArkInventory.Localise["UNKNOWN"] ) )
							
							if i.guid then
								
								ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_PET_ID"], LIGHTYELLOW_FONT_COLOR_CODE, i.guid ) )
								
								local pd = ArkInventory.Collection.Pet.GetByID( i.guid )
								if pd then
									ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_PET_SPECIES"], LIGHTYELLOW_FONT_COLOR_CODE, pd.sd.speciesID ) )
									ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", "IsRevoked", LIGHTYELLOW_FONT_COLOR_CODE, pd.IsRevoked and "true" or "false" ) )
									ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", "isLockedForConvert", LIGHTYELLOW_FONT_COLOR_CODE, pd.isLockedForConvert and "true" or "false" ) )
								end
								
							end
							
						elseif info.class == "spell" then
							
							-- mounts
							
							local md = ArkInventory.Collection.Mount.GetMount( i.index )
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, md.mt or ArkInventory.Localise["UNKNOWN"] ) )
							
							ArkInventory.Lib.Dewdrop:AddLine( )
							
							ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["TEXTURE"], LIGHTYELLOW_FONT_COLOR_CODE, info.texture ) )
							
						end
						
					end
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_AI_ID_SHORT"], LIGHTYELLOW_FONT_COLOR_CODE, info.id ),
						"hasArrow", true,
						"hasEditBox", true,
						"editBoxText", info.id
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["CATEGORY"], LIGHTYELLOW_FONT_COLOR_CODE, cat0.id ) )
					
					local cid = ArkInventory.ObjectIDCategory( i )
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s (%s): %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_CACHE"], ArkInventory.Localise["CATEGORY"], LIGHTYELLOW_FONT_COLOR_CODE, cid ) )
					
					cid = ArkInventory.ObjectIDRule( i )
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s (%s): %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_CACHE"], ArkInventory.Localise["CATEGORY_RULE"], LIGHTYELLOW_FONT_COLOR_CODE, cid ) )
					
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", "Data is ready", LIGHTYELLOW_FONT_COLOR_CODE, tostring(info.ready) ) )
					
					if i.h then
						if info.class == "item" then
							
							ArkInventory.Lib.Dewdrop:AddLine( )
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Localise["MENU_ITEM_DEBUG_PT"],
								"hasArrow", true,
								"tooltipTitle", ArkInventory.Localise["MENU_ITEM_DEBUG_PT"],
								"tooltipText", ArkInventory.Localise["MENU_ITEM_DEBUG_PT_DESC"],
								"value", "DEBUG_INFO_PT"
							)
							
						end
					end
					
				end
				
				if strsub( value, 1, 16 ) == "CATEGORY_ASSIGN_" then
					
					local k = string.match( value, "CATEGORY_ASSIGN_(.+)" )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise[string.format( "CATEGORY_%s", k )],
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					for _, cat in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].sort_order < ArkInventory.Global.Category[b].sort_order end ) do
						
						local t = cat.type_code
						
						if cat.id == cat0.id then
							t = "DO_NOT_USE"
						end
						
						if k == t then
							
							local cat_bar, def_bar = ArkInventory.CategoryLocationGet( loc_id, cat.id )
							local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat.id )
							local catset = codex.catset.ca[cat_type][cat_num]
							
							local c1 = ""
							
							if not def_bar then
								c1 = LIGHTYELLOW_FONT_COLOR_CODE
							end
							
							if not catset.active then
								c1 = RED_FONT_COLOR_CODE
							end
							
							local text = string.format( "%s%s", c1, cat.name )
							
							local c2 = GREEN_FONT_COLOR_CODE
							if cat_bar < 0 then
								-- hidden category, make bar number red
								c2 = RED_FONT_COLOR_CODE
							end
							
							if not def_bar then
								text = string.format( "%s %s[%s]", text, c2, abs( cat_bar ) )
							end
							
							local desc = string.format( ArkInventory.Localise["MENU_ITEM_ASSIGN_CATEGORY_DESC"], itemname, cat.fullname )
							
							if not catset.active then
								desc = string.format( "%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["MENU_ITEM_ASSIGN_DISABLED_DESC"] )
							end
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", text,
								"tooltipTitle", cat.fullname,
								"tooltipText", desc,
								"icon", helper_CategoryIcon( catset ),
								"hasArrow", true,
								"value", string.format( "CATEGORY_CURRENT_OPTION_%s_3", cat.id ),
								"func", function( )
									if catset.active then
										ArkInventory.ItemCategorySet( i, cat.id )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										ArkInventory.Lib.Dewdrop:Close( )
									end
								end
							)
							
						end
						
					end
					
					if k == "CUSTOM" then
					
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["MENU_ITEM_CUSTOM_NEW"],
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.Frame_Config_Show( "settings", "categoryset" )
							end
						)
						
					end
					
				end
				
				ArkInventory.MenuItemCategoryAssignOpen( 2, level, value, i, loc_id, codex, bar_id, itemname, cat0, cat1, cat2 )
				
			end
			
			
			if level == 3 and value then
				
				if value == "DEBUG_INFO_PT" then
				
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: ", ArkInventory.Localise["MENU_ITEM_DEBUG_PT_TITLE"] ),
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					--local pt_set = ArkInventory.Lib.PeriodicTable:ItemSearch( i.h )
					local pt_set = ArkInventory.PT_ItemSearch( i.h )
					
					if not pt_set then
					
						ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s%s", LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise["MENU_ITEM_DEBUG_PT_NONE"] ) )
					
					else
					
						for k, v in ArkInventory.spairs( pt_set ) do
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", k,
								"hasArrow", true,
								"hasEditBox", true,
								"editBoxText", k
							)
						end
						
					end
					
				end
				
				
				ArkInventory.MenuItemCategoryAssignOpen( 2, level, value, i, loc_id, codex, bar_id, itemname, cat0, cat1, cat2 )
				
				ArkInventory.MenuItemCategoryAssignOpen( 3, level, value, i, loc_id, codex, bar_id, itemname, cat0, cat1, cat2 )
				
			end
			
			if level == 4 and value then
				ArkInventory.MenuItemCategoryAssignOpen( 3, level, value, i, loc_id, codex, bar_id, itemname, cat0, cat1, cat2 )
			end
			
		end
		
	)
	
end

function ArkInventory.MenuItemCategoryAssignOpen( offset, level, value, i, loc_id, codex, bar_id, itemname, cat0, cat1, cat2 )
	
	if ( level == 0 + offset ) then
		
		if strsub( value, 1, 24 ) == "CATEGORY_CURRENT_OPTION_" then
			
			local cat_id, req_id = string.match( value, "^CATEGORY_CURRENT_OPTION_(.+)_(.+)" )
			
			if cat_id ~= nil then
				
				local cat = ArkInventory.Global.Category[cat_id]
				local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat.id )
				local catset = codex.catset.ca[cat_type][cat_num]
				
				local cat_bar, cat_def = ArkInventory.CategoryLocationGet( loc_id, cat.id )
				cat_bar = abs( cat_bar )
				
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", cat.fullname,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				if codex.catset.system then
					
					local text = string.format( "%s* %s *%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["LOCKED"], FONT_COLOR_CODE_CLOSE )
					local desc = string.format( ArkInventory.Localise["MENU_LOCKED_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET"], ArkInventory.Localise["CONFIG"], ArkInventory.Localise["CONTROLS"] )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", text,
						"tooltipTitle", text,
						"tooltipText", desc
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
				end
				
				local text = ArkInventory.Localise["STATUS"]
				local desc = string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_STATUS"], cat.fullname )
				
				if catset.active then
					text = string.format( "%s: %s%s", text, GREEN_FONT_COLOR_CODE, ArkInventory.Localise["ENABLED"] )
					if cat.type_code == "RULE" or cat.type_code == "CUSTOM" then
						desc = string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_STATUS_DESC"], desc, ArkInventory.Localise["DISABLE"] )
					end
				else
					text = string.format( "%s: %s%s", text, RED_FONT_COLOR_CODE, ArkInventory.Localise["DISABLED"] )
					if cat.type_code == "RULE" or cat.type_code == "CUSTOM" then
						desc = string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_STATUS_DESC"], desc, ArkInventory.Localise["ENABLE"] )
					end
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"hidden", codex.catset.system,
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"disabled", not ( cat.type_code == "RULE" or cat.type_code == "CUSTOM" ),
					"func", function( )
						catset.active = not catset.active
						ArkInventory.ItemCacheClear( )
						ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				local desc = ""
				local disabled1 = false
				local disabled2 = false
				
				if req_id == "0" then
					
					-- from level 1
					-- you have overridden the default and assigned a category
					-- you cannot re-assign it from here
					
					desc = string.format( ArkInventory.Localise["MENU_ITEM_ASSIGN_CURRENT_DESC"], itemname, cat0.fullname )
					disabled1 = true
					disabled2 = cat_def
					
				elseif req_id == "1" then
					
					-- from level 1
					-- reset to default category, except if its a rule
					
					if cat0.type_code == "RULE" then
						desc = string.format( ArkInventory.Localise["MENU_ITEM_ASSIGN_CURRENT_DESC"], itemname, cat0.fullname )
						disabled1 = true
					else
						desc = string.format( ArkInventory.Localise["MENU_ITEM_ASSIGN_RESET_DESC"], itemname, cat2.fullname )
						disabled1 = false
					end
					
					disabled2 = cat_def
					
				elseif req_id == "2" then
					
					-- from level 1
					-- this is the default category for the item
					
					if cat.id == cat2.id then
						-- this is its default category
						desc = string.format( ArkInventory.Localise["MENU_ITEM_ASSIGN_CURRENT_DESC"], itemname, cat0.fullname )
						disabled1 = true
					else
						-- assign a new category
						desc = string.format( ArkInventory.Localise["MENU_ITEM_ASSIGN_CATEGORY_DESC"], itemname, cat0.fullname )
						disabled1 = false
					end
					
					disabled2 = cat_def
					
				elseif req_id == "3" then
					
					-- from level 2
					-- select category to assign to it
					-- the default category for this item has been removed from the list
					
					desc = string.format( ArkInventory.Localise["MENU_ITEM_ASSIGN_CATEGORY_DESC"], itemname, cat.fullname )
					disabled1 = false
					disabled2 = cat_def
					
				elseif req_id == "4" then
					
					-- assign category to bar
					
					desc = string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat.fullname, FONT_COLOR_CODE_CLOSE ), bar_id )
					disabled1 = bar_id == cat_bar and not def_bar
					disabled2 = def_bar
					
				end
				
				if not catset.active then
					desc = string.format( "%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["MENU_ITEM_ASSIGN_DISABLED_DESC"] )
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["ASSIGN"],
					"tooltipTitle", ArkInventory.Localise["ASSIGN"],
					"tooltipText", desc,
					"disabled", disabled1 or not catset.active,
					"func", function( )
						if req_id == "0" then
							return
						elseif req_id == "1" then
							ArkInventory.ItemCategorySet( i, nil )
						elseif req_id == "2" or req_id == "3" then
							ArkInventory.ItemCategorySet( i, cat.id )
						elseif req_id == "4" then
							ArkInventory.CategoryLocationSet( loc_id, cat.id, bar_id )
						end
						ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						ArkInventory.Lib.Dewdrop:Close( )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["MOVE"],
					"tooltipTitle", ArkInventory.Localise["MOVE"],
					"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_MOVE_START_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, cat.fullname, FONT_COLOR_CODE_CLOSE ) ),
					"disabled", disabled2,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.EditModeMove( ArkInventory.Const.Move.Category, loc_id, cat_bar, cat.id )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["REMOVE"],
					"tooltipTitle", ArkInventory.Localise["REMOVE"],
					"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_REMOVE_DESC"], cat.fullname, cat_bar ),
					"disabled", disabled2,
					"func", function( )
						ArkInventory.CategoryLocationSet( loc_id, cat_id, nil )
						ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["HIDE"],
					"tooltipTitle", ArkInventory.Localise["HIDE"],
					"tooltipText", ArkInventory.Localise["MENU_BAR_CATEGORY_HIDDEN_DESC"],
					"disabled", disabled2,
					"checked", ArkInventory.CategoryHiddenCheck( loc_id, cat_id ),
					"func", function( )
						ArkInventory.CategoryHiddenToggle( loc_id, cat_id )
						ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["ACTION"],
					"isTitle", true
				)
				
				local text = ArkInventory.Localise["TYPE"]
				local desc = string.format( "under construction\n\nset the action to take for %s.", cat.fullname )
				local colour = GREEN_FONT_COLOR_CODE
				local state = ArkInventory.Localise["UNKNOWN"]
				
				if catset.action.t == ArkInventory.ENUM.ACTION.TYPE.DISABLED then
					colour = GRAY_FONT_COLOR_CODE
					state = ArkInventory.Localise["DISABLED"]
				elseif catset.action.t == ArkInventory.ENUM.ACTION.TYPE.VENDOR then
					state = ArkInventory.Localise["VENDOR"]
				elseif catset.action.t == ArkInventory.ENUM.ACTION.TYPE.MAIL then
					state = ArkInventory.Localise["MAIL"]
				elseif catset.action.t == ArkInventory.ENUM.ACTION.TYPE.MOVE then
					state = ArkInventory.Localise["MOVE"]
				elseif catset.action.t == ArkInventory.ENUM.ACTION.TYPE.USE then
					state = ArkInventory.Localise["USE"]
				elseif catset.action.t == ArkInventory.ENUM.ACTION.TYPE.DELETE then
					state = ArkInventory.Localise["DELETE"]
				elseif catset.action.t == ArkInventory.ENUM.ACTION.TYPE.SCRAP then
					state = ArkInventory.Localise["SCRAP"]
				end
				
				text = string.format( "%s: %s%s", text, colour, state )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"hasArrow", true,
					"value", string.format( "CATEGORY_ACTION_TYPE_%s", cat_id )
				)
				
				
				local text = ArkInventory.Localise["WHEN"]
				local desc = string.format( "under construction\n\nset when the action for %s will run.", cat.fullname )
				local colour = GREEN_FONT_COLOR_CODE
				local state = ArkInventory.Localise["UNKNOWN"]
				
				if catset.action.w == ArkInventory.ENUM.ACTION.WHEN.DISABLED then
					colour = GRAY_FONT_COLOR_CODE
					state = ArkInventory.Localise["DISABLED"]
				elseif catset.action.w == ArkInventory.ENUM.ACTION.WHEN.MANUAL then
					state = ArkInventory.Localise["MANUAL"]
				elseif catset.action.w == ArkInventory.ENUM.ACTION.WHEN.AUTO then
					state = ArkInventory.Localise["AUTOMATIC"]
				end
				
				text = string.format( "%s: %s%s", text, colour, state )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"hasArrow", true,
					"value", string.format( "CATEGORY_ACTION_WHEN_%s", cat_id )
				)
				
				local text = ArkInventory.Localise["RECIPIENT"]
				local desc = string.format( "set the recipient to recieve items in %s", cat.fullname )
				local recipient = catset.action.recipient
				if not recipient then
					recipient = string.format( "%s%s", RED_FONT_COLOR_CODE, "<not set>" )
				else
					recipient = string.format( "%s%s", GREEN_FONT_COLOR_CODE, recipient )
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", text, recipient ),
					"tooltipTitle", text,
					"tooltipText", desc,
					"hidden", catset.action.t ~= ArkInventory.ENUM.ACTION.TYPE.MAIL,
					"hasArrow", true,
					"value", string.format( "CATEGORY_ACTION_MAIL_%s", cat_id )
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_LABEL"], ArkInventory.Localise["ACTIONS"], ArkInventory.Localise["ASSIGNED"] ),
					"isTitle", true
				)
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_LABEL"], ArkInventory.Localise["ACTIONS"], ArkInventory.Localise["ASSIGNABLE"] ),
					"isTitle", true
				)
				
			end
			
		end
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["CLOSE_MENU"],
			"closeWhenClicked", true
		)
		
	end
	
	if ( level == 1 + offset ) then
		
		if strsub( value, 1, 21 ) == "CATEGORY_ACTION_TYPE_" then
			
			local cat_id = string.match( value, "^CATEGORY_ACTION_TYPE_(.+)" )
			
			if cat_id ~= nil then
				
				local cat = ArkInventory.Global.Category[cat_id]
				local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat.id )
				local catset = codex.catset.ca[cat_type][cat_num]
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["ACTION"],
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				
				local text = ArkInventory.Localise["DISABLED"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_TYPE_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.TYPE.DISABLED
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"isRadio", true,
					"checked", catset.action.t == state,
					"func", function( )
						catset.action.t = state
					end
				)
				
				
				local text = ArkInventory.Localise["VENDOR"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_TYPE_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.TYPE.VENDOR
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"isRadio", true,
					"checked", catset.action.t == state,
					"func", function( )
						catset.action.t = state
					end
				)
				
				
				local text = ArkInventory.Localise["MAIL"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_TYPE_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.TYPE.MAIL
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"isRadio", true,
					"checked", catset.action.t == state,
					"func", function( )
						catset.action.t = state
					end
				)
				
				
				local text = ArkInventory.Localise["MOVE"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_TYPE_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.TYPE.MOVE
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"hidden", true,
					"isRadio", true,
					"checked", catset.action.t == state,
					"func", function( )
						catset.action.t = state
					end
				)
				
				
				local text = ArkInventory.Localise["USE"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_TYPE_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.TYPE.USE
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"hidden", true,
					"isRadio", true,
					"checked", catset.action.t == state,
					"func", function( )
						catset.action.t = state
					end
				)
				
				
				local text = ArkInventory.Localise["DELETE"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_TYPE_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.TYPE.DELETE
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"hidden", true,
					"isRadio", true,
					"checked", catset.action.t == state,
					"func", function( )
						catset.action.t = state
					end
				)
				
				
				local text = ArkInventory.Localise["SCRAP"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_TYPE_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.TYPE.SCRAP
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"isRadio", true,
					"checked", catset.action.t == state,
					"func", function( )
						catset.action.t = state
					end
				)
				
			end
			
		end
		
		if strsub( value, 1, 21 ) == "CATEGORY_ACTION_WHEN_" then
			
			local cat_id = string.match( value, "^CATEGORY_ACTION_WHEN_(.+)" )
			
			if cat_id ~= nil then
				
				local cat = ArkInventory.Global.Category[cat_id]
				local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat.id )
				local catset = codex.catset.ca[cat_type][cat_num]
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["ACTION"],
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				local text = ArkInventory.Localise["DISABLED"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_WHEN_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.WHEN.DISABLED
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"isRadio", true,
					"checked", catset.action.w == state,
					"func", function( )
						catset.action.w = state
					end
				)
				
				local text = ArkInventory.Localise["MANUAL"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_WHEN_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.WHEN.MANUAL
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"isRadio", true,
					"checked", catset.action.w == state,
					"func", function( )
						catset.action.w = state
					end
				)
				
				local text = ArkInventory.Localise["AUTOMATIC"]
				local desc = string.format( ArkInventory.Localise["CONFIG_ACTION_WHEN_DESC"], cat.fullname, text )
				local state = ArkInventory.ENUM.ACTION.WHEN.AUTO
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"disabled", catset.action.t == ArkInventory.ENUM.ACTION.TYPE.DELETE,
					"isRadio", true,
					"checked", catset.action.w == state,
					"func", function( )
						catset.action.w = state
					end
				)
				
			end
			
		end
		
		if strsub( value, 1, 21 ) == "CATEGORY_ACTION_MAIL_" then
			
			local cat_id = string.match( value, "^CATEGORY_ACTION_MAIL_(.+)" )
			
			if cat_id ~= nil then
				
				local cat = ArkInventory.Global.Category[cat_id]
				local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat.id )
				local catset = codex.catset.ca[cat_type][cat_num]
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["RECIPIENT"],
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				local selected = false
				local desc = string.format( "set the recipient to recieve items in %s", cat.fullname )
				
				for address, displayname in ArkInventory.spairs( ArkInventory.MailRecipients, function( a, b ) return ( a < b ) end ) do
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", displayname,
						"tooltipTitle", "",
						--"tooltipText", "",
						"isRadio", true,
						"checked", catset.action.recipient == address,
						"func", function( )
							catset.action.recipient = address
						end
					)
					
				end
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				local text = ArkInventory.Localise["OTHER"]
				
				local recipient = catset.action.recipient
				if not recipient then
					recipient = string.format( "%s%s", RED_FONT_COLOR_CODE, "<not set>" )
				else
					recipient = string.format( "%s%s", GREEN_FONT_COLOR_CODE, recipient )
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", text, recipient ),
					"tooltipTitle", text,
					"tooltipText", desc,
					"hidden", catset.action.t ~= ArkInventory.ENUM.ACTION.TYPE.MAIL,
					"hasArrow", true,
					"hasEditBox", true,
					"editBoxText", catset.action.recipient or "",
					"editBoxFunc", function( v )
						local recipient = string.gsub( v, "%s+", "" )
						if string.find( recipient, "-" ) then
							catset.action.recipient = string.lower( recipient )
						else
							ArkInventory.OutputWarning( "recipient must be in the format <character>-<realm>" )
						end
					end
				)
			
			end
			
		end
		
	end
	
	
end

function ArkInventory.MenuBagOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local blizzard_id = ArkInventory.InternalIdToBlizzardBagId( loc_id, bag_id )
	local codex = ArkInventory.GetLocationCodex( loc_id )
	local player_id = codex.player.data.info.player_id
	
	local i = ArkInventory.Frame_Item_GetDB( frame )
	local info = ArkInventory.GetObjectInfo( i.h, i )
	
	local isEmpty = false
	if not ( blizzard_id == ArkInventory.ENUM.BAG.INDEX.BACKPACK or blizzard_id == ArkInventory.ENUM.BAG.INDEX.BANK ) then
		if not i or i.h == nil then
			isEmpty = true
		end
	end
	
	local bag = codex.player.data.location[loc_id].bag[bag_id]
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			if level == 1 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s %i", ArkInventory.Localise["OPTIONS"], ArkInventory.Localise["SLOT"], bag_id ),
					"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.EditMode].Texture,
					"isTitle", true
				)
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["DISPLAY"],
					"tooltipTitle", ArkInventory.Localise["DISPLAY"],
					"tooltipText", ArkInventory.Localise["MENU_BAG_SHOW_DESC"],
					"checked", codex.player.data.option[loc_id].bag[bag_id].display,
					"closeWhenClicked", true,
					"func", function( )
						codex.player.data.option[loc_id].bag[bag_id].display = not codex.player.data.option[loc_id].bag[bag_id].display
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["MENU_BAG_ISOLATE"],
					"tooltipTitle", ArkInventory.Localise["MENU_BAG_ISOLATE"],
					"tooltipText", ArkInventory.Localise["MENU_BAG_ISOLATE_DESC"],
					"closeWhenClicked", true,
					"func", function( )
						for x in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
							if x == bag_id then
								codex.player.data.option[loc_id].bag[x].display = true
							else
								codex.player.data.option[loc_id].bag[x].display = false
							end
						end
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["MENU_BAG_SHOWALL"],
					"tooltipTitle", ArkInventory.Localise["MENU_BAG_SHOWALL"],
					"tooltipText", ArkInventory.Localise["MENU_BAG_SHOWALL_DESC"],
					"closeWhenClicked", true,
					"func", function( )
						for x in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
							codex.player.data.option[loc_id].bag[x].display = true
						end
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				if not isEmpty then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["EMPTY"],
						"tooltipTitle", ArkInventory.Localise["EMPTY"],
						"tooltipText", ArkInventory.Localise["MENU_BAG_EMPTY_DESC"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.EmptyBag( loc_id, bag_id )
						end
					)
					
				end
				
				
				if not ArkInventory.Global.Mode.Edit and loc_id == ArkInventory.Const.Location.Bank and bag.status == ArkInventory.Const.Bag.Status.Purchase then
					
					if bag_id == ArkInventory.Global.Location[loc_id].ReagentBag then
						
						local cost = GetReagentBankCost( )
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", BANKSLOTPURCHASE,
							"tooltipTitle", ArkInventory.Localise["REAGENTBANK"],
							"tooltipText", string.format( "%s\n\n%s %s", REAGENTBANK_PURCHASE_TEXT, COSTS_LABEL, ArkInventory.MoneyText( cost, true ) ),
							"closeWhenClicked", true,
							"func", function( )
								PlaySound( SOUNDKIT.IG_MAINMENU_OPTION )
								StaticPopup_Show( "CONFIRM_BUY_REAGENTBANK_TAB" )
							end
						)
						
					else
						
						local numSlots = GetNumBankSlots( )
						local cost = GetBankSlotCost( numSlots )
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", BANKSLOTPURCHASE,
							"tooltipTitle", BANK_BAG,
							"tooltipText", string.format( "%s\n\n%s %s", BANKSLOTPURCHASE_LABEL, COSTS_LABEL, ArkInventory.MoneyText( cost, true ) ),
							"closeWhenClicked", true,
							"func", function( )
								PlaySound( SOUNDKIT.IG_MAINMENU_OPTION )
								StaticPopup_Show( "CONFIRM_BUY_BANK_SLOT" )
							end
						)
						
					end
					
				elseif not ArkInventory.Global.Mode.Edit and loc_id == ArkInventory.Const.Location.Bank and bag_id == ArkInventory.Global.Location[loc_id].ReagentBag then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", REAGENTBANK_DEPOSIT,
						"tooltipTitle", REAGENTBANK_DEPOSIT,
						"closeWhenClicked", true,
						"func", function( )
							PlaySound( SOUNDKIT.IG_MAINMENU_OPTION )
							DepositReagentBank( )
						end
					)
					
				end
				
				if ArkInventory.Global.Mode.Edit and not isEmpty then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["DEBUG"],
						"hasArrow", true,
						"value", "DEBUG_INFO"
					)
					
				end
				
				if loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank then
					
					if loc_id == ArkInventory.Const.Location.Bag then
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", ArkInventory.Localise["REVERSE_NEW_LOOT_TEXT"],
							"tooltipTitle", ArkInventory.Localise["REVERSE_NEW_LOOT_TEXT"],
							"tooltipText", ArkInventory.Localise["OPTION_TOOLTIP_REVERSE_NEW_LOOT"],
							"checked", ArkInventory.CrossClient.GetInsertItemsLeftToRight( ),
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.CrossClient.SetInsertItemsLeftToRight( not ArkInventory.CrossClient.GetInsertItemsLeftToRight( ) )
								-- its a bit slow to update so close the menu?
							end
						)
						
					end
					
					
					if ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.FILTER.ASSIGN_TO_BAG and ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.FILTER.LABELS then
						
						if ( bag_id > 1 ) and (( loc_id == ArkInventory.Const.Location.Bag and bag_id <= ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.NUM_BAGS_NORMAL + 1 ) or ( loc_id == ArkInventory.Const.Location.Bank and bag_id <= ArkInventory.Const.BLIZZARD.GLOBAL.BANK.NUM_BAGS + 1 )) then
							
							ArkInventory.Lib.Dewdrop:AddLine( )
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.FILTER.ASSIGN_TO_BAG,
								"isTitle", true
							)
							
							for i, flag in ArkInventory.CrossClient.EnumerateBagGearFilters( ) do
								
								local checked = false
								
								if loc_id == ArkInventory.Const.Location.Bag then
									
									checked = ArkInventory.CrossClient.GetBagSlotFlag( blizzard_id, flag )
									
								elseif loc_id == ArkInventory.Const.Location.Bank then
									
									checked = ArkInventory.CrossClient.GetBagSlotFlag( blizzard_id, flag )
									
								end
								
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.FILTER.LABELS[flag],
									"tooltipTitle", ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.FILTER.ASSIGN_TO_BAG,
									"tooltipText", ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.FILTER.LABELS[flag],
									"checked", checked,
									"closeWhenClicked", true,
									"func", function( )
										
										if loc_id == ArkInventory.Const.Location.Bag then
											
											ArkInventory.CrossClient.SetBagSlotFlag( blizzard_id, flag, not checked )
											
										elseif loc_id == ArkInventory.Const.Location.Bank then
											
											if bag_id == 1 then
												ArkInventory.CrossClient.SetBankBagSlotFlag( blizzard_id - ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.NUM_BAGS, flag, not checked )
											else
												ArkInventory.CrossClient.SetBagSlotFlag( blizzard_id, flag, not checked )
											end
											
										end
										
									end
								)
								
							end
							
						end
						
					end
					
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Restack].Texture,
						"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Restack].Name( ),
						"isTitle", true
					)
					
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", BAG_FILTER_IGNORE,
						"tooltipTitle", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Restack].Name( ),
						"tooltipText", BAG_FILTER_IGNORE,
						"checked", codex.player.data.option[loc_id].bag[bag_id].restack.ignore,
						"closeWhenClicked", true,
						"func", function( )
							
							local checked = not codex.player.data.option[loc_id].bag[bag_id].restack.ignore
							codex.player.data.option[loc_id].bag[bag_id].restack.ignore = checked
							
							if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.LEGION ) then
								
								if loc_id == ArkInventory.Const.Location.Bag then
									
									if bag_id == 1 then
										ArkInventory.CrossClient.SetBackpackAutosortDisabled( checked )
									else
										ArkInventory.CrossClient.SetBagSlotFlag( blizzard_id, ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.FILTER.IGNORECLEANUP, checked )
									end
									
								elseif loc_id == ArkInventory.Const.Location.Bank then
									
									if bag_id == 1 then
										ArkInventory.CrossClient.SetBankAutosortDisabled( checked )
									elseif bag_id == ArkInventory.Global.Location[loc_id].ReagentBag then
										-- already set
									else
										ArkInventory.CrossClient.SetBankBagSlotFlag( blizzard_id - ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.NUM_BAGS, ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.FILTER.IGNORECLEANUP, checked )
									end
									
								end
								
							end
							
						end
					)
					
					
					if loc_id == ArkInventory.Const.Location.Bag then
						
						local disabled, text = ArkInventory.CrossClient.OptionNotAvailableExpansion( ArkInventory.ClientCheck( nil, ArkInventory.ENUM.EXPANSION.PANDARIA ), OPTION_TOOLTIP_REVERSE_CLEAN_UP_BAGS )
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", REVERSE_CLEAN_UP_BAGS_TEXT,
							"tooltipTitle", REVERSE_CLEAN_UP_BAGS_TEXT,
							"tooltipText", text,
							"disabled", disabled,
							"checked", ArkInventory.db.option.restack.reverse,
							"closeWhenClicked", true,
							"disabled", not ArkInventory.db.option.restack.blizzard,
							"func", function( )
								ArkInventory.db.option.restack.reverse = not ArkInventory.db.option.restack.reverse
								ArkInventory.CrossClient.SetSortBagsRightToLeft( ArkInventory.db.option.restack.reverse )
							end
						)
						
					end
					
				end
				
			end
			
			if level == 2 and value then
				
				if value == "DEBUG_INFO" then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["DEBUG"],
						"isTitle", true
					)
					
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["NAME"], LIGHTYELLOW_FONT_COLOR_CODE, info.name ) )
					
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["LOCATION"], LIGHTYELLOW_FONT_COLOR_CODE, loc_id, ArkInventory.Global.Location[loc_id].Name ) )
					
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["CATEGORY_CLASS"], LIGHTYELLOW_FONT_COLOR_CODE, info.class ) )
					
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s (%s)", QUALITY, LIGHTYELLOW_FONT_COLOR_CODE, info.q, _G[string.format( "ITEM_QUALITY%s_DESC", info.q )] ) )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_AI_ID_SHORT"], LIGHTYELLOW_FONT_COLOR_CODE, info.id ),
						"hasArrow", true,
						"hasEditBox", true,
						"editBoxText", info.id
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, info.itemtypeid, info.itemtype ),
						"hasArrow", true,
						"hasEditBox", true,
						"editBoxText", info.itemtypeid
					)
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["MENU_ITEM_DEBUG_SUBTYPE"], LIGHTYELLOW_FONT_COLOR_CODE, info.itemsubtypeid, info.itemsubtype ),
						"hasArrow", true,
						"hasEditBox", true,
						"editBoxText", info.itemsubtypeid
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["TEXTURE"], LIGHTYELLOW_FONT_COLOR_CODE, info.texture ) )
					
					local ifam = GetItemFamily( i.h ) or 0
					ArkInventory.Lib.Dewdrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_FAMILY"], LIGHTYELLOW_FONT_COLOR_CODE, ifam ) )
					
				end
				
			end
			
		end
		
	)
	
end

function ArkInventory.MenuChangerVaultTabOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local codex = ArkInventory.GetLocationCodex( loc_id )
	local bag = codex.player.data.location[loc_id].bag[bag_id]
	local button = _G[string.format( "%s%s%sWindowBag%s", ArkInventory.Const.Frame.Main.Name, loc_id, ArkInventory.Const.Frame.Changer.Name, bag_id )]
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			if level == 1 then
			
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", ArkInventory.Localise["VAULT"], string.format( GUILDBANK_TAB_NUMBER, bag_id ) ),
					"icon", bag.texture,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", bag.name,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				if not ArkInventory.Global.Location[loc_id].isOffline then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", "request tab data",
						"closeWhenClicked", true,
						"func", function( )
							QueryGuildBankTab( GetCurrentGuildBankTab( ) or 1 )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "mode: %s", ArkInventory.Localise["VAULT"] ),
					"closeWhenClicked", true,
					"disabled", GuildBankFrame.mode == "bank",
					"func", function( )
						--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "bank" )
						GuildBankFrameTab_OnClick( bag_id, 1 )
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				if not ArkInventory.Global.Location[loc_id].isOffline then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "mode: %s", GUILD_BANK_LOG ),
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "log",
						"func", function( )
							ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
							--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "log" )
							GuildBankFrameTab_OnClick( bag_id, 2 )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "mode: %s", GUILD_BANK_MONEY_LOG ),
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "moneylog",
						"func", function( )
							ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
							--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "moneylog" )
							GuildBankFrameTab_OnClick( bag_id, 3 )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "mode: %s", GUILD_BANK_TAB_INFO ),
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "tabinfo",
						"func", function( )
							ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
							--GuildBankFrameTab_OnClick( bag_id, 4 )
							--ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "tabinfo" )
							GuildBankFrameTab_OnClick( bag_id, 4 )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					if IsGuildLeader( ) then
					
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", "change name or icon",
							"closeWhenClicked", true,
							"func", function( )
								SetCurrentGuildBankTab( bag_id )
								GuildBankPopupFrame:Show( )
								GuildBankPopupFrame_Update( bag_id )
							end
						)
						
					end
					
				end
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
		
		end
		
	)
	
end

function ArkInventory.MenuChangerVaultActionOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local loc_id = ArkInventory.Const.Location.Vault
	local codex = ArkInventory.GetLocationCodex( loc_id )
	local bag_id = ArkInventory.Global.Location[loc_id].view_tab
	local mode = ArkInventory.Global.Location[loc_id].view_mode
	local bag = codex.player.data.location[loc_id].bag[bag_id]
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			local ok = false
			local amount = 0
			local tt = ""
			
			if level == 1 then
			
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["VAULT"],
					"icon", ArkInventory.Global.Location[loc_id].Texture,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", DEPOSIT,
					"closeWhenClicked", true,
					"func", function( )
						PlaySound( SOUNDKIT.IG_MAINMENU_OPTION )
						StaticPopup_Hide( "GUILDBANK_WITHDRAW" )
						if StaticPopup_Visible( "GUILDBANK_DEPOSIT") then
							StaticPopup_Hide( "GUILDBANK_DEPOSIT" )
						else
							StaticPopup_Show( "GUILDBANK_DEPOSIT" )
						end
					end
				)
				
				
				ok = false
				amount = 0
				tt = ""
				
				amount = GetGuildBankWithdrawMoney( )
				if amount >= 0 then
					
					if ( ( not CanGuildBankRepair( ) and not CanWithdrawGuildBankMoney( ) ) or ( CanGuildBankRepair( ) and not CanWithdrawGuildBankMoney( ) ) ) then
						amount = 0
					else
						amount = min( amount, GetGuildBankMoney( ) )
					end
					
					if amount > 0 then
						ok = true
					end
					
				else
					
					amount = 0
					
				end
				
				if amount > 0 then
					tt = string.format( "%s %s", GUILDBANK_AVAILABLE_MONEY, ArkInventory.MoneyText( amount, true ) )
				end
				
				if ok and ( not CanWithdrawGuildBankMoney( ) ) then
					tt = string.format( "%s%s (%s)", tt, REPAIR_ITEMS )
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", WITHDRAW,
					"tooltipTitle", WITHDRAW,
					"tooltipText", tt,
					"closeWhenClicked", true,
					"disabled", not ok,
					"func", function( )
						PlaySound( SOUNDKIT.IG_MAINMENU_OPTION )
						StaticPopup_Hide( "GUILDBANK_DEPOSIT" )
						if StaticPopup_Visible( "GUILDBANK_WITHDRAW" ) then
							StaticPopup_Hide( "GUILDBANK_WITHDRAW" )
						else
							StaticPopup_Show( "GUILDBANK_WITHDRAW" )
						end
					end
				)
				
				
				ok = nil
				amount = 0
				tt = ""
				
				if IsGuildLeader( ) then
					
					local numSlots = GetNumGuildBankTabs( )
					amount = GetGuildBankTabCost( )
					
					if not amount or amount == 0 or numSlots >= MAX_BUY_GUILDBANK_TABS then
						
						amount = 0
						ok = false
						
					else
						
						if GetMoney( ) >= amount then
							ok = true
						else
							ok = false
						end
						
					end
					
					if amount > 0 then
						tt = string.format( "%s %s", COSTS_LABEL, ArkInventory.MoneyText( amount, true ) )
					end
					
				end
				
				if ok ~= nil then
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", BANKSLOTPURCHASE,
						"tooltipTitle", BANKSLOTPURCHASE,
						"tooltipText", tt,
						"closeWhenClicked", true,
						"disabled", not ok,
						"func", function( )
							PlaySound( SOUNDKIT.IG_MAINMENU_OPTION )
							StaticPopup_Show( "CONFIRM_BUY_GUILDBANK_TAB" )
						end
					)
				end
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", string.format( GUILDBANK_TAB_NUMBER, bag_id ), bag.name or "" ),
					"icon", bag.texture,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", DISPLAY, ArkInventory.Localise["VAULT"] ),
					"closeWhenClicked", true,
					"disabled", mode == "bank",
					"func", function( )
						--ArkInventory.Output( "bank" )
						ArkInventory.Global.Location[loc_id].view_mode = "bank"
						ArkInventory.VaultTabClick( bag_id, ArkInventory.Global.Location[loc_id].view_mode )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", DISPLAY, GUILD_BANK_LOG ),
					"closeWhenClicked", true,
					"disabled", mode == "log",
					"func", function( )
						--ArkInventory.Output( "log" )
						ArkInventory.Global.Location[loc_id].view_mode = "log"
						ArkInventory.VaultTabClick( bag_id, ArkInventory.Global.Location[loc_id].view_mode )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", DISPLAY, GUILD_BANK_MONEY_LOG ),
					"closeWhenClicked", true,
					"disabled", mode == "moneylog",
					"func", function( )
						--ArkInventory.Output( "moneylog" )
						ArkInventory.Global.Location[loc_id].view_mode = "moneylog"
						ArkInventory.VaultTabClick( bag_id, ArkInventory.Global.Location[loc_id].view_mode )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", DISPLAY, GUILD_BANK_TAB_INFO ),
					"closeWhenClicked", true,
					"disabled", GuildBankFrame.mode == "tabinfo",
					"func", function( )
						--ArkInventory.Output( "info" )
						ArkInventory.Global.Location[loc_id].view_mode = "tabinfo"
						ArkInventory.VaultTabClick( bag_id, ArkInventory.Global.Location[loc_id].view_mode )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				if IsGuildLeader( ) then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", "change name or icon",
						"closeWhenClicked", true,
						"func", function( )
							SetCurrentGuildBankTab( bag_id )
							GuildBankPopupFrame:Show( )
							GuildBankPopupFrame_Update( bag_id )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", "rescan data",
					"closeWhenClicked", true,
					"func", function( )
						QueryGuildBankTab( GetCurrentGuildBankTab( ) or 1 )
					end
				)
					
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
		
		end
		
	)
	
end

function ArkInventory.MenuSwitchLocation( offset, level, value, frame )
	
	if ( level == 1 + offset ) then
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.SwitchLocation].Texture,
			"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.SwitchLocation].Name,
			"isTitle", true
		)
		
		local ploc_id = frame and frame:GetParent( ):GetParent( ).ARK_Data.loc_id
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		if ArkInventory.db.option.ui.sortalpha then
			
			local t = ArkInventory.Global.Location
			for loc_id, loc_data in ArkInventory.spairs( t, function( a, b ) return ( t[a].Name or "" ) < ( t[b].Name or "" ) end ) do
				if loc_data.canView and ArkInventory.ClientCheck( loc_data.ClientCheck ) then
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", loc_data.Name,
						"tooltipTitle", loc_data.Name,
						"tooltipText", string.format( ArkInventory.Localise["MENU_LOCATION_TOGGLE_DESC"], loc_data.Name ),
						"icon", loc_data.Texture,
						"hasArrow", loc_data.canOverride,
						"value", string.format( "LOCATION_OVERRIDE_%s", loc_id ),
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Main_Toggle( loc_id )
						end
					)
				end
			end
			
		else
			
			for loc_id, loc_data in ArkInventory.spairs( ArkInventory.Global.Location ) do
				if loc_data.canView and ArkInventory.ClientCheck( loc_data.ClientCheck ) then
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", loc_data.Name,
						"tooltipTitle", loc_data.Name,
						"tooltipText", string.format( ArkInventory.Localise["MENU_LOCATION_TOGGLE_DESC"], loc_data.Name ),
						"icon", loc_data.Texture,
						"disabled", loc_id == ploc_id,
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Main_Toggle( loc_id )
						end
					)
				end
			end
			
		end
	end
	
	if ( level == 2 + offset ) and value then
		
		local loc_id = string.match( value, "^LOCATION_OVERRIDE_(.+)$" )
		if loc_id then
			
			loc_id = tonumber( loc_id )
			local loc_data = ArkInventory.Global.Location[loc_id]
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["OVERRIDE"],
				"isTitle", true
			)
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["ENABLE"],
				"tooltipTitle", ArkInventory.Localise["ENABLE"],
				"tooltipText", string.format( ArkInventory.Localise["CONFIG_CONTROL_WITH_ARKINV"], ArkInventory.Const.Program.Name, ArkInventory.Global.Location[loc_id].Name ),
				"closeWhenClicked", true,
				"func", function( )
					ArkInventory.LocationOverrideSet( loc_id, true )
				end
			)
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["DISABLE"],
				"tooltipTitle", ArkInventory.Localise["DISABLE"],
				"tooltipText", string.format( ArkInventory.Localise["CONFIG_CONTROL_WITH_BLIZZARD"], ArkInventory.Const.Program.Name, ArkInventory.Global.Location[loc_id].Name ),
				"closeWhenClicked", true,
				"func", function( )
					ArkInventory.LocationOverrideSet( loc_id, false )
				end
			)
			
		end
		
	end
	
end

function ArkInventory.MenuSwitchLocationOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			ArkInventory.MenuSwitchLocation( 0, level, value, frame )
			if level == 1 then
				ArkInventory.Lib.Dewdrop:AddLine( )
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
			end
		end
	)
	
end

function ArkInventory.MenuSwitchCharacter( offset, level, value, frame )
	
	local loc_id = frame:GetParent( ):GetParent( ).ARK_Data.loc_id
	local codex = ArkInventory.GetLocationCodex( loc_id )
	
	if ( level == 1 + offset ) then
		
		local count = 0
		local accounts = { }
		local realms = { }
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.SwitchCharacter].Texture,
			"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.SwitchCharacter].Name,
			"isTitle", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		if not ArkInventory.Global.Location[loc_id].isAccount then
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", codex.player.data.info.realm,
				"notClickable", true
			)
		end
		
		local show
		
		for n, tp in ArkInventory.spairs( ArkInventory.db.player.data, function( a, b ) return ( a < b ) end ) do
			
			show = true
			
			if tp.info.account_id ~= codex.player.data.info.account_id and not ArkInventory.Global.Location[loc_id].isAccount then
				show = false
				local a = ArkInventory.db.account.data[tp.info.account_id]
				if a and a.used == "Y" then
					accounts[tp.info.account_id] = true
				end
			elseif tp.info.class ~= ArkInventory.Const.Class.Guild and loc_id == ArkInventory.Const.Location.Vault then
				show = false
			elseif tp.info.class ~= ArkInventory.Const.Class.Account and ArkInventory.Global.Location[loc_id].isAccount then
				show = false
			elseif tp.location[loc_id].slot_count == 0 then
				show = false
			elseif tp.info.realm ~= codex.player.data.info.realm then
				show = false
				if not ArkInventory.Global.Location[loc_id].isAccount then
					realms[tp.info.realm] = true
				end
			end
			
			if show then
				
				count = count + 1
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.DisplayName4( tp.info, codex.player.data.info.faction ),
					--"tooltipTitle", "",
					--"tooltipText", "",
					"isRadio", true,
					"checked", codex.player.data.info.player_id == tp.info.player_id,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Main_Show( loc_id, tp.info.player_id )
					end,
					"hasArrow", true,
					"value", string.format( "SWITCH_CHARACTER_ERASE_%s", tp.info.player_id )
				)
				
			end
			
		end
		
		if count == 0 then
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", "no data availale",
				"disabled", true
			)
			
		end
		
		if not ArkInventory.Table.IsEmpty( realms ) then
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["OTHER"],
				"hasArrow", true,
				"value", "OTHER_REALMS"
			)
			
		end
		
		if not ArkInventory.Table.IsEmpty( accounts ) then
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["ACCOUNT"],
				--"tooltipTitle", "",
				--"tooltipText", "",
				"hasArrow", true,
				"value", string.format( "SWITCH_ACCOUNT" )
			)
			
		end
		
	end
	
	
	if ( level > 1 + offset ) and value then
		
		local account = string.match( value, "^SWITCH_ACCOUNT$" )
		if account then
			
			local accounts = { }
			local show
			
			for n, tp in pairs( ArkInventory.db.player.data ) do
				
				if tp.info.account_id ~= codex.player.data.info.account_id and not ArkInventory.Global.Location[loc_id].isAccount then
					local a = ArkInventory.db.account.data[tp.info.account_id]
					if a and a.used == "Y" then
						accounts[tp.info.account_id] = true
					end
					accounts[tp.info.account_id] = true
				end
				
			end
			
			if not ArkInventory.Table.IsEmpty( accounts ) then
				
				for k, v in ArkInventory.spairs( ArkInventory.db.account.data, function( a, b ) return ( ArkInventory.db.account.data[a].name < ArkInventory.db.account.data[b].name ) end ) do
					
					if accounts[k] then
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", v.name,
							--"tooltipTitle", "",
							--"tooltipText", "",
							"closeWhenClicked", true,
							"func", function( )
								for n, tp in ArkInventory.spairs( ArkInventory.db.player.data, function( a, b ) return ( a < b ) end ) do
									-- grab first player from that account
									if tp.info.account_id == k then
										ArkInventory.Frame_Main_Show( loc_id, tp.info.player_id )
									end
								end
							end
						)
					end
					
				end
				
			end
			
		end
		
		
		if value == "OTHER_REALMS" then
			
			local realms = { }
			
			for n, tp in ArkInventory.spairs( ArkInventory.db.player.data, function( a, b ) return ( a < b ) end ) do
				
				if tp.info.account_id ~= codex.player.data.info.account_id and not ArkInventory.Global.Location[loc_id].isAccount then
					
				elseif tp.info.class ~= ArkInventory.Const.Class.Guild and loc_id == ArkInventory.Const.Location.Vault then
					
				elseif tp.info.class ~= ArkInventory.Const.Class.Account and ArkInventory.Global.Location[loc_id].isAccount then
					
				elseif tp.location[loc_id].slot_count == 0 then
					
				elseif tp.info.realm ~= codex.player.data.info.realm then
					if not ArkInventory.Global.Location[loc_id].isAccount then
						realms[tp.info.realm] = true
					end
				end
				
			end
			
			for k in ArkInventory.spairs( realms, function( a, b ) return ( a < b ) end ) do
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", k,
					"hasArrow", true,
					"value", string.format( "SWITCH_REALM_%s", k )
				)
				
			end
			
		end
		
		local realm = string.match( value, "^SWITCH_REALM_(.+)" )
		if realm then
			
			local count = 0
			
			for n, tp in ArkInventory.spairs( ArkInventory.db.player.data, function( a, b ) return a < b end ) do
				
				local show = true
				
				if ( loc_id == ArkInventory.Const.Location.Vault ) and ( tp.info.class ~= ArkInventory.Const.Class.Guild ) then
					show = false
				elseif ( loc_id == ArkInventory.Const.Location.Pet ) and ( tp.info.class ~= ArkInventory.Const.Class.Account ) then
					show = false
				elseif ( loc_id == ArkInventory.Const.Location.Mount ) and ( tp.info.class ~= ArkInventory.Const.Class.Account ) then
					show = false
				elseif tp.location[loc_id].slot_count == 0 or tp.info.realm ~= realm then
					show = false
				end
				
				if show then
					
					count = count + 1
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.DisplayName4( tp.info, codex.player.data.info.faction ),
						--"tooltipTitle", "",
						--"tooltipText", "",
						"hasArrow", true,
						"isRadio", true,
						"checked", codex.player.data.info.player_id == tp.info.player_id,
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Main_Show( loc_id, tp.info.player_id )
						end,
						"value", string.format( "SWITCH_CHARACTER_ERASE_%s", tp.info.player_id )
					)
					
				end
				
			end
			
			
			if count == 0 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", "no data availale",
					"disabled", true
				)
				
			end
			
		end
		
		local player_id = string.match( value, "^SWITCH_CHARACTER_ERASE_(.+)" )
		if player_id then
			
			local tp = ArkInventory.GetPlayerStorage( player_id )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.DisplayName4( tp.data.info, codex.player.data.info.faction ),
				"isTitle", true
			)
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			if loc_id ~= ArkInventory.Const.Location.Vault then
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Global.Location[loc_id].Name ),
					"tooltipTitle", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Global.Location[loc_id].Name ),
					"tooltipText", string.format( "%s%s", RED_FONT_COLOR_CODE, string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE_DESC"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.DisplayName1( tp.data.info ) ) ),
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Main_Hide( loc_id )
						ArkInventory.EraseSavedData( tp.data.info.player_id, loc_id )
					end
				)
			end
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Localise["ALL"] ),
				"tooltipTitle", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Localise["ALL"] ),
				"tooltipText", string.format( "%s%s", RED_FONT_COLOR_CODE, string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE_DESC"], ArkInventory.Localise["ALL"], ArkInventory.DisplayName1( tp.data.info ) ) ),
				"closeWhenClicked", true,
				"func", function( )
					ArkInventory.Frame_Main_Hide( )
					ArkInventory.EraseSavedData( tp.data.info.player_id )
				end
			)
		
		end
		
	end

end

function ArkInventory.MenuSwitchCharacterOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			ArkInventory.MenuSwitchCharacter( 0, level, value, frame )
			if level == 1 then
				ArkInventory.Lib.Dewdrop:AddLine( )
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
			end
		end
	)
end

function ArkInventory.MenuLDBBagsOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local codex = ArkInventory.GetPlayerCodex( )
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			if level == 1 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Const.Program.Name,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Global.Version,
					"notClickable", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CONFIG"],
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Config_Show( )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["MENU_ACTION"],
					"hasArrow", true,
					"value", "ACTIONS"
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["LOCATIONS"],
					"hasArrow", true,
					"value", "LOCATION"
				)
					
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["FONT"],
					"hasArrow", true,
					"value", "FONT"
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["LDB"],
					"hasArrow", true,
					"value", "LDB"
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
			
			if level == 2 and value then
			
				if value == "LOCATION" then
					ArkInventory.MenuSwitchLocation( 1, level, value )
				end
				
				if value == "FONT" then
				
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["FONT"],
						"isTitle", true
					)
					
					for _, face in pairs( ArkInventory.Lib.SharedMedia:List( "font" ) ) do
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", face,
							"tooltipTitle", ArkInventory.Localise["FONT"],
							"tooltipText", string.format( ArkInventory.Localise["CONFIG_GENERAL_FONT_DESC"], face ),
							"checked", face == ArkInventory.db.option.font.face,
							"func", function( )
								ArkInventory.db.option.font.face = face
								ArkInventory.MediaAllFontSet( face )
							end
						)
					end
					
				end
				
				if value == "ACTIONS" then
				
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["MENU_ACTION"],
						"isTitle", true
					)
					
					for k, v in pairs( ArkInventory.Const.ButtonData ) do
						if v.LDB then
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", v.Name,
								"closeWhenClicked", true,
								"icon", v.Texture,
								"func", function( )
									v.Scripts.OnClick( nil, nil )
								end
							)
						end
					end
					
				end
				
				if value == "LDB" then
				
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["LDB"],
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["LDB_BAGS_COLOUR_USE"],
						"tooltipTitle", ArkInventory.Localise["LDB_BAGS_COLOUR_USE"],
						"tooltipText", ArkInventory.Localise["LDB_BAGS_COLOUR_USE_DESC"],
						"checked", codex.player.data.ldb.bags.colour,
						"func", function( )
							codex.player.data.ldb.bags.colour = not codex.player.data.ldb.bags.colour
							ArkInventory.LDB.Bags:Update( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["LDB_BAGS_STYLE"],
						"tooltipTitle", ArkInventory.Localise["LDB_BAGS_STYLE"],
						"tooltipText", ArkInventory.Localise["LDB_BAGS_STYLE_DESC"],
						"checked", codex.player.data.ldb.bags.full,
						"func", function( )
							codex.player.data.ldb.bags.full = not codex.player.data.ldb.bags.full
							ArkInventory.LDB.Bags:Update( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["DISPLAY"],
						"hasArrow", true,
						"value", "LDB_BAG_TYPES"
					)
					
				end
				
			end
			
			if level == 3 and value then
				
				if value == "LDB_BAG_TYPES" then
				
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["DISPLAY"],
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE"],
						"tooltipTitle", ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE"],
						"tooltipText", ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE_DESC"],
						"checked", codex.player.data.ldb.bags.includetype,
						"func", function( )
							codex.player.data.ldb.bags.includetype = not codex.player.data.ldb.bags.includetype
							ArkInventory.LDB.Bags:Update( )
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					local data = ArkInventory.Const.Slot.Data
					
					for k, v in ArkInventory.spairs( ArkInventory.Const.Slot.Data, function(a,b) return ( data[a] and data[a].name or "" ) < ( data[b] and data[b].name or "" ) end ) do
						
						if not v.hide then
							
							if ArkInventory.ClientCheck( v.ClientCheck ) then
								
								ArkInventory.Lib.Dewdrop:AddLine(
									"text", v.name,
									"tooltipTitle", v.name,
									"tooltipText", ArkInventory.Localise["LDB_BAGS_INCLUDE_COUNT_DESC"],
									"checked", codex.player.data.ldb.bags.include[k],
									"func", function( )
										codex.player.data.ldb.bags.include[k] = not codex.player.data.ldb.bags.include[k]
										ArkInventory.LDB.Bags:Update( )
									end
								)
								
								
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	)
	
end

function ArkInventory.MenuLDBTrackingCurrencyOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			ArkInventory.MenuLDBTrackingCurrencyListHeaders( 0, level, value )
		end
	)
	
end

function ArkInventory.MenuLDBTrackingCurrencyListHeaders( offset, level, value )
	
	if not offset or type( offset ) ~= "number" then return end
	local offset = math.abs( offset )
	
	local loc_id = ArkInventory.Const.Location.Currency
	local codex = ArkInventory.GetPlayerCodex( )
	
	if ( level == 1 + offset ) then
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.LDB.Tracking_Currency.name,
			"isTitle", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Global.Version,
			"notClickable", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		if not ArkInventory.isLocationMonitored( loc_id ) then
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
			self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_MONITORED"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
				"notClickable", true
			)
			
			return
			
		end
		
		if ArkInventory.Collection.Currency.GetCount( ) == 0 then
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["LDB_CURRENCY_NONE"],
				"notClickable", true
			)
			
			return
			
		end
		
		
		local count = 0
		
		for _, entry in ArkInventory.Collection.Currency.ListIterate( ) do
			
			if entry.parentIndex == nil and entry.name then
				
				--ArkInventory.OutputDebug( "HEADER: ", entry )
				
				local expand = codex.player.data.ldb.tracking.currency.expand[entry.id]
				local value = string.format( "HEADER_%s", entry.index )
				
				count = count + 1
				
				if count > 1 and not entry.active then
					ArkInventory.Lib.Dewdrop:AddLine( )
				end
				
				local text = string.format( "%s%s", YELLOW_FONT_COLOR_CODE, entry.name )
				local desc = ""
				
				if expand then
					desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["COLLAPSE"] )
				else
					desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["EXPAND"] )
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"hasArrow", not expand,
					"value", value,
					"func", function( )
						codex.player.data.ldb.tracking.currency.expand[entry.id] = not codex.player.data.ldb.tracking.currency.expand[entry.id]
					end
				)
				
				if expand then
					ArkInventory.MenuLDBTrackingCurrencyListEntries( value, false, codex )
				end
				
			end
			
		end
		
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["CLOSE_MENU"],
			"closeWhenClicked", true
		)
		
	end
	
	
	if ( level > 1 + offset ) and ( level < 5 + offset ) and value then
		
		ArkInventory.MenuLDBTrackingCurrencyListEntries( value, true, codex )
		
		ArkInventory.MenuLDBTrackingCurrencyListOptions( value, codex )
		
	end
	
end

function ArkInventory.MenuLDBTrackingCurrencyListEntries( value, showTitle, codex )
	
	local index = string.match( value, "^HEADER_(.+)$" )
	if index then
		
		local index = tonumber( index )
		local parent = ArkInventory.Collection.Currency.GetByIndex( index )
		
		if showTitle then
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", parent.name,
				"isTitle", true
			)
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
		end
		
		--ArkInventory.OutputDebug( "" )
		--ArkInventory.OutputDebug( "HEADER: ", parent.index, " = ", parent.name )
		
		for _, entry in ArkInventory.Collection.Currency.ListIterate( ) do
			
			--ArkInventory.OutputDebug( "ENTRY: ", entry.index, " / ", entry.parentIndex, " / ", entry.name, " / ", entry.isHeader )
			
			local currencyHeader = entry.isHeader and entry.hasCurrency
			
			if entry.parentIndex == parent.index then
				
				local data = entry.data
				
				if entry.isHeader and entry.index ~= parent.index then
					
					currencyHeader = false
					
					local expand = codex.player.data.ldb.tracking.currency.expand[entry.id]
					local value = string.format( "HEADER_%s", entry.index )
					local text1 = string.format( "%s%s", ORANGE_FONT_COLOR_CODE, entry.name )
					local desc = ""
					
					if expand then
						desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["COLLAPSE"] )
					else
						desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["EXPAND"] )
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", text1,
						"tooltipTitle", text1,
						"tooltipText", desc,
						"hasArrow", not expand,
						"value", value,
						"func", function( )
							codex.player.data.ldb.tracking.currency.expand[entry.id] = not codex.player.data.ldb.tracking.currency.expand[entry.id]
						end
					)
					
					if expand then
						ArkInventory.MenuLDBTrackingCurrencyListEntries( value, false, codex )
					end
					
				end
				
				if currencyHeader or not entry.isHeader then
					
					local checked = codex.player.data.ldb.tracking.currency.watched[data.id]
					local text1 = entry.name
					
					if checked then
						text1 = string.format( "%s%s", GREEN_FONT_COLOR_CODE, text1 )
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"icon", data.icon or "",
						"text", text1,
						"tooltipTitle", string.format( ArkInventory.Const.Tooltip.customHyperlinkFormat, data.link ),
						"hasArrow", true,
						"func", function( )
							if IsAltKeyDown( ) then
								-- add to tooltip
								codex.player.data.ldb.tracking.currency.tracked[data.id] = not codex.player.data.ldb.tracking.currency.tracked[data.id]
							else
								-- add to text
								codex.player.data.ldb.tracking.currency.watched[data.id] = not codex.player.data.ldb.tracking.currency.watched[data.id]
								ArkInventory:SendMessage( "EVENT_ARKINV_LDB_CURRENCY_UPDATE_BUCKET" )
							end
						end,
						"value", string.format( "OPTIONS_%s", entry.index )
					)
					
				end
				
			end
			
		end
		
		
		if false and not parent.active then
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", "LDB_CURRENCY_REACTIVATE_ALL",
				"tooltipTitle", "LDB_CURRENCY_REACTIVATE_ALL",
				"tooltipText", "LDB_CURRENCY_REACTIVATE_ALL_TEXT",
				"closeWhenClicked", true,
				"func", function( )
					ArkInventory.Collection.Currency.ReactivateAll( )
				end
			)
			
		end
		
	end
	
end

function ArkInventory.MenuLDBTrackingCurrencyListOptions( value, codex )
	
	local index = string.match( value, "^OPTIONS_(.+)$" )
	if index then
		
		-- options
		
		local index = tonumber( index )
		
		local entry = ArkInventory.Collection.Currency.GetByIndex( index )
		local data = entry.data
		
		--ArkInventory.Output( entry )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", entry.name,
			"isTitle", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		-- inactivate / active
		
		local text = ArkInventory.Localise["UNUSED"]
		local desc = ArkInventory.Localise["TOKEN_MOVE_TO_UNUSED"]
		local checked = not entry.active
		
		if checked then
			text = string.format( "%s%s", RED_FONT_COLOR_CODE, text )
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["RESTORE"] )
		else
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["MOVE"] )
		end
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", checked and ArkInventory.Const.Texture.Checked or "",
			"text", text,
			"tooltipTitle", text,
			"tooltipText", desc,
			"closeWhenClicked", true,
			"func", function( )
				ArkInventory.Collection.Currency.ListSetActive( entry.index, not entry.active )
			end
		)
		
		
		
		-- ldb options
		ArkInventory.Lib.Dewdrop:AddLine( )
		ArkInventory.Lib.Dewdrop:AddLine(
			--"text", string.format( "%sLDB", YELLOW_FONT_COLOR_CODE ),
			"text", ArkInventory.Localise["LDB"],
			"isTitle", true
		)
		
		-- add to object tooltip
		local text = ArkInventory.Localise["LDB_OBJECT_TOOLTIP_INCLUDE"]
		local desc = string.format( ArkInventory.Localise["LDB_OBJECT_TOOLTIP_INCLUDE_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Currency].Name )
		local checked = codex.player.data.ldb.tracking.currency.tracked[data.id]
		
		if checked then
			--text = string.format( "%s%s", GREEN_FONT_COLOR_CODE, text )
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["REMOVE"] )
		else
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["ADD"] )
		end
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", checked and ArkInventory.Const.Texture.Checked or "",
			"text", text,
			"tooltipTitle", text,
			"tooltipText", desc,
			"func", function( )
				codex.player.data.ldb.tracking.currency.tracked[data.id] = not codex.player.data.ldb.tracking.currency.tracked[data.id]
			end
		)
		
		-- set as object text
		local text = ArkInventory.Localise["LDB_OBJECT_TEXT_INCLUDE"]
		local desc = string.format( ArkInventory.Localise["LDB_OBJECT_TEXT_INCLUDE_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Currency].Name )
		local checked = codex.player.data.ldb.tracking.currency.watched[data.id]
		
		if codex.player.data.ldb.tracking.currency.watched == data.id then
			--text = string.format( "%s%s", GREEN_FONT_COLOR_CODE, text )
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["REMOVE"] )
		else
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["ADD"] )
		end
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", checked and ArkInventory.Const.Texture.Checked or "",
			"text", text,
			"tooltipTitle", text,
			"tooltipText", desc,
			"func", function( )
				codex.player.data.ldb.tracking.currency.watched[data.id] = not codex.player.data.ldb.tracking.currency.watched[data.id]
				ArkInventory:SendMessage( "EVENT_ARKINV_LDB_CURRENCY_UPDATE_BUCKET" )
			end
		)
		
	end
	
	
end

function ArkInventory.MenuLDBTrackingReputationOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			ArkInventory.MenuLDBTrackingReputationListHeaders( 0, level, value )
		end
	)
	
end

function ArkInventory.MenuLDBTrackingReputationListHeaders( offset, level, value )
	
	if not offset or type( offset ) ~= "number" then return end
	local offset = math.abs( offset )
	
	local loc_id = ArkInventory.Const.Location.Reputation
	local codex = ArkInventory.GetPlayerCodex( )
	
	if ( level == 1 + offset ) then
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.LDB.Tracking_Reputation.name,
			"isTitle", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Global.Version,
			"notClickable", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		if not ArkInventory.isLocationMonitored( loc_id ) then
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_MONITORED"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
				"notClickable", true
			)
			
			return
			
		end
		
		if ArkInventory.Collection.Reputation.GetCount( ) == 0 then
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["LDB_REPUTATION_NONE"],
				"notClickable", true
			)
			
			return
			
		end
		
		
		local count = 0
		
		for _, entry in ArkInventory.Collection.Reputation.ListIterate( ) do
			
			if entry.parentIndex == nil and entry.name then
				
				--ArkInventory.OutputDebug( "HEADER: ", entry )
				
				local expand = codex.player.data.ldb.tracking.reputation.expand[entry.id]
				local value = string.format( "HEADER_%s", entry.index )
				
				count = count + 1
				
				if count > 1 and not entry.active then
					ArkInventory.Lib.Dewdrop:AddLine( )
				end
				
				local text = string.format( "%s%s", YELLOW_FONT_COLOR_CODE, entry.name )
				local desc = ""
				
				if expand then
					desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["COLLAPSE"] )
				else
					desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["EXPAND"] )
				end
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", text,
					"tooltipTitle", text,
					"tooltipText", desc,
					"hasArrow", not expand,
					"value", value,
					"func", function( )
						codex.player.data.ldb.tracking.reputation.expand[entry.id] = not codex.player.data.ldb.tracking.reputation.expand[entry.id]
					end
				)
				
				if expand then
					ArkInventory.MenuLDBTrackingReputationListEntries( value, false, codex )
				end
				
			end
			
		end
		
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["CLOSE_MENU"],
			"closeWhenClicked", true
		)
		
	end
	
	
	if ( level > 1 + offset ) and ( level < 5 + offset ) and value then
		
		ArkInventory.MenuLDBTrackingReputationListEntries( value, true, codex )
		
		ArkInventory.MenuLDBTrackingReputationListOptions( value, codex )
		
	end
	
end

function ArkInventory.MenuLDBTrackingReputationListEntries( value, showTitle, codex )
	
	local index = string.match( value, "^HEADER_(.+)$" )
	if index then
		
		local index = tonumber( index )
		local parent = ArkInventory.Collection.Reputation.GetByIndex( index )
		
		if showTitle then
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", parent.name,
				"isTitle", true
			)
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
		end
		
		--ArkInventory.OutputDebug( "" )
		--ArkInventory.OutputDebug( "HEADER: ", parent.index, " = ", parent.name )
		
		for _, entry in ArkInventory.Collection.Reputation.ListIterate( ) do
			
			--ArkInventory.OutputDebug( "ENTRY: ", entry.index, " / ", entry.parentIndex, " / ", entry.name, " / ", entry.isHeader )
			
			local repHeader = entry.isHeader and entry.hasRep
			
			if entry.parentIndex == parent.index or entry.index == parent.index then
				
				local data = entry.data
				
				if entry.isHeader and entry.index ~= parent.index then
					
					repHeader = false
					
					local expand = codex.player.data.ldb.tracking.reputation.expand[entry.id]
					local value = string.format( "HEADER_%s", entry.index )
					local text1 = string.format( "%s%s", ORANGE_FONT_COLOR_CODE, entry.name )
					local desc = ""
					
					if expand then
						desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["COLLAPSE"] )
					else
						desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["EXPAND"] )
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", text1,
						"tooltipTitle", text1,
						"tooltipText", desc,
						"hasArrow", not expand,
						"value", value,
						"func", function( )
							codex.player.data.ldb.tracking.reputation.expand[entry.id] = not codex.player.data.ldb.tracking.reputation.expand[entry.id]
						end
					)
					
					if expand then
						ArkInventory.MenuLDBTrackingReputationListEntries( value, false, codex )
					end
					
				end
				
				if repHeader or not entry.isHeader then
					
					local checked = codex.player.data.ldb.tracking.reputation.tracked[data.id]
					local text1 = entry.name
					
					if checked then
						text1 = string.format( "%s%s", GREEN_FONT_COLOR_CODE, text1 )
					end
					
					local text2 = ArkInventory.Collection.Reputation.LevelText( data.id, "*st**pv*" )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"icon", data.icon or "",
						"text", string.format( "%s |cff7f7f7f(%s)|r", text1, text2 ),
						"tooltipTitle", string.format( ArkInventory.Const.Tooltip.customHyperlinkFormat, data.link ),
						"hasArrow", true,
						"func", function( )
							if IsAltKeyDown( ) then
								-- add to tooltip
								if codex.player.data.ldb.tracking.reputation.watched == data.id then
									codex.player.data.ldb.tracking.reputation.watched = nil
								else
									codex.player.data.ldb.tracking.reputation.watched = data.id
								end
								ArkInventory:SendMessage( "EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET" )
							else
								-- add to text
								codex.player.data.ldb.tracking.reputation.tracked[data.id] = not codex.player.data.ldb.tracking.reputation.tracked[data.id]
							end
						end,
						"value", string.format( "OPTIONS_%s", entry.index )
					)
					
				end
				
			end
			
		end
		
		if false and not parent.active then
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", "LDB_REPUTATION_REACTIVATE_ALL",
				"tooltipTitle", "LDB_REPUTATION_REACTIVATE_ALL",
				"tooltipText", "LDB_REPUTATION_REACTIVATE_ALL_TEXT",
				"closeWhenClicked", true,
				"func", function( )
					ArkInventory.Collection.Reputation.ReactivateAll( )
				end
			)
			
		end
		
	end
	
end

function ArkInventory.MenuLDBTrackingReputationListOptions( value, codex )
	
	local index = string.match( value, "^OPTIONS_(.+)$" )
	if index then
		
		-- options
		
		local index = tonumber( index )
		
		local entry = ArkInventory.Collection.Reputation.GetByIndex( index )
		local data = entry.data
		local name = entry.name
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", name,
			"isTitle", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		
		-- at war
		
		local text = ArkInventory.Localise["AT_WAR"]
		local desc = ArkInventory.Localise["REPUTATION_AT_WAR_DESCRIPTION"]
		local checked = data.atWarWith
		
		if checked then
			text = string.format( "%s%s", RED_FONT_COLOR_CODE, text )
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["ENABLE"] )
		else
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["DISABLE"] )
		end
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", checked and ArkInventory.Const.Texture.atWar or "",
			"text", text,
			"tooltipTitle", text,
			"tooltipText", desc,
			"closeWhenClicked", true,
			"disabled", not data.canToggleAtWar,
			"func", function( )
				ArkInventory.Collection.Reputation.ToggleAtWar( data.id )
			end
		)
		
		
		-- move to inactivate, or restore
		
		local text = ArkInventory.Localise["INACTIVE"]
		local desc = ArkInventory.Localise["REPUTATION_MOVE_TO_INACTIVE"]
		local checked = not entry.active
		
		if checked then
			text = string.format( "%s%s", RED_FONT_COLOR_CODE, text )
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["RESTORE"] )
		else
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["MOVE"] )
		end
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", checked and ArkInventory.Const.Texture.Checked or "",
			"text", text,
			"tooltipTitle", text,
			"tooltipText", desc,
			"closeWhenClicked", true,
			"disabled", not data.canSetInactive,
			"func", function( )
				ArkInventory.Collection.Reputation.ListSetActive( entry.index, not entry.active )
			end
		)
		
		
		-- show as experience bar
		
		local text = ArkInventory.Localise["SHOW_FACTION_ON_MAINSCREEN"]
		local desc = ArkInventory.Localise["REPUTATION_SHOW_AS_XP"]
		local checked = data.isWatched
		
		if checked then
			--text = string.format( "%s%s", GREEN_FONT_COLOR_CODE, text )
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["CLEAR"] )
		else
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["SET"] )
		end
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", checked and ArkInventory.Const.Texture.Checked or "",
			"text", text,
			"tooltipTitle", text,
			"tooltipText", desc,
			"closeWhenClicked", true,
			"func", function( )
				ArkInventory.Collection.Reputation.ToggleShowAsExperienceBar( data.id )
			end
		)
		
		
		-- ldb options
		ArkInventory.Lib.Dewdrop:AddLine( )
		ArkInventory.Lib.Dewdrop:AddLine(
			--"text", string.format( "%sLDB", YELLOW_FONT_COLOR_CODE ),
			"text", ArkInventory.Localise["LDB"],
			"isTitle", true
		)
		
		-- add to object tooltip
		local text = ArkInventory.Localise["LDB_OBJECT_TOOLTIP_INCLUDE"]
		local desc = string.format( ArkInventory.Localise["LDB_OBJECT_TOOLTIP_INCLUDE_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Reputation].Name )
		local checked = codex.player.data.ldb.tracking.reputation.tracked[data.id]
		
		if checked then
			--text = string.format( "%s%s", GREEN_FONT_COLOR_CODE, text )
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["REMOVE"] )
		else
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["ADD"] )
		end
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", checked and ArkInventory.Const.Texture.Checked or "",
			"text", text,
			"tooltipTitle", text,
			"tooltipText", desc,
			"func", function( )
				codex.player.data.ldb.tracking.reputation.tracked[data.id] = not codex.player.data.ldb.tracking.reputation.tracked[data.id]
			end
		)
		
		-- set as object text
		local text = ArkInventory.Localise["LDB_OBJECT_TEXT_SET"]
		local desc = string.format( ArkInventory.Localise["LDB_OBJECT_TEXT_SET_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Reputation].Name )
		local checked = codex.player.data.ldb.tracking.reputation.watched == data.id
		
		if codex.player.data.ldb.tracking.reputation.watched == data.id then
			--text = string.format( "%s%s", GREEN_FONT_COLOR_CODE, text )
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["HIDE"] )
		else
			desc = string.format( ArkInventory.Localise["ADD_CLICK_TO_ACTION"], desc, ArkInventory.Localise["SHOW"] )
		end
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", checked and ArkInventory.Const.Texture.Checked or "",
			"text", text,
			"tooltipTitle", text,
			"tooltipText", desc,
			"func", function( )
				if codex.player.data.ldb.tracking.reputation.watched == data.id then
					codex.player.data.ldb.tracking.reputation.watched = nil
				else
					codex.player.data.ldb.tracking.reputation.watched = data.id
				end
				ArkInventory:SendMessage( "EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET" )
			end
		)
		
	end
	
	
end

function ArkInventory.MenuLDBTrackingItemOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local codex = ArkInventory.GetPlayerCodex( )
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		
		"children", function( level, value )
			
			if level == 1 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.LDB.Tracking_Item.name,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Global.Version,
					"notClickable", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				local numTokenTypes = 0
				
				for k in ArkInventory.spairs( ArkInventory.db.option.tracking.items )  do
					
					numTokenTypes = numTokenTypes + 1
					
					local count = ArkInventory.CrossClient.GetItemCount( k )
					local info = ArkInventory.GetObjectInfo( k )
					local checked = codex.player.data.ldb.tracking.item.tracked[k]
					local t1 = info.name
					local t2 = ArkInventory.Localise["CLICK_TO_SELECT"]
					
					if checked then
						t1 = string.format( "%s%s", GREEN_FONT_COLOR_CODE, info.name )
						t2 = ArkInventory.Localise["CLICK_TO_DESELECT"]
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"icon", info.texture,
						"text", t1,
						--"tooltipTitle", info.name,
						--"tooltipText", t2,
						"tooltipLink", info.h,
						"checked", checked,
						"func", function( )
							codex.player.data.ldb.tracking.item.tracked[k] = not codex.player.data.ldb.tracking.item.tracked[k]
							ArkInventory:SendMessage( "EVENT_ARKINV_LDB_ITEM_UPDATE_BUCKET" )
						end,
						"hasArrow", true,
						"value", k
					)
					
				end
				
				if numTokenTypes == 0 then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["NONE"],
						"disabled", true
					)
					
				end
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
			
			if level == 2 and value and value > 0 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["REMOVE"], FONT_COLOR_CODE_CLOSE ),
					"tooltipTitle", ArkInventory.Localise["REMOVE"],
					--"tooltipText", "",
					"func", function( )
						ArkInventory.db.option.tracking.items[value] = nil
						codex.player.data.ldb.tracking.item.tracked[value] = false
						ArkInventory:SendMessage( "EVENT_ARKINV_LDB_ITEM_UPDATE_BUCKET" )
					end
				)
				
			end
			
		end
		
	)
	
end

function ArkInventory.MenuLDBMountsEntries( offset, level, value )
	
	if not offset or type( offset ) ~= "number" then return end
	local offset = math.abs( offset )
	
	local codex = ArkInventory.GetPlayerCodex( )
	local icon = ""
	
	if ( level == 1 + offset ) then
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.LDB.Mounts.name,
			"isTitle", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Global.Version,
			"notClickable", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
--		ArkInventory.Lib.Dewdrop:AddLine(
--			"text", ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Name,
--			"isTitle", true
--		)
		
		for mountType in pairs( ArkInventory.Const.Mount.Types ) do
			if mountType ~= "x" then
				
				local mode = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mountType ) )]
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", mode,
					"tooltipTitle", mode,
					"hasArrow", true,
					"value", mountType
				)
				
			end
		end
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["CONFIG"],
			"closeWhenClicked", true,
			"func", function( )
				ArkInventory.Frame_Config_Show( "advanced", "ldb", "mounts" )
			end
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["CLOSE_MENU"],
			"closeWhenClicked", true
		)
		
	end
	
	
	if ( level == 2 + offset ) and value then
		
		local mountType = value
		local header = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mountType ) )]
		local selected = codex.player.data.ldb.mounts.type[mountType].selected
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", header,
			"isTitle", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		local companionCount = 0
		
		for _, md in ArkInventory.Collection.Mount.Iterate( mountType ) do
			
			local usable = ArkInventory.Collection.Mount.isUsable( md.index )
			
			companionCount = companionCount + 1
			
			icon = ""
			local text = md.name
			
			if selected[md.spellID] == true then
				icon = ArkInventory.Const.Texture.Yes
				text = string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, text, FONT_COLOR_CODE_CLOSE )
			elseif selected[md.spellID] == false then
				icon = ArkInventory.Const.Texture.No
				text = string.format( "%s%s%s", RED_FONT_COLOR_CODE, text, FONT_COLOR_CODE_CLOSE )
			end
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"icon", icon,
				"text", text,
				"tooltipTitle", md.name,
				"tooltipText", md.desc,
				"hasArrow", true,
				"value", string.format( "%s:%s", mountType, md.index )
			)
			
		end
		
		if companionCount == 0 then
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["LDB_COMPANION_NONE"],
				"disabled", true
			)
			
		end
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["USE_ALL"],
			"tooltipTitle", ArkInventory.Localise["USE_ALL"],
			"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_USEALL_DESC"], ArkInventory.Localise["MOUNTS"] ),
			"checked", codex.player.data.ldb.mounts.type[mountType].useall,
			"func", function( )
				codex.player.data.ldb.mounts.type[mountType].useall = not codex.player.data.ldb.mounts.type[mountType].useall
				ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
			end
		)
		
		if mountType == "a" then
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", string.format( ArkInventory.Localise["LDB_MOUNTS_USEFORLAND"], ArkInventory.Localise["LDB_MOUNTS_TYPE_L"] ),
				"tooltipTitle", string.format( ArkInventory.Localise["LDB_MOUNTS_USEFORLAND"], ArkInventory.Localise["LDB_MOUNTS_TYPE_L"] ),
				"tooltipText", string.format( ArkInventory.Localise["LDB_MOUNTS_USEFORLAND_DESC"], ArkInventory.Localise["LDB_MOUNTS_TYPE_A"], ArkInventory.Localise["LDB_MOUNTS_TYPE_L"] ),
				"checked", codex.player.data.ldb.mounts.type.l.useflying,
				"func", function( )
					codex.player.data.ldb.mounts.type.l.useflying = not codex.player.data.ldb.mounts.type.l.useflying
				end
			)
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT"],
				"tooltipTitle", ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT"],
				"tooltipText", ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT_DESC"],
				"checked", codex.player.data.ldb.mounts.type.a.dismount,
				"func", function( )
					codex.player.data.ldb.mounts.type.a.dismount = not codex.player.data.ldb.mounts.type.a.dismount
				end
			)
			
			if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAGONFLIGHT ) then
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["DRAGONRIDING"],
					"tooltipTitle", ArkInventory.Localise["DRAGONRIDING"],
					"tooltipText", ArkInventory.Localise["LDB_MOUNTS_FLYING_DRAGONRIDING_DESC"],
					"checked", codex.player.data.ldb.mounts.dragonriding,
					"func", function( )
						codex.player.data.ldb.mounts.dragonriding = not codex.player.data.ldb.mounts.dragonriding
					end
				)
			end
			
		end
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", string.format( ArkInventory.Localise["LDB_MOUNTS_TRAVEL_FORM"], ArkInventory.Localise["SPELL_DRUID_TRAVEL_FORM"] ),
			"tooltipTitle", string.format( ArkInventory.Localise["LDB_MOUNTS_TRAVEL_FORM"], ArkInventory.Localise["SPELL_DRUID_TRAVEL_FORM"] ),
			"tooltipText", string.format( ArkInventory.Localise["LDB_MOUNTS_TRAVEL_FORM_DESC"], ArkInventory.Localise["SPELL_DRUID_TRAVEL_FORM"] ),
			"checked", codex.player.data.ldb.travelform,
			"disabled", codex.player.data.info.class ~= "DRUID",
			"func", function( )
				codex.player.data.ldb.travelform = not codex.player.data.ldb.travelform
				ArkInventory.SetMountMacro( )
			end
		)
		
	end
	
	if ( level == 3 + offset ) and value then
		
		local mountType, index = string.match( value, "^(.-):(.-)$" )
		index = tonumber( index )
		
		local md = ArkInventory.Collection.Mount.GetMount( index )
		local usable = ArkInventory.Collection.Mount.isUsable( md.index )
		local selected = codex.player.data.ldb.mounts.type[mountType].selected
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"icon", md.icon,
			"text", md.name,
			"isTitle", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_SELECT"], FONT_COLOR_CODE_CLOSE ),
			"tooltipTitle", md.name,
			"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_SELECT"], md.name ),
			"checked", selected[md.spellID] == true,
			"disabled", selected[md.spellID] == true,
			"isRadio", true,
			"func", function( )
				selected[md.spellID] = true
				ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
			end
		)
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", string.format( "%s%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_IGNORE"], FONT_COLOR_CODE_CLOSE ),
			"tooltipTitle", md.name,
			"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_IGNORE"], md.name ),
			"checked", selected[md.spellID] == false,
			"disabled", selected[md.spellID] == false,
			"isRadio", true,
			"func", function( )
				selected[md.spellID] = false
				ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
			end
		)
		
		if selected[md.spellID] ~= nil then
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", string.format( "%s%s%s", HIGHLIGHT_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_DESELECT"], FONT_COLOR_CODE_CLOSE ),
				"tooltipTitle", md.name,
				"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_DESELECT"], md.name ),
				"checked", selected[md.spellID] == nil,
				"disabled", selected[md.spellID] == nil,
				"isRadio", true,
				"func", function( )
					selected[md.spellID] = nil
					ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
				end
			)
		end
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["LDB_MOUNTS_SUMMON"],
			"tooltipTitle", md.name,
			"tooltipText", ArkInventory.Localise["LDB_MOUNTS_SUMMON"],
			"disabled", not usable,
			"func", function( )
				ArkInventory.Collection.Mount.Summon( index )
			end
		)
		
	end
	
end

function ArkInventory.MenuLDBMountsOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local x, p, rp
	x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
	if ( x >= ( GetScreenWidth( ) / 2 ) ) then
		p = "TOPRIGHT"
		rp = "BOTTOMLEFT"
	else
		p = "TOPLEFT"
		rp = "BOTTOMRIGHT"
	end
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			ArkInventory.MenuLDBMountsEntries( 0, level, value )
		end
	)
	
end

function ArkInventory.MenuLDBPetsEntries( offset, level, value )
	
	if not offset or type( offset ) ~= "number" then return end
	local offset = math.abs( offset )
	
	local codex = ArkInventory.GetPlayerCodex( )
	local selected = codex.player.data.ldb.pets.selected
	
	--ArkInventory.Output( level, " / ", offset, " / ", value )
	
	if ( level == 1 + offset ) then
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.LDB.Pets.name,
			"isTitle", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Global.Version,
			"notClickable", true
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		
		local n = ArkInventory.Collection.Pet.GetCount( )
		
		if n > 0 then
			
			for i = 1, C_PetJournal.GetNumPetTypes( ) do
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Collection.Pet.PetTypeName( i ),
					"hasArrow", true,
					"value", string.format( "PETTYPE_%s", i )
				)
			end
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["USE_ALL"],
				"tooltipTitle", ArkInventory.Localise["USE_ALL"],
				"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_USEALL_DESC"], ArkInventory.Localise["PETS"] ),
				"checked", codex.player.data.ldb.pets.useall,
				"func", function( )
					codex.player.data.ldb.pets.useall = not codex.player.data.ldb.pets.useall
					ArkInventory:SendMessage( "EVENT_ARKINV_LDB_PET_UPDATE_BUCKET" )
				end
			)
			
		else
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["LDB_COMPANION_NONE"],
				"disabled", true
			)
			
		end
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["CONFIG"],
			"closeWhenClicked", true,
			"func", function( )
				ArkInventory.Frame_Config_Show( "advanced", "LDB", "pets" )
			end
		)
		
		ArkInventory.Lib.Dewdrop:AddLine( )
		ArkInventory.Lib.Dewdrop:AddLine(
			"text", ArkInventory.Localise["CLOSE_MENU"],
			"closeWhenClicked", true
		)
		
	end
	
	if ( level == 2 + offset ) and value then
		
		local petType0 = string.match( value, "^PETTYPE_(.+)$" )
		
		if petType0 then
			
			petType0 = tonumber( petType0 )
			local species = -1
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Collection.Pet.PetTypeName( petType0 ),
				"isTitle", true
			)
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			for _, pd in ArkInventory.Collection.Pet.Iterate( ) do
				
				if ( pd.sd.petType == petType0 ) and ( species ~= pd.sd.speciesID ) then
					
					species = pd.sd.speciesID
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", pd.sd.name,
						"hasArrow", true,
						"value", string.format( "PETSPECIES_%s", pd.sd.speciesID )
					)
				
				end
				
			end
		
		end
		
	end
		
	if ( level == 3 + offset ) and value then
		
		local speciesID = string.match( value, "^PETSPECIES_(.+)$" )
		
		if speciesID then
			
			speciesID = tonumber( speciesID )
			local sd = ArkInventory.Collection.Pet.GetSpeciesInfo( speciesID )
			
			if sd then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", sd.icon,
					"text", sd.name,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				for _, pd in ArkInventory.Collection.Pet.Iterate( ) do
					
					if ( pd.sd.speciesID == sd.speciesID ) then
						
						local c = select( 5, ArkInventory.GetItemQualityColor( pd.quality ) )
						local name = string.format( "%s%s|r", c, sd.name )
						
						if pd.cn and pd.cn ~= "" then
							name = string.format( "%s (%s)", name, pd.cn )
						end
						
						name = string.format( "%s [%s]", name, pd.level )
						
						local icon = ""
						
						if selected[pd.guid] == true then
							icon = ArkInventory.Const.Texture.Yes
						elseif selected[pd.guid] == false then
							icon = ArkInventory.Const.Texture.No
						end
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"icon", icon,
							"text", name,
							"tooltipTitle", name,
							"hasArrow", true,
							"value", string.format( "PETID_%s", pd.guid )
						)
					
					end
					
				end
				
			end
		
		end
		
	end
		
	if ( level == 4 + offset ) and value then
		
		local petID = string.match( value, "^PETID_(.+)$" )
		
		if petID then
			
			local pd = ArkInventory.Collection.Pet.GetByID( petID )
			
			local selected = codex.player.data.ldb.pets.selected
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", pd.fullname,
				"isTitle", true
			)
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_SELECT"], FONT_COLOR_CODE_CLOSE ),
				"tooltipTitle", pd.fullname,
				"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_SELECT"], pd.fullname ),
				"checked", selected[pd.guid] == true,
				"disabled", selected[pd.guid] == true,
				"isRadio", true,
				"func", function( )
					selected[pd.guid] = true
					ArkInventory:SendMessage( "EVENT_ARKINV_LDB_PET_UPDATE_BUCKET" )
				end
			)
	
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", string.format( "%s%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_IGNORE"], FONT_COLOR_CODE_CLOSE ),
				"tooltipTitle", pd.fullname,
				"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_IGNORE"], pd.fullname ),
				"checked", selected[pd.guid] == false,
				"disabled", selected[pd.guid] == false,
				"isRadio", true,
				"func", function( )
					selected[pd.guid] = false
					ArkInventory:SendMessage( "EVENT_ARKINV_LDB_PET_UPDATE_BUCKET" )
				end
			)
			
			if selected[pd.guid] ~= nil then
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s%s%s", HIGHLIGHT_FONT_COLOR_CODE, ArkInventory.Localise["CLICK_TO_DESELECT"], FONT_COLOR_CODE_CLOSE ),
					"tooltipTitle", pd.fullname,
					"tooltipText", string.format( ArkInventory.Localise["LDB_COMPANION_DESELECT"], pd.fullname ),
					"isRadio", true,
					"func", function( )
						selected[pd.guid] = nil
						ArkInventory:SendMessage( "EVENT_ARKINV_LDB_PET_UPDATE_BUCKET" )
					end
				)
			end
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			local txt = BATTLE_PET_SUMMON
			local active = ArkInventory.Collection.Pet.GetCurrent( )
			if active and active == pd.guid then
				txt = PET_ACTION_DISMISS
			end
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", txt,
				"tooltipTitle", pd.fullname,
				"tooltipText", BATTLE_PETS_SUMMON_TOOLTIP,
				"disabled", not ArkInventory.Collection.Pet.CanSummon( pd.guid ),
				"func", function( )
					ArkInventory.Collection.Pet.Summon( pd.guid )
				end
			)
			
		end
		
	end
	
end

function ArkInventory.MenuLDBPetsOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			ArkInventory.MenuLDBPetsEntries( 0, level, value )
		end
	)
	
end

function ArkInventory.MenuItemPetJournal( frame, index )
	
	assert( frame, "code error: frame argument is missing" )
	assert( index, "code error: index argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			local pd = ArkInventory.Collection.Pet.GetByID( index )
			if pd then
				
				--ArkInventory.Output( pd.fullname, " / ", pd.quality, " / ", pd.link )
				
				if ( level == 1 ) then
					
					--name = string.format( "%s%s|r", select( 5, ArkInventory.GetItemQualityColor( pd.quality ) ), pd.fullname )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", pd.fullname,
						"icon", pd.sd.icon,
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					local isRevoked = ArkInventory.Collection.Pet.IsRevoked( pd.guid )
					local isLockedForConvert = ArkInventory.Collection.Pet.IsLockedForConvert( pd.guid )
					
					if ( not isRevoked ) and ( not isLockedForConvert ) then
						
						local txt = BATTLE_PET_SUMMON
						if ( ArkInventory.Collection.Pet.GetCurrent( ) == pd.guid ) then
							txt = PET_DISMISS
						end
						
						-- summon / dismiss
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", txt,
							"disabled", not ArkInventory.Collection.Pet.CanSummon( pd.guid ),
							"closeWhenClicked", true,
							"func", function( info )
								ArkInventory.Collection.Pet.Summon( pd.guid )
							end
						)
						
						-- rename
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", BATTLE_PET_RENAME,
							"disabled", not ArkInventory.Collection.Pet.IsReady( ),
							"closeWhenClicked", true,
							"func", function( info )
								ArkInventory.Lib.StaticDialog:Spawn( "BATTLE_PET_RENAME", pd.guid )
							end
						)
						
						-- enable / disable favourite
						if pd.fav then
							txt = BATTLE_PET_UNFAVORITE
						else
							txt = BATTLE_PET_FAVORITE
						end
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", txt,
							"disabled", not ArkInventory.Collection.Pet.IsReady( ),
							"closeWhenClicked", true,
							"func", function( info )
								if pd.fav then
									ArkInventory.Collection.Pet.SetFavorite( pd.guid, 0 )
								else
									ArkInventory.Collection.Pet.SetFavorite( pd.guid, 1 )
								end
							end
						)
						
						-- release
						if ArkInventory.Collection.Pet.CanRelease( pd.guid ) then
							
							txt = nil
							if ArkInventory.Collection.Pet.InBattle( ) then
								txt2 = "in battle"
							elseif ArkInventory.Collection.Pet.IsSlotted( pd.guid ) then
								txt = "slotted"
							end
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", BATTLE_PET_RELEASE,
								"tooltipTitle", BATTLE_PET_RELEASE,
								"tooltipText", txt,
								"disabled", ArkInventory.Collection.Pet.InBattle( ) or ArkInventory.Collection.Pet.IsSlotted( pd.guid ),
								"closeWhenClicked", true,
								"func", function( info )
									ArkInventory.Lib.StaticDialog:Spawn( "BATTLE_PET_RELEASE", pd.guid )
								end
							)
						end
						
						-- cage
						if ArkInventory.Collection.Pet.CanTrade( pd.guid ) then
							
							txt = BATTLE_PET_PUT_IN_CAGE
							
							if ArkInventory.Collection.Pet.IsSlotted( pd.guid ) then
								txt = BATTLE_PET_PUT_IN_CAGE_SLOTTED
							elseif ArkInventory.Collection.Pet.IsHurt( pd.guid ) then
								txt = BATTLE_PET_PUT_IN_CAGE_HEALTH
							end
							
							ArkInventory.Lib.Dewdrop:AddLine(
								"text", txt,
								"disabled", ArkInventory.Collection.Pet.IsSlotted( pd.guid ) or ArkInventory.Collection.Pet.IsHurt( pd.guid ),
								"closeWhenClicked", true,
								"func", function( info )
									ArkInventory.Lib.StaticDialog:Spawn( "BATTLE_PET_PUT_IN_CAGE", pd.guid )
								end
							)
						end
						
					end
					
				end
				
			else
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", "pet data not found",
					"tooltipTitle", "error",
					"tooltipText", "pet data not found",
					"disabled", true
				)
				
			end
			
			if ( level == 1 ) then
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
		end
	)
	
end

function ArkInventory.MenuItemMountJournal( frame, index )
	
	assert( frame, "code error: frame argument is missing" )
	assert( index, "code error: index argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			local md = ArkInventory.Collection.Mount.GetMount( index )
			
			if md then
				
				if ( level == 1 ) then
					
					--name = string.format( "%s%s|r", select( 5, ArkInventory.GetItemQualityColor( pd.quality ) ), pd.fullname )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", md.name,
						"icon", md.icon,
						"isTitle", true
					)
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					-- enable / disable favourite
					if md.fav then
						txt = BATTLE_PET_UNFAVORITE
					else
						txt = BATTLE_PET_FAVORITE
					end
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", txt,
						"disabled", not ArkInventory.Collection.Pet.IsReady( ),
						"closeWhenClicked", true,
						"func", function( info )
							if md.fav then
								ArkInventory.Collection.Mount.SetFavorite( index, false )
							else
								ArkInventory.Collection.Mount.SetFavorite( index, true )
							end
						end
					)
					
				end
				
			else
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", "mount data not found",
					"tooltipTitle", "error",
					"tooltipText", "mount data not found",
					"disabled", true
				)
				
			end
			
			if ( level == 1 ) then
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
		end
	)
	
end

function ArkInventory.MenuRestackOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			if level == 1 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Restack].Texture,
					"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Restack].Name( ),
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["TYPE"],
					"isTitle", true
				)
				
				local txt = string.format( "%s: %s", ArkInventory.Localise["BLIZZARD"], ArkInventory.Localise["CLEANUP"] )
				local disabled, tooltipText = ArkInventory.CrossClient.OptionNotAvailableExpansion( ArkInventory.ClientCheck( nil, ArkInventory.ENUM.EXPANSION.DRAENOR ), ArkInventory.Localise["RESTACK_TYPE"] )
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", txt,
					"tooltipTitle", txt,
					"tooltipText", tooltipText,
					"disabled", disabled,
					"isRadio", true,
					"checked", ArkInventory.db.option.restack.blizzard,
					--"closeWhenClicked", true,
					"func", function( )
						ArkInventory.db.option.restack.blizzard = true
					end
				)
				
				local txt = string.format( "%s: %s", ArkInventory.Const.Program.Name, ArkInventory.Localise["RESTACK"] )
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", txt,
					"tooltipTitle", txt,
					"tooltipText", ArkInventory.Localise["RESTACK_TYPE"],
					"isRadio", true,
					"checked", not ArkInventory.db.option.restack.blizzard,
					--"closeWhenClicked", true,
					"func", function( )
						ArkInventory.db.option.restack.blizzard = false
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["ENABLE"],
					--"tooltipTitle", ArkInventory.Localise["ENABLE"],
					--"tooltipText", ArkInventory.Localise["ENABLE"],
					"checked", ArkInventory.db.option.restack.enable,
					"func", function( )
						ArkInventory.db.option.restack.enable = not ArkInventory.db.option.restack.enable
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["OPTIONS"],
					"isTitle", true
				)
				
				if ArkInventory.db.option.restack.blizzard then
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", REAGENTBANK_DEPOSIT,
						"tooltipTitle", REAGENTBANK_DEPOSIT,
						"tooltipText", ArkInventory.Localise["RESTACK_CLEANUP_DEPOSIT"],
						"checked", ArkInventory.db.option.restack.deposit,
						--"closeWhenClicked", true,
						"func", function( )
							ArkInventory.db.option.restack.deposit = not ArkInventory.db.option.restack.deposit
						end
					)
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", REVERSE_CLEAN_UP_BAGS_TEXT,
						"tooltipTitle", REVERSE_CLEAN_UP_BAGS_TEXT,
						"tooltipText", OPTION_TOOLTIP_REVERSE_CLEAN_UP_BAGS,
						"checked", ArkInventory.db.option.restack.reverse,
						--"closeWhenClicked", true,
						"func", function( )
							ArkInventory.db.option.restack.reverse = not ArkInventory.db.option.restack.reverse
							ArkInventory.CrossClient.SetSortBagsRightToLeft( ArkInventory.db.option.restack.reverse )
						end
					)
					
				else
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", ArkInventory.Localise["RESTACK_TOPUP_FROM_BAGS"],
						"tooltipTitle", ArkInventory.Localise["RESTACK_TOPUP_FROM_BAGS"],
						"tooltipText", ArkInventory.Localise["RESTACK_TOPUP_FROM_BAGS_DESC"],
						"checked", ArkInventory.db.option.restack.topup,
						--"closeWhenClicked", true,
						"func", function( )
							ArkInventory.db.option.restack.topup = not ArkInventory.db.option.restack.topup
						end
					)
					
					if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAENOR ) then
						
						local txt = string.format( "%s (%s)", REAGENTBANK_DEPOSIT, ArkInventory.Localise["REAGENTBANK"] )
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", txt,
							"tooltipTitle", txt,
							"tooltipText", string.format( ArkInventory.Localise["RESTACK_FILL_FROM_BAGS_DESC"], ArkInventory.Localise["REAGENTBANK"], ArkInventory.Localise["BACKPACK"] ),
							"checked", ArkInventory.db.option.restack.deposit,
							"func", function( )
								ArkInventory.db.option.restack.deposit = not ArkInventory.db.option.restack.deposit
							end
						)
						
						local txt = string.format( "%s (%s)", REAGENTBANK_DEPOSIT, ArkInventory.Localise["BANK"] )
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", txt,
							"tooltipTitle", txt,
							"tooltipText", string.format( ArkInventory.Localise["RESTACK_FILL_FROM_BAGS_DESC"], ArkInventory.Localise["BANK"], ArkInventory.Localise["BACKPACK"] ),
							"checked", ArkInventory.db.option.restack.bank,
							"func", function( )
								ArkInventory.db.option.restack.bank = not ArkInventory.db.option.restack.bank
							end
						)
						
						
						ArkInventory.Lib.Dewdrop:AddLine( )
						
						local txt = ArkInventory.Localise["REAGENTBANK"]
						if not ArkInventory.db.option.restack.priority then
							txt = ArkInventory.Localise["RESTACK_FILL_PRIORITY_PROFESSION"]
						end
						txt = string.format( "%s: %s", ArkInventory.Localise["RESTACK_FILL_PRIORITY"], txt )
						
						ArkInventory.Lib.Dewdrop:AddLine(
							"text", txt,
							"tooltipTitle", txt,
							"tooltipText", string.format( ArkInventory.Localise["RESTACK_FILL_PRIORITY_DESC"], ArkInventory.Localise["REAGENTBANK"], ArkInventory.Localise["RESTACK_FILL_PRIORITY_PROFESSION"] ),
							"func", function( )
								ArkInventory.db.option.restack.priority = not ArkInventory.db.option.restack.priority
							end
						)
						
					end
--[[
					ArkInventory.Lib.Dewdrop:AddLine( )
					local txt = ArkInventory.Localise["RESTACK_REFRESH_WHEN_COMPLETE"]
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", txt,
						"tooltipTitle", ,
						--"tooltipText", ArkInventory.Localise["RESTACK_REFRESH_WHEN_COMPLETE_DESC"],
						"checked", ArkInventory.db.option.restack.refresh,
						--"closeWhenClicked", true,
						"func", function( )
							ArkInventory.db.option.restack.refresh = not ArkInventory.db.option.restack.refresh
						end
					)
]]--
						
				end
				
				if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAENOR ) then
					
					ArkInventory.Lib.Dewdrop:AddLine( )
					
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", REAGENTBANK_DEPOSIT,
						"tooltipTitle", REAGENTBANK_DEPOSIT,
						"tooltipText", REAGENTBANK_DEPOSIT,
						"closeWhenClicked", true,
						"disabled", ArkInventory.Global.Mode.Edit or not ArkInventory.Global.Mode.Bank,
						"func", function( )
							PlaySound( SOUNDKIT.IG_MAINMENU_OPTION )
							DepositReagentBank( )
						end
					)
					
				end
				
			end
			
			
			ArkInventory.Lib.Dewdrop:AddLine( )
			
			ArkInventory.Lib.Dewdrop:AddLine(
				"text", ArkInventory.Localise["CLOSE_MENU"],
				"closeWhenClicked", true
			)
			
		end
		
	)
	
end

function ArkInventory.MenuRefreshOpen( frame )
	
	assert( frame, "code error: frame argument is missing" )
	
	if ArkInventory.Lib.Dewdrop:IsOpen( frame ) then
		ArkInventory.Lib.Dewdrop:Close( )
		return
	end
	
	
	local loc_id = frame:GetParent( ):GetParent( ).ARK_Data.loc_id
	local codex = ArkInventory.GetLocationCodex( loc_id )
	
	
	ArkInventory.Lib.Dewdrop:Open( frame,
		"point", helper_DewdropMenuPosition( frame ),
		"relativePoint", helper_DewdropMenuPosition( frame, true ),
		"children", function( level, value )
			
			if level == 1 then
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"icon", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Refresh].Texture,
					"text", ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Refresh].Name,
					"isTitle", true
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERRIDE_NEW"], ArkInventory.Localise["RESET"] ),
					"tooltipTitle", ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERRIDE_NEW_RESET_DESC"],
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Global.NewItemResetTime = ArkInventory.TimeAsMinutes( )
						ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
					end
				)
				
				if ArkInventory.db.option.newitemglow.enable and loc_id == ArkInventory.Const.Location.Bag and not ArkInventory.Global.Location[loc_id].isOffline then
					ArkInventory.Lib.Dewdrop:AddLine(
						"text", string.format( "%s: %s", ArkInventory.Localise["NEW_ITEM_GLOW"], ArkInventory.Localise["CLEAR"] ),
						--"tooltipTitle", ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERRIDE_NEW_RESET_DESC"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.ClearNewItemGlow( loc_id )
						end
					)
				end
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", ArkInventory.Localise["ITEMS"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_HIDDEN"] ),
					"tooltipTitle", ArkInventory.Localise["CONFIG_DESIGN_ITEM_HIDDEN_DESC"],
					"closeWhenClicked", true,
					"checked", ArkInventory.Global.Options.ShowHiddenItems,
					"func", function( )
						ArkInventory.ToggleShowHiddenItems( )
					end
				)
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", string.format( "%s: %s", ArkInventory.Localise["ITEMS"], ArkInventory.Localise["MENU_ACTION_REFRESH_CLEAR_CACHE"] ),
					"tooltipTitle", ArkInventory.Localise["MENU_ACTION_REFRESH_CLEAR_CACHE_DESC"],
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.ItemCacheClear( )
					end
				)
				
				ArkInventory.Lib.Dewdrop:AddLine( )
				
				ArkInventory.Lib.Dewdrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
		end
		
	)
	
end
