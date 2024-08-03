local addonName, addonTable = ...
local addon = addonTable.addon

local defaultColor1 = {r=0.33,g=0.33,b=0.33,a=1} --frame
local defaultColor2 = {r=0.55,g=0.55,b=0.55,a=1} --background
local defaultColor3 = {r=0.11,g=0.11,b=0.11,a=1} --tabs
local defaultColor4 = {r=0.66,g=0.66,b=0.66,a=1} --controls
local defaultColor5 = {r=0.28,g=0.28,b=0.28,a=1} --wildcard

local defaults = {
    profile = {
        modules = {
            ["*"] = { 
                enabled = true,
            },
        },
        --subgroup
        ["*"] = { 
            --module
            ["**"] = { 
                color1 = defaultColor1,
                classcolored1 = false,
                color2 = defaultColor2,
                classcolored2 = false,
                color3 = defaultColor3,
                classcolored3 = false,
                color4 = defaultColor4,
                classcolored4 = false,
                color5 = defaultColor5,
                classcolored5 = false,
            },
            Ace3_Skin = { 
                color2 = {r=0.33,g=0.33,b=0.33}
            },
            FrameColor_Skin = { 
                color2 = {r=0.8,g=0.8,b=0.8,a=1}
            },
            PlayerFrame = {
                hide_pulsing_resting = true,
                color2 = defaultColor1,
            },
            TargetFrame = {
                color2 = {r=0.2,g=0.2,b=0.2},
                color3 = {r=1,g=0,b=0},
            },
            FocusFrame = {
                color2 = {r=0.2,g=0.2,b=0.2},
                color3 = {r=1,g=0,b=0},
            },
            CharacterFrame = {
                classcolored2 = true, 
            },
            InspectFrame = {
                classcolored2 = true, 
            },
            TradeFrame = {
                classcolored2 = true, 
            },
            ClassTalentFrame = { --cata
                classcolored2 = true, 
            },
            PlayerSpellsFrame = { --retail
                classcolored2 = true, 
            },
            ChannelFrame = {
                color2 = {r=0.2039215862751007,g=0.6431372761726379,b=1,a=1}
            },
            FriendsFrame = {
                color2 = {r=0.2039215862751007,g=0.6431372761726379,b=1,a=1}
            },
            DelvesFrame = {
                color2 = {r=0.67,g=0.83,b=0.45,a=1}
            }
        },
        MicroMenu = {
            ["*"] = { 
                color1 = defaultColor1,
                color2 = {r=1,g=1,b=1,a=1},
                color3 = {r=0.3,g=0.3,b=0.3,a=1},
                color4 = {r=0,g=0,b=0,a=1},
            },
        },
        ColorOverrides = {
            ClassColors = {
                DEATHKNIGHT   = {r=0.77,g=0.12,b=0.23},
                DEMONHUNTER   = {r=0.64,g=0.19,b=0.79},
                DRUID         = {r=1.00,g=0.49,b=0.04},
                EVOKER        = {r=0.20,g=0.58,b=0.50},
                HUNTER        = {r=0.67,g=0.83,b=0.45},
                MAGE          = {r=0.25,g=0.78,b=0.923},
                MONK          = {r=0.00,g=1.00,b=0.60},
                PALADIN       = {r=0.96,g=0.55,b=0.73},
                PRIEST        = {r=1.00,g=1.00,b=1.00},
                ROGUE         = {r=1.00,g=0.96,b=0.41},
                SHAMAN        = {r=0.00,g=0.44,b=0.87},
                WARLOCK       = {r=0.53,g=0.53,b=0.9},
                WARRIOR       = {r=0.78,g=0.61,b=0.43},
            },
            ReactionColors = {
                HOSTILE       = {r=1,g=0,b=0},
                NEUTRAL       = {r=1,g=1,b=0},
                FRIENDLY      = {r=0,g=1,b=0},
            },
        },
    },
}

function addon:LoadDataBase()
    self.db = LibStub("AceDB-3.0"):New(addonName.."DB", defaults, true) 
    --db callbacks
    self.db.RegisterCallback(self, "OnProfileChanged", "ReloadConfig")
    self.db.RegisterCallback(self, "OnProfileCopied", "ReloadConfig")
    self.db.RegisterCallback(self, "OnProfileReset", "ReloadConfig")
end
