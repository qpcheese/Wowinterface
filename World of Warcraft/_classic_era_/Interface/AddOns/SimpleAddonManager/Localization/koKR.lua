-- Default locale
local ADDON_NAME, PRIVATE_TABLE = ...

if GetLocale() ~= "koKR" then
	return
end

local L = PRIVATE_TABLE.L

L["${n} seconds"] = "${n} 초"
L["(Automatically in category)"] = "(분류에서 자동으로)"
L["Active Addons"] = "활성 애드온"
L["Add search results to category"] = "분류에 검색 결과 추가"
L["AddOn binary search"] = "애드온 이진 검색"
L["Addons being modified"] = "변경 중인 애드온"
L["Addons being modified in this session"] = "이번 접속에서 변경 중인 애드온"
L["Addons enabled and loaded, or ready to be loaded on demand."] = "켜져 불러왔거나 요청 시 불러올 준비가 된 애드온입니다."
L["Addons not in any category. It will be taken into account if you are viewing or not auto-generated categories."] = "분류에 없는 애드온입니다. 자동 생성된 분류를 보고 있는지 여부가 고려됩니다."
L["AddOns Total Memory"] = "애드온 총 메모리"
L["AddOns: "] = "애드온:"
L["Also disable Simple Addon Manager?"] = "Simple Addon Manager도 끌까요?"
L["Author"] = "제작자"
L["Author: "] = "제작자:"
L["Autofocus searchbar when opening the UI"] = "UI 열 때 검색 표시줄에 자동 초점"
L["Automatically added:"] = "자동으로 추가됨:"
L["Be careful with this option, enabling/disabling Blizzard Addons might have unintended consequences!"] = "블리자드 애드온을 사용/미사용하면 의도하지 않은 결과를 초래할 수 있으므로 이 옵션에 주의하세요!"
L["Categories"] = "분류"
L["Category created from addons metadata"] = "애드온 메타데이터에서 생성된 분류"
L["Category Options"] = "분류 옵션"
L["Characters"] = "캐릭터"
L["Circular dependency detected!"] = "순환 종속이 감지되었습니다!"
L["Collapse all"] = "모두 접기"
L["Create new profile"] = "새 프로필 만들기"
L["Currently Disabled Addons"] = "현재 꺼진 애드온"
L["Currently Enabled Addons"] = "현재 켜진 애드온"
L["Delete"] = "삭제"
L["Delete category '${category}'?"] = "분류 '${category}'|1을;를; 삭제할까요?"
L["Delete the profile '${profile}'?"] = "프로필 '${profile}'|1을;를; 삭제할까요?"
L["Disable this and every AddOn that depends on it"] = "이것과 의존하는 모든 애드온 끄기"
L["Disabled Addons"] = "꺼진 애드온"
--[[Translation missing --]]
L["Enable Addons"] = "Enable Addons"
--[[Translation missing --]]
L["Enable addons from the profile '${profile}'?"] = "Enable addons from the profile '${profile}'?"
L["Enable this Addon and its dependencies"] = "이 애드온 및 추가 구성 요소 켜기"
L["Enable this and every AddOn that depends on it"] = "이것과 의존하는 모든 애드온 켜기"
L["Enabled Addons"] = "켜진 애드온"
L["Enter the category name"] = "분류 이름을 입력하세요."
L["Enter the name for the new profile"] = "새 프로필 이름을 입력하세요."
L["Enter the new name for the category '${category}'"] = "분류 '${category}'의 새 이름을 입력하세요."
L["Enter the new name for the profile "] = "프로필의 새 이름을 입력하세요."
L["Expand all"] = "모두 펴기"
L["Fixed category"] = "고정 분류"
L["Hide autogenerated categories"] = "자동 생성된 분류 숨기기"
L["Ignore addons included in dependent profiles."] = "종속 프로필에 포함된 애드온을 무시합니다."
L["Internal name"] = "내부 이름"
L["Left-click to open"] = "좌클릭 - 열기"
L["List Options"] = "목록 옵션"
L["Load"] = "불러오기"
L["Load AddOn"] = "애드온 불러오기"
L["Load Profile"] = "프로필 불러오기"
L["Load profile '${profile}' and reload UI?"] = "'${profile}' 프로필을 불러오고 UI를 재시작할까요?"
L["Load the AddOns from '${char}'?"] = "'${char}'에게서 애드온을 불러올까요?"
L["Load the profile '${profile}'?"] = "프로필 '${profile}'|1을;를; 불러올까요?"
L["Localize autogenerated categories name"] = "자동 생성된 분류 이름 지역화"
L["Manually added:"] = "수동으로 추가됨:"
L["Memory Update"] = "메모리 업데이트"
L["Memory: "] = "메모리:"
L["Name (improved)"] = "이름 (개선됨)"
L["New Category"] = "새 분류"
L["None"] = "없음"
L["Not Found!"] = "찾을 수 없습니다!"
L["Options"] = "옵션"
L["Profile dependencies"] = "프로필 종속"
L["Profiles"] = "프로필"
L["Reload UI"] = "UI 새로고침"
L["Remove search results from category"] = "분류에서 검색 결과 제거"
L["Rename"] = "이름 바꾸기"
L["Replace original Addon wow menu button"] = "원 애드온 wow 메뉴 버튼 대체"
L["Result: ${name}"] = "결과: ${name}"
L["Results: ${results}"] = "결과: ${results}"
L["Right-click to edit"] = "우클릭 - 편집"
L["Right-click to show profile menu"] = "우클릭 - 프로필 메뉴 표시"
L["Save"] = "저장"
L["Save (*)"] = "저장 (*)"
L["Save current addons in profile '${profile}'?"] = "현재 애드온을 프로필 '${profile}'에 저장할까요?"
L["Save current addons, ignoring addons included in dependent profiles, into profile '${profile}'?"] = "종속 프로필에 포함된 애드온을 무시하고 현재 애드온을 '${profile}' 프로필에 저장할까요?"
L["Search By"] = "검색"
L[ [=[Search in progress...
Status: enabled: ${enabled}, disabled: ${disabled}
The addon you are looking for has been disabled?]=] ] = [=[검색 중...
상태: 켜짐: ${enabled}, 꺼짐: ${disabled}
찾고 있는 애드온이 꺼졌나요?]=]
L["Search Options"] = "검색 옵션"
L["Select All"] = "모두 선택"
L["Select None"] = "선택 안 함"
L["Show Blizzard addons found in dependencies"] = "추가 구성 요소에서 발견된 Blizzard 애드온 표시"
L["Show memory usage in broker/minimap tooltip"] = "브로커/미니맵 툴팁에 메모리 사용량 표시"
L["Show minimap button"] = "미니맵 버튼 표시"
L["Show versions in AddOns list"] = "애드온 목록에 버전 표시"
L["Sort by"] = "정렬"
L[ [=[Start binary search?
Make sure to save your profile first, just in case.]=] ] = "이진 검색을 시작할까요? 만약을 대비해 프로필을 먼저 저장하세요."
L["This addons is not installed!"] = "이 애드온은 설치되지 않았습니다!"
L["Title"] = "제목"
L["Uncategorized Addons"] = "미분류 애드온"
L["Update only when opening the main window"] = "기본 창을 열 때만 업데이트"
L["User created category"] = "사용자 생성 분류"
L["Utilities"] = "유틸리티"
L["Version: "] = "버전:"
L["View AddOn list as dependency tree"] = "애드온 목록을 추가 구성 요소 트리로 보기"
L["Your AddOns were restored, reload UI?"] = "애드온이 복원되었습니다. UI를 새로 불러올까요?"
