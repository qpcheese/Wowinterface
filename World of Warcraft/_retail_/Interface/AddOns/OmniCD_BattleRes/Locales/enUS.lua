local L = LibStub("AceLocale-3.0"):GetLocale("OmniCD")
if not L then return end

if (GetLocale() == "itIT") then
	L["Charge Position"] = "Posizione di carica"
	L["Counter Position"] = "Posizione del contatore"
	L["Reset Module"] = "Ripristina modulo"
elseif (GetLocale() == "koKR") then
	L["Charge Position"] = "충전 횟수 위치"
	L["Counter Position"] = "재사용 대기시간 숫자 위치"
	L["Reset Module"] = "모듈 초기화"
else
	L["Charge Position"] = "Charge Position"
	L["Counter Position"] = "Counter Position"
	L["Reset Module"] = "Reset Module"
end
