Route23WildMons:
	def_grass_wildmons 10 ; encounter rate
IF DEF(_RED)
	db 45, PRIMEAPE
ENDC
IF DEF(_BLUE)
	db 45, PRIMEAPE
ENDC
	db 45, HITMONCHAN
	db 45, HITMONLEE
	db 45, JOLTEON
	db 45, FLAREON
	db 45, VAPOREON
IF DEF(_RED)
	db 45, SANDSLASH
ENDC
IF DEF(_BLUE)
	db 45, SANDSLASH
ENDC
	db 45, LICKITUNG
	db 45, FARFETCHD
	db 60, DITTO
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
