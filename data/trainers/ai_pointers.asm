TrainerAIPointers:
	table_width 3, TrainerAIPointers
	; AndrewNote - all trainers have GenericAI except boss enemies who have SwitchAI
	; one entry per trainer class
	; first byte, number of times (per Pokémon) it can occur
	; next two bytes, pointer to AI subroutine for trainer class
	; subroutines are defined in engine/battle/trainer_ai.asm
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI ; unused_juggler
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, SwitchAI ; juggler
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 2, GenericAI ; blackbelt
	dbw 3, SwitchAI ; rival1
	dbw 3, GenericAI ; oak
	dbw 1, GenericAI ; chief
	dbw 3, GenericAI ; scientist
	dbw 1, SwitchAI ; giovanni
	dbw 3, GenericAI
	dbw 2, SwitchAI ; cooltrainerm
	dbw 1, SwitchAI ; cooltrainerf
	dbw 2, SwitchAI ; bruno
	dbw 5, SwitchAI ; brock
	dbw 1, SwitchAI ; misty
	dbw 1, SwitchAI ; surge
	dbw 1, SwitchAI ; erika
	dbw 2, SwitchAI ; koga
	dbw 2, SwitchAI ; blaine
	dbw 1, SwitchAI ; sabrina
	dbw 3, GenericAI
	dbw 1, SwitchAI ; rival2
	dbw 1, SwitchAI ; rival3
	dbw 2, SwitchAI ; lorelei
	dbw 3, GenericAI
	dbw 2, SwitchAI ; agatha
	dbw 1, SwitchAI ; lance
	assert_table_length NUM_TRAINERS
