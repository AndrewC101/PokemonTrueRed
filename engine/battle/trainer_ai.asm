; creates a set of moves that may be used and returns its address in hl
; unused slots are filled with 0, all used slots may be chosen with equal probability
AIEnemyTrainerChooseMoves:
	ld a, [wIsInBattle]
	dec a
	jr nz, .notwildbattle
	ld hl, wEnemyMonMoves
	ld a, [wCurOpponent]
	cp MEWTWO
	ret nz
	ld a, PROF_OAK ; AndrewNote - give Mewtwo Prof Oak AI
	ld [wTrainerClass], a
.notwildbattle
	ld a, $a
	ld hl, wBuffer ; init temporary move selection array. Only the moves with the lowest numbers are chosen in the end
	ld [hli], a   ; move 1
	ld [hli], a   ; move 2
	ld [hli], a   ; move 3
	ld [hl], a    ; move 4
	ld a, [wEnemyDisabledMove] ; forbid disabled move (if any)
	swap a
	and $f
	jr z, .noMoveDisabled
	ld hl, wBuffer
	dec a
	ld c, a
	ld b, $0
	add hl, bc    ; advance pointer to forbidden move
	ld [hl], $50  ; forbid (highly discourage) disabled move
.noMoveDisabled
	ld hl, TrainerClassMoveChoiceModifications
	ld a, [wTrainerClass]
	ld b, a
.loopTrainerClasses
	dec b
	jr z, .readTrainerClassData
.loopTrainerClassData
	ld a, [hli]
	and a
	jr nz, .loopTrainerClassData
	jr .loopTrainerClasses
.readTrainerClassData
	ld a, [hl]
	and a
	jp z, .useOriginalMoveSet
	push hl
.nextMoveChoiceModification
	pop hl
	ld a, [hli]
	and a
	jr z, .loopFindMinimumEntries
	push hl
	ld hl, AIMoveChoiceModificationFunctionPointers
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc    ; skip to pointer
	ld a, [hli]   ; read pointer into hl
	ld h, [hl]
	ld l, a
	ld de, .nextMoveChoiceModification  ; set return address
	push de
	jp hl         ; execute modification function
.loopFindMinimumEntries ; all entries will be decremented sequentially until one of them is zero
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.loopDecrementEntries
	ld a, [de]
	inc de
	and a
	jr z, .loopFindMinimumEntries
	dec [hl]
	jr z, .minimumEntriesFound
	inc hl
	dec c
	jr z, .loopFindMinimumEntries
	jr .loopDecrementEntries
.minimumEntriesFound
	ld a, c
.loopUndoPartialIteration ; undo last (partial) loop iteration
	inc [hl]
	dec hl
	inc a
	cp NUM_MOVES + 1
	jr nz, .loopUndoPartialIteration
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.filterMinimalEntries ; all minimal entries now have value 1. All other slots will be disabled (move set to 0)
	ld a, [de]
	and a
	jr nz, .moveExisting
	ld [hl], a
.moveExisting
	ld a, [hl]
	dec a
	jr z, .slotWithMinimalValue
	xor a
	ld [hli], a     ; disable move slot
	jr .next
.slotWithMinimalValue
	ld a, [de]
	ld [hli], a     ; enable move slot
.next
	inc de
	dec c
	jr nz, .filterMinimalEntries
	ld hl, wBuffer    ; use created temporary array as move set
	ret
.useOriginalMoveSet
	ld hl, wEnemyMonMoves    ; use original move set
	ret

AIMoveChoiceModificationFunctionPointers:
	dw AIMoveChoiceModification1
	dw AIMoveChoiceModification2
	dw AIMoveChoiceModification3
	dw AIMoveChoiceModification4

; discourages moves that cause no damage but only a status ailment if player's mon already has one
AIMoveChoiceModification1:
	ld a, [wBattleMonStatus]
	and a
	ret z ; return if no status ailment on player's mon
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMovePower]
	and a
	jr nz, .nextMove
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .nextMove
	ld a, [hl]
	add $5 ; heavily discourage move
	ld [hl], a
	jr .nextMove

