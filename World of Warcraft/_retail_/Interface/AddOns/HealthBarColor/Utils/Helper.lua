local _, addonTable = ...
local addon = addonTable.addon

function addon:ConvertDbNumberToOutlinemode(number)
  local outlinemodes = {
      [1] = "NONE",
      [2] = "OUTLINE",
      [3] = "THICKOUTLINE",
      [4] = "MONOCHROME",
      [5] = "MONOCHROMEOUTLINE",
      [6] = "MONOCHROMETHICKOUTLINE",
  }
  local outlinemode = outlinemodes[number]
  return outlinemode or ""
end
