EndOfBattle:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .notLinkBattle
; link battle
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1Status
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld a, [wEnemyMonStatus]
	ld [hl], a
	call ClearScreen
	callfar DisplayLinkBattleVersusTextBox
	ld a, [wBattleResult]
	cp $1
	ld de, YouWinText
	jr c, .placeWinOrLoseString
	ld de, YouLoseText
	jr z, .placeWinOrLoseString
	ld de, DrawText
.placeWinOrLoseString
	hlcoord 6, 8
	call PlaceString
	ld c, 200
	call DelayFrames
	jp .evolution
.notLinkBattle
    ; AndrewNote - reset battle events that must be reset
    callfar ClearAISentOut

    CheckEvent EVENT_JAMES_BATTLE
    jr z, .checkAndrew
    lb bc, RARE_CANDY, 99 ; AndrewNote - James gives 99 rare candies
    call GiveItem

.checkAndrew
    CheckEvent EVENT_ANDREW_BATTLE
    jr z, .resetEvents
    lb bc, MASTER_BALL, 99 ; AndrewNote - Andrew gives 99 master balls
    call GiveItem

.resetEvents
    ResetEvent EVENT_NO_SHIFT
    ResetEvent EVENT_NO_ITEMS
	ResetEvent EVENT_REMATCH
	ResetEvent EVENT_STOP_SWITCHING
	ResetEvent EVENT_USE_FULL_RESTORES
	ResetEvent EVENT_USE_FULL_HEALS
	ResetEvent EVENT_HIGH_LVL_ENEMY
	ResetEvent EVENT_ANDREW_BATTLE
	ResetEvent EVENT_JAMES_BATTLE

	CheckEvent EVENT_RESET_MEWTWO_ENCOUNTER
	jr z, .continue
	ResetEvent EVENT_RESET_MEWTWO_ENCOUNTER

	ld a, HS_MEWTWO
	ld [wMissableObjectIndex], a
	predef ShowObject
	ResetEvent EVENT_BEAT_MEWTWO

.continue
	ld a, [wBattleResult]
	and a
	jp nz, .resetVariables

    ; AndrewNote - give x100 bonus money. Only for Master Oak
    ; This is some crude code but does the job
    CheckEvent EVENT_MAX_BONUS_MONEY
    jr z, .checkBigBonus
    call BonusIncrementBig
    call BonusIncrementBig
    call BonusIncrementBig
    call BonusIncrementBig
    call BonusIncrementBig
    call BonusIncrementBig
    call BonusIncrementBig
    call BonusIncrementBig
    call BonusIncrementBig
    call BonusIncrementBig
	ld hl, MaxBonusMoneyText
	call PrintText
    jr .continueMoney

.checkBigBonus
    CheckEvent EVENT_BIG_BONUS_MONEY
    jr z, .checkBonus
    call BonusIncrementBig
	ld hl, BigBonusMoneyText
	call PrintText
    jr .continueMoney

.checkBonus
    CheckEvent EVENT_BONUS_MONEY
    jr z, .continueMoney
    call BonusIncrement
	ld hl, BonusMoneyText
	call PrintText
    jr .continueMoney

.continueMoney
    ResetEvent EVENT_BONUS_MONEY
    ResetEvent EVENT_BIG_BONUS_MONEY
    ResetEvent EVENT_MAX_BONUS_MONEY
	ld hl, wTotalPayDayMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .evolution ; if pay day money is 0, jump
	ld de, wPlayerMoney + 2
	ld c, $3
	predef AddBCDPredef
	ld hl, PickUpPayDayMoneyText
	call PrintText
.evolution
	xor a
	ld [wForceEvolution], a
	predef EvolutionAfterBattle
.resetVariables
	xor a
	ld [wLowHealthAlarm], a ;disable low health alarm
	ld [wChannelSoundIDs + Ch5], a
	ld [wIsInBattle], a
	ld [wBattleType], a
	ld [wMoveMissed], a
	ld [wCurOpponent], a
	ld [wForcePlayerToChooseMon], a
	ld [wNumRunAttempts], a
	ld [wEscapedFromBattle], a
	ld hl, wPartyAndBillsPCSavedMenuItem
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wListScrollOffset], a
	ld hl, wPlayerStatsToDouble
	ld b, $18
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ld hl, wd72c
	set 0, [hl]
	call WaitForSoundToFinish
	call GBPalWhiteOut
	ld a, $ff
	ld [wDestinationWarpID], a
	ret

BonusIncrement:
	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money
	ret

; AndrewNote - this is crap, but gets the job done
BonusIncrementBig:
	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money

	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money

	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money

	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money

	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money

	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money

	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money

	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money

	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money

	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money
	ret

YouWinText:
	db "YOU WIN@"

YouLoseText:
	db "YOU LOSE@"

DrawText:
	db "  DRAW@"

PickUpPayDayMoneyText:
	text_far _PickUpPayDayMoneyText
	text_end

BonusMoneyText:
	text_far _BonusMoneyText
	text_end

BigBonusMoneyText:
	text_far _BigBonusMoneyText
	text_end

MaxBonusMoneyText:
	text_far _MaxBonusMoneyText
	text_end
