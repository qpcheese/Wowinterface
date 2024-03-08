-- Author      : CaptJack2883
-- Create Date : 08/24/2017
-- Modify Date : 11/27/2022

-- Put Variables in MacroMaker.lua (unless they're function-local)


function MacroMakerConfig_OnLoad(panel)	
	panel.name = "Macro Maker"
	panel.okay = function (self) MacroMakerConfig_Close() end
	panel.cancel = function (self) MacroMakerConfig_CancelOrLoad() end
	panel.refresh = function (self) MacroMakerConfig_Refresh() end
	panel.default = function (self) MacroMakerConfig_Default() end
	InterfaceOptions_AddCategory(panel)
	
end

function MMConfigShow()
	InterfaceOptionsFrame_OpenToCategory(MacroMakerConfig)
	InterfaceOptionsFrame_OpenToCategory(MacroMakerConfig)
	--MMCreateDropDowns()
end

function MacroMakerConfig_Close()
  MMPrint("The Config screen was closed.")
  MMMinimapButtonShown = MMMinimapButtonCheckbox:GetChecked()
  if MMMinimapButtonShown then
    MM_LDBaddon.db.profile.minimap.hide = false        
    MM_LDBicon:Show("Macro Maker")
  else        
    MM_LDBaddon.db.profile.minimap.hide = true        
    MM_LDBicon:Hide("Macro Maker")
  end
end

function MacroMakerConfig_Refresh()  
  MMPrint("The Config screen was refreshed.")
  MMMinimapButtonCheckbox:SetChecked(MMMinimapButtonShown)
  if MMMinimapButtonShown then
    MM_LDBaddon.db.profile.minimap.hide = false        
    MM_LDBicon:Show("Macro Maker")
  else        
    MM_LDBaddon.db.profile.minimap.hide = true        
    MM_LDBicon:Hide("Macro Maker")
  end
end

function MMOptionsButtonHide_OnClick()
	MacroMakerFrame:Hide()
	MMMainHidden = 0
end

function MMOptionsButtonShowMM_OnClick()
	MacroMakerFrame:Show()
	MMMainHidden = 1
	MMBtnMacroInput:SetNormalTexture("Interface\\Icons\\INV_MISC_QUESTIONMARK")
end

function MMCreateDropDowns()
	if not MMDropMacroSelect then
		CreateFrame("Button", "MMDropMacroSelect", UIParent, "UIDropDownMenuTemplate")
	end
	 
	MMDropMacroSelect:ClearAllPoints()
	MMDropMacroSelect:SetPoint("CENTER", 0, 0)
	MMDropMacroSelect:Show()
	 
	local MMDropMacroSelectItems = {"Alpha", "Beta", "Gamma", "Delta",}
	 
	local function MMDropMacroSelect_OnClick(self)
	   UIDropDownMenu_SetSelectedID(MMDropMacroSelect, self:GetID())
	end
	 
	local function MMDropMacroSelect_Initialize(self, level)
	   local MMDDMSinfo = UIDropDownMenu_CreateInfo()
	   for k,v in pairs(MMDropMacroSelectItems) do
		  info = UIDropDownMenu_CreateInfo()
		  info.text = v
		  info.value = v
		  info.func = OnClick
		  UIDropDownMenu_AddButton(MMDDMSinfo, level)
	   end
	end
	 
	 
	UIDropDownMenu_Initialize(MMDropMacroSelect, MMDropMacroSelect_Initialize)
	UIDropDownMenu_SetWidth(MMDropMacroSelect, 100);
	UIDropDownMenu_SetButtonWidth(MMDropMacroSelect, 124)
	UIDropDownMenu_SetSelectedID(MMDropMacroSelect, 1)
	UIDropDownMenu_JustifyText(MMDropMacroSelect, "LEFT")
end