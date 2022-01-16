	db DEX_GENGAR ; pokedex id

	db  50,  65,  45, 110, 130
	;   hp  atk  def  spd  spc

    ; AndrewNote - Gengar is now pure ghost type but has less hp/defense (to make up for having no weakness), makes Agatha harder
	db GHOST, GHOST ; type
	db 45 ; catch rate
	db 190 ; base exp

	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
	dw GengarPicFront, GengarPicBack

	db HYPNOSIS, PSYCHIC_M, NIGHT_SHADE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         MEGA_DRAIN,   THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         METRONOME,    SELFDESTRUCT, \
	     SKULL_BASH,   DREAM_EATER,  REST,         EXPLOSION,    \
	     SUBSTITUTE,   STRENGTH
	; end

	db 0 ; padding
