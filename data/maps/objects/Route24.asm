Route24_Object:
	db $2c ; border block

	def_warp_events

	def_bg_events

	def_object_events
	object_event 11, 15, SPRITE_COOLTRAINER_M, STAY, LEFT, 1, OPP_POKEMANIAC, 10
	object_event  5, 20, SPRITE_COOLTRAINER_M, STAY, UP, 2, OPP_JR_TRAINER_M, 2
	object_event 11, 19, SPRITE_COOLTRAINER_M, STAY, LEFT, 3, OPP_COOLTRAINER_M, 6
	object_event 10, 22, SPRITE_COOLTRAINER_M, STAY, RIGHT, 4, OPP_GENTLEMAN, 6
	object_event 11, 25, SPRITE_COOLTRAINER_F, STAY, LEFT, 5, OPP_BEAUTY, 15
	object_event 10, 28, SPRITE_COOLTRAINER_M, STAY, RIGHT, 6, OPP_SUPER_NERD, 10
	object_event 11, 31, SPRITE_COOLTRAINER_M, STAY, LEFT, 7, OPP_ROCKER, 3
	object_event 10,  5, SPRITE_POKE_BALL, STAY, NONE, 8, TM_THUNDER_WAVE

	def_warps_to ROUTE_24
