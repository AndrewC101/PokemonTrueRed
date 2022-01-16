Route8WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 18, PIDGEY
IF DEF(_RED)
	db 18, MEOWTH
	db 25, PIKACHU
	db 25, VULPIX
	db 25, POLIWHIRL
	db 25, WEEPINBELL
	db 25, EEVEE
	db 25, MR_MIME
	db 25, EXEGGCUTE
	db 30, EXEGGCUTE
ENDC
IF DEF(_BLUE)
	db 18, MEOWTH
	db 25, PIKACHU
	db 25, VULPIX
	db 25, POLIWHIRL
	db 25, WEEPINBELL
	db 25, EEVEE
	db 25, MR_MIME
	db 25, EXEGGCUTE
	db 30, EXEGGCUTE
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