StatusAilmentMoveEffects:
	db EFFECT_01 ; unused sleep effect
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db -1 ; end

; AndrewNote - adds much more intelligence to enemies
; encourage moves with specific effects when appropriate.
; discourages those moves when they would be redundant
AIMoveChoiceModification2:
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect] ; read move effect
	cp HEAL_EFFECT
    jp z, .handleHealing
    cp EXPLODE_EFFECT
    jp z, .handleHealing
    ld a, [wEnemyMovePower] ; read move damage
    and a
    jp z, .handleBasicStatMoves
    ld a, [wEnemyMoveNum]
.continueEffects
    ld a, [wEnemyMoveEffect] ; read move effect
	cp PARALYZE_EFFECT
    jp z, .handlePara
	ld a, [wEnemyMoveEffect]
	cp ATTACK_UP2_EFFECT
	jp z, .handleAttackBoost
	cp SPECIAL_UP2_EFFECT
    jp z, .handleSpecialBoost
    cp REFLECT_EFFECT
    jp z, .handleReflect
    cp LIGHT_SCREEN_EFFECT
    jp z, .handleLightScreen
    cp FOCUS_ENERGY_EFFECT
    jp z, .checkfocus
    cp SUBSTITUTE_EFFECT
	jp z, .checksub
	cp LEECH_SEED_EFFECT
	jp z, .checkseed
	cp ATTACK_DOWN1_EFFECT
	jp z, .handleAttackDown
	cp DEFENSE_DOWN1_EFFECT
	jp z, .handleDefenseDown
	cp DEFENSE_DOWN2_EFFECT
	jp z, .handleDefenseDown
	cp ACCURACY_DOWN1_EFFECT
	jp z, .handleAccuracyDown
	cp ACCURACY_DOWN2_EFFECT
	jp z, .handleAccuracyDown
	cp SPEED_UP2_EFFECT
	jp z, .handleSpeedUp
	cp DEFENSE_UP2_EFFECT
	jp z, .handleDefenseUp
	cp CONFUSION_EFFECT
	jp z, .handleConfusion
	cp DREAM_EATER_EFFECT
	jp z, .handleDreamEater
	cp SPLASH_EFFECT
	jp z, .handleSplash
	cp SWITCH_AND_TELEPORT_EFFECT
	jp z, .handleSplash
	cp DISABLE_EFFECT
	jp z, .handleDisable
	cp CHARGE_EFFECT
	jp z, .handleDig
	jp .nextMove
