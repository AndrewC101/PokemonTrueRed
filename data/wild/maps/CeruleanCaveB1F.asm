CeruleanCaveB1FWildMons:
	def_grass_wildmons 25 ; encounter rate
	db 60, CHANSEY
	db 60, SNORLAX
	db 60, GYARADOS
	db 60, ALAKAZAM
	db 60, STARMIE
	db 60, CHARIZARD
IF DEF(_RED)
	db 60, VENUSAUR
ENDC
IF DEF(_BLUE)
	db 60, VENUSAUR
ENDC
	db 60, BLASTOISE
	db 60, DRAGONITE
	db 60, DRAGONITE
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
