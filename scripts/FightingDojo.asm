FightingDojo_Script:
	call EnableAutoTextBoxDrawing
	ld hl, FightingDojoTrainerHeaders
	ld de, FightingDojo_ScriptPointers
	ld a, [wFightingDojoCurScript]
	call ExecuteCurMapScriptInTable
	ld [wFightingDojoCurScript], a
	ret

FightingDojoScript_5cd70:
	xor a
	ld [wJoyIgnore], a
	ld [wFightingDojoCurScript], a
	ld [wCurMapScript], a
	ret

FightingDojo_ScriptPointers:
	dw FightingDojoScript1
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw FightingDojoScript3

FightingDojoScript1:
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	ret nz
	call CheckFightingMapTrainers
	ld a, [wTrainerHeaderFlagBit]
	and a
	ret nz
	CheckEvent EVENT_BEAT_KARATE_MASTER
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld [wcf0d], a
	ld a, [wYCoord]
	cp 3
	ret nz
	ld a, [wXCoord]
	cp 4
	ret nz
	ld a, $1
	ld [wcf0d], a
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, $1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ret

FightingDojoScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, FightingDojoScript_5cd70
	ld a, [wcf0d]
	and a
	jr z, .asm_5cde4

.asm_5cde4
	ld a, $f0
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_KARATE_MASTER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AndrewNote - respawn prizes after beating Master Oak
	ResetEvent EVENT_DEFEATED_FIGHTING_DOJO
    ResetEvent EVENT_GOT_HITMONLEE
    ResetEvent EVENT_GOT_HITMONCHAN
    ld a, HS_FIGHTING_DOJO_GIFT_1
    ld [wMissableObjectIndex], a
    predef ShowObject
    ld a, HS_FIGHTING_DOJO_GIFT_2
    ld [wMissableObjectIndex], a
    predef ShowObject
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld [wFightingDojoCurScript], a
	ld [wCurMapScript], a
	ResetEvent EVENT_NO_REMATCH_OPTION ; AndrewNote - disable no rematch flag
	ret

FightingDojo_TextPointers:
	dw FightingDojoText1
	dw FightingDojoText2
	dw FightingDojoText3
	dw FightingDojoText4
	dw FightingDojoText5
	dw FightingDojoText6
	dw FightingDojoText7
	dw FightingDojoText8
	dw FightingDojoText9
	dw FightingDojoText10

FightingDojoTrainerHeaders:
	def_trainers 2
FightingDojoTrainerHeader0:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_0, 0, FightingDojoBattleText1, FightingDojoEndBattleText1, FightingDojoAfterBattleText1
FightingDojoTrainerHeader1:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_1, 0, FightingDojoBattleText2, FightingDojoEndBattleText2, FightingDojoAfterBattleText2
FightingDojoTrainerHeader2:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_2, 0, FightingDojoBattleText3, FightingDojoEndBattleText3, FightingDojoAfterBattleText3
FightingDojoTrainerHeader3:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_3, 0, FightingDojoBattleText4, FightingDojoEndBattleText4, FightingDojoAfterBattleText4
; AndrewNote - add new trainers
FightingDojoTrainerHeader4:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_4, 0, FightingDojoBattleText5, FightingDojoEndBattleText5, FightingDojoAfterBattleText5
FightingDojoTrainerHeader5:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_5, 0, FightingDojoBattleText6, FightingDojoEndBattleText6, FightingDojoAfterBattleText6
	db -1 ; end

FightingDojoText1:
	text_asm
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	jp nz, .continue1
	CheckEventReuseA EVENT_BEAT_KARATE_MASTER
	jp nz, .continue2
	; AndrewNote - refactor to allow rematch
	jr .fightMaster
.continue1
    CheckEvent EVENT_NO_REMATCH_OPTION ; AndrewNote - don't offer rematch option right after victory
    jr nz, .continue2

	ld hl, FightingDojoText_5ce9d
	call PrintText

    call RematchChoice ; AndrewNote - offer rematch
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .fightMaster

    ld hl, ByeText
    call PrintText
	jr .asm_9dba4
.continue2
	ld hl, FightingDojoText8
	call PrintText
	jp TextScriptEnd
.fightMaster
    SetEvent EVENT_NO_REMATCH_OPTION
    SetEvent EVENT_MAX_BONUS_MONEY ; AndrewNote - give X100 money after victory
    predef HealParty ; AndrewNote - heal party to prevent pre status cheesing "cleric clause"
	ld hl, FightingDojoText_5ce8e
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, FightingDojoText_5ce93
	ld de, FightingDojoText_5ce93
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	ld [wFightingDojoCurScript], a
	ld [wCurMapScript], a
	jr .asm_9dba4
.asm_9dba4
	jp TextScriptEnd

FightingDojoText_5ce8e:
	text_far _FightingDojoText_5ce8e
	text_end

