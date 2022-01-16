Route2WildMons:
	def_grass_wildmons 25 ; encounter rate
	db  3, RATTATA
	db  3, PIDGEY
	db  4, PIDGEY
	db  3, VULPIX
	db  3, BELLSPROUT
IF DEF(_RED)
	db  3, POLIWAG
	db  5, VULPIX
	db  5, BELLSPROUT
	db  5, POLIWAG
	db  10, BEEDRILL
ENDC
IF DEF(_BLUE)
	db  3, POLIWAG
	db  5, VULPIX
	db  5, BELLSPROUT
	db  5, POLIWAG
	db  10, BEEDRILL
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
