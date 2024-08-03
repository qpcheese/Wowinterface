--[[
    Should only be used as a last resort, but may be necessary in some cases.
]]
local _, addonTable = ...
local addon = addonTable.addon

local queue = {}
function addon:DelayUntilAfterCombat(callback)
  self:RegisterEvent("PLAYER_REGEN_ENABLED", "OnCombatEnd")
  table.insert(queue, callback)
end

function addon:OnCombatEnd()
  for i=1, #queue do
    queue[i]()
  end
  queue = {}
  self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end


