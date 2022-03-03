PokemonTower1F_Script:
	jp EnableAutoTextBoxDrawing

PokemonTower1F_TextPointers:
	dw PokemonTower1Text1
	dw PokemonTower1Text2
	dw PokemonTower1Text3
	dw PokemonTower1Text4
	dw PokemonTower1Text5
	dw PokemonTower1Text6

PokemonTower1Text1:
	text_far _PokemonTower1Text1
	text_end

PokemonTower1Text2:
	text_far _PokemonTower1Text2
	text_end

PokemonTower1Text3:
	text_far _PokemonTower1Text3
	text_end

PokemonTower1Text4:
	text_far _PokemonTower1Text4
	text_end

PokemonTower1Text5:
	text_far _PokemonTower1Text5
	text_end

PokemonTower1Text6:
	text_asm
    CheckEvent EVENT_BEAT_ELITE_4
	jr z, .e4NotBeaten
	CheckEvent EVENT_BEAT_YUNA
	jr nz, .afterBeat
.beforeBeat
    ld hl, PokemonTower7BattleText4
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, PokemonTower7EndBattleText4
	ld de, PokemonTower7EndBattleText4
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	SetEvent EVENT_NO_ITEMS
	SetEvent EVENT_NO_SHIFT
	SetEvent EVENT_MAX_STAT_EXP
	SetEvent EVENT_DONT_TAKE_MONEY
	SetEvent EVENT_BIG_BONUS_MONEY
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	jr .done
.afterBeat
	ld hl, PokemonTower7AfterBattleText4
	call PrintText
    call RematchChoice ; AndrewNote - offer rematch
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .beforeBeat
.bye
    ld hl, YunaBye
    call PrintText
	jr .done
.e4NotBeaten
    ld hl, PokemonTower7BeforeBattleText4
    call PrintText
    jr .done
.done
	jp TextScriptEnd

YunaBye:
    text_far _YunaBye
    text_end
_YunaBye:
    text "Good luck"
    line "on your journey."
    done

PokemonTower7BeforeBattleText4:
	text_far _PokemonTower7BeforeBattleText4
	text_end

PokemonTower7BattleText4:
	text_far _PokemonTower7BattleText4
	text_end

PokemonTower7EndBattleText4:
	text_far _PokemonTower7EndBattleText4
	text_asm
	SetEvent EVENT_BEAT_YUNA
	ret

PokemonTower7AfterBattleText4:
	text_far _PokemonTower7AfterBattleText4
	text_end
