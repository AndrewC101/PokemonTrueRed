TrainerAIPointers:
	table_width 3, TrainerAIPointers
	; AndrewNote - all trainers have GenericAI except boss enemies who have SwitchAndUseItemsAI
	; one entry per trainer class
	; first byte, number of times (per Pokémon) it can occur
	; next two bytes, pointer to AI subroutine for trainer class
	; subroutines are defined in engine/battle/trainer_ai.asm
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, SwitchAndUseItemsAI ; jr trainer male
	dbw 3, GenericAI
	dbw 3, SwitchAndUseItemsAI ; pokemaniac
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, SwitchAndUseItemsAI ; engineer
	dbw 3, GenericAI ; unused_juggler
	dbw 3, SwitchAndUseItemsAI ; fisher
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, SwitchAndUseItemsAI ; rocker
	dbw 3, SwitchAndUseItemsAI ; juggler
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 2, SwitchAndUseItemsAI ; blackbelt
	dbw 3, SwitchAndUseItemsAI ; rival1
	dbw 3, SwitchAndUseItemsAI ; oak
	dbw 1, GenericAI ; chief
	dbw 3, SwitchAndUseItemsAI ; scientist
	dbw 1, SwitchAndUseItemsAI ; giovanni
	dbw 3, GenericAI
	dbw 2, SwitchAndUseItemsAI ; cooltrainerm
	dbw 1, SwitchAndUseItemsAI ; cooltrainerf
	dbw 2, SwitchAndUseItemsAI ; bruno
	dbw 5, SwitchAndUseItemsAI ; brock
	dbw 1, SwitchAndUseItemsAI ; misty
	dbw 1, SwitchAndUseItemsAI ; surge
	dbw 1, SwitchAndUseItemsAI ; erika
	dbw 2, SwitchAndUseItemsAI ; koga
	dbw 2, SwitchAndUseItemsAI ; blaine
	dbw 1, SwitchAndUseItemsAI ; sabrina
	dbw 3, GenericAI
	dbw 1, SwitchAndUseItemsAI ; rival2
	dbw 1, SwitchAndUseItemsAI ; rival3
	dbw 2, SwitchAndUseItemsAI ; lorelei
	dbw 3, GenericAI
	dbw 2, SwitchAndUseItemsAI ; agatha
	dbw 1, SwitchAndUseItemsAI ; lance
	assert_table_length NUM_TRAINERS
