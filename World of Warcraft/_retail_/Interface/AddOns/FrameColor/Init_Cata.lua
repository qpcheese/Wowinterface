local _, addonTable = ...

addonTable.isClassic = true
addonTable.isWrath = true
addonTable.isCata = true

addonTable.playerClass = select(2,UnitClass("player"))
addonTable.classColor = RAID_CLASS_COLORS[addonTable.playerClass]

addonTable.texturePaths = {
    PortraitIcon = "Interface\\AddOns\\FrameColor\\Textures\\Icon_Circle.tga",
    ParchmentFrame = "Interface\\Stationery\\StationeryTest1.blp",
}