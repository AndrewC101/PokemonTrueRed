SSAnneBow_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne5TrainerHeaders
	ld de, SSAnneBow_ScriptPointers
	ld a, [wSSAnneBowCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnneBowCurScript], a
	ret

SSAnneBow_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnneBow_TextPointers:
	dw SSAnne5Text1
	dw SSAnne5Text2
	dw SSAnne5Text3
	dw SSAnne5Text4
	dw SSAnne5Text5
	dw SSAnne5Text6
	dw SSAnne5Text7
	dw SSAnne5Text8
	dw SSAnne5Text9

; AndrewNote - Add Gym Leader optional bosses
SSAnne5TrainerHeaders:
	def_trainers 4
SSAnne5TrainerHeader0:
	trainer EVENT_BEAT_BROCK_REMATCH, 0, SSAnne5BattleText1, SSAnne5EndBattleText1, SSAnne5RematchText
SSAnne5TrainerHeader1:
	trainer EVENT_BEAT_MISTY_REMATCH, 0, SSAnne5BattleText2, SSAnne5EndBattleText2, SSAnne5RematchText
SSAnne5TrainerHeader2:
	trainer EVENT_BEAT_SURGE_REMATCH, 0, SSAnne5BattleText3, SSAnne5EndBattleText3, SSAnne5RematchText
SSAnne5TrainerHeader3:
	trainer EVENT_BEAT_ERIKA_REMATCH, 0, SSAnne5BattleText4, SSAnne5EndBattleText4, SSAnne5RematchText
SSAnne5TrainerHeader4:
	trainer EVENT_BEAT_KOGA_REMATCH, 0, SSAnne5BattleText5, SSAnne5EndBattleText5, SSAnne5RematchText
SSAnne5TrainerHeader5:
	trainer EVENT_BEAT_SABRINA_REMATCH, 0, SSAnne5BattleText6, SSAnne5EndBattleText6, SSAnne5RematchText
SSAnne5TrainerHeader6:
	trainer EVENT_BEAT_BLAINE_REMATCH, 0, SSAnne5BattleText7, SSAnne5EndBattleText7, SSAnne5RematchText
SSAnne5TrainerHeader7:
	trainer EVENT_BEAT_LORELEI_REMATCH, 0, SSAnne5BattleText8, SSAnne5EndBattleText8, SSAnne5RematchText
SSAnne5TrainerHeader8:
	trainer EVENT_BEAT_BRUNO_REMATCH, 0, SSAnne5BattleText9, SSAnne5EndBattleText9, SSAnne5RematchText
	db -1 ; end

; AndrewNote - Gym leader optional bosses
SSAnne5Text1:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, SSAnne5TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5Text2:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, SSAnne5TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5Text3:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, SSAnne5TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5Text4:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, SSAnne5TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5BattleText1:
	text_far _SSAnne5BattleText1
	text_end

SSAnne5EndBattleText1:
	text_far _SSAnne5EndBattleText1
	text_end

SSAnne5Text5:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, SSAnne5TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5Text6:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, SSAnne5TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5Text7:
	text_asm
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, SSAnne5TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5Text8:
	text_asm
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, SSAnne5TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5Text9:
	text_asm
	SetEvent EVENT_BIG_BONUS_MONEY
	ld hl, SSAnne5TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5BattleText2:
	text_far _SSAnne5BattleText2
	text_end

SSAnne5EndBattleText2:
	text_far _SSAnne5EndBattleText2
	text_end

SSAnne5BattleText3:
	text_far _SSAnne5BattleText3
	text_end

SSAnne5EndBattleText3:
	text_far _SSAnne5EndBattleText3
	text_end

SSAnne5BattleText4:
	text_far _SSAnne5BattleText4
	text_end

SSAnne5EndBattleText4:
	text_far _SSAnne5EndBattleText4
	text_end

SSAnne5BattleText5:
	text_far _SSAnne5BattleText5
	text_end

SSAnne5EndBattleText5:
	text_far _SSAnne5EndBattleText5
	text_end

SSAnne5BattleText6:
	text_far _SSAnne5BattleText6
	text_end

SSAnne5EndBattleText6:
	text_far _SSAnne5EndBattleText6
	text_end

SSAnne5BattleText7:
	text_far _SSAnne5BattleText7
	text_end

SSAnne5EndBattleText7:
	text_far _SSAnne5EndBattleText7
	text_end

SSAnne5BattleText8:
	text_far _SSAnne5BattleText8
	text_end

SSAnne5EndBattleText8:
	text_far _SSAnne5EndBattleText8
	text_end

SSAnne5BattleText9:
	text_far _SSAnne5BattleText9
	text_end

SSAnne5EndBattleText9:
	text_far _SSAnne5EndBattleText9
	text_end

SSAnne5RematchText:
	text_far _SSAnne5RematchText
	text_end
