-- health ticks that display over frontline health bars on mouseover

-- yellow: all pets have ticks at 25% and 50%
-- blue: magic pets have ticks at 35% and 70% (they take at most 35% damage)
-- orange: pets facing an opponent that can Explode has a tick marking 40% of Exploder's total life

local _,t = ...
t.health = {}

-- runs when Battle UI loads for first time (could be at PLAYER_LOGIN)
function t.health:Setup()
    self.ticks = {} -- one set of ticks each for ally and enemy units in battle ui
    for i=1,2 do
        local parent = i==Enum.BattlePetOwner.Ally and PetBattleFrame.ActiveAlly or PetBattleFrame.ActiveEnemy
        -- this frame contains all the ticks for that unit so all can be shown/hid at once
        self.ticks[i] = CreateFrame("Frame",nil,parent)
        self.ticks[i]:SetPoint("TOPLEFT",parent.HealthBarFrame,6,-6)
        self.ticks[i]:SetPoint("BOTTOMRIGHT",parent.HealthBarFrame,-6,6)
        self.ticks[i].petOwner = i
        self.ticks[i]:Hide()
        -- create individual ticks within the Ticks frame for the unit
        for _,percent in ipairs({50,25,35,70,40}) do
            self.ticks[i][percent] = self:CreateTick(percent,self.ticks[i])
        end
        -- when mouse enters ally or enemy frame, show the Ticks frame for the unit
        parent:HookScript("OnEnter",t.health.ShowTicks)
        -- and while Ticks frame is shown, watch for mouse leaving to hide the Ticks frame (tick buttons will capture mouse; so can't use OnLeave)
        self.ticks[i]:SetScript("OnUpdate",t.health.HideTicks)
    end
    self:UpdateEnabled()
end

function t.health:Update()
    for i=1,2 do
        local pet = C_PetBattles.GetActivePet(i)
        local maxHealth = C_PetBattles.GetMaxHealth(i,pet)
        -- show blue ticks for magic pets (that take up to 35% damage)
        local isMagic = C_PetBattles.GetPetType(i,pet)==6
        self.ticks[i][35]:SetShown(isMagic)
        self.ticks[i][70]:SetShown(isMagic)
        -- show orange tick for opposing pets that explode
        local hasExplode
        local otherOwner = 3-i
        local otherPet = C_PetBattles.GetActivePet(otherOwner)
        -- look for active ability 282 (Explode) in opposing pet
        for j=1,3 do
            if C_PetBattles.GetAbilityInfo(otherOwner,otherPet,j)==282 then
                hasExplode = true
            end
        end
        -- if opposing pet can explode, mode orange tick to 40% of opponent's max health
        if hasExplode then
            local explodeDamage = C_PetBattles.GetMaxHealth(otherOwner,otherPet)*0.4
            self.ticks[i][40].explodeDamage = explodeDamage
            local xpos = explodeDamage * self.ticks[i][40]:GetParent():GetWidth() / maxHealth
            self.ticks[i][40]:ClearAllPoints()
            self.ticks[i][40]:SetPoint(i==1 and "TOPLEFT" or "TOPRIGHT",(i==1 and 1 or -1)*xpos,0)
        end
        self.ticks[i][40]:SetShown(hasExplode)
    end
end

-- create a tick at the given percent for the given parent
function t.health:CreateTick(percent,parent)
    local tick = CreateFrame("Button",nil,parent)
    tick:SetSize(6,8)
    tick:SetHitRectInsets(-6,-6,-6,-6)
    tick.percent = percent
    local texture = "Interface\\Buttons\\"..(percent==40 and "LegendaryOrange64" or (percent~=35 and percent~=70) and "GoldGradiant" or "BlueGrad64")
    tick.Back = tick:CreateTexture(nil,"ARTWORK")
    tick.Back:SetAllPoints(true)
    tick.Back:SetTexture(texture)
    tick.Highlight = tick:CreateTexture(nil,"HIGHLIGHT")
    tick.Highlight:SetAllPoints(true)
    tick.Highlight:SetTexture(texture)
    tick.Highlight:SetBlendMode("ADD")
    local width = parent:GetWidth()
    local isAlly = parent.petOwner==Enum.BattlePetOwner.Ally -- Enum.BattlePetOwner.Ally
    tick:SetPoint(isAlly and "BOTTOMLEFT" or "BOTTOMRIGHT",width*(percent/100)*(isAlly and 1 or -1),0)
    tick:SetScript("OnEnter",self.ShowTickTooltip)
    tick:SetScript("OnLeave",self.HideTickTooltip)
    return tick
end

-- OnEnter on ally or enemy unit will update the ticks and show them
function t.health:ShowTicks()
    if self.petOwner and t.health.ticks[self.petOwner] and BattlePetBattleUITweaksSettings.HealthTicks then
        t.health:Update()
        t.health.ticks[self.petOwner]:Show()
    end
end

-- while tick frame is visible, OnUpdate set to this will watch for mouse leaving to hide
-- (the ticks themselves and potentially other things would trigger an OnLeave if that was used)
function t.health:HideTicks(elapsed)
    if not MouseIsOver(self:GetParent()) then
        self:Hide()
    end
end

function t.health:ShowTickTooltip()
    local side = self:GetParent().petOwner
    GameTooltip:SetOwner(self,side==Enum.BattlePetOwner.Ally and "ANCHOR_TOPRIGHT" or "ANCHOR_TOPLEFT")
    local active = C_PetBattles.GetActivePet(side)
	local health = C_PetBattles.GetHealth(side,active)
	local maxHealth = C_PetBattles.GetMaxHealth(side,active)
	local tickHealth = self.percent==40 and self.explodeDamage or maxHealth*(self.percent/100)
	local label = self.percent==40 and "Explode" or format("%d%%",self.percent)

	if tickHealth>health then
		GameTooltip:AddLine(format("%s in \124cff55ff55%d healing.",label,tickHealth-health))
	else
		GameTooltip:AddLine(format("%s in \124cffff5555%d damage.",label,health-tickHealth))
	end
	GameTooltip:Show()
end

function t.health:HideTickTooltip()
    GameTooltip:Hide()
end

-- updates enabled state (called during setup and when option changes)
function t.health:UpdateEnabled()
    local isEnabled = BattlePetBattleUITweaksSettings.HealthTicks
    if isEnabled then
        t.main:AddEvent("health","PET_BATTLE_PET_CHANGED",t.health.Update)
    else
        t.main:RemoveEvent("health","PET_BATTLE_PET_CHANGED")
    end
end

t.main:RunWithBattleUILoad("health",t.health.Setup)

