move_choices: MACRO
	IF _NARG
		db \# ; all args
	ENDC
	db 0 ; end
list_index += 1
ENDM

; move choice modification methods that are applied for each trainer class
TrainerClassMoveChoiceModifications:
    ; AndrewNote - add AI to trainers
	list_start TrainerClassMoveChoiceModifications
	move_choices         ; YOUNGSTER
	move_choices 1, 2, 3    ; BUG CATCHER
	move_choices 1, 2, 3 ; LASS
	move_choices 1, 2, 3 ; SAILOR
	move_choices 1, 2, 3 ; JR_TRAINER_M
	move_choices 1, 2, 3 ; JR_TRAINER_F
	move_choices 1, 2, 3, 4 ; POKEMANIAC
	move_choices 1, 2, 3 ; SUPER_NERD
	move_choices 1, 2    ; HIKER
	move_choices 1, 2    ; BIKER
	move_choices 1, 2, 3 ; BURGLAR
	move_choices 1, 2, 3 ; ENGINEER
	move_choices 1, 2    ; UNUSED_JUGGLER
	move_choices 1, 2, 3 ; FISHER
	move_choices 1, 2, 3 ; SWIMMER
	move_choices         ; CUE_BALL
	move_choices 1, 2, 3 ; GAMBLER
	move_choices 1, 2, 3 ; BEAUTY
	move_choices 1, 2, 3 ; PSYCHIC_TR
	move_choices 1, 2, 3 ; ROCKER
	move_choices 1, 2, 3 ; JUGGLER
	move_choices 1, 2    ; TAMER
	move_choices 1, 2, 3  ; BIRD_KEEPER
	move_choices 1, 2, 3    ; BLACKBELT
	move_choices 1, 2, 3 ; RIVAL1
	move_choices 1, 2, 3, 4 ; PROF_OAK
	move_choices 1, 2    ; CHIEF
	move_choices 1, 2, 3, 4 ; SCIENTIST
	move_choices 1, 2, 3, 4 ; GIOVANNI
	move_choices 1, 2, 3 ; ROCKET
	move_choices 1, 2, 3 ; COOLTRAINER_M
	move_choices 1, 2, 3 ; COOLTRAINER_F
	move_choices 1, 2, 3 ; BRUNO
	move_choices 1, 2, 3 ; BROCK
	move_choices 1, 2, 3 ; MISTY
	move_choices 1, 2, 3 ; LT_SURGE
	move_choices 1, 2, 3 ; ERIKA
	move_choices 1, 2, 3 ; KOGA
	move_choices 1, 2, 3 ; BLAINE
	move_choices 1, 2, 3 ; SABRINA
	move_choices 1, 2, 3 ; GENTLEMAN
	move_choices 1, 2, 3 ; RIVAL2
	move_choices 1, 2, 3, 4 ; RIVAL3
	move_choices 1, 2, 3 ; LORELEI
	move_choices 1, 2, 3 ; CHANNELER
	move_choices 1, 2, 3, 4 ; AGATHA
	move_choices 1, 2, 3 ; LANCE
	assert_list_length NUM_TRAINERS
