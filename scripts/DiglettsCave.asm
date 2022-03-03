DiglettsCave_Script:
	jp EnableAutoTextBoxDrawing

DiglettsCave_TextPointers:
    dw DiglettsCaveText1

; AndrewNote - Ichigo battle
DiglettsCaveText1:
    text_asm
	ld hl, IchigoBattleText
	call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .noBattle
    ld hl, IchigoBeginBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, IchigoEndBattleText
	ld de, IchigoEndBattleText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	SetEvent EVENT_MEDIUM_STAT_EXP
	SetEvent EVENT_DONT_TAKE_MONEY
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	jp TextScriptEnd
.noBattle
    ld hl, IchigoNoBattleText
	call PrintText
	jp TextScriptEnd


IchigoBattleText:
    text_far _IchigoBattleText
    text_end
_IchigoBattleText:
    text "Hey I'm ICHIGO!"

    para "Substitute"
    line "#MON trainer."

    para "I am training"
    line "here to defeat"
    cont "AIZEN."

    para "Let's train"
    line "together!"
    done

IchigoEndBattleText:
    text_far _IchigoEndBattleText
    text_end
_IchigoEndBattleText:
    text "Nani"
    prompt

IchigoNoBattleText:
    text_far _IchigoNoBattleText
    text_end
_IchigoNoBattleText:
    text "I must face"
    line "him alone!"
    done

IchigoBeginBattleText:
    text_far _IchigoBeginBattleText
    text_end
_IchigoBeginBattleText:
    text "BAN..."
    line "KAI!!"
    done