.handleBasicStatMoves
; first don't use moves against a sub
;joenote - do not use moves that are ineffective against substitute if a substitute is up
	ld a, [wPlayerBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a	;check for substitute bit
	jr z, .noSub	;if the substitute bit is not set, then skip out of this block
	ld a, [wEnemyMoveEffect]	;get the move effect into a
	push hl
	push de
	push bc
	ld hl, SubstituteImmuneEffects
	ld de, $0001
	call IsInArray	;see if a is found in the hl array (carry flag set if true)
	pop bc
	pop de
	pop hl
	jp c, .discourageMove	;carry flag means the move effect is blocked by substitute
.noSub
; if hp < 1/3 then just attack, don't use an stat moves except healing
    ld a, 3
	push hl
    push bc
    push de
	call AICheckIfHPBelowFraction
    jp c, .discourageWithPop ; discourage non damaging non healing moves if hp < 33%
	pop de
    pop bc
    pop hl
    jp .continueEffects
.handlePara
   ; encourage if slower than opponent
    call StrCmpSpeed
    jp nc, .encouragePara

   ; 50% chance to encourage if faster than opponent
    call Random
    cp 128
    jp c, .encouragePara

    inc [hl] ; 50% to not use para if faster than player
    jp .nextMove

.encouragePara
    jp .stronglyEncourageMove ; strongly encourage if slower than opponent
.handleHealing
    ld a, 2
	push hl
    push bc
    push de
	call AICheckIfHPBelowFraction
	jp nc, .discourageWithPop ; don't heal if above 50% hp
	ld a, 3	;
    call AICheckIfHPBelowFraction
    jp c, .encourageWithPop ; encourage heal if hp below 33%
	pop de
    pop bc
    pop hl
    jp .nextMove
.handleAttackBoost
    CheckEvent EVENT_JAMES_BATTLE ; for enemies over lvl 100, stop at +2
    jr z, .normalLvlAttackBoost
    ld a, [wEnemyMonAttackMod]
    cp 9
    jp c, .superStronglyEncourageMove
    jp .discourageMove
.normalLvlAttackBoost
    ld a, [wEnemyMonAttackMod]
    cp $b
    jp nc, .discourageMove ; don't swords dance after +4
    cp $9
    jp nc, .nextMove
    jp .stronglyEncourageMove ; strongly encourage swords dance if not at + 2
    jp .nextMove
.handleSpecialBoost
    CheckEvent EVENT_ANDREW_BATTLE ; for lvl 255 mewtwo
    jr z, .normalLvlSpecialBoost
    ld a, [wEnemyMonSpecialMod]
    cp 7
    jp c, .encourageMove ; Andrew battle - only use to reverse stat drops
    jp .discourageMove
.normalLvlSpecialBoost
    ld a, [wEnemyMonSpecialMod]
    cp $b
    jp nc, .discourageMove ; don't amnesia after +4
    cp $9
    jp nc, .nextMove ; no preference if at +2
    ld a, [wPlayerMonSpecialMod]
	cp $9
	jp nc, .superStronglyEncourageMove ; extra encourage if player has boosted special and enemy doesn't
    jp .stronglyEncourageMove; strongly encourage amnesia if not at +2
    jp .nextMove
.handleReflect
    push hl
    push bc
    push de
    ld hl, wEnemyBattleStatus3
	bit HAS_REFLECT_UP, [hl]
	jp nz, .discourageWithPop ; don't reflect if already up
	ld a, [wPlayerMonSpecialMod]
	cp $9
	jp nc, .discourageWithPop  ; don't reflect on special attacker
	ld a, [wPlayerMoveType]	;physical move types are numbers $00 to $08 while special is $14 to $1A
    cp $14
    jp nc, .discourageWithPop ; don't reflect if player picked a special attack
	pop de
	pop bc
	pop hl
	;dec [hl]
	;dec [hl] ; encourage reflect if not up
	ld a, [wPlayerMonAttackMod]
    cp $9
    jp nc, .superStronglyEncourageMove  ; further encourage if player over +2 attack
    ld a, [wPlayerMovePower] ; does the player move deal damage
    and a
    jp z, .nextMove
	ld a, [wPlayerMoveType]	;physical move types are numbers $00 to $08 while special is $14 to $1A
    cp $09
    jp c, .superStronglyEncourageMove ; further encourage if player picked a physical damaging move
	jp .nextMove ; jp from now on as we are now out of reach for jr
.handleLightScreen
    push hl
    push bc
    push de
    ld hl, wEnemyBattleStatus3
	bit HAS_LIGHT_SCREEN_UP, [hl]
	jp nz, .discourageWithPop ; don't light screen if already up
    ld a, [wPlayerMonAttackMod]
    cp $9
    jp nc, .discourageWithPop  ; don't light screen on physical attacker
	ld a, [wPlayerMoveType]	;physical move types are numbers $00 to $08 while special is $14 to $1A
    cp $09
    jp c, .discourageWithPop ; don't light screen if player picked a physical attack
	pop de
	pop bc
	pop hl
	;dec [hl]
	;dec [hl] ; encourage light screen if not up
	ld a, [wPlayerMonSpecialMod]
    cp $9
    jp nc, .superStronglyEncourageMove  ; further encourage if player over +2 special
    ld a, [wPlayerMovePower] ; only encourage on moves that deal damage
    and a
    jp z, .nextMove
	ld a, [wPlayerMoveType]	;physical move types are numbers $00 to $08 while special is $14 to $1A
    cp $14
    jp nc, .superStronglyEncourageMove ; further encourage if player picked a special damaging move
	jp .nextMove
.checkfocus	;check status, and heavily discourage if bit is set
	ld a, [wEnemyBattleStatus2]
	bit GETTING_PUMPED, a
	jp nz, .discourageMove
	jp .nextMove
.checksub	;check status, and heavily discourage if bit is set
    ld a, 4	;
	call AICheckIfHPBelowFraction
	jp c, .discourageMove ; don't sub of at 1/4 hp
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a
	jp nz, .discourageMove ; don't use if sub already up
	jp .nextMove
.checkseed
	;first check to make sure leech seed isn't used on a grass pokemon
	push bc
	push hl
	ld hl, wBattleMonType
	ld b, [hl]                 ; b = type 1 of player's pokemon
	inc hl
	ld c, [hl]                 ; c = type 2 of player's pokemon
	ld a, b		;load type 1 into a
	cp GRASS	;is type 1 grass?
	jr z, .seedgrasstest	;skip ahead if type1 is grass
	ld a, c		;load type 2 into a
.seedgrasstest
	pop hl
	pop bc
	cp GRASS	;a is either type 1 grass or it is type 2 yet to be confirmed
	jp z, .discourageMove	;heavily discourage if either of the types are grass
	;else, not to make sure it isn't already used
	;check status, and heavily discourage if bit is set
	ld a, [wPlayerBattleStatus2]
	bit SEEDED, a
	jp nz, .discourageMove
	jp .nextMove
.handleAttackDown
    ld a, [wPlayerMonAttackMod]
    cp $5
    jr c, .discourageMove  ; discourage if player below -2
	jp .nextMove
.handleDefenseDown
    ld a, [wPlayerMonDefenseMod]
    cp $5
    jr c, .discourageMove  ; discourage if player below -2
	jp .nextMove
.handleAccuracyDown
    ld a, [wPlayerMonAccuracyMod]
    cp $7
    jr z, .encourageMove ; lower player accuracy if not lowered yet
    cp $5
    jr c, .discourageMove  ; discourage if player below -2
	jp .nextMove
.handleSpeedUp
    ld a, [wEnemyMonSpeedMod]
    cp $9
    jp nc, .discourageMove ; don't agility after +2
.handleDefenseUp
    ld a, [wEnemyMonDefenseMod]
    cp $b
    jp nc, .discourageMove ; don't barrier after +4
.handleConfusion
    ld a, [wPlayerBattleStatus1]	;load the player pkmn volatile status
	and $80	;check bit 7 for confusion bit
	jp nz, .discourageMove
.handleDreamEater
    ld a, [wBattleMonStatus]	;load the player pkmn non-volatile status
	and $7	;check bits 0 to 2 for sleeping turns
	jp z, .discourageMove	;heavily discourage using dream eater on non-sleeping pkmn
	dec [hl]	;else slightly encourage dream eater's use on a sleeping pkmn
	jp .nextMove
.handleSplash
    jr .discourageMove ; don't use splash!
.handleDisable
    ld a, [wPlayerDisabledMove]
	and a
	jr nz, .discourageMove
.handleDig
    ld a, [wPlayerMoveNum]
    cp DIG
    jp z, .discourageMove
    jp .nextMove
.discourageMove
	ld a, [hl]
    add $10 ; strongly discourage move
    ld [hl], a
	jp .nextMove
.discourageWithPop
    pop de
    pop bc
    pop hl
	ld a, [hl]
    add $10 ; strongly discourage move
    ld [hl], a
	jp .nextMove
.encourageMove
	ld a, [hl]
    sub $2 ; strongly encourage move
    ld [hl], a
	jp .nextMove
.stronglyEncourageMove
	ld a, [hl]
    sub $3 ; strongly encourage move
    ld [hl], a
	jp .nextMove
.superStronglyEncourageMove
	ld a, [hl]
    sub $4 ; strongly encourage move
    ld [hl], a
	jp .nextMove
.encourageWithPop
    pop de
    pop bc
    pop hl
	ld a, [hl]
    sub $4 ; strongly encourage move
    ld [hl], a
	jp .nextMove

; encourages moves that are effective against the player's mon (even if non-damaging).
; discourage damaging moves that are ineffective or not very effective against the player's mon,
; unless there's no damaging move that deals at least neutral damage
AIMoveChoiceModification3:
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	push hl
	push bc
	push de
	callfar AIGetTypeEffectiveness
	pop de
	pop bc
	pop hl
	ld a, [wTypeEffectiveness]
	and a
	jp z, .dontUse
	ld a, [wTypeEffectiveness]
	cp $10
	jr z, .handleNeutral ; AndrewNote - encourage stab moves 50% of the time
	jr c, .notEffectiveMove
	ld a, [wEnemyMovePower] ; AndrewNote - only encourage moves that deal damage
    and a
    jr z, .nextMove
    jr .handleSuperEffective
.handleNeutral
    ; AndrewNote - 50% chance to encourage STAB
	call Random
	cp 128
	jp c, .nextMove ; 50% ignore below

    push bc
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wEnemyMonType1]
	cp b
	pop bc
	jr z, .slightEncourageMove ; extra encouragement to STAB
	push bc
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wEnemyMonType2]
	cp b
	pop bc
	jr z, .slightEncourageMove ; extra encouragement to STAB
	jp .nextMove
