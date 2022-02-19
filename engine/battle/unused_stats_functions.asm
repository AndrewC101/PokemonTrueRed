; does nothing since no stats are ever selected (barring glitches)
DoubleSelectedStats:
	ld a, [hWhoseTurn]
	and a
	ld a, [wPlayerStatsToDouble]
	ld hl, wBattleMonAttack
	jr z, .notEnemyTurn
	ld a, [wEnemyStatsToDouble]
	ld hl, wEnemyMonAttack
.notEnemyTurn
	ld c, 4
	ld b, a
.loop
	srl b
	call c, .doubleStat
	inc hl
	inc hl
	dec c
	ret z
	jr .loop
; AndrewNote - taken from shinpokered
.doubleStat
	push bc
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc holds value of stat to double
;double the stat
	sla c
	rl b
;cap stat at 999
	;b register contains high byte & c register contains low byte
	ld a, c ;let's work on low byte first. Note that decimal 999 is $03E7 in hex.
	sub 999 % $100 ;a = a - ($03E7 % $100). Gives a = a - $E7. A byte % $100 always gives the lesser nibble.
	;Note that if a < $E7 then the carry bit 'c' in the flag register gets set due to overflowing with a negative result.
	ld a, b ;now let's work on the high byte
	sbc 999 / $100 ;a = a - ($03E7 / $100 + c_flag). Gives a = a - ($03 + c_flag). A byte / $100 always gives the greater nibble.
	;Note again that if a < $03 then the carry bit remains set.
	;If the bit is already set from the lesser nibble, then its addition here can still make it remain set if a is low enough.
	jr c, .donecapping ;jump to next marker if the c_flag is set. This only remains set if BC <  the cap of $03E7.
	;else let's continue and set the 999 cap
	ld a, 999 / $100 ; else load $03 into a
	ld b, a ;and store it as the high byte
	ld a, 999 % $100 ; else load $E7 into a
	ld c, a ;and store it as the low byte
	;now registers b & c together contain $03E7 for a capped stat value of 999
.donecapping
	ld a, c
	ld [hld], a
	ld [hl], b
	pop bc
	ret

; does nothing since no stats are ever selected (barring glitches)
;HalveSelectedStats:
;	ldh a, [hWhoseTurn]
;	and a
;	ld a, [wPlayerStatsToHalve]
;	ld hl, wBattleMonAttack
;	jr z, .notEnemyTurn
;	ld a, [wEnemyStatsToHalve]
;	ld hl, wEnemyMonAttack
;.notEnemyTurn
;	ld c, 4
;	ld b, a
;.loop
;	srl b
;	call c, .halveStat
;	inc hl
;	inc hl
;	dec c
;	ret z
;	jr .loop

;.halveStat
;	ld a, [hl]
;	srl a
;	ld [hli], a
;	rr [hl]
;	or [hl]
;	jr nz, .nonzeroStat
;	ld [hl], 1
;.nonzeroStat
;	dec hl
;	ret
