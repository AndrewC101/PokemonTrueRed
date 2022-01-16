ViridianForestWildMons:
	def_grass_wildmons 8 ; encounter rate
IF DEF(_RED)
	db  4, CATERPIE
	db  4, WEEDLE
	db  7, KAKUNA
	db  7, METAPOD
	db  6, PARAS
	db  6, VENONAT
	db  10, BEEDRILL
	db  10, BUTTERFREE
ENDC
IF DEF(_BLUE)
	db  4, CATERPIE
	db  4, WEEDLE
	db  7, KAKUNA
	db  7, METAPOD
	db  6, PARAS
	db  6, VENONAT
	db  10, BEEDRILL
	db  10, BUTTERFREE
ENDC
	db  5, PIKACHU
	db  10, PIKACHU
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
