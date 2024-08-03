local addonName, addonTable = ...
local addon = addonTable.addon

local AceGUI = LibStub("AceGUI-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local function createAceContainer(parentFrame)
  local scrollContainer = AceGUI:Create("ScrollFrame")
  scrollContainer:SetLayout("Fill")
  scrollContainer.frame:SetParent(parentFrame)
  scrollContainer.frame:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 25, -55)
  scrollContainer.frame:SetPoint("BOTTOMRIGHT", parentFrame, "BOTTOMRIGHT", -25, 25)
  scrollContainer.content:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 25, -55)
  scrollContainer.content:SetPoint("BOTTOMRIGHT", parentFrame, "BOTTOMRIGHT", -25, 25)
  scrollContainer.frame:SetClipsChildren(true)
  scrollContainer.frame:Show()
  return scrollContainer
end

local function creatResizeButton(parentFrame)
  local resizeButton = CreateFrame("Button", nil, parentFrame)
  resizeButton:SetPoint("BOTTOMRIGHT",-1,1)
  resizeButton:SetSize(26, 26)
  resizeButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
  resizeButton:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
  resizeButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
  resizeButton:SetScript("OnMouseDown", function() 
    parentFrame:StartSizing("BOTTOMRIGHT")
  end)
  resizeButton:SetScript("OnMouseUp", function()
    parentFrame:StopMovingOrSizing("BOTTOMRIGHT")
  end)
  return resizeButton
end

local function createTabs(parentFrame, ...)
  local TabSystem = CreateFrame("Frame", nil, parentFrame, "TabSystemTemplate")
  local tabs = {}
  TabSystem:SetTabSelectedCallback(function()end)
  TabSystem:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", 15, 2)
  for k,v in pairs({...}) do 
    TabSystem:AddTab(v)
    tabs[v] = TabSystem:GetTabButton(k)
  end
  TabSystem:SetTab(1)
  return TabSystem, tabs
end

local function clearFrame(frame)
  frame.container:ReleaseChildren()
end

local function applySkin(frame)
  --[[   
  local frameColor = {r=0.23921568627450981,g=0.2235294117647059,b=0.41568627450980394}
  for _, texture in pairs({
      frame.NineSlice.TopEdge,
      frame.NineSlice.BottomEdge,
      frame.NineSlice.TopRightCorner,
      frame.NineSlice.TopLeftCorner,
      frame.NineSlice.RightEdge,
      frame.NineSlice.LeftEdge,
      frame.NineSlice.BottomRightCorner,
      frame.NineSlice.BottomLeftCorner,  
  }) do
      texture:SetDesaturation(1)
      texture:SetVertexColor(frameColor.r,frameColor.g,frameColor.b) 
  end
  local tabColor = {r=0.22,g=0.22,b=0.22}
  for _, tab in pairs({ frame.TabSystem:GetChildren() }) do 
      for _, texture in pairs({
          tab.Left,
          tab.Middle,
          tab.Right,
      }) do 
          texture:SetVertexColor(tabColor.r,tabColor.g,tabColor.b) 
      end
  end
    ]]
  local r,g,b = PANEL_BACKGROUND_COLOR:GetRGB()
  frame.Bg:SetColorTexture(r,g,b,0.9)
end

local frame = nil
function addon:GetOptionsFrame()
  if frame then 
      return frame
  end
  frame = CreateFrame("Frame", "HealthBarColorOptions", UIParent, "PortraitFrameTemplate")
  frame:Hide()
  tinsert(UISpecialFrames, frame:GetName())
  frame:SetFrameStrata("DIALOG")
  frame.title = _G["HealthBarColorOptionsTitleText"]
  frame.title:SetText(addonName)
  HealthBarColorOptionsPortrait:SetTexture(addonTable.texturePaths.portraitIcon)
  frame:SetSize(950,550)
  frame:SetPoint("CENTER", UIparent, "CENTER")
  frame:SetMovable(true)
  --frame:SetResizable(true)
  frame:SetUserPlaced(true)
  --frame:SetResizeBounds(950,550)
  frame:SetClampedToScreen(true)
  frame:SetClampRectInsets(400, -400, 0, 180)
  frame:RegisterForDrag("LeftButton")
  frame.TitleContainer:SetScript("OnMouseDown", function()
    frame:StartMoving()
  end)
  frame.TitleContainer:SetScript("OnMouseUp", function()
    frame:StopMovingOrSizing()
  end)
  --frame.resizeButton = creatResizeButton(frame)
  local container = createAceContainer(frame)
  frame.container = container
  frame.TabSystem, frame.tabs = createTabs(frame, L["healthBars_tab_label"], L["fonts_tab_label"], L["modules_tab_label"], L["colors_tab_label"], L["profiles_tab_label"])
  
  frame.tabs[L["healthBars_tab_label"]]:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_HealthBars_Tab", container)
  end)

  frame.tabs[L["fonts_tab_label"]]:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_Fonts_Tab", container)
  end)
  if not self:IsModuleEnabled("Font_player") then
    frame.tabs[L["fonts_tab_label"]]:Hide()
  end

  frame.tabs[L["modules_tab_label"]]:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_Modules_Tab", container)
  end)

  frame.tabs[L["colors_tab_label"]]:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_Colors_Tab", container)
  end)

  frame.tabs[L["profiles_tab_label"]]:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_Profiles_Tab", container)
  end)

  frame:SetScript("OnEvent", frame.Hide) 
  frame:HookScript("OnShow", function()
      frame.TabSystem:SetTab(1)
      ACD:Open("HealthBarColor_HealthBars_Tab", container)
      frame:RegisterEvent("PLAYER_REGEN_DISABLED")
  end)
  frame:HookScript("OnHide",function()
      clearFrame(frame)
      frame:UnregisterEvent("PLAYER_REGEN_ENABLED")
  end)
  applySkin(frame)
  frame.TabSystem:SetTab(1)
  return frame
end

function addon:UpdateOptionsFrameTabs()
  if not frame then
    return
  end
  --[[
    Used to hide the Font tab when the module is disabled.
    /:Hide() & :Show() will update the tabs anchors
  ]]
  if not self:IsModuleEnabled("Font_player") then
    frame.tabs[L["fonts_tab_label"]]:Hide()
  else
    frame.tabs[L["fonts_tab_label"]]:Show()
  end
  local prevTab = frame.TabSystem:GetTabButton(1)
  for i=2, #frame.TabSystem.tabs do
    local tab = frame.TabSystem:GetTabButton(i)
    if tab:IsShown() then
      tab:ClearAllPoints()
      tab:SetPoint("LEFT", prevTab, "RIGHT", 0, 0)
      prevTab = tab
    end
  end
end

function addon:UpdateOptionsFrame()
  if not frame then
    return
  end
  self:UpdateOptionsFrameTabs()
end


function addon:HideOptionsFrame()
  if not frame then
    return
  end
  frame:Hide()
end