FightingDojoText_5ce93:
	text_far _FightingDojoText_5ce93
	text_end

FightingDojoText8:
	text_far _FightingDojoText_5ce98
	text_end

FightingDojoText_5ce9d:
	text_far _FightingDojoText_5ce9d
	text_end

FightingDojoText2:
	text_asm
	SetEvent EVENT_BIG_BONUS_MONEY
	SetEvent EVENT_RESET_MEWTWO_ENCOUNTER ; AndrewNote - respawn Mewtwo on victory
	predef HealParty ; AndrewNote - heal party to prevent pre status cheesing "cleric clause"
	ld hl, FightingDojoTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText1:
	text_far _FightingDojoBattleText1
	text_end

FightingDojoEndBattleText1:
	text_far _FightingDojoEndBattleText1
	text_end

FightingDojoAfterBattleText1:
	text_far _FightingDojoAfterBattleText1
	text_end

FightingDojoText3:
	text_asm
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, FightingDojoTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText2:
	text_far _FightingDojoBattleText2
	text_end

FightingDojoEndBattleText2:
	text_far _FightingDojoEndBattleText2
	text_end

FightingDojoAfterBattleText2:
	text_far _FightingDojoAfterBattleText2
	text_end

FightingDojoText4:
	text_asm
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, FightingDojoTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText3:
	text_far _FightingDojoBattleText3
	text_end

FightingDojoEndBattleText3:
	text_far _FightingDojoEndBattleText3
	text_end

FightingDojoAfterBattleText3:
	text_far _FightingDojoAfterBattleText3
	text_end

FightingDojoText5:
	text_asm
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, FightingDojoTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText4:
	text_far _FightingDojoBattleText4
	text_end

FightingDojoEndBattleText4:
	text_far _FightingDojoEndBattleText4
	text_end

FightingDojoAfterBattleText4:
	text_far _FightingDojoAfterBattleText4
	text_end

FightingDojoBattleText5:
	text_far _FightingDojoBattleText5
	text_end

FightingDojoEndBattleText5:
	text_far _FightingDojoEndBattleText5
	text_end

FightingDojoAfterBattleText5:
	text_far _FightingDojoAfterBattleText5
	text_end

FightingDojoBattleText6:
	text_far _FightingDojoBattleText6
	text_end

FightingDojoEndBattleText6:
	text_far _FightingDojoEndBattleText6
	text_end

FightingDojoAfterBattleText6:
	text_far _FightingDojoAfterBattleText6
	text_end

FightingDojoAfterBattleText7:
	text_far _FightingDojoText_5ce9d
	text_end

FightingDojoText6:
; Hitmonlee Poké Ball
	text_asm
	CheckEitherEventSet EVENT_GOT_HITMONLEE, EVENT_GOT_HITMONCHAN
	jr z, .GetMon
	ld hl, OtherHitmonText
	call PrintText
	jr .done
.GetMon
    ; AndrewNote - now a level 100 Mew
	ld a, MEW
	call DisplayPokedex
	ld hl, WantHitmonleeText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wcf91]
	ld b, a
	ld c, 100
	call GivePokemon
	jr nc, .done

	; once Poké Ball is taken, hide sprite
	ld a, HS_FIGHTING_DOJO_GIFT_1
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvents EVENT_GOT_HITMONLEE, EVENT_DEFEATED_FIGHTING_DOJO
.done
	jp TextScriptEnd

WantHitmonleeText:
	text_far _WantHitmonleeText
	text_end

FightingDojoText7:
; Hitmonchan Poké Ball
	text_asm
	CheckEitherEventSet EVENT_GOT_HITMONLEE, EVENT_GOT_HITMONCHAN
	jr z, .GetMon
	ld hl, OtherHitmonText
	call PrintText
	jr .done
.GetMon
    ; AndrewNote - now a level 100 Mewtwo
	ld a, MEWTWO
	call DisplayPokedex
	ld hl, WantHitmonchanText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wcf91]
	ld b, a
	ld c, 100
	call GivePokemon
	jr nc, .done
	SetEvents EVENT_GOT_HITMONCHAN, EVENT_DEFEATED_FIGHTING_DOJO

	; once Poké Ball is taken, hide sprite
	ld a, HS_FIGHTING_DOJO_GIFT_2
	ld [wMissableObjectIndex], a
	predef HideObject
.done
	jp TextScriptEnd

FightingDojoText9:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
    SetEvent EVENT_NO_SHIFT
    SetEvent EVENT_NO_ITEMS
	ld hl, FightingDojoTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoText10:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
    SetEvent EVENT_NO_SHIFT
    SetEvent EVENT_NO_ITEMS
	ld hl, FightingDojoTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

WantHitmonchanText:
	text_far _WantHitmonchanText
	text_end

OtherHitmonText:
	text_far _OtherHitmonText
	text_end