local MODULE, moduleData =  ...


-- The %s in _G.ITEM_MIN_SKILL = "Requires %s (%d)" is replaced
-- by an expansion identifier and the profession name.
-- But the order depends on the locale.
-- e: expansion identifier
-- p: profession name
moduleData.itemMinSkillString = {
  ["enUS"] = "e p",
  ["enGB"] = "e p",
  ["deDE"] = "p e",
  ["frFR"] = "p e",
  ["itIT"] = "p e",
  ["esES"] = "p e",
  ["esMX"] = "p e",
}

moduleData.expansionIdentifierToVersionNumber = {
  ["enUS"] = {
    ["Classic"] =               moduleData.EP_VANILLA,
    ["Outland"] =               moduleData.EP_BC,
    ["Northrend"] =             moduleData.EP_WRATH,
    ["Cataclysm"] =             moduleData.EP_CATA,
    ["Pandaria"] =              moduleData.EP_PANDARIA,
    ["Draenor"] =               moduleData.EP_WOD,
    ["Legion"] =                moduleData.EP_LEGION,
    ["Zandalari"] =             moduleData.EP_BFA,
    ["Kul Tiran"] =             moduleData.EP_BFA,
    ["Shadowlands"] =           moduleData.EP_SL,
    ["Dragon Isles"] =          moduleData.EP_DF,
  },
  ["enGB"] = {
    ["Classic"] =               moduleData.EP_VANILLA,
    ["Outland"] =               moduleData.EP_BC,
    ["Northrend"] =             moduleData.EP_WRATH,
    ["Cataclysm"] =             moduleData.EP_CATA,
    ["Pandaria"] =              moduleData.EP_PANDARIA,
    ["Draenor"] =               moduleData.EP_WOD,
    ["Legion"] =                moduleData.EP_LEGION,
    ["Zandalari"] =             moduleData.EP_BFA,
    ["Kul Tiran"] =             moduleData.EP_BFA,
    ["Shadowlands"] =           moduleData.EP_SL,
    ["Dragon Isles"] =          moduleData.EP_DF,
  },
  ["deDE"] = {
    ["Klassische"] =            moduleData.EP_VANILLA,        -- Would need itemMinSkillString "e p" for this.
    ["der Scherbenwelt"] =      moduleData.EP_BC,
    ["von Nordend"] =           moduleData.EP_WRATH,
    ["des Kataklysmus"] =       moduleData.EP_CATA,
    ["von Pandaria"] =          moduleData.EP_PANDARIA,
    ["von Draenor"] =           moduleData.EP_WOD,
    ["der Verheerten Inseln"] = moduleData.EP_LEGION,
    ["von Zandalar"] =          moduleData.EP_BFA,
    ["von Kul Tiras"] =         moduleData.EP_BFA,
    ["der Schattenlande"] =     moduleData.EP_SL,
    ["der Dracheninseln"] =     moduleData.EP_DF,
  },
  ["frFR"] = {
    ["classique"] =             moduleData.EP_VANILLA,
    ["de l’Outreterre"] =       moduleData.EP_BC,
    ["du Norfendre"] =          moduleData.EP_WRATH,
    ["de Cataclysm"] =          moduleData.EP_CATA,
    ["de Pandarie"] =           moduleData.EP_PANDARIA,
    ["de Draenor"] =            moduleData.EP_WOD,
    ["de Legion"] =             moduleData.EP_LEGION,
    ["de Zandalar"] =           moduleData.EP_BFA,
    ["de Kul Tiras"] =          moduleData.EP_BFA,
    ["d’Ombreterre"] =          moduleData.EP_SL,
  },
  ["itIT"] = {
    ["Classica"] =              moduleData.EP_VANILLA,
    ["delle Terre Esterne"] =   moduleData.EP_BC,
    ["di Nordania"] =           moduleData.EP_WRATH,
    ["di Cataclysm"] =          moduleData.EP_CATA,
    ["di Pandaria"] =           moduleData.EP_PANDARIA,
    ["di Draenor"] =            moduleData.EP_WOD,
    ["di Legion"] =             moduleData.EP_LEGION,
    ["di Zandalar"] =           moduleData.EP_BFA,
    ["di Kul Tiras"] =          moduleData.EP_BFA,
    ["di Shadowlands"] =        moduleData.EP_SL,
  },
  ["esES"] = {
    ["clásica"] =               moduleData.EP_VANILLA,
    ["de Terrallende"] =        moduleData.EP_BC,
    ["de Rasganorte"] =         moduleData.EP_WRATH,
    ["de Cataclysm"] =          moduleData.EP_CATA,
    ["de Pandaria"] =           moduleData.EP_PANDARIA,
    ["de Draenor"] =            moduleData.EP_WOD,
    ["de Legion"] =             moduleData.EP_LEGION,
    ["Zandalari"] =             moduleData.EP_BFA,
    ["de Kul Tiras"] =          moduleData.EP_BFA,
    ["de Shadowlands"] =        moduleData.EP_SL,
  },
  ["esMX"] = {
    ["clásica"] =               moduleData.EP_VANILLA,
    ["de Terrallende"] =        moduleData.EP_BC,
    ["de Rasganorte"] =         moduleData.EP_WRATH,
    ["de Cataclysm"] =          moduleData.EP_CATA,
    ["de Pandaria"] =           moduleData.EP_PANDARIA,
    ["de Draenor"] =            moduleData.EP_WOD,
    ["de Legion"] =             moduleData.EP_LEGION,
    ["Zandalari"] =             moduleData.EP_BFA,
    ["de Kul Tiras"] =          moduleData.EP_BFA,
    ["de Shadowlands"] =        moduleData.EP_SL,
  },



  -- Check these items to create more locales...
  -- Classic:      https://www.wowhead.com/item=6661/recipe-savory-deviate-delight
  -- Outland:      https://www.wowhead.com/item=34126/recipe-shoveltusk-soup
  -- Northrend:    https://www.wowhead.com/item=43036/recipe-dragonfin-filet
  -- Cataclysm:    https://www.wowhead.com/item=62800/recipe-seafood-magnifique-feast
  -- Pandaria:     https://www.wowhead.com/item=74658/recipe-spicy-vegetable-chips
  -- Draenor:      https://www.wowhead.com/item=116347/recipe-burnished-leather-bag
  -- Legion:       https://www.wowhead.com/item=133830/recipe-lavish-suramar-feast
  -- Zandalari:    https://www.wowhead.com/spell=265817/zandalari-cooking
  -- Kul Tiran:    https://www.wowhead.com/spell=264646/kul-tiran-cooking
  -- Shadowlands:  https://www.wowhead.com/spell=309831/shadowlands-cooking
  -- Dragon Isles: https://www.wowhead.com/item=194641/design-elemental-lariat


}