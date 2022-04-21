Route23_Script:
	call Route23Script_511e9
	call EnableAutoTextBoxDrawing
	ld hl, Route23_ScriptPointers
	ld a, [wRoute23CurScript]
	jp CallFunctionInTable

Route23Script_511e9:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	ResetEvents EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2
	ResetEvents EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH1, EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH2
	ld a, HS_VICTORY_ROAD_3F_BOULDER
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_VICTORY_ROAD_2F_BOULDER
	ld [wMissableObjectIndex], a
	predef_jump HideObject

Route23_ScriptPointers:
	dw Route23Script0
	dw Route23Script1
	dw Route23Script2

Route23Script0:
	ld hl, YCoordsData_51255
	ld a, [wYCoord]
	ld b, a
	ld e, $0
	EventFlagBit c, EVENT_PASSED_EARTHBADGE_CHECK + 1, EVENT_PASSED_CASCADEBADGE_CHECK
.asm_51224
	ld a, [hli]
	cp -1
	ret z
	inc e
	dec c
	cp b
	jr nz, .asm_51224
	cp 35
	jr nz, .asm_51237
	ld a, [wXCoord]
	cp 14
	ret nc
.asm_51237
	ld a, e
	ldh [hSpriteIndexOrTextID], a
	ld a, c
	ld [wWhichBadge], a
	ld b, FLAG_TEST
	EventFlagAddress hl, EVENT_PASSED_CASCADEBADGE_CHECK
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	call Route23Script_5125d
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	ret

YCoordsData_51255:
	db 35
	db 56
	db 85
	db 96
	db 105
	db 119
	db 136
	db -1 ; end

Route23Script_5125d:
	ld hl, BadgeTextPointers
	ld a, [wWhichBadge]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcd6d
.copyTextLoop
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copyTextLoop
	ret

BadgeTextPointers:
	dw CascadeBadgeText
	dw ThunderBadgeText
	dw RainbowBadgeText
	dw SoulBadgeText
	dw MarshBadgeText
	dw VolcanoBadgeText
	dw EarthBadgeText

EarthBadgeText:
	db "EARTHBADGE@"

VolcanoBadgeText:
	db "VOLCANOBADGE@"

MarshBadgeText:
	db "MARSHBADGE@"

SoulBadgeText:
	db "SOULBADGE@"

RainbowBadgeText:
	db "RAINBOWBADGE@"

ThunderBadgeText:
	db "THUNDERBADGE@"

CascadeBadgeText:
	db "CASCADEBADGE@"

Route23Script_512d8:
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	jp StartSimulatingJoypadStates

Route23Script1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
Route23Script2:
	ld a, $0
	ld [wRoute23CurScript], a
	ret

Route23_TextPointers:
	dw Route23Text1
	dw Route23Text2
	dw Route23Text3
	dw Route23Text4
	dw Route23Text5
	dw Route23Text6
	dw Route23Text7
	dw Route23Text8
	dw Route23Text9
	dw Route23Text10

Route23Text1:
	text_asm
	EventFlagBit a, EVENT_PASSED_EARTHBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23Script_51346
	jp TextScriptEnd

Route23Text2:
	text_asm
	EventFlagBit a, EVENT_PASSED_VOLCANOBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23Script_51346
	jp TextScriptEnd

Route23Text3:
	text_asm
	EventFlagBit a, EVENT_PASSED_MARSHBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23Script_51346
	jp TextScriptEnd

Route23Text4:
	text_asm
	EventFlagBit a, EVENT_PASSED_SOULBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23Script_51346
	jp TextScriptEnd

Route23Text5:
	text_asm
	EventFlagBit a, EVENT_PASSED_RAINBOWBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23Script_51346
	jp TextScriptEnd

Route23Text6:
	text_asm
	EventFlagBit a, EVENT_PASSED_THUNDERBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23Script_51346
	jp TextScriptEnd

Route23Text7:
	text_asm
	EventFlagBit a, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23Script_51346
	jp TextScriptEnd

Route23Script_51346:
	ld [wWhichBadge], a
	call Route23Script_5125d
	ld a, [wWhichBadge]
	inc a
	ld c, a
	ld b, FLAG_TEST
	ld hl, wObtainedBadges
	predef FlagActionPredef
	ld a, c
	and a
	jr nz, .asm_5136e
	ld hl, VictoryRoadGuardText1
	call PrintText
	call Route23Script_512d8
	ld a, $1
	ld [wRoute23CurScript], a
	ret
.asm_5136e
	ld hl, VictoryRoadGuardText2
	call PrintText
	ld a, [wWhichBadge]
	ld c, a
	ld b, FLAG_SET
	EventFlagAddress hl, EVENT_PASSED_CASCADEBADGE_CHECK
	predef FlagActionPredef
	ld a, $2
	ld [wRoute23CurScript], a
	ret

Route23Script_51388:
	ld hl, VictoryRoadGuardText2
	jp PrintText

VictoryRoadGuardText1:
	text_far _VictoryRoadGuardText1
	text_asm
	ld a, SFX_DENIED
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jp TextScriptEnd

VictoryRoadGuardText2:
	text_far _VictoryRoadGuardText2
	sound_get_item_1
	text_far _VictoryRoadGuardText_513a3
	text_end

Route23Text8:
	text_far _Route23Text8
	text_end
	
