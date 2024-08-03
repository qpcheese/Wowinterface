-- interface options panel to turn tweaks on/off

local _,t = ...
t.options = CreateFrame("Frame",nil,InterfaceOptionsFramePanelContainer)
t.options.name = "Battle Pet UI Tweaks"
if select(4,GetBuildInfo())>100000 then
    Settings.RegisterAddOnCategory(Settings.RegisterCanvasLayoutCategory(t.options, "Battle Pet UI Tweaks"))
else
    InterfaceOptions_AddCategory(t.options)
end

BattlePetBattleUITweaksSettings = {} -- savedvar of settings
local settings

-- list of options: {<savedvar key>,<displayed name>,<default value>,<module>,<description>}
t.options.info = {
    {"RoundCounter","Round Counter",true,"round","Display the number of the current round in the 'Vs' circle at the top of the battle UI."},
    {"CurrentStats","Current Stats",true,"stats","Display the health percentage, power and speed of frontline pets beneath their health bars."},
    {"HealthTicks","Health Ticks",true,"health","Display ticks for important health threshholds on mouseover of frontline pet health bars."},
    {"KeyBinds","Key Binds",true,"binds","Bind the Forfeit, Pass and pet swapping buttons to keys 6, 7 and 1-3 respectively."},
    {"EnemyAbilities","Enemy Abilities",true,"abilities","Display enemy abilities and their cooldown at the bottom of the battle UI."}
}

-- this setup is called directly from t.main before starting setup of other parts of the addon (unlike the other
-- modules, this one can be used before ever entering a battle; and we want to make sure savedvars are set up
-- before other modules do their thing.)
function t.options:Setup()

    -- if BattlePetBinds is enabled, then default of KeyBinds should be false
    if C_AddOns.IsAddOnLoaded("BattlePetBinds") then
        self.info[4][3] = false
    end
    -- if Derangement Pet Battle Cooldowns or PetTracker is enabled, then default of EnemyAbilities should be false
    if C_AddOns.IsAddOnLoaded("DerangementPetBattleCooldowns") or C_AddOns.IsAddOnLoaded("PetTracker") then
        self.info[5][3] = false
    end

    settings = BattlePetBattleUITweaksSettings
    -- load defaults if not defined
    for _,info in ipairs(t.options.info) do
        if settings[info[1]]==nil then
            settings[info[1]] = info[3]
        end
    end
    self:Hide()
    self.title = t.options:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
    self.title:SetPoint("TOPLEFT",16,-16)
    self.title:SetText("Battle Pet Battle UI Tweaks")
    self.version = t.options:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
    self.version:SetPoint("BOTTOMLEFT",self.title,"BOTTOMRIGHT",4,0)
    self.version:SetText("version "..C_AddOns.GetAddOnMetadata("BattlePetBattleUITweaks","Version"))
    self.desc = t.options:CreateFontString(nil,"ARTWORK","GameFontHighlight")
    self.desc:SetPoint("TOPLEFT",16,-40)
    self.desc:SetText("A collection of quality-of-life improvements for the pet battle UI")

    self.list = CreateFrame("Frame",nil,t.options,"InsetFrameTemplate3")
    self.list:SetPoint("TOPLEFT",32,-72)
    self.list:SetPoint("TOPRIGHT",-32,-72)

    self.buttons = {}
    for i,info in ipairs(self.info) do
        self.buttons[i] = self:CreateOption(self.list,i,"TOPLEFT",self.list,"TOPLEFT",8,-(i-1)*50-8)
    end
    self.list:SetHeight(#self.info*50+16)

    -- adjust how far text can run based on list (and ultimately container) size
    self:SetScript("OnShow",function(self)
        local width = self.list:GetWidth()
        for i,button in ipairs(self.buttons) do
            button:SetHitRectInsets(-2,-220,-2,2)
        end
        self:refresh()
    end)

end

-- creates an option for the t.options.info index
function t.options:CreateOption(parent,index,anchorPoint,relativeTo,relativePoint,xoff,yoff)
    local info = self.info[index]
    local button = CreateFrame("CheckButton",nil,parent,"UICheckButtonTemplate")
    button.index = index
    button.var = info[1]
    button.text:SetText(info[2])
    button:SetPoint(anchorPoint,relativeTo,relativePoint,xoff,yoff)
    button:SetHitRectInsets(-2,-220,-2,2)
    button.text:SetFontObject(GameFontNormal)
    button.text:ClearAllPoints()
    button.text:SetPoint("LEFT",button,"RIGHT",4,0)
    button.desc = button:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall")
    button.desc:SetPoint("TOPLEFT",button.text,"BOTTOMLEFT",0,-6)
    button.desc:SetJustifyH("LEFT")
    button.desc:SetTextColor(0.75,0.75,0.75)
    button.desc:SetText(info[5])
    button:SetScript("OnClick",t.options.OptionOnClick)
    return button
end

function t.options.refresh()
    local self = t.options
    for _,button in ipairs(self.buttons) do
        button:SetChecked(button.var and settings[button.var])
    end
end

function t.options:OptionOnClick()
    settings[self.var] = not settings[self.var]
    local module = t.options.info[self.index][4]
    if t[module].UpdateEnabled then
        t[module]:UpdateEnabled()
    end
end