SSAnneBow_Object:
	db $23 ; border block

	def_warp_events
	warp_event 13,  6, SS_ANNE_3F, 1
	warp_event 13,  7, SS_ANNE_3F, 1

	def_bg_events

	def_object_events
	; AndrewNote - add gym leader optional bosses
	object_event 7,  11, SPRITE_COOLTRAINER_M, STAY, DOWN, 1, OPP_BROCK, 2
	object_event 4,  4, SPRITE_BRUNETTE_GIRL, STAY, LEFT, 2, OPP_MISTY, 2
	object_event 6,  2, SPRITE_ROCKER, STAY, UP, 3, OPP_LT_SURGE, 2
	object_event 8,  4, SPRITE_ERIKA, STAY, UP, 4, OPP_ERIKA, 2
	object_event 4,  8, SPRITE_KOGA, STAY, LEFT, 5, OPP_KOGA, 2
	object_event 10, 8, SPRITE_GIRL, STAY, DOWN, 6, OPP_SABRINA, 2
	object_event 11, 2, SPRITE_MIDDLE_AGED_MAN, STAY, UP, 7, OPP_BLAINE, 2
	object_event 1,  6, SPRITE_LORELEI, STAY, LEFT, 8, OPP_LORELEI, 2
	object_event 1,  7, SPRITE_BRUNO, STAY, LEFT, 9, OPP_BRUNO, 2

	def_warps_to SS_ANNE_BOW
