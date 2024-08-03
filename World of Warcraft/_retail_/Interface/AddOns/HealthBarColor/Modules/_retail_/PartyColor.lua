local _, addonTable = ...
local addon = addonTable.addon

local UnitClass = UnitClass
local CreateColor = CreateColor
local MAX_PARTY_MEMBERS = MAX_PARTY_MEMBERS

local module = addon:NewModule("PartyColor")
Mixin(module, addonTable.hooks)

function module:OnEnable()
  local function on_to_player_art(PartyMemberFrame)
    local class = select(2, UnitClass(PartyMemberFrame.unit))

    if not class then
      return
    end

    local hp_texture = PartyMemberFrame.HealthBarContainer.HealthBar.HealthBarTexture
    local classColorStart = addonTable.classColors[class].classColorStart
    local classColorEnd = addonTable.classColors[class].classColorEnd
    -- Desaturation would not work after reloading, but changing texture always seems to work.
    hp_texture:SetAtlas("UI-HUD-UnitFrame-Party-PortraitOn-Bar-Health-Status", TextureKitConstants.UseAtlasSize)
    hp_texture:SetGradient("HORIZONTAL", CreateColor(classColorStart.r, classColorStart.g, classColorStart.b, classColorStart.a), CreateColor(classColorEnd.r, classColorEnd.g, classColorEnd.b, classColorEnd.a))
  end

  for i=1, MAX_PARTY_MEMBERS do
    local PartyMemberFrame = PartyFrame["MemberFrame" .. i]
    if PartyMemberFrame then
      self:HookFunc(PartyMemberFrame, "ToPlayerArt", on_to_player_art)
      on_to_player_art(PartyMemberFrame)
    end
  end
end

function module:OnDisable()
  self:DisableHooks()
  for i=1, MAX_PARTY_MEMBERS do
    local PartyMemberFrame = PartyFrame["MemberFrame" .. i]
    if PartyMemberFrame then
      local hp_texture = PartyMemberFrame.HealthBarContainer.HealthBar.HealthBarTexture
      hp_texture:SetAtlas("UI-HUD-UnitFrame-Party-PortraitOn-Bar-Health", TextureKitConstants.UseAtlasSize)
      hp_texture:SetVertexColor(1, 1, 1)
    end
  end
end


