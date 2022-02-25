PalletTown_Script:
	CheckEvent EVENT_GOT_POKEBALLS_FROM_OAK
	jr z, .next
	SetEvent EVENT_PALLET_AFTER_GETTING_POKEBALLS
.next
	call EnableAutoTextBoxDrawing
	ld hl, PalletTown_ScriptPointers
	ld a, [wPalletTownCurScript]
	jp CallFunctionInTable

PalletTown_ScriptPointers:
	dw PalletTownScript0
	dw PalletTownScript1
	dw PalletTownScript2
	dw PalletTownScript3
	dw PalletTownScript4
	dw PalletTownScript5
	dw PalletTownScript6

PalletTownScript0:
	CheckEvent EVENT_FOLLOWED_OAK_INTO_LAB
	ret nz
	ld a, [wYCoord]
	cp 1 ; is player near north exit?
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld a, BANK(Music_MeetProfOak)
	ld c, a
	ld a, MUSIC_MEET_PROF_OAK ; "oak appears" music
	call PlayMusic
	ld a, $FC
	ld [wJoyIgnore], a
	SetEvent EVENT_OAK_APPEARED_IN_PALLET

	; trigger the next script
	ld a, 1
	ld [wPalletTownCurScript], a
	ret

PalletTownScript1:
	xor a
	ld [wcf0d], a
	ld a, 1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $FF
	ld [wJoyIgnore], a
	ld a, HS_PALLET_TOWN_OAK
	ld [wMissableObjectIndex], a
	predef ShowObject

	; trigger the next script
	ld a, 2
	ld [wPalletTownCurScript], a
	ret

PalletTownScript2:
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call Delay3
	ld a, 1
	ld [wYCoord], a
	ld a, 1
	ldh [hNPCPlayerRelativePosPerspective], a
	ld a, 1
	swap a
	ldh [hNPCSpriteOffset], a
	predef CalcPositionOfPlayerRelativeToNPC
	ld hl, hNPCPlayerYDistance
	dec [hl]
	predef FindPathToPlayer ; load Oak's movement into wNPCMovementDirections2
	ld de, wNPCMovementDirections2
	ld a, 1 ; oak
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, $FF
	ld [wJoyIgnore], a

	; trigger the next script
	ld a, 3
	ld [wPalletTownCurScript], a
	ret

PalletTownScript3:
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a ; ld a, SPRITE_FACING_DOWN
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, 1
	ld [wcf0d], a
	ld a, $FC
	ld [wJoyIgnore], a
	ld a, 1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
; set up movement script that causes the player to follow Oak to his lab
	ld a, $FF
	ld [wJoyIgnore], a
	ld a, 1
	ld [wSpriteIndex], a
	xor a
	ld [wNPCMovementScriptFunctionNum], a
	ld a, 1
	ld [wNPCMovementScriptPointerTableNum], a
	ldh a, [hLoadedROMBank]
	ld [wNPCMovementScriptBank], a

	; trigger the next script
	ld a, 4
	ld [wPalletTownCurScript], a
	ret

PalletTownScript4:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a ; is the movement script over?
	ret nz

	; trigger the next script
	ld a, 5
	ld [wPalletTownCurScript], a
	ret

PalletTownScript5:
	CheckEvent EVENT_DAISY_WALKING
	jr nz, .next
	CheckBothEventsSet EVENT_GOT_TOWN_MAP, EVENT_ENTERED_BLUES_HOUSE, 1
	jr nz, .next
	SetEvent EVENT_DAISY_WALKING
	ld a, HS_DAISY_SITTING
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_DAISY_WALKING
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
.next
	CheckEvent EVENT_GOT_POKEBALLS_FROM_OAK
	ret z
	SetEvent EVENT_PALLET_AFTER_GETTING_POKEBALLS_2
PalletTownScript6:
	ret

PalletTown_TextPointers:
	dw PalletTownText1
	dw PalletTownText2
	dw PalletTownText3
	dw PalletTownText4
	dw PalletTownText5
	dw PalletTownText6
	dw PalletTownText7
	dw PalletTownText8

