CeruleanCaveB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCaveB1FTrainerHeaders
	ld de, CeruleanCaveB1F_ScriptPointers
	ld a, [wCeruleanCaveB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeruleanCaveB1FCurScript], a
	ret

CeruleanCaveB1F_ScriptPointers:
    dw CeruleanCaveB1FScript1
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

CeruleanCaveB1FScript1:
    CheckEvent EVENT_BEAT_GREEN
    jr z, .checkFight
    ret
.checkFight
    xor a
	ldh [hJoyHeld], a
	ld [wcf0d], a
	ld a, [wYCoord]
	cp 1
	ret nz
	ld a, [wXCoord]
	cp 28
	ret nz
	ld a, $1
	ld [wcf0d], a
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, $1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $4
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
    ret

CeruleanCaveB1F_TextPointers:
	dw MewtwoText
	dw PickUpItemText
	dw PickUpItemText
	dw GreenText

CeruleanCaveB1FTrainerHeaders:
	def_trainers
MewtwoTrainerHeader:
	trainer EVENT_BEAT_MEWTWO, 0, MewtwoBattleText, MewtwoBattleText, MewtwoBattleText
GreenTrainerHeader:
    trainer EVENT_BEAT_GREEN, 4, GreenBattleText, GreenEndBattleText, GreenAfterBattleText
	db -1 ; end

MewtwoText:
	text_asm
	ld hl, MewtwoTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewtwoBattleText:
	text_far _MewtwoBattleText
	text_asm
	ld a, MEWTWO
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

GreenText:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
    SetEvent EVENT_NO_SHIFT
    SetEvent EVENT_NO_ITEMS
    SetEvent EVENT_SHOULD_BEAT_GREEN
	ld hl, GreenTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

GreenBattleText:
    text_far _GreenBattleText
    text_end

GreenEndBattleText:
    text_far _GreenEndBattleText
    text_end

GreenAfterBattleText:
    text_far _GreenAfterBattleText
    text_end
