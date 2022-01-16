SSAnne1F_Script:
	call EnableAutoTextBoxDrawing
	ret

SSAnne1F_TextPointers:
	dw SSAnne1Text1
	dw SSAnne1Text2

SSAnne1Text1:
	text_far _SSAnne1Text1
	text_end

SSAnne1TextHeal:
	text_far _SSAnne1Text2
	text_end

SSAnne1Text2:
	text_asm
	predef HealParty ; AndrewNote - First guy on SS Anne heals party
	call GBFadeOutToWhite
	call Delay3
	call GBFadeInFromWhite
	ld hl, SSAnne1TextHeal
	call PrintText
	jp TextScriptEnd
