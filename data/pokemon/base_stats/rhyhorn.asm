	db DEX_RHYHORN ; pokedex id

	db  80,  85,  95,  25,  35
	;   hp  atk  def  spd  spc

    ; AndrewNote - Rhyhorn is now pure rock type, makes Brock harder for bulbasaur and squirtle
	db ROCK, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp

	INCBIN "gfx/pokemon/front/rhyhorn.pic", 0, 1 ; sprite dimensions
	dw RhyhornPicFront, RhyhornPicBack

	db HORN_ATTACK, FIRE_BLAST, THUNDER, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        THRASH,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         FIRE_BLAST,   \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	db 0 ; padding
