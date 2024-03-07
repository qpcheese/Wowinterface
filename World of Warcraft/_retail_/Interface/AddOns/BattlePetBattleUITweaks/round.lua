-- round counter that displays instead of the Vs bit at the top of the battle UI

local _,t = ...
t.round = {}

-- runs when Battle UI loads for first time (or at PLAYER_LOGIN if already loaded then)
function t.round:Setup()
    self.roundTitle = PetBattleFrame:CreateFontString(nil,"ARTWORK","GameFontNormal")
    self.roundTitle:SetPoint("BOTTOM",PetBattleFrame.TopVersusText,"TOP",1,2)
    self.roundTitle:SetText("Round")
    self.roundTitle:Hide()
    self:UpdateEnabled()
end

-- updates the current round display
function t.round:Update(round)
    local versus = PetBattleFrame.TopVersusText
    versus:SetPoint("TOP",PetBattleFrame,"TOP",-1,-17)
    versus:SetFontObject("Game24Font")
    versus:SetText(tonumber(round) and round+1 or "?")
    self.roundTitle:Show()
end

-- when battle ends, restore the displayed round to the big "Vs" so the first
-- second of battle shows Vs before round beginss
function t.round:Close()
    local versus = PetBattleFrame.TopVersusText
    versus:SetPoint("TOP",PetBattleFrame,"TOP",0,-6)
    versus:SetFontObject("GameFont_Gigantic")
    versus:SetText(PET_BATTLE_UI_VS)
    self.roundTitle:Hide()
end

-- updates enabled state (called during setup and when option changes)
function t.round:UpdateEnabled()
    local isEnabled = BattlePetBattleUITweaksSettings.RoundCounter
    if isEnabled then
        t.main:AddEvent("round","PET_BATTLE_CLOSE",self.Close)
        t.main:AddEvent("round","PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE",self.Update)
        if not self.roundTitle:IsVisible() and C_PetBattles.IsInBattle() then
            self:Update()
        end
    else
        t.main:RemoveEvent("round","PET_BATTLE_CLOSE")
        t.main:RemoveEvent("round","PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE")
        if self.roundTitle:IsVisible() then
            self:Close()
        end
    end
end

t.main:RunWithBattleUILoad("round",t.round.Setup)