.notEffectiveMove ; discourages non-effective moves if better moves are available
	push hl
	push de
	push bc
	ld a, [wEnemyMoveType]
	ld d, a
	ld hl, wEnemyMonMoves  ; enemy moves
	ld b, NUM_MOVES + 1
	ld c, $0
.loopMoves
	dec b
	jr z, .done
	ld a, [hli]
	and a
	jr z, .done
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp SUPER_FANG_EFFECT
	jr z, .betterMoveFound ; Super Fang is considered to be a better move
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .betterMoveFound ; any special damage moves are considered to be better moves
	ld a, [wEnemyMoveType]
	cp d
	jr z, .loopMoves
	ld a, [wEnemyMovePower]
	and a
	jr nz, .betterMoveFound ; damaging moves of a different type are considered to be better moves
	jr .loopMoves
.betterMoveFound
	ld c, a
.done
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jp z, .nextMove
	inc [hl] ; slightly discourage this move
	jp .nextMove
.handleSuperEffective
    dec [hl]
    dec [hl] ; encourage SE more than STAB
    push bc
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wEnemyMonType1]
	cp b
	pop bc
	jr z, .slightEncourageMove ; extra encouragement to STAB
	push bc
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wEnemyMonType2]
	cp b
	pop bc
	jr z, .slightEncourageMove ; extra encouragement to STAB
    jp .nextMove
