TradeMons:
; AndrewNote - update all in-game trades
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
	db GOLEM,   RHYDON,  TRADE_DIALOGSET_CASUAL, "BARNEY@@@@@"
	db ABRA,       JYNX,   TRADE_DIALOGSET_CASUAL, "POPO@@@@@@@"
	db BUTTERFREE, SCYTHER,  TRADE_DIALOGSET_HAPPY,  "JACK@@@@@@@"
	db CLEFABLE,    CHANSEY,      TRADE_DIALOGSET_CASUAL, "THE BLOB@@@"
	db SPEAROW,    FARFETCHD, TRADE_DIALOGSET_HAPPY,  "DUX@@@@@@@@"
	db SLOWBRO,    LICKITUNG, TRADE_DIALOGSET_CASUAL, "GLUTTONY@@@"
	db POLIWHIRL,  MR_MIME,      TRADE_DIALOGSET_POLITE, "BORIS@@@@@@"
	db ELECTABUZZ, GENGAR, TRADE_DIALOGSET_POLITE, "CASPER@@@@@"
	db MAGMAR,    ALAKAZAM,   TRADE_DIALOGSET_HAPPY,  "EINSTEIN@@@"
	db MR_MIME,  TAUROS, TRADE_DIALOGSET_HAPPY,  "ROCKY@@@@@@"
	assert_table_length NUM_NPC_TRADES
