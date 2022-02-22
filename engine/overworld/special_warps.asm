SpecialWarpIn::
	call LoadSpecialWarpData
	predef LoadTilesetHeader
	ld hl, wd732
	bit 2, [hl] ; dungeon warp or fly warp?
	res 2, [hl]
	jr z, .next
; if dungeon warp or fly warp
	ld a, [wDestinationMap]
	jr .next2
.next
	bit 1, [hl]
	jr z, .next3
	call DebugStart
.next3
	ld a, 0
.next2
	ld b, a
	ld a, [wd72d]
	and a
	jr nz, .next4
	ld a, b
.next4
	ld hl, wd732
	bit 4, [hl] ; dungeon warp?
	ret nz
; if not dungeon warp
	ld [wLastMap], a
	ret

; gets the map ID, tile block map view pointer, tileset, and coordinates
LoadSpecialWarpData:
	ld a, [wd72d]
	cp TRADE_CENTER
	jr nz, .notTradeCenter
	ld hl, TradeCenterSpec1
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK ; which gameboy is clocking determines who is on the left and who is on the right
	jr z, .copyWarpData
	ld hl, TradeCenterSpec2
	jr .copyWarpData
.notTradeCenter
	cp COLOSSEUM
	jr nz, .notColosseum
	ld hl, ColosseumSpec1
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .copyWarpData
	ld hl, ColosseumSpec2
	jr .copyWarpData
.notColosseum
	ld a, [wd732]
	bit 1, a
	jr nz, .notFirstMap
	bit 2, a
	jr nz, .notFirstMap
	ld hl, FirstMapSpec
.copyWarpData
	ld de, wCurMap
	ld c, $7
.copyWarpDataLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyWarpDataLoop
	ld a, [hli]
	ld [wCurMapTileset], a
	xor a
	jr .done
.notFirstMap
	ld a, [wLastMap] ; this value is overwritten before it's ever read
	ld hl, wd732
	bit 4, [hl] ; used dungeon warp (jumped down hole/waterfall)?
	jr nz, .usedDunegonWarp
	bit 6, [hl] ; return to last pokemon center (or player's house)?
	res 6, [hl]
	jr z, .otherDestination
; return to last pokemon center or player's house
	ld a, [wLastBlackoutMap]
	jr .usedFlyWarp
.usedDunegonWarp
	ld hl, wd72d
	res 4, [hl]
	ld a, [wDungeonWarpDestinationMap]
	ld b, a
	ld [wCurMap], a
	ld a, [wWhichDungeonWarp]
	ld c, a
	ld hl, DungeonWarpList
	ld de, 0
	ld a, 6
	ld [wDungeonWarpDataEntrySize], a
.dungeonWarpListLoop
	ld a, [hli]
	cp b
	jr z, .matchedDungeonWarpDestinationMap
	inc hl
	jr .nextDungeonWarp
.matchedDungeonWarpDestinationMap
	ld a, [hli]
	cp c
	jr z, .matchedDungeonWarpID
.nextDungeonWarp
	ld a, [wDungeonWarpDataEntrySize]
	add e
	ld e, a
	jr .dungeonWarpListLoop
.matchedDungeonWarpID
	ld hl, DungeonWarpData
	add hl, de
	jr .copyWarpData2
.otherDestination
	ld a, [wDestinationMap]
.usedFlyWarp
	ld b, a
	ld [wCurMap], a
	ld hl, FlyWarpDataPtr
.flyWarpDataPtrLoop
	ld a, [hli]
	inc hl
	cp b
	jr z, .foundFlyWarpMatch
	inc hl
	inc hl
	jr .flyWarpDataPtrLoop
.foundFlyWarpMatch
	ld a, [hli]
	ld h, [hl]
	ld l, a
.copyWarpData2
	ld de, wCurrentTileBlockMapViewPointer
	ld c, $6
.copyWarpDataLoop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyWarpDataLoop2
	xor a ; OVERWORLD
	ld [wCurMapTileset], a
.done
	ld [wYOffsetSinceLastSpecialWarp], a
	ld [wXOffsetSinceLastSpecialWarp], a
	ld a, $ff ; the player's coordinates have already been updated using a special warp, so don't use any of the normal warps
	ld [wDestinationWarpID], a
	ret

; AndrewNote - function to warp player home
WarpHome::
    CheckEvent EVENT_NO_REMATCH_OPTION ; can't warp from Elite Four
	jr nz, .noWarp
    CheckEvent EVENT_IN_SAFARI_ZONE ; can't warp from safari Zone
	jr nz, .noWarp
	CheckEvent EVENT_GOT_POKEDEX ; can't warp before getting Pokedex
	jr nz, .next
.noWarp
	callfar ItemUseNotTime
	ret
.next
	call GBPalWhiteOutWithDelay3
	ld a, PALLET_TOWN
	ld [wLastBlackoutMap], a
	ld a, [wd732]
	set 3, a
	res 4, a
	set 6, a
	ld [wd732], a
	;make sure player has at least 1000 money
	ld a, [wPlayerMoney]
	and a
	ret nz
	ld a, [wPlayerMoney + 1]
	cp $10
	ret nc
	ld a, $10
	ld [wPlayerMoney + 1], a
	ret

; AndrewNote - option to forfeit a match - mostly taken from shinpokered
ForfeitTrainerMatch:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z	;return if in a link battle
	ld a, [wIsInBattle]
	cp 0
	ret z	;return if not in battle
	cp 1
	ret z	;return if in wild battle
	ld a, [hJoyHeld]
	and SELECT
	ret z	;return if select is not being held
	ld hl, ForfeitTrainerMatchText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	cp 1
	jr z, .done
	call FaintAllMons
	ret
.done
	ret z
ForfeitTrainerMatchText:
	text_far _ForfeitTrainerMatchText
	text_end
_ForfeitTrainerMatchText::
	text "Forfeit?"
	done

FaintAllMons:
	ld a, $00
	ld [wBattleMonHP], a
	ld [wBattleMonHP + 1], a
	ld [wPartyMon1HP], a
	ld [wPartyMon1HP + 1], a
	ld [wPartyMon2HP], a
	ld [wPartyMon2HP + 1], a
	ld [wPartyMon3HP], a
	ld [wPartyMon3HP + 1], a
	ld [wPartyMon4HP], a
	ld [wPartyMon4HP + 1], a
	ld [wPartyMon5HP], a
	ld [wPartyMon5HP + 1], a
	ld [wPartyMon6HP], a
	ld [wPartyMon6HP + 1], a
	ret


INCLUDE "data/maps/special_warps.asm"
