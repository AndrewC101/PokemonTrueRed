PowerPlantWildMons:
	def_grass_wildmons 10 ; encounter rate
	db 21, VOLTORB
	db 21, MAGNEMITE
	db 20, PIKACHU
	db 24, PIKACHU
	db 35, JOLTEON
	db 35, RAICHU
	db 35, MAGNETON
	db 35, MAGNETON
IF DEF(_RED)
	db 35, ELECTABUZZ
	db 35, ELECTABUZZ
ENDC
IF DEF(_BLUE)
	db 35, ELECTABUZZ
	db 35, ELECTABUZZ
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
