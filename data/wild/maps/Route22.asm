Route22WildMons:
	def_grass_wildmons 25 ; encounter rate
	db  3, RATTATA
IF DEF(_RED)
	db  4, NIDORAN_M
	db  4, NIDORAN_F
	db  4, SPEAROW
	db  5, MEOWTH
	db  5, VULPIX
	db  5, BELLSPROUT
	db  5, POLIWAG
	db  5, PIKACHU
	db  5, PIKACHU
ENDC
IF DEF(_BLUE)
	db  4, NIDORAN_M
	db  4, NIDORAN_F
	db  4, SPEAROW
	db  5, MEOWTH
	db  5, VULPIX
	db  5, BELLSPROUT
	db  5, POLIWAG
	db  5, PIKACHU
	db  5, PIKACHU
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
