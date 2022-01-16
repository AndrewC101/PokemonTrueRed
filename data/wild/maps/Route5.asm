Route5WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 13, BELLSPROUT
	db 13, PIDGEY
	db 15, PIDGEY
	db 10, MANKEY
	db 12, ODDISH
	db 15, BELLSPROUT
	db 18, MEOWTH
	db 18, MEOWTH
	db 24, ARBOK
	db 24, ARBOK
ENDC
IF DEF(_BLUE)
	db 13, BELLSPROUT
	db 13, PIDGEY
	db 15, PIDGEY
	db 10, MANKEY
	db 12, ODDISH
	db 15, BELLSPROUT
	db 18, MEOWTH
	db 18, MEOWTH
	db 24, ARBOK
	db 24, ARBOK
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
