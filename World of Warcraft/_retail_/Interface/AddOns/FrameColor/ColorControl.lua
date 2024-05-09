local _, addonTable = ...
local addon = addonTable.addon

local CopyTable = CopyTable

function addon:OverwriteSubgroupColors(newColor1, newColor2, newColor3, newColor4, subgroup)    
    local dbObj = self.db.profile[subgroup]
    for module,_ in pairs (dbObj) do
        dbObj[module].color1 = CopyTable(newColor1)
        dbObj[module].color2 = CopyTable(newColor2)
        dbObj[module].color3 = CopyTable(newColor3)
        dbObj[module].color4 = CopyTable(newColor4)
    end
end

function addon:ToggleSubgroupClassColors(value, subgroup)    
    local dbObj = self.db.profile[subgroup]
    for module,_ in pairs (dbObj) do
        dbObj[module].classcolored1 = value
        dbObj[module].classcolored2 = value
        dbObj[module].classcolored3 = value
        dbObj[module].classcolored4 = value
    end
end