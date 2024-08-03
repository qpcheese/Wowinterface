-- adds key bindings to forfeit (6), pass (7), and switching pets (1-3 while swapping)

local _,t = ...
t.binds = {}

local FORFEIT_KEY = "6"
local PASS_KEY = "7"
local FORFEIT_WAIT = 1.5 -- number of seconds that holding down forfeit button will forfeit and accept confirmation

local cooldownDone

function t.binds:Setup()
    -- set up bindings for Forfeit and Pass while PetBattleFrame.BottomFrame is up
    self.passOrForfeit = CreateFrame("Button",nil,PetBattleFrame.BottomFrame)
    self.passButton = CreateFrame("Button","BattlePetBattleUITweaksPass",self.passOrForfeit)
    self.forfeitButton = CreateFrame("Button","BattlePetBattleUITweaksForfeit",self.passOrForfeit)
    self.forfeitButton:RegisterForClicks("AnyUp","AnyDown")
    self.passButton:SetScript("OnClick",function(self) PetBattleFrame.BottomFrame.TurnTimer.SkipButton:Click() end)
    self.passOrForfeit:SetScript("OnShow",t.binds.SetBindsPassOrForfeit)
    self.passOrForfeit:SetScript("OnHide",t.binds.ClearBinds)

    -- "reverse" cooldown spinner to countdown when releasing the forfiet bind will confirm the forfeit
    self.forfeitButton.Cooldown = CreateFrame("Cooldown",nil,PetBattleFrame.BottomFrame.ForfeitButton,"CooldownFrameTemplate")
    self.forfeitButton.Cooldown:SetReverse(true)
    self.forfeitButton.Cooldown:Hide()
    -- there is both a down and up "click" to this button
    self.forfeitButton:SetScript("OnClick",function(self,_,down)
        if down then -- on down, click the forfeit button and start a cooldown
            PetBattleFrame.BottomFrame.ForfeitButton:Click()
            self.Cooldown:SetCooldown(GetTime(),FORFEIT_WAIT)
            cooldownDown = nil
        else -- if up, either forfeit or dismiss coolodnw
            if cooldownDone then -- if cooldown finished, forfeit match
                C_PetBattles.ForfeitGame()
            else -- if cooldown didn't finish, abort it by hiding the cooldown
                self.Cooldown:Hide()
            end
            cooldownDone = nil
        end
    end)
    -- when cooldown spinner finishes, close the dialog and flag that the cooldown finished
    self.forfeitButton.Cooldown:SetScript("OnCooldownDone",function(self,...)
        -- simular a click of the cancel button to close the forfeit dialog
        for i=1,3 do -- searching top 3 popups to make sure we're closing right dialog
            local popup = _G["StaticPopup"..i]
            if popup and popup:IsVisible() and (popup.which=="PET_BATTLE_FORFEIT_NO_PENALTY" or popup.which=="PET_BATTLE_FORFEIT") then
                _G["StaticPopup"..i.."Button2"]:Click()
            end
        end
        cooldownDone = true
    end)

    -- close the cooldown spinner when the forfeit dialog dismissed (in case they clicked okay/cancel while key down)
    for i=1,3 do
        local popup = _G["StaticPopup"..i]
        if popup then
            popup:HookScript("OnHide",function(self)
                if self.which=="PET_BATTLE_FORFEIT_NO_PENALTY" or self.which=="PET_BATTLE_FORFEIT" then
                    t.binds.forfeitButton.Cooldown:Hide()
                end
            end)
        end
    end

    -- set up bindings for 1-3 while PetBattleFrame.BottomFrame.PetSelectionFrame is up
    self.switch = CreateFrame("Frame",nil,PetBattleFrame.BottomFrame.PetSelectionFrame)
    self.switchButtons = {
        CreateFrame("Button","BattlePetBattleUITweaksPet1",self.switch),
        CreateFrame("Button","BattlePetBattleUITweaksPet2",self.switch),
        CreateFrame("Button","BattlePetBattleUITweaksPet3",self.switch)
    }
    for i=1,3 do
        self.switchButtons[i]:SetScript("OnClick",function(self) PetBattleFrame.BottomFrame.PetSelectionFrame["Pet"..self:GetID()]:Click() end)
    end
    self.switch:SetScript("OnShow",t.binds.SetBindsSwitch)
    self.switch:SetScript("OnHide",t.binds.ClearBinds)

    -- support for pettracker switcher
    if C_AddOns.IsAddOnLoaded("PetTracker") then
        PetBattleFrame.BottomFrame.SwitchPetButton:SetScript("PreClick",function(self)
            if PetTrackerSwitcher and not t.binds.altSwitch then
                t.binds.altSwitch = CreateFrame("Frame",nil,PetTrackerSwitcher)
                t.binds.altSwitch:SetScript("OnSHow",t.binds.SetBindsSwitch)
                t.binds.altSwitch:SetScript("OnHide",t.binds.ClearBinds)
            end
        end)
    end

    t.binds:CreateHotKeys()
    t.binds:UpdateEnabled()
