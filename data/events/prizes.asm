PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

; AndrewNote - update slot prizes
PrizeMenuMon1Entries:
	db ABRA
	db CLEFAIRY
IF DEF(_RED)
	db DRATINI
ENDC
IF DEF(_BLUE)
	db DRATINI
ENDC
	db "@"

PrizeMenuMon1Cost:
IF DEF(_RED)
	bcd2 200
	bcd2 500
ENDC
IF DEF(_BLUE)
	bcd2 200
	bcd2 500
ENDC
	bcd2 3000
	db "@"

PrizeMenuMon2Entries:
IF DEF(_RED)
	db PORYGON
	db JYNX
ENDC
IF DEF(_BLUE)
	db PORYGON
	db JYNX
ENDC
	db CHANSEY
	db "@"

PrizeMenuMon2Cost:
IF DEF(_RED)
	bcd2 3000
	bcd2 6000
	bcd2 9999
ENDC
IF DEF(_BLUE)
	bcd2 3000
	bcd2 6000
	bcd2 9000
ENDC
	db "@"

PrizeMenuTMsEntries:
	db TM_SOFTBOILED
	db TM_DRAGON_RAGE
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 1000
	bcd2 2000
	bcd2 3000
	db "@"
