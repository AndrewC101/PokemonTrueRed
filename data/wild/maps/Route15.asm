Route15WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 35, WEEPINBELL
	db 45, DITTO
	db 35, FEAROW
	db 35, VENOMOTH
	db 35, GLOOM
	db 35, TAUROS
	db 35, DODRIO
	db 35, KANGASKHAN
ENDC
IF DEF(_BLUE)
	db 35, WEEPINBELL
	db 45, DITTO
	db 35, FEAROW
	db 35, VENOMOTH
	db 35, GLOOM
	db 35, TAUROS
	db 35, DODRIO
	db 35, KANGASKHAN
ENDC
	db 40, ARCANINE
	db 40, ARCANINE
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
