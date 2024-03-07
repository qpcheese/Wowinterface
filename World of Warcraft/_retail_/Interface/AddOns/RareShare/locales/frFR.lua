local AddonName, Addon = ...
 
if (GetLocale() == "frFR") then
    Addon.Loc = {
        Title = "Rare Share",
        Died = "est mort",
        AlreadyAnnounced = "a déjà été annoncé récemment",
        RareFound = "Rare trouvé! Annonce au chat..",
        Enabled = "Activé",
        Disabled = "Désactivé",
        Config = {
            RareAnnounce = {
                "Activer les annonces de chat",
                "Active/désactive l’annonce de rares au chat général lorsqu’il est ciblé",
            },
			PartyRaidChatAnnounce = {
				"Activer les annonces de chat de groupe/raid (les annonces de chat doivent être activées)",
				"Active/désactive l’annonce de rares au chat Party/Raid lorsqu’il est ciblé (les annonces de chat doivent être activées)",
			},
            Sound = {
                "Activer les sons",
                "Active/désactive les indices sonores lorsque les indices rares sont marqués",
            },
            TomTom = {
                "Activer les Waypoints TomTom",
                "Active/désactive les points de cheminement tomtom automatiques",
            },
            OnDeath = {
                "Activer les annonces de décès (utilisation à vos risques et périls)",
                "Active/désactive l’annonce de la mort de rares pour discuter",
            },
            Duplicates = {
                "Activer les notifications pour les rares déjà terminés",
                "Active/désactive la réaction aux rares qui ont déjà été complétées aujourd’hui",
            },
            MapPin = {
                "Ajouter des emplacements d’épingles de carte à la fin d’un message d’annonce",
                "Active/désactive l’ajout d’épingles de mappage aux messages d’annonce"
            }
        }
    }
end