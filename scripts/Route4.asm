Route4_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route4TrainerHeaders
	ld de, Route4_ScriptPointers
	ld a, [wRoute4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute4CurScript], a
	ret

Route4_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route4_TextPointers:
	dw Route4Text1
	dw Route4Text2
	dw PickUpItemText
	dw PokeCenterSignText
	dw Route4Text5
	dw Route4Text6

Route4TrainerHeaders:
	def_trainers 2
Route4TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_0, 0, Route4BattleText1, Route4EndBattleText1, Route4AfterBattleText1
	db -1 ; end

Route4Text1:
	text_far _Route4Text1
	text_end

; AndrewNote - optional boss outside Cerulean Cave
Route4Text2:
	text_asm
	CheckEvent EVENT_BEAT_ELITE_4
	jr z, .e4NotBeaten  ; AndrewNote - trainer will only battle after beating Elite 4
	predef HealParty    ; AndrewNote - trainer heals party for easy grinding
	call GBFadeOutToWhite
	call Delay3
	call GBFadeInFromWhite
	; AndrewNote - set boss battle events
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
    SetEvent EVENT_NO_SHIFT
    SetEvent EVENT_NO_ITEMS
	ld hl, Route4HealText
	call PrintText
	ld hl, Route4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd
.e4NotBeaten
    ld hl, Route4AfterBattleText1
    call PrintText
    jp TextScriptEnd

Route4BattleText1:
	text_far _Route4BattleText1
	text_end

Route4EndBattleText1:
	text_far _Route4EndBattleText1
	text_end

Route4AfterBattleText1:
	text_far _Route4AfterBattleText1
	text_end

Route4Text5:
	text_far _Route4Text5
	text_end

Route4Text6:
	text_far _Route4Text6
	text_end

Route4HealText:
	text_far _Route15HealText
	text_end
