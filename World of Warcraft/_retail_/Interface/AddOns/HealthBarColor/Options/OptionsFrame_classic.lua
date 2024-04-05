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

local function clearFrame(frame)
  frame.container:ReleaseChildren()
end

local frame = nil
function addon:GetOptionsFrame()
  if frame then 
      return frame
  end
  frame = HealthBarColorOptions
  frame:SetScale(UIParent:GetScale())
  frame:SetSize(950,550)
  tinsert(UISpecialFrames, frame:GetName())
  frame:SetFrameStrata("DIALOG")
  frame.title = _G["HealthBarColorOptionsTitleText"]
  frame.title:SetText(addonName)
  HealthBarColorOptionsPortrait:SetTexture(addonTable.texturePaths.portraitIcon)
  frame:SetPoint("CENTER", UIparent, "CENTER")
  frame:SetMovable(true)
  --frame:SetResizable(true)
  frame:SetUserPlaced(true)
  --frame:SetResizeBounds(950,550)
  frame:SetClampedToScreen(true)
  frame:SetClampRectInsets(400, -400, 0, 180)
  frame:RegisterForDrag("LeftButton")
  if not frame.TitleContainer then
    frame.TitleContainer = CreateFrame("Frame", nil, frame)
    frame.TitleContainer:SetAllPoints(frame.TitleBg)
  end
  frame.TitleContainer:SetScript("OnMouseDown", function()
    frame:StartMoving()
  end)
  frame.TitleContainer:SetScript("OnMouseUp", function()
    frame:StopMovingOrSizing()
  end)
  --frame.resizeButton = creatResizeButton(frame)
  local container = createAceContainer(frame)
  frame.container = container
  HealthBarColorOptionsTab1:SetText(L["healthBars_tab_label"])
  HealthBarColorOptionsTab1:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_HealthBars_Tab", container)
  end)

  HealthBarColorOptionsTab2:SetText(L["fonts_tab_label"])
  HealthBarColorOptionsTab2:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_Fonts_Tab", container)
  end)

  HealthBarColorOptionsTab3:SetText(L["modules_tab_label"])
  HealthBarColorOptionsTab3:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_Modules_Tab", container)
  end)

  HealthBarColorOptionsTab4:SetText(L["colors_tab_label"])
  HealthBarColorOptionsTab4:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_Colors_Tab", container)
  end)

  HealthBarColorOptionsTab5:SetText(L["profiles_tab_label"])
  HealthBarColorOptionsTab5:HookScript("OnClick", function()
    clearFrame(frame)
    ACD:Open("HealthBarColor_Profiles_Tab", container)
  end)


  frame:SetScript("OnEvent", frame.Hide) 
  frame:HookScript("OnShow", function()
      ACD:Open("HealthBarColor_HealthBars_Tab", container)
      frame:RegisterEvent("PLAYER_REGEN_DISABLED")
  end)
  frame:HookScript("OnHide",function()
      clearFrame(frame)
      frame:UnregisterEvent("PLAYER_REGEN_ENABLED")
  end)
  self:UpdateOptionsFrameTabs()
  return frame
end

function addon:UpdateOptionsFrameTabs()
  --Used to hide the Font tab when the module is disabled
  if not self:IsModuleEnabled("Font_player") then
    HealthBarColorOptionsTab2:Hide()
  else
    HealthBarColorOptionsTab2:Show()
  end
  local prevTab = _G["HealthBarColorOptionsTab1"]
  for i=2, frame.numTabs do
    local tab = _G["HealthBarColorOptionsTab"..i]
    if tab:IsShown() then
      tab:SetPoint("LEFT", prevTab, "RIGHT", -16, 0)
      prevTab = tab
    end
  end
end

function addon:UpdateOptionsFrame()
  self:UpdateOptionsFrameTabs()
end

function addon:HideOptionsFrame()
  if not frame then
    return
  end
  frame:Hide()
end