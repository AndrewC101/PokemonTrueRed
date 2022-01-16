SSAnne3F_Script:
	jp EnableAutoTextBoxDrawing

SSAnne3F_TextPointers:
	dw SSAnne3Text1

SSAnne3TextHeal:
	text_far _SSAnne3Text1
	text_end

SSAnne3Text1:
	text_asm
	predef HealParty ; AndrewNote - npc to heal party for gym leader optional bosses
	call GBFadeOutToWhite
	call Delay3
	call GBFadeInFromWhite
	ld hl, SSAnne3TextHeal
	call PrintText
	jp TextScriptEnd
