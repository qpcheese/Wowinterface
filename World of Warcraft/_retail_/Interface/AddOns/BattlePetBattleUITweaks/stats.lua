-- displays current health %, power and speed beneath both frontline pets

local _,t = ...
t.stats = {}

-- texcoords into PetBattles\PetBattle-StatIcons for each stat type
t.stats.texCoords = {health={.5,1,.5,1}, power={0,.5,0,.5}, speed={0,.5,.5,1}}

-- runs when Battle UI loads for first time (could be at PLAYER_LOGIN)
function t.stats:Setup()
    self.stats = {} -- one set of stats each for ally and enemy units in battle ui
    for i=1,2 do
        self.stats[i] = {}
        local parent = i==Enum.BattlePetOwner.Ally and PetBattleFrame.ActiveAlly or PetBattleFrame.ActiveEnemy
        local anchor = i==Enum.BattlePetOwner.Ally and "BOTTOMRIGHT" or "BOTTOMLEFT"
        local offset = i==Enum.BattlePetOwner.Ally and -180 or 50
        self.stats[i].health = self:CreateStat("health",parent,anchor,offset)
        self.stats[i].power = self:CreateStat("power",parent,anchor,offset+55)
        self.stats[i].speed = self:CreateStat("speed",parent,anchor,offset+110)        
    end
    self:UpdateEnabled()
end

-- updates the displayed stats of both frontline pets
function t.stats:Update()
    for i=1,2 do
        local pet = C_PetBattles.GetActivePet(i)
        local health = C_PetBattles.GetHealth(i,pet) or 0
        local maxHealth = C_PetBattles.GetMaxHealth(i,pet) or 1
        local power = C_PetBattles.GetPower(i,pet)
        local speed = C_PetBattles.GetSpeed(i,pet)
        self.stats[i].health.text:SetText(format("%.0f%%",health*100/maxHealth))
        self.stats[i].power.text:SetText(C_PetBattles.GetPower(i,pet))
        self.stats[i].speed.text:SetText(C_PetBattles.GetSpeed(i,pet))
    end
end

-- creates a health, Power or Speed frame (statType) for the given unit (parent frame) and anchor
function t.stats:CreateStat(statType,parent,anchor,xoff)
    local stat = CreateFrame("Frame",nil,parent)
    stat:SetSize(16,16)
    stat.icon = stat:CreateTexture(nil,"ARTWORK")
    stat.icon:SetAllPoints(true)
    stat.icon:SetTexture("Interface\\PetBattles\\PetBattle-StatIcons")
    stat.icon:SetTexCoord(unpack(self.texCoords[statType]))
    stat.text = stat:CreateFontString(nil,"ARTWORK","GameFontHighlight")
    stat.text:SetPoint("LEFT",stat.icon,"RIGHT",2,0)
    stat.back = stat:CreateTexture(nil,"BACKGROUND")
    stat.back:SetPoint("TOPLEFT",-2,2)
    stat.back:SetPoint("BOTTOMRIGHT",stat.text,2,-2)
    stat.back:SetColorTexture(0,0,0,0.35)
    stat:SetPoint("TOP",parent,anchor,xoff,10)
    return stat
end

-- updates enabled state (called during setup and when option changes)
function t.stats:UpdateEnabled()
    local isEnabled = BattlePetBattleUITweaksSettings.CurrentStats
    if isEnabled then
        t.main:AddEvent("stats","PET_BATTLE_AURA_APPLIED",t.stats.Update)
        t.main:AddEvent("stats","PET_BATTLE_AURA_CHANGED",t.stats.Update)
        t.main:AddEvent("stats","PET_BATTLE_AURA_CANCELED",t.stats.Update)
        t.main:AddEvent("stats","PET_BATTLE_HEALTH_CHANGED",t.stats.Update)
        t.main:AddEvent("stats","PET_BATTLE_PET_CHANGED",t.stats.Update)
        t.main:AddEvent("stats","PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE",t.stats.Update)
        if C_PetBattles.IsInBattle() then
            self:Update()
        end
    else
        t.main:RemoveEvent("stats","PET_BATTLE_AURA_APPLIED")
        t.main:RemoveEvent("stats","PET_BATTLE_AURA_CHANGED")
        t.main:RemoveEvent("stats","PET_BATTLE_AURA_CANCELED")
        t.main:RemoveEvent("stats","PET_BATTLE_HEALTH_CHANGED")
        t.main:RemoveEvent("stats","PET_BATTLE_PET_CHANGED")
        t.main:RemoveEvent("stats","PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE")
    end
    for i=1,2 do
        self.stats[i].health:SetShown(isEnabled)
        self.stats[i].power:SetShown(isEnabled)
        self.stats[i].speed:SetShown(isEnabled)
    end
end

t.main:RunWithBattleUILoad("stats",t.stats.Setup)
