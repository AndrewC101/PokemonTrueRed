Route9WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 16, RATTATA
	db 16, SPEAROW
	db 14, RATTATA
IF DEF(_RED)
	db 11, SANDSHREW
	db 13, SPEAROW
	db 15, EKANS
	db 20, MAGNEMITE
	db 30, MACHOKE
	db 30, PRIMEAPE
	db 30, TAUROS
ENDC
IF DEF(_BLUE)
	db 11, SANDSHREW
	db 13, SPEAROW
	db 15, EKANS
	db 20, MAGNEMITE
	db 30, MACHOKE
	db 30, PRIMEAPE
	db 30, TAUROS
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
