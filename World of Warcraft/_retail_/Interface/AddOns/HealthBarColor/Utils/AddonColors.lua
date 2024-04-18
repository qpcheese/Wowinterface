local _, addonTable = ...
local addon = addonTable.addon

addonTable.classColors = {}
addonTable.reactionColors = {}
addonTable.selectionColors = {}
addonTable.powerColors = {}
addonTable.debuffColors = {}

function addon:UpdateAddonColors()
  --[[
    Copy is important for profile switching as the old profile no longer exists after that and the colors inside the hbc_units would point to nil
    ]]
  addonTable.classColors = CopyTable(self.db.profile.addonColors.classColors)
  addonTable.reactionColors = CopyTable(self.db.profile.addonColors.reactionColors)
  addonTable.powerColors = CopyTable(self.db.profile.addonColors.powerColors)
  addonTable.debuffColors = CopyTable(self.db.profile.addonColors.debuffColors)
end