local AddonName, Addon = ...

if (GetLocale() == "koKR") then
    Addon.Loc = {
        Title = "Rare Share",
        Died = "사망",
        AlreadyAnnounced = "최근에 이미 발표되었습니다.",
        RareFound = "희귀 발견! 채팅 발표..",
        Enabled = "사용",
        Disabled = "비활성화",
        Config = {
            RareAnnounce = {
                "채팅 알림 사용",
                "타겟팅 시 일반 채팅에 레어 발표를 활성화/비활성화합니다.",
            },
			PartyRaidChatAnnounce = {
				"파티/레이드 채팅 공지 활성화(채팅 공지를 활성화해야 함)",
				"타겟팅 시 파티/레이드 채팅에 레어 알림을 활성화/비활성화합니다(채팅 알림이 활성화되어 있어야 함).",
			},
            Sound = {
                "사운드 활성화",
                "희귀어에 태그가 지정될 때 들리는 단서를 활성화/비활성화합니다.",
            },
            TomTom = {
                "TomTom 웨이포인트 활성화",
                "자동 톰톰 웨이포인트 활성화/비활성화",
            },
            OnDeath = {
                "사망 시 공지 활성화(자신의 위험 부담 하에 사용)",
                "채팅에 대한 레어의 사망을 알리는 활성화/비활성화",
            },
            Duplicates = {
                "이미 완료된 희귀품에 대한 알림 사용",
                "오늘 이미 완료된 레어에 반응하는 활성화/비활성화",
            },
            MapPin = {
                "공지 메시지 끝에 맵 핀 위치 추가",
                "공지 메시지에 지도 핀 추가를 활성화/비활성화합니다."
            }
        }
    }
end