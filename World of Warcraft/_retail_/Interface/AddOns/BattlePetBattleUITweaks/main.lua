-- coordinates loading and updating modules

local _,t = ...
_BattlePetBattleUITweaks = t

local events = {} -- table of events that modules have registered for callbacks
local inits = {} -- ordered list of modules that want to know when Battle Pet UI loaded

t.main = CreateFrame("Frame")

--[[ event handling ]]

-- when an event fires, call the callbacks for modules that registered it
function t.main:HandleEvent(event,...)
    if events[event] then
        for module,callback in pairs(events[event]) do
            if type(callback)=="function" then
                callback(t[module],...)
            end
        end
    end
end

-- registers an event for a module to call the given callback function
function t.main:AddEvent(module,event,callback)
    if not events[event] then
        events[event] = {}
    end
    t.main:RegisterEvent(event)
    events[event][module] = callback
end

-- unregisters an event for a module
function t.main:RemoveEvent(module,event)
    if events[event] then
        events[event][module] = nil
        -- if no more modules are registered for this event, unregister it
        if not next(events[event]) then
            t.main:UnregisterEvent(event)
        end
    end
end

t.main:SetScript("OnEvent",t.main.HandleEvent)

--[[ initialization ]]

-- set up savedvars and perform initialization
function t.main:PLAYER_LOGIN()
    t.options:Setup() -- can't wait for battle UI since user can go to options anytime
    if C_AddOns.IsAddOnLoaded("Blizzard_PetBattleUI") then
        t.main:ADDON_LOADED("Blizzard_PetBattleUI")
    else
        t.main:AddEvent("main","ADDON_LOADED",t.main.ADDON_LOADED)
    end
end
t.main:AddEvent("main","PLAYER_LOGIN",t.main.PLAYER_LOGIN)

-- watch for Blizzard_PetBattleUI loading and run registered callbacks when it has
function t.main:ADDON_LOADED(addon)
    if addon=="Blizzard_PetBattleUI" then
        t.main:RemoveEvent("main","ADDON_LOADED")
        for module,callback in pairs(inits) do
            callback(t[module])
        end
    end
end

-- use this for modules to set a callback function when Blizzard_PetBattleUI loads
function t.main:RunWithBattleUILoad(module,callback)
    if not inits[module] then
        inits[module] = callback
    end
end

