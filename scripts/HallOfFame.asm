HallOfFame_Script:
	call EnableAutoTextBoxDrawing
	ld hl, HallOfFame_ScriptPointers
	ld a, [wHallOfFameCurScript]
	jp CallFunctionInTable

HallofFameRoomScript_5a4aa:
	xor a
	ld [wJoyIgnore], a
	ld [wHallOfFameCurScript], a
	ret

HallOfFame_ScriptPointers:
	dw HallofFameRoomScript0
	dw HallofFameRoomScript1
	dw HallofFameRoomScript2
	dw HallofFameRoomScript3

HallofFameRoomScript3:
	ret

HallofFameRoomScript2:
	call Delay3
	ld a, [wLetterPrintingDelayFlags]
	push af
	xor a
	ld [wJoyIgnore], a
	predef HallOfFamePC
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld hl, wFlags_D733
	res 1, [hl]
	inc hl
	set 0, [hl]
	xor a
	ld hl, wLoreleisRoomCurScript
	ld [hli], a ; wLoreleisRoomCurScript
	ld [hli], a ; wBrunosRoomCurScript
	ld [hl], a ; wAgathasRoomCurScript
	ld [wLancesRoomCurScript], a
	ld [wHallOfFameCurScript], a
	; Elite 4 events
	ResetEventRange ELITE4_EVENTS_START, ELITE4_CHAMPION_EVENTS_END, 1
	xor a
	ld [wHallOfFameCurScript], a
	ld a, PALLET_TOWN
	ld [wLastBlackoutMap], a
	farcall SaveSAVtoSRAM
	ld b, 5
.delayLoop
	ld c, 600 / 5
	call DelayFrames
	dec b
	jr nz, .delayLoop
	call WaitForTextScrollButtonPress
	jp Init

HallofFameRoomScript0:
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovement5a528
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wHallOfFameCurScript], a
	ret

RLEMovement5a528:
	db D_UP, 5
	db -1 ; end

HallofFameRoomScript1:
    SetEvent EVENT_BEAT_ELITE_4 ; AndrewNote - flag that Elite 4 has been defeated in this save file
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, $1
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call Delay3
	xor a
	ld [wJoyIgnore], a
	inc a ; PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, HS_CERULEAN_CAVE_GUY ; access to mewtwo
	ld [wMissableObjectIndex], a
	predef HideObject
	; AndrewNote - All objects and events that change after beating Elite 4
	ld a, HS_SAFFRON_CITY_F ; AndrewNote - access to hall of destiny optional bosses
    ld [wMissableObjectIndex], a
    predef HideObject
	ld a, HS_SAFFRON_CITY_2 ; AndrewNote - access to hall of destiny optional bosses
    ld [wMissableObjectIndex], a
    predef HideObject
    ld a, HS_SS_ANNE_2F_GUARD ; AndrewNote - access to ss anne dock gym leader rematches
    ld [wMissableObjectIndex], a
    predef HideObject
    ResetEvent EVENT_SS_ANNE_LEFT ; AndrewNote - ss anne returns
    ResetEvent EVENT_NO_REMATCH_OPTION ; AndrewNote - enable rematches again

    ; AndrewNote - reset legendary birds
	ld a, HS_ZAPDOS
	ld [wMissableObjectIndex], a
	predef ShowObject
    ResetEvent EVENT_BEAT_ZAPDOS

	ld a, HS_ARTICUNO
	ld [wMissableObjectIndex], a
	predef ShowObject
    ResetEvent EVENT_BEAT_ARTICUNO

	ld a, HS_MOLTRES
	ld [wMissableObjectIndex], a
	predef ShowObject
    ResetEvent EVENT_BEAT_MOLTRES

	ld a, $2
	ld [wHallOfFameCurScript], a
	ret

HallOfFame_TextPointers:
	dw HallofFameRoomText1

HallofFameRoomText1:
	text_far _HallofFameRoomText1
	text_end
