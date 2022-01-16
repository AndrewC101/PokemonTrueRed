SeafoamIslands1FWildMons:
	def_grass_wildmons 15 ; encounter rate
	db 30, SEAKING
IF DEF(_RED)
	db 35, SEADRA
	db 35, DEWGONG
	db 35, GYARADOS
	db 35, SLOWBRO
	db 35, CLOYSTER
	db 35, OMANYTE
	db 35, KABUTO
	db 35, STARYU
	db 35, STARMIE
ENDC
IF DEF(_BLUE)
	db 35, SEADRA
	db 35, DEWGONG
	db 35, GYARADOS
	db 35, SLOWBRO
	db 35, CLOYSTER
	db 35, JYNX
	db 35, KABUTO
	db 35, STARYU
	db 35, STARMIE
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
