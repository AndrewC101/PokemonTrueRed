Route7WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 19, PIDGEY
IF DEF(_RED)
	db 19, BELLSPROUT
	db 17, MEOWTH
	db 25, PIKACHU
	db 25, GROWLITHE
	db 25, VULPIX
	db 25, POLIWHIRL
	db 25, WEEPINBELL
	db 25, EEVEE
	db 25, EEVEE
ENDC
IF DEF(_BLUE)
	db 19, BELLSPROUT
	db 17, MEOWTH
	db 25, PIKACHU
	db 25, GROWLITHE
	db 25, VULPIX
	db 25, POLIWHIRL
	db 25, WEEPINBELL
	db 25, EEVEE
	db 25, EEVEE
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
