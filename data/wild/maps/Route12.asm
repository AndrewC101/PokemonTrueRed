Route12WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 24, ODDISH
	db 25, PIDGEY
	db 23, PIDGEY
	db 24, VENONAT
	db 22, ODDISH
	db 25, SHELLDER
	db 25, SHELLDER
	db 30, GLOOM
	db 30, WEEPINBELL
	db 30, WEEPINBELL
ENDC
IF DEF(_BLUE)
	db 24, ODDISH
	db 25, PIDGEY
	db 23, PIDGEY
	db 24, VENONAT
	db 22, ODDISH
	db 25, SHELLDER
	db 25, SHELLDER
	db 30, GLOOM
	db 30, WEEPINBELL
	db 30, WEEPINBELL
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