.slightEncourageMove
    dec [hl]
    jp .nextMove
.encourageMove
	ld a, [hl]
    sub $2 ; encourage move
    ld [hl], a
	jp .nextMove
.dontUse
    ld a, [hl]
    add $10 ; don't use move
    ld [hl], a
	jp .nextMove


; AndrewNote - always heal when below 50% hp
; this makes enemies with recover/softboiled more difficult
AIMoveChoiceModification4:
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove

	; if not a healing move just return
    ld a, [wEnemyMoveEffect] ; read move effect
	cp HEAL_EFFECT
	jp nz, .nextMove

	; if fighting Andrew don't check for rest
    CheckEvent EVENT_ANDREW_BATTLE ; Andrew uses REST at 50%
    jr nz, .skipRestCheck

	; if REST return, don't want rest prioritized at 50%
    ld a, [wEnemyMoveNum]
    cp REST
    jp z, .nextMove

.skipRestCheck
    ; encourage move if below 50%
    ld a, 2
	push hl
    push bc
    push de
	call AICheckIfHPBelowFraction
	jp c, .encourageWithPop ; encourage heal below 50%
	pop de
    pop bc
    pop hl
    jr .nextMove
.encourageWithPop
    pop de
    pop bc
    pop hl
	ld a, [hl]
    sub $4 ; strongly encourage move
    ld [hl], a
	jp .nextMove

; AndrewNote - taken from shinpokered
SubstituteImmuneEffects:	;joenote - added this table to track for substitute immunities
	db $01 ; unused sleep effect
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db CONFUSION_EFFECT
	db LEECH_SEED_EFFECT

; AndrewNote - taken from shinpokered
StrCmpSpeed:	;joenote - function for AI to compare pkmn speeds
	push bc
	push de
	push hl
	ld de, wBattleMonSpeed ; player speed value
	ld hl, wEnemyMonSpeed ; enemy speed value
	ld c, $2	;bytes to copy
.spdcmploop
	ld a, [de]
	cp [hl]
	jr nz, .return
	inc de
	inc hl
	dec c
	jr nz, .spdcmploop
	;At this point:
	;zero flag set means speeds equal
	;carry flag not set means player pkmn faster
	;carry flag set means ai pkmn faster
.return
	pop hl
	pop de
	pop bc
	ret

; AndrewNote - switch if mon is SLP or FRZ and enemy tries to set up on it
AIEnemyTrainerSwitch:
    ld a, [wEnemyMonStatus]
    and SLP | 1 << FRZ ; sleeping or frozen
    ret z

    CheckEvent EVENT_STOP_SWITCHING
    jr z, .keepGoing

    ld a, [wEnemyMonStatus]
    and SLP
    ret nz

.keepGoing
    ld a, [wPlayerMoveEffect] ; read move effect
	cp ATTACK_UP2_EFFECT
	jp z, .switch
	cp ATTACK_UP1_EFFECT
	jp z, .switch
	cp SPECIAL_UP2_EFFECT
    jp z, .switch
	cp SPECIAL_UP1_EFFECT
    jp z, .switch
	cp DEFENSE_UP2_EFFECT
    jp z, .switch
	cp DEFENSE_UP1_EFFECT
    jp z, .switch
    cp SPEED_UP2_EFFECT
    jp z, .switch
    cp HEAL_EFFECT
    jp z, .switch
    cp SUBSTITUTE_EFFECT
    jp z, .switch
    jp .done
.switch
    SetEvent EVENT_ENEMY_MOVE_FIRST
    SetEvent EVENT_AI_JUST_SWITCHED
    call AISwitchIfEnoughMons
.done
    ret

ReadMove:
	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wEnemyMoveNum
	call CopyData
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/trainers/move_choices.asm"

INCLUDE "data/trainers/pic_pointers_money.asm"

INCLUDE "data/trainers/names.asm"

INCLUDE "engine/battle/misc.asm"

INCLUDE "engine/battle/read_trainer_party.asm"

INCLUDE "data/trainers/special_moves.asm"

INCLUDE "data/trainers/parties.asm"

TrainerAI:
    ; AndrewNote - prevent enemy from getting a move after switching
    CheckEvent EVENT_AI_JUST_SWITCHED
    jr nz, .justSwitched
	and a
	ld a, [wIsInBattle]
	dec a
	ret z ; wild battle
	jr .trainer
.justSwitched
    ResetEvent EVENT_AI_JUST_SWITCHED
    ret
.trainer
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; if in a link battle, we're done as well
	ld a, [wTrainerClass] ; what trainer class is this?
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerAIPointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [wAICount]
	and a
	ret z ; if no AI uses left, we're done here
	inc hl
	inc a
	jr nz, .getpointer
	dec hl
	ld a, [hli]
	ld [wAICount], a
.getpointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	jp hl

INCLUDE "data/trainers/ai_pointers.asm"

; AndrewNote - switch if attack, special or accuracy fall to -2 or lower
SwitchAndUseItemsAI:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; AndrewNote - First check for item use             ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    CheckEvent EVENT_FIRST_TURN_GUARD_SPEC
    jr z, .checkFullRestore

    ResetEvent EVENT_FIRST_TURN_GUARD_SPEC
    call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set 1, [hl]
	ld a, GUARD_SPEC
	jp AIPrintItemUse

.checkFullRestore
    CheckEvent EVENT_USE_FULL_RESTORES
    jr z, .checkFullHeal

    CheckEvent EVENT_GUARANTEED_FULL_RESTORE
    jr z, .normalRestore
    ld a, 3
	call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore

.normalRestore
    ; If fighting Andrew he has a small chance to troll with fullRestore
    call Random
	cp $20 ; 1/8 chance to use FR when hp < 1/3
	jr nc, .checkFullHeal
	ld a, 3
	call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore

.checkFullHeal
    CheckEvent EVENT_USE_FULL_HEALS
    jr z, .checkSwitch

    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; AndrewNote - now check for switch        ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.checkSwitch
    ; AndrewNote - switches take priority
    CheckEvent EVENT_ENEMY_SWITCH_NEXT_TURN
    jr nz, .switch

    ld a, [wEnemyMonAttackMod]
    cp $6
    jr c, .prepareSwitch

    ld a, [wEnemyMonSpecialMod]
    cp $6
    jr c, .prepareSwitch

    ld a, [wEnemyMonAccuracyMod]
    cp $6
    jr c, .prepareSwitch

    ld a, [wEnemyBattleStatus2]
	bit 7, a	;check a for the leech seed bit
	jr z, .checkToxic
    call Random	; 25% chance to switch of seeded
	cp $40
	jp c, .prepareSwitch

.checkToxic
	ld hl, wEnemyBattleStatus3
	bit BADLY_POISONED, [hl]
	jr z, .done
	call Random	; 50% chance to switch if intoxicated
	cp $80
	jp c, .prepareSwitch

.done
    ret
.switch
    ResetEvent EVENT_ENEMY_SWITCH_NEXT_TURN
	jp AISwitchIfEnoughMons
.prepareSwitch
    ld a, 4
	call AICheckIfHPBelowFraction
    jr c, .nothing ; don't switch if hp < 25%, just let it die

; If enemy only has 1 Pokemon left, don't try to switch
	ld a, [wEnemyPartyCount]
	ld c, a
	ld hl, wEnemyMon1HP
	ld d, 0 ; keep count of unfainted monsters
; count how many monsters haven't fainted yet
.loop
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .Fainted ; has monster fainted?
	inc d
.Fainted
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl, bc
	pop bc
	dec c
	jr nz, .loop

	ld a, d ; how many available monsters are there?
	cp $1
	jr z, .nothing ; don't bother if only 1

; prepare for switch
    SetEvent EVENT_ENEMY_SWITCH_NEXT_TURN
    SetEvent EVENT_ENEMY_MOVE_FIRST
.nothing

GenericAI:
	and a ; clear carry
	ret

; end of individual trainer AI routines

DecrementAICount:
    ; AndrewNote - give AI infinite uses of items and actions
	;ld hl, wAICount
	;dec [hl]
	scf
	ret

AIPlayRestoringSFX:
	ld a, SFX_HEAL_AILMENT
	jp PlaySoundWaitForCurrent

AIUseFullRestore:
    CheckEvent EVENT_GUARANTEED_FULL_RESTORE
    jr z, .normal
    ResetEvent EVENT_GUARANTEED_FULL_RESTORE
    ld hl, AndrewHealText
    call PrintText
.normal
	call AICureStatus
	ld a, FULL_RESTORE
	ld [wAIItem], a
	ld de, wHPBarOldHP
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, wEnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [wHPBarMaxHP], a
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wHPBarMaxHP+1], a
	ld [wEnemyMonHP], a
	jr AIPrintItemUseAndUpdateHPBar

;AIUsePotion:
; enemy trainer heals his monster with a potion
;	ld a, POTION
;	ld b, 20
;	jr AIRecoverHP

;AIUseSuperPotion:
; enemy trainer heals his monster with a super potion
;	ld a, SUPER_POTION
;	ld b, 50
;	jr AIRecoverHP

;AIUseHyperPotion:
; enemy trainer heals his monster with a hyper potion
;	ld a, HYPER_POTION
;	ld b, 200
	; fallthrough

