local AddonName, Addon = ...

if (GetLocale() == "enUS") then
    Addon.Loc = {
        Title = "Rare Share",
        Died = "gestorben",
        AlreadyAnnounced = "wurde eben schon angekündigt",
        RareFound = "Rare gefunden! Wird im Chat angekündigt.",
        Enabled = "Eingeschaltet",
        Disabled = "Ausgeschaltet",
        Config = {
            RareAnnounce = {
                "Chat-Ankündigungen aktivieren",
                "Schaltet die Ankündigung im Allgemein-Channel von seltenen Gegnern, die ins Ziel genommen wurden, ein bzw. aus.",
            },
			PartyRaidChatAnnounce = {
				"Party-/Raid-Chat-Ankündigungen aktivieren (Chat-Ankündigungen müssen aktiviert sein)",
				"Aktiviert/deaktiviert die Ankündigung von Rares im Party-/Raid-Chat, wenn sie angegriffen werden (Chat-Ankündigungen müssen aktiviert sein)",
			},
            Sound = {
                "Hinweiston aktivieren",
                "Schaltet den Ton, wenn ein seltener Gegner von einem anderen Spieler zum ersten Mal ins Ziel genommen wurde ein bzw. aus.",
            },
            TomTom = {
                "Tom-Tom Wegpunkte aktivieren",
                "Schaltet die automatische Erstellung von Tom-Tom Wegpunkten an bzw. aus.",
            },
            OnDeath = {
                "Ankündigung Rare-Tod aktivieren (Benutzung auf eigene Gefahr!)",
                "Schaltet die Ankündigung über den gerade stattgefundenen Tod des seltenen Gegners ein bzw. aus.",
            },
            Duplicates = {
                "Benachrichtigungen für bereits abgeschlossene Rares aktivieren",
                "Aktiviert/deaktiviert das Reagieren auf Seltenheiten, die heute bereits abgeschlossen wurden",
            },
            MapPin = {
                "Anhängen von Kartenpin-Positionen an das Ende einer Ankündigungsnachricht",
                "Aktiviert/deaktiviert das Anhängen von Karten-Pins an Ankündigungsnachrichten"
            }
        }
    }
end