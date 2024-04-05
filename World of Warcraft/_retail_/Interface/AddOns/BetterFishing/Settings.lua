local addonName = ...
local BetterFishing = {}

EventUtil.ContinueOnAddOnLoaded(addonName, function()
  BetterFishingDB = BetterFishingDB or {};
  BetterFishing:CreateSettings()
end)

function BetterFishing:CreateSettings()
  local optionsFrame
  ---@class optionsFrame : Frame
  optionsFrame = CreateFrame("Frame", nil, nil, "VerticalLayoutFrame")
  optionsFrame.spacing = 4
  local category, layout = Settings.RegisterCanvasLayoutCategory(optionsFrame, "Better Fishing |Tinterface/cursor/crosshair/fishing:18:18:0:0|t");
  category.ID = "Better Fishing";
  Settings.RegisterAddOnCategory(category);

  local layoutIndex = 0
	local function GetLayoutIndex()
		layoutIndex = layoutIndex + 1
		return layoutIndex
	end
  ---@class Header : Frame
  local Header = CreateFrame("Frame", nil, optionsFrame)
  Header:SetSize(150, 50)
  local headerText = Header:CreateFontString(nil, "ARTWORK", "GameFontHighlightHuge")
  headerText:SetPoint("TOPLEFT", 7, -22)
  headerText:SetText("Better Fishing")
  local divider = Header:CreateTexture(nil, "ARTWORK")
  divider:SetAtlas("Options_HorizontalDivider", true)
  divider:SetPoint("BOTTOMLEFT", -50)
  Header.layoutIndex = GetLayoutIndex()
  Header.bottomPadding = 10
  local function makeCheckButton(text)
    ---@class checkButton : CheckButton
    local checkButton = CreateFrame("CheckButton", addonName.."CheckBox", optionsFrame, "SettingsCheckBoxTemplate")
    checkButton.text = checkButton:CreateFontString(addonName.."CheckBoxText", "ARTWORK", "GameFontNormal")
    checkButton.text:SetText(text)
    checkButton.text:SetPoint("LEFT", checkButton, "RIGHT", 4, 0)
    checkButton:SetSize(21,20)

    return checkButton
  end
  local settingsInfo = {
    { option = "enhanceSounds", detail = "Enhance Sounds" },
    { option = "doubleClickEnabled", detail = "Double Click to cast" },
    { option = "recastOnDoubleClick", detail = "When Double Click is enabled allow recasting while fishing" },
    { option = "overrideLunker", detail = "Allow Fishing while \"Looking for Lunkers\" (Dragonflight) buff is active", minExpansion = LE_EXPANSION_DRAGONFLIGHT },
    { option = "objectIconDisabled", detail = "Disable icon above bobber (visibility varies for nameplate addons)", minExpansion = LE_EXPANSION_DRAGONFLIGHT }
  }

  for _, keyInfo in ipairs(settingsInfo) do
    if not keyInfo.minExpansion or LE_EXPANSION_LEVEL_CURRENT >= keyInfo.minExpansion then
      ---@class checkButton
      local checkButton = makeCheckButton(keyInfo.detail)
      checkButton.layoutIndex = GetLayoutIndex()
      checkButton:SetHitRectInsets(0,-checkButton.text:GetWidth(), 0, 0)
      checkButton.HoverBackground = nil
      checkButton:SetChecked(BetterFishingDB[keyInfo.option])
      checkButton:SetScript("OnClick", function()
        BetterFishingDB[keyInfo.option] = not BetterFishingDB[keyInfo.option]
        checkButton:SetChecked(BetterFishingDB[keyInfo.option])
      end)

    end
  end

  local function FormatPercentageRound(value)
    return FormatPercentage(value, true);
  end

  local right = MinimalSliderWithSteppersMixin.Label.Right
  local slider = CreateFrame("Slider", addonName.."Slider", optionsFrame, "MinimalSliderWithSteppersTemplate")
  local formatters = {}
  formatters[right] = CreateMinimalSliderFormatter(right, FormatPercentageRound);
  slider:Init(BetterFishingDB.enhanceSoundsScale or 1, 0, 1, 20, formatters)
  slider:SetPoint("LEFT", addonName.."CheckBoxText", "RIGHT", 10, 0)
  local function OnValueChanged(_, value)
    BetterFishingDB.enhanceSoundsScale = value
  end
  slider:RegisterCallback(MinimalSliderWithSteppersMixin.Event.OnValueChanged, OnValueChanged)
  optionsFrame:Layout()
end

SLASH_BETTERFISHING1, SLASH_BETTERFISHING2 = '/bf', '/betterfishing'
SlashCmdList.BETTERFISHING = function(msg)
  Settings.OpenToCategory("Better Fishing")
end