local _, addonTable = ...
local addon = addonTable.addon

if IsAddOnLoaded("FrameColor") then
  local info = 
  {
    moduleName = "HealthBarColor",
    color1 = 
    {
      name = "Main",
      desc = "",
    },
    color2 = 
    {
      name = "Background",
      desc = "",
      hasAlpha = true,
    },
    color3 = 
    {
      name = "Tabs",
      desc = "",
    },
  }

  local module = FrameColor_CreateSkinModule(info)

  function module:OnEnable()
    local main_color = self:GetColor1()
    local bg_color = self:GetColor2()
    local tab_color = self:GetColor3()
    self:Recolor(main_color, bg_color, tab_color, 1)
  end

  function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, color, 0)
  end

  function module:Recolor(main_color, bg_color, tab_color, desaturation)
    for _, texture in pairs(
      {
        HealthBarColorOptionsPortraitFrame,
        HealthBarColorOptionsTopBorder,
        HealthBarColorOptionsTopRightCorner,
        HealthBarColorOptionsRightBorder,
        HealthBarColorOptionsBotRightCorner,
        HealthBarColorOptionsBtnCornerRight,
        HealthBarColorOptionsBotLeftCorner,
        HealthBarColorOptionsBtnCornerLeft,
        HealthBarColorOptionsLeftBorder,
        HealthBarColorOptionsBottomBorder,
      }
    ) do
      texture:SetDesaturation(desaturation)
      texture:SetVertexColor(main_color.r,main_color.g,main_color.b) 
    end
    local backgroundTexture = HealthBarColorOptionsBg
    if backgroundTexture then
      backgroundTexture:SetDesaturation(desaturation)
      backgroundTexture:SetVertexColor(bg_color.r, bg_color.g, bg_color.b, bg_color.a)
    end
    for _ ,texture in pairs(
      {
        HealthBarColorOptionsTab1Left,
        HealthBarColorOptionsTab1Middle,
        HealthBarColorOptionsTab1Right,
        HealthBarColorOptionsTab2Left,
        HealthBarColorOptionsTab2Middle,
        HealthBarColorOptionsTab2Right,
        HealthBarColorOptionsTab3Left,
        HealthBarColorOptionsTab3Middle,
        HealthBarColorOptionsTab3Right,
        HealthBarColorOptionsTab4Left,
        HealthBarColorOptionsTab4Middle,
        HealthBarColorOptionsTab4Right,
        HealthBarColorOptionsTab5Left,
        HealthBarColorOptionsTab5Middle,
        HealthBarColorOptionsTab5Right,
      }
    ) do 
      texture:SetVertexColor(tab_color.r,tab_color.g,tab_color.b,tab_color.a) 
    end
  end
end