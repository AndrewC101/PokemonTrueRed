Route6WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 13, BELLSPROUT
	db 13, PIDGEY
	db 15, MANKEY
	db 10, MEOWTH
	db 12, ODDISH
	db 15, BELLSPROUT
	db 18, SCYTHER
	db 18, PINSIR
	db 18, KRABBY
	db 24, KINGLER
ENDC
IF DEF(_BLUE)
	db 13, BELLSPROUT
	db 13, PIDGEY
	db 15, MANKEY
	db 10, MEOWTH
	db 12, ODDISH
	db 15, BELLSPROUT
	db 18, SCYTHER
	db 18, PINSIR
	db 18, KRABBY
	db 24, KINGLER
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