; AndrewNote - Sephiroth battle
Route23Text9:
    text_asm
	CheckEvent EVENT_BEAT_SEPHIROTH
	jr nz, .afterBeat
	ld hl, SephirothBattleText
	call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .noBattle
.beforeBeat
    ld hl, SephirothBeginBattleText
    call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SephirothEndBattleText
	ld de, SephirothEndBattleText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
    SetEvent EVENT_NO_SHIFT
    SetEvent EVENT_NO_ITEMS
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	jp TextScriptEnd
.afterBeat
	ld hl, SephirothAfterBattleText
	call PrintText
    call RematchChoice ; AndrewNote - offer rematch
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .beforeBeat
.noBattle
    ld hl, SephirothNoBattleText
    call PrintText
    jp TextScriptEnd

SephirothBattleText:
    text_far _SephirothBattleText
    text_end

SephirothBeginBattleText:
    text_far _SephirothBeginBattleText
    text_end

SephirothEndBattleText:
    text_far _SephirothEndBattleText
    text_asm
    SetEvent EVENT_BEAT_SEPHIROTH
    jp TextScriptEnd

SephirothAfterBattleText:
    text_far _SephirothAfterBattleText
    text_end

SephirothNoBattleText:
    text_far _SephirothNoBattleText
    text_end

_SephirothBattleText:
    text "You creatures"
    line "are too weak"
    cont "to survive."

    para "You can not"
    line "hope to defeat"
    cont "me."

    para "Shall I give"
    line "you despair?"
    done

_SephirothBeginBattleText:
	text "I am..."

	para "SEPHIROTH"

	para "Mother..."

	para "Our time has"
	line "come!"

	para "Nothing can"
	line "stop us!"
    done

_SephirothEndBattleText:
    text "I will"
    line "never be a"
    cont "memory."
    prompt

_SephirothNoBattleText:
    text "A wise choice."

    para "But this world"
    line "is near its end."

    para "Soon all shall"
    line "become one with"
    cont "me."
    done

_SephirothAfterBattleText:
    text "Have you seen"
    line "CLOUD?"

    para "Bring CLOUD"
    line "to me."
    done

Route23Text10:
    text_asm
	ld hl, QuitterText1
	call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr z, .done
    ld hl, QuitterText2
	call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .done
    ld hl, QuitterText3
	call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr z, .done
    ld hl, QuitterText4
	call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .done
    lb bc, FULL_RESTORE, 5
	call GiveItem
	jr nc, .bagFull
    ld hl, QuitterNeverGiveUpText
	call PrintText
    ld hl, GotFullRestoresText
	call PrintText
    jp TextScriptEnd
.bagFull
    ld hl, BagFullText
	call PrintText
    jp TextScriptEnd
.done
	ld hl, QuitterQuitsText
	call PrintText
    jp TextScriptEnd

QuitterNeverGiveUpText:
    text_far _QuitterNeverGiveUpText
    text_end
_QuitterNeverGiveUpText:
    text "You are right!"

    para "I have got here"
    line "because I am"
    cont "strong."

    para "I must keep"
    line "going and"
    cont "believe in"
    cont "myself."

    para "Here have these"
    line "my friend."

    para "I have lots of"
    line "them."
    prompt

GotFullRestoresText:
    text_far _GotFullRestoresText
    sound_get_item_1
    text_end
_GotFullRestoresText:
    text "Received 5"
    line "Full Restores!"
    done

BagFullText:
    text_far _BagFullText
    text_end
_BagFullText:
    text "You've got too"
    line "much stuff for"
    cont "my gift."
    done

QuitterText1:
    text_far _QuitterText1
    text_end
_QuitterText1:
    text "What am I"
    line "doing here!?"

    para "What am I"
    line "thinking!?"

    para "I can't do this!"

    para "I should just"
    line "go home."

    para "Don't you think"
    line "I should just"
    cont "go home?"
    prompt

QuitterText2:
    text_far _QuitterText2
    text_end
_QuitterText2:
    text "Yeah I have"
    line "all 8 badges."

    para "But the Gym"
    line "Leaders only"
    cont "gave them to me"
    cont "because they"
    cont "felt sorry for"
    cont "me."

    para "Do you think"
    line "I deserve the"
    cont "badges?"
    prompt

QuitterText3:
    text_far _QuitterText3
    text_end
_QuitterText3:
    text "Well yeah I"
    line "got through"
    cont "victory road."

    para "But I got"
    line "lucky that few"
    cont "other trainers"
    cont "challenged me."

    para "I am way weaker"
    line "than them."

    para "Look how cool"
    line "and confident"
    cont "they are."

    para "Not like me."

    para "I'm weak."

    para "Don't you think"
    line "I'm weak?"
    prompt

QuitterText4:
    text_far _QuitterText4
    text_end
_QuitterText4:
    text "Maybe you're"
    line "right."

    para "I have made it"
    line "this far and"
    cont "many others"
    cont "haven't."

    para "But..."

    para "I'm afraid."

    para "You say it's"
    line "ok to be"
    cont "nervous."

    para "Maybe I can"
    line "do this."

    para "Do you think"
    line "I can do this?"
    prompt

QuitterQuitsText:
    text_far _QuitterQuitsText
    text_end
_QuitterQuitsText:
    text "You are right"
    line "I don't know"
    cont "what I was"
    cont "thinking."

    para "I'm quiting my"
    line "#MON journey"
    cont "and going home."
    done

