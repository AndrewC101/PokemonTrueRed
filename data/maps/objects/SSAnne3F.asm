SSAnne3F_Object:
	db $c ; border block

	def_warp_events
	warp_event  0,  3, SS_ANNE_BOW, 1
	warp_event 19,  3, SS_ANNE_2F, 8

	def_bg_events

	def_object_events
	; AndrewNote - add nurse to heal party
	object_event  3, 2, SPRITE_NURSE, STAY, DOWN, 1 ; person

	def_warps_to SS_ANNE_3F
