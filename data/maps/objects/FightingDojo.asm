FightingDojo_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 11, LAST_MAP, 2
	warp_event  5, 11, LAST_MAP, 2

	def_bg_events

	def_object_events
	; AndrewNote - add optional bosses
	object_event  5,  3, SPRITE_OAK, STAY, DOWN, 1, OPP_PROF_OAK, 1
	object_event  3,  4, SPRITE_BLUE, STAY, RIGHT, 2, OPP_RIVAL3, 4
	object_event  6,  5, SPRITE_GIOVANNI, STAY, LEFT, 3, OPP_GIOVANNI, 4
	object_event  6,  10, SPRITE_RED, STAY, LEFT, 4, OPP_JR_TRAINER_M, 9
	object_event  3,  6, SPRITE_LANCE, STAY, RIGHT, 5, OPP_LANCE, 2
	object_event  4,  1, SPRITE_POKE_BALL, STAY, NONE, 6 ; person
	object_event  5,  1, SPRITE_POKE_BALL, STAY, NONE, 7 ; person
	;object_event  3,  6, SPRITE_GYM_GUIDE, STAY, RIGHT, 9, OPP_POKEMANIAC, 9
	object_event  6,  7, SPRITE_AGATHA, STAY, LEFT, 10, OPP_AGATHA, 2
	object_event  1,  1, SPRITE_RED, STAY, DOWN, 11, OPP_POKEMANIAC, 11
	object_event  8,  1, SPRITE_BLUE, STAY, DOWN, 12, OPP_ENGINEER, 5

	def_warps_to FIGHTING_DOJO