end

-- in the OnShow of passOrForfeit (child of PetBattleFrame.BottomFrame), enable Forfeit and Pass bindings
function t.binds:SetBindsPassOrForfeit()
    if BattlePetBattleUITweaksSettings.KeyBinds then
        SetOverrideBindingClick(self,true,PASS_KEY,"BattlePetBattleUITweaksPass")
        SetOverrideBindingClick(self,true,FORFEIT_KEY,"BattlePetBattleUITweaksForfeit")
    end
end

-- in the OnShow of switch (child of PetBattleFrame.BottomFrame.PetSelectionFrame), enable 1-3 bindings
function t.binds:SetBindsSwitch()
    if BattlePetBattleUITweaksSettings.KeyBinds then
        for i=1,3 do
            SetOverrideBindingClick(self,true,i,t.binds.switchButtons[i]:GetName())
            t.binds.switchButtons[i]:SetID(i)
        end
    end
end

-- in the OnHide of either of the above, clear their related bindings
function t.binds:ClearBinds()
    ClearOverrideBindings(self)
end

-- creates visible letters attached to the buttons
function t.binds:CreateHotKeys()
    -- forfeit already has a HotKey
    PetBattleFrame.BottomFrame.ForfeitButton.HotKey:SetText(FORFEIT_KEY)
    -- pass panel button
    local skipButton = PetBattleFrame.BottomFrame.TurnTimer.SkipButton
    skipButton.hotkey = skipButton:CreateFontString(nil,"OVERLAY","NumberFontNormalSmallGray")
    skipButton.hotkey:SetPoint("RIGHT",-1,-1)
    skipButton.hotkey:SetText(PASS_KEY)
    -- switch pets 1 to 3
    for i=1,3 do
        local pet = PetBattleFrame.BottomFrame.PetSelectionFrame["Pet"..i]
        pet.hotkey = pet:CreateFontString(nil,"OVERLAY","NumberFontNormalSmallGray")
        pet.hotkey:SetPoint("TOPRIGHT",pet.HealthBarBG,"TOPRIGHT",2,18)
        pet.hotkey:SetText(i)
    end
end

-- updates enabled state (called during setup and when option changes)
function t.binds:UpdateEnabled()
    local isEnabled = BattlePetBattleUITweaksSettings.KeyBinds
    PetBattleFrame.BottomFrame.ForfeitButton.HotKey:SetShown(isEnabled)
    PetBattleFrame.BottomFrame.TurnTimer.SkipButton.hotkey:SetShown(isEnabled)
    for i=1,3 do
        PetBattleFrame.BottomFrame.PetSelectionFrame["Pet"..i].hotkey:SetShown(isEnabled)
    end
    -- binds are set/cleared when the following two frames are show/hidden (and on screen; safe to show out of battle)
    self.passOrForfeit:SetShown(isEnabled)
    self.switch:SetShown(isEnabled)
end

t.main:RunWithBattleUILoad("binds",t.binds.Setup)