PalletTownText1:
	text_asm
	ld a, [wcf0d]
	and a
	jr nz, .next
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, OakAppearsText
	jr .done
.next
	ld hl, OakWalksUpText
.done
	call PrintText
	jp TextScriptEnd

OakAppearsText:
	text_far _OakAppearsText
	text_asm
	ld c, 10
	call DelayFrames
	xor a
	ld [wEmotionBubbleSpriteIndex], a ; player's sprite
	ld [wWhichEmotionBubble], a ; EXCLAMATION_BUBBLE
	predef EmotionBubble
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	jp TextScriptEnd

OakWalksUpText:
	text_far _OakWalksUpText
	text_end

PalletTownText2: ; girl
	text_far _PalletTownText2
	text_end

PalletTownText3: ; fat man
	text_far _PalletTownText3
	text_end

PalletTownText4: ; sign by lab
	text_far _PalletTownText4
	text_end

PalletTownText5: ; sign by fence
	text_far _PalletTownText5
	text_end

PalletTownText6: ; sign by Red's house
	text_far _PalletTownText6
	text_end

PalletTownText7: ; sign by Blue's house
	text_far _PalletTownText7
	text_end

; AndrewNote - Red, a lot of script dedicated to a single npc
PalletTownText8:
	text_asm
    CheckEvent EVENT_BEAT_ELITE_4
	jr z, .e4NotBeaten
	CheckEvent EVENT_BEAT_RED
	jr nz, .afterBeat
    ld hl, RedBattleText
	call PrintText
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .bye
	ld hl, LetsGo
	call PrintText
	jr z, .fight
.beforeBeat
	ld hl, RedBattleText
	call PrintText
.fight
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, RedEndBattleText
	ld de, RedEndBattleText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	SetEvent EVENT_NO_ITEMS
	SetEvent EVENT_NO_SHIFT
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_BIG_BONUS_MONEY
	SetEvent EVENT_SHOULD_BEAT_RED
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	jr .done
.afterBeat
	ld hl, RedAfterBattleText
	call PrintText
    call RematchChoice ; AndrewNote - offer rematch
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .beforeBeat
.bye
    ld hl, RedBye
    call PrintText
	jr .done
.e4NotBeaten
    CheckEvent EVENT_BEAT_MISTY
    jr z, .mistyNotBeaten
    ld hl, RedBeforeBattleText2
    call PrintText
    jr .done
.mistyNotBeaten
    ld hl, RedBeforeBattleText
    call PrintText
.done
	jp TextScriptEnd

RedBye:
	text_far _RedBye
	text_end
_RedBye:
    text "Go have fun!"
    done

LetsGo:
	text_far _LetsGo
	text_end
_LetsGo:
    text "Let's go!"
    done

RedBeforeBattleText2:
    text_far _RedBeforeBattleText2
    text_end
_RedBeforeBattleText2:
    text "You are doing"
    line "well!"

    para "BROCK and MISTY"
    line "are pretty cool"
    cont "aren't they?"

    para "Keep it up"
    line "and don't give"
    cont "up!"

    para "Soon you'll"
    line "be the Champion!"
    done

RedBattleText:
	text_far _RedBattleText
	text_end
_RedBattleText:
    text "You have done"
    line "it!"

    para "Well done!"

    para "I knew you"
    line "would do it."

    para "We are"
    line "powerful!"

    para "Now you get"
    line "full exp from"
    cont "rematches."

    para "And all #MON"
    line "you catch are"
    cont "at their"
    cont "strongest."

    para "The SS Anne"
    line "has returned."

    para "And you can"
    line "now access the"
    cont "SAFFRON"
    cont "Hall of Destiny"

    para "You see..."

	para "In another"
	line "reality."

	para "I am you!"

	para "I was brought"
	line "here by"
	cont "Master OAK."

	para "to test you!"

	para "Do you accept?"
	done

RedBeforeBattleText:
	text_far _FightingDojoBeforeBattleText6
	text_end

RedEndBattleText:
	text_far _FightingDojoEndBattleText6
	text_end

RedAfterBattleText:
	text_far _FightingDojoAfterBattleText6
	text_end
