Route11WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 14, SANDSHREW
	db 15, SPEAROW
	db 12, EKANS
	db  9, DROWZEE
	db 13, SPEAROW
	db 18, DROWZEE
	db 18, SCYTHER
ENDC
IF DEF(_BLUE)
	db 14, SANDSHREW
	db 15, SPEAROW
	db 12, EKANS
	db  9, DROWZEE
	db 13, SPEAROW
	db 18, DROWZEE
	db 18, SCYTHER
ENDC
	db 18, PINSIR
	db 18, PONYTA
	db 24, RAPIDASH
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
