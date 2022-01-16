Route24WildMons:
	def_grass_wildmons 25 ; encounter rate
IF DEF(_RED)
	db  8, KAKUNA
	db  8, METAPOD
	db 12, PIDGEY
	db 12, ODDISH
	db 12, BELLSPROUT
	db 14, BUTTERFREE
	db 14, BEEDRILL
ENDC
IF DEF(_BLUE)
	db  8, KAKUNA
	db  8, METAPOD
	db 12, PIDGEY
	db 12, ODDISH
	db 12, BELLSPROUT
	db 14, BUTTERFREE
	db 14, BEEDRILL
ENDC
	db 14, PIKACHU
	db 12, ABRA
	db 12, ABRA
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