AIRecoverHP:
; heal b HP and print "trainer used $(a) on pokemon!"
	ld [wAIItem], a
	ld hl, wEnemyMonHP + 1
	ld a, [hl]
	ld [wHPBarOldHP], a
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	ld [wHPBarNewHP+1], a
	jr nc, .next
	inc a
	ld [hl], a
	ld [wHPBarNewHP+1], a
.next
	inc hl
	ld a, [hld]
	ld b, a
	ld de, wEnemyMonMaxHP + 1
	ld a, [de]
	dec de
	ld [wHPBarMaxHP], a
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [wHPBarMaxHP+1], a
	sbc b
	jr nc, AIPrintItemUseAndUpdateHPBar
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [de]
	ld [hl], a
	ld [wHPBarNewHP+1], a
	; fallthrough

AIPrintItemUseAndUpdateHPBar:
	call AIPrintItemUse_
	hlcoord 2, 2
	xor a
	ld [wHPBarType], a
	predef UpdateHPBar2
	jp DecrementAICount

AISwitchIfEnoughMons:
; enemy trainer switches if there are 2 or more unfainted mons in party
	ld a, [wEnemyPartyCount]
	ld c, a
	ld hl, wEnemyMon1HP

	ld d, 0 ; keep count of unfainted monsters

	; count how many monsters haven't fainted yet
.loop
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .Fainted ; has monster fainted?
	inc d
.Fainted
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl, bc
	pop bc
	dec c
	jr nz, .loop

	ld a, d ; how many available monsters are there?
	cp 2    ; don't bother if only 1
	jp nc, SwitchEnemyMon
	and a
	; AndrewNote - reset at end of enemy turn
	ResetEvent EVENT_ENEMY_MOVE_FIRST
	ret

SwitchEnemyMon:
; prepare to withdraw the active monster: copy hp, number, and status to roster

	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1HP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wEnemyMonHP
	ld bc, 4
	call CopyData

	ld hl, AIBattleWithdrawText
	call PrintText

	; This wFirstMonsNotOutYet variable is abused to prevent the player from
	; switching in a new mon in response to this switch.
	ld a, 1
	ld [wFirstMonsNotOutYet], a
	callfar EnemySendOut
	xor a
	ld [wFirstMonsNotOutYet], a

	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z
	ld a, $1
	ldh [hWhoseTurn], a
	scf
	ret

AIBattleWithdrawText:
	text_far _AIBattleWithdrawText
	text_end

AIUseFullHeal:
	call AIPlayRestoringSFX
	call AICureStatus
	ld a, FULL_HEAL
	jp AIPrintItemUse

AICureStatus:
; cures the status of enemy's active pokemon
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1Status
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	xor a
	ld [hl], a ; clear status in enemy team roster
	ld a, [hWhoseTurn]
	push af
	ld a, $01 	;forcibly set it to the AI's turn
	ld [hWhoseTurn], a
	call UndoBurnParStats	;undo brn/par stat changes
	pop af
	ld [hWhoseTurn], a
	xor a
	ld [wEnemyMonStatus], a ; clear status in active enemy data
	ld [wEnemyToxicCounter], a	;clear toxic counter
	ld hl, wEnemyBattleStatus3
	res BADLY_POISONED, [hl]	;clear toxic bit
	ret

AICheckIfHPBelowFraction:
; return carry if enemy trainer's current HP is below 1 / a of the maximum
	ldh [hDivisor], a
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ldh [hDividend], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld b, 2
	call Divide
	ldh a, [hQuotient + 3]
	ld c, a
	ldh a, [hQuotient + 2]
	ld b, a
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld e, a
	ld a, [hl]
	ld d, a
	ld a, d
	sub b
	ret nz
	ld a, e
	sub c
	ret

AIPrintItemUse:
	ld [wAIItem], a
	call AIPrintItemUse_
	jp DecrementAICount

AIPrintItemUse_:
; print "x used [wAIItem] on z!"
	ld a, [wAIItem]
	ld [wd11e], a
	call GetItemName
	ld hl, AIBattleUseItemText
	jp PrintText

AndrewHealText:
    text_far _AndrewHealText
    text_end

AIBattleUseItemText:
	text_far _AIBattleUseItemText
	text_end
