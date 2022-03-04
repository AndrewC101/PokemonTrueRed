Route14WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 24, BELLSPROUT
	db 26, PIDGEY
	db 40, DITTO
	db 24, VENONAT
	db 30, PERSIAN
	db 30, PERSIAN
	db 30, HITMONCHAN
	db 30, HITMONLEE
ENDC
IF DEF(_BLUE)
	db 24, BELLSPROUT
	db 26, PIDGEY
	db 40, DITTO
	db 24, VENONAT
	db 30, PERSIAN
	db 30, PERSIAN
	db 30, HITMONCHAN
	db 30, HITMONLEE
ENDC
	db 30, FEAROW
	db 30, FEAROW
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
