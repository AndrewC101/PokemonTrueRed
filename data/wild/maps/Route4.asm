Route4WildMons:
	def_grass_wildmons 20 ; encounter rate
	db 12, RATTATA
	db 12, SPEAROW
	db 12, CUBONE
IF DEF(_RED)
	db 12, EKANS
	db 12, ABRA
	db 14, BEEDRILL
	db 14, BUTTERFREE
	db 14, SANDSHREW
	db 18, GROWLITHE
	db 18, GROWLITHE
ENDC
IF DEF(_BLUE)
	db 12, EKANS
	db 12, ABRA
	db 14, BEEDRILL
	db 14, BUTTERFREE
	db 14, SANDSHREW
	db 18, GROWLITHE
	db 18, GROWLITHE
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
