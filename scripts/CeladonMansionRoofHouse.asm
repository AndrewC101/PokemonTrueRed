CeladonMansionRoofHouse_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansionRoofHouse_TextPointers:
	dw CeladonMansion5Text1
	dw CeladonMansion5Text2
	dw CeladonMansion5Text3

CeladonMansion5Text1:
	text_far _CeladonMansion5Text1
	text_end

CeladonMansion5Text3:
	text_far _CeladonMansion5Text3
	text_end

CeladonMansion5Text2:
	text_asm
	CheckEvent EVENT_BEAT_ELITE_4 ; AndrewNote - give lvl 70 MEW after beating E4
	jr z, .notYet
	lb bc, MEW, 70
	call GivePokemon
	jr nc, .party_full
	ld a, HS_CELADON_MANSION_EEVEE_GIFT
	ld [wMissableObjectIndex], a
	predef HideObject
.party_full
	jp TextScriptEnd
.notYet
	ld hl, CeladonMansion5Text3
	call PrintText
	jp TextScriptEnd
