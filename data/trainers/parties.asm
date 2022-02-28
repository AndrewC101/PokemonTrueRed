TrainerDataPointers:
	dw YoungsterData
	dw BugCatcherData
	dw LassData
	dw SailorData
	dw JrTrainerMData
	dw JrTrainerFData
	dw PokemaniacData
	dw SuperNerdData
	dw HikerData
	dw BikerData
	dw BurglarData
	dw EngineerData
	dw UnusedJugglerData
	dw FisherData
	dw SwimmerData
	dw CueBallData
	dw GamblerData
	dw BeautyData
	dw PsychicData
	dw RockerData
	dw JugglerData
	dw TamerData
	dw BirdKeeperData
	dw BlackbeltData
	dw Green1Data
	dw ProfOakData
	dw ChiefData
	dw ScientistData
	dw GiovanniData
	dw RocketData
	dw CooltrainerMData
	dw CooltrainerFData
	dw BrunoData
	dw BrockData
	dw MistyData
	dw LtSurgeData
	dw ErikaData
	dw KogaData
	dw BlaineData
	dw SabrinaData
	dw GentlemanData
	dw Green2Data
	dw Green3Data
	dw LoreleiData
	dw ChannelerData
	dw AgathaData
	dw LanceData

; if first byte != $FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == $FF, then
	; first byte is $FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

; AndrewNote - update all trainers
YoungsterData:
; Route 3
	db 13, BULBASAUR, EKANS, 0
	db 17, SPEAROW, 0
; Mt. Moon 1F
	db 12, RATTATA, SPEAROW, SANDSHREW, 0
; Route 24
	db 17, WARTORTLE, EKANS, NIDORINO, 0
; Route 25
	db 18, PIDGEOTTO, PIKACHU, 0
	db 20, FEAROW, 0
	db 19, NIDORINO, SANDSHREW, 0
; SS Anne 1F Rooms
	db 25, NIDOKING, 0
; Route 11
	db 27, CHARMELEON, 0
	db 25, IVYSAUR, WARTORTLE, CHARMELEON, 0
	db 23, WARTORTLE, PIDGEOTTO, FEAROW, 0
	db 25, RATICATE, FEAROW, NIDOKING, NIDOQUEEN, 0

BugCatcherData:
; Viridian Forest
	db 7, METAPOD, KAKUNA, 0
	db 8, WEEDLE, CATERPIE, WEEDLE, 0
	db 11, BEEDRILL, 0
; Route 3
	db 10, BUTTERFREE, BEEDRILL, PARAS, 0
	db 10, BUTTERFREE, BEEDRILL, BUTTERFREE, BEEDRILL, 0
	db 13, BUTTERFREE, BUTTERFREE, 0
; Mt. Moon 1F
	db 13, BEEDRILL, BEEDRILL, 0
	db 10, BUTTERFREE, BEEDRILL, VENONAT, 0
; Route 24
	db 18, BUTTERFREE, BEEDRILL, 0
; Route 6
	db 18, BUTTERFREE, BUTTERFREE, BEEDRILL, 0
	db 25, SCYTHER, 0
; Unused
	db 18, METAPOD, CATERPIE, VENONAT, 0
; Route 9
	db 28, PINSIR, PARASECT, 0
	db 30, VENOMOTH, SCYTHER, PINSIR, 0
; weevil underwood in viridan forest
    db 30, VENOMOTH, 0

LassData:
; Route 3
	db 14, PIDGEY, PIDGEY, 0
	db 15, RATTATA, POLIWAG, 0
	db 18, JIGGLYPUFF, 0
; Route 4 optional boss
	db 85, CHANSEY, CHANSEY, CHANSEY, CHANSEY, CHANSEY, CHANSEY, 0
; Mt. Moon 1F
	db 16, ODDISH, BELLSPROUT, 0
	db 20, CLEFAIRY, 0
; Route 24
	db 18, PIDGEOTTO, NIDOQUEEN, 0
	db 14, PIDGEOTTO, NIDOKING, 0
; Route 25
	db 18, NIDORINO, NIDORINA, 0
	db 19, MEOWTH, VULPIX, BELLSPROUT, 0
; SS Anne 1F Rooms
	db 21, RAICHU, NIDOQUEEN, 0
; SS Anne 2F Rooms
	db 21, RATICATE, RAICHU, 0
; Route 8
	db 33, NIDOQUEEN, NIDOKING, 0
	db 35, PERSIAN, WIGGLYTUFF, CHANSEY, 0
	db 33, PIDGEOT, ARBOK, VILEPLUME, PERSIAN, RAICHU, 0
	db 31, WIGGLYTUFF, CLEFABLE, 0
; Celadon Gym
	db 43, PARASECT, TANGELA, 0
	db 42, PARASECT, VILEPLUME, 0
; Lance Sister
    db 45, DRAGONAIR, SEADRA, CHARIZARD, 0
; Karen
    db $FF, 61, PERSIAN, 62, VILEPLUME, 63, ARBOK, 64, GENGAR, 65, FLAREON, 0

SailorData:
; SS Anne Stern
	db 24, MACHOKE, SHELLDER, 0
	db 24, MACHOKE, TENTACOOL, 0
; SS Anne B1F Rooms
	db 23, POLIWHIRL, 0
	db 21, STARYU, SHELLDER, SEEL, 0
	db 22, WARTORTLE, DRATINI, 0
	db 21, PSYDUCK, MACHOP, MR_MIME, 0
	db 25, GYARADOS, 0
; Vermilion Gym
	db 28, MAGNETON, GOLDUCK, 0

JrTrainerMData:
; Pewter Gym
	db 13, GEODUDE, SANDSHREW, 0
; Route 24/Route 25
	db 16, RATICATE, EKANS, 0
; Route 24
	db 23, PRIMEAPE, SANDSLASH, 0
; Route 6
	db 22, SLOWPOKE, 0
	db 20, FEAROW, RATICATE, 0
; Route 9
	db 22, ARBOK, CHARMELEON, 0
	db 25, RATICATE, FEAROW, KADABRA, SANDSLASH, 0
; Route 12
	db 40, NIDOKING, CHARIZARD, BLASTOISE, 0
; Red
    db 100, PIKACHU, LAPRAS, SNORLAX, BLASTOISE, CHARIZARD, VENUSAUR, 0
; YuGiOh
    db $FF, 93, CLEFABLE, 95, JYNX, 97, ALAKAZAM, 100, ARTICUNO, 100, ZAPDOS, 100, MOLTRES, 0

JrTrainerFData:
; Cerulean Gym
	db 25, POLIWHIRL, 0
; Route 6
	db 19, RATICATE, PIKACHU, 0
	db 21, PIDGEOTTO, PIDGEOTTO, KADABRA, 0
; unused
	db 40, VENUSAUR, 0
; Route 9
	db 31, PIDGEOTTO, IVYSAUR, CHARMELEON, WARTORTLE, 0
	db 34, PERSIAN, 0
; Route 10
	db 31, RAICHU, WIGGLYTUFF, 0
	db 30, FEAROW, FLAREON, 0
; Rock Tunnel B1F
	db 30, WIGGLYTUFF, HITMONLEE, HITMONCHAN, 0
	db 29, VILEPLUME, VAPOREON, 0
; Celadon Gym
	db 42, VILEPLUME, KANGASKHAN, 0
; Route 13
	db 40, PIDGEOT, MR_MIME, VICTREEBEL, RAICHU, VAPOREON, 0
	db 42, GOLDUCK, JOLTEON, 0
	db 43, NIDOQUEEN, PERSIAN, MACHOKE, SEADRA, 0
	db 45, JYNX, POLIWRATH, CHANSEY, 0
; Route 20
	db 40, SEAKING, DRAGONAIR, 0
; Rock Tunnel 1F
	db 29, WEEPINBELL, NINETALES, 0
	db 30, RATICATE, VILEPLUME, PIDGEOTTO, 0
	db 30, PIDGEOTTO, RATICATE, WARTORTLE, KANGASKHAN, 0
; Route 15
	db 31, VENUSAUR, ARCANINE, POLIWRATH, 0
	db 47, NIDOKING, NIDOQUEEN, 0
	db 50, WIGGLYTUFF, CLEFABLE, CHANSEY, 0
	db 46, KANGASKHAN, FEAROW, TANGELA, 0
; Route 20
	db 45, VENUSAUR, CHARIZARD, BLASTOISE, 0
; Green
    db $FF, 76, CLEFABLE, 77, GENGAR, 78, VICTREEBEL, 79, NINETALES, 80, KANGASKHAN, 81, BLASTOISE, 0

PokemaniacData:
; Route 10
	db 35, CHANSEY, LICKITUNG, 0
	db 40, MAROWAK, POLIWRATH, 0
; Rock Tunnel B1F
	db 31, FARFETCHD, MR_MIME, JYNX, 0
	db 30, PORYGON, EXEGGCUTE, 0
; unused
	db 37, GENGAR, 0
; Victory Road 2F - Kaiba
	db $FF, 60, MR_MIME, 62, TAUROS, 64, SNORLAX, 65, DRAGONITE, 65, DRAGONITE, 65, DRAGONITE, 0
; Rock Tunnel 1F
	db 32, MAROWAK, HYPNO, 0
; Chris Chan
    db 50, PIKACHU, RAICHU, SNORLAX, 0
    db 100, PIKACHU, RAICHU, SNORLAX, VAPOREON, JOLTEON, FLAREON, 0
; Aizen
    db 23, HYPNO, 0
; Andrew
    db $FF, 255, MEWTWO, 0

SuperNerdData:
; Mt. Moon 1F
	db 14, PONYTA, PONYTA, 0
; Mt. Moon B2F
	db 16, FARFETCHD, VOLTORB, KADABRA, 0
; Route 8
	db 30, EEVEE, VAPOREON, JOLTEON, FLAREON, 0
	db 34, MUK, ARBOK, WEEZING, 0
	db $FF, 37, JYNX, 41, MAGNETON, 53, DITTO, 0
; Unused
	db 22, KOFFING, MAGNEMITE, WEEZING, 0
	db 20, MAGNEMITE, MAGNEMITE, KOFFING, MAGNEMITE, 0
	db 24, MAGNEMITE, VOLTORB, 0
; Cinnabar Gym
	db 53, MAGMAR, 0
	db 52, RAPIDASH, CHARIZARD, NINETALES, ARCANINE, 0
	db 54, RAPIDASH, 0
	db 65, PONYTA, PONYTA, 0
; Ulquiorra
    db 20, GOLBAT, 0

HikerData:
; Mt. Moon 1F
	db 14, GEODUDE, SANDSHREW, ONIX, 0
; Route 25
	db 19, MACHOP, GEODUDE, 0
	db 18, GEODUDE, CUBONE, MACHOP, RHYHORN, 0
	db 28, ONIX, 0
; Route 9
	db 23, GRAVELER, RHYHORN, 0
	db 26, GRAVELER, MACHOKE, SANDSLASH, 0
; Route 10
	db 31, GRAVELER, DUGTRIO, 0
	db 30, RHYHORN, GRAVELER, 0
; Rock Tunnel B1F
	db 30, GRAVELER, GRAVELER, RHYHORN, 0
	db 40, GOLEM, 0
; Route 9/Rock Tunnel B1F
	db 32, MACHOKE, ONIX, 0
; Rock Tunnel 1F
	db 31, GRAVELER, DUGTRIO, SANDSLASH, MACHOKE, 0
	db 34, ONIX, ONIX, RHYHORN, 0
	db 30, ONIX, OMANYTE, 0

BikerData:
; Route 13
	db 45, WEEZING, ARBOK, NIDOKING, 0
; Route 14
	db 44, WEEZING, MUK, 0
; Route 15
	db 45, ARBOK, TENTACRUEL, NIDOKING, VENUSAUR, JIGGLYPUFF, 0
	db 47, WEEZING, ARBOK, MEOWTH, 0
; Route 16
	db 45, HAUNTER, KANGASKHAN, 0
	db 50, MACHAMP, 0
	db 70, PIKACHU, BULBASAUR, CHARMANDER, SQUIRTLE, 0
; Route 17
	; From https://www.smogon.com/smog/issue27/glitch:
	; 0E:5FC2 is offset of the ending 0 for this first Biker on Route 17.
	; BaseStats + (BASE_DATA_SIZE) * (000 - 1) = $5FC2;
	; that's the formula from GetMonHeader for the base stats of mon #000.
	; (BaseStats = $43DE and BANK(BaseStats) = $0E.)
	; Finally, PokedexOrder lists 0 as the dex ID for every MissingNo.
	; The result is that this data gets interpreted as the base stats
	; for MissingNo: 0, 33, MUK, 0, 29, VOLTORB, VOLTORB, 0, ..., 28, GRIMER, GRIMER.
	db 47, DODRIO, TAUROS, WEEZING, 0
	db 50, SNORLAX, 0
	db 49, PINSIR, CHARIZARD, 0
	db 48, NIDOKING, NIDOQUEEN, 0
	db 48, MACHAMP, KANGASKHAN, MAROWAK, KINGLER, OMASTAR, 0
; Route 14
	db 45, WEEZING, ARBOK, MUK, BEEDRILL, 0
	db 46, SCYTHER, HAUNTER, GOLEM, 0
	db 50, ARCANINE, GYARADOS, 0

BurglarData:
; Unused
	db 29, GROWLITHE, VULPIX, 0
	db 33, GROWLITHE, 0
	db 28, VULPIX, CHARMANDER, PONYTA, 0
; Cinnabar Gym
	db 53, RAPIDASH, HYPNO, PRIMEAPE, 0
	db 54, ARCANINE, 0
	db 53, CHARIZARD, CHARIZARD, 0
; Mansion 2F
	db 49, NINETALES, POLIWRATH, 0
; Mansion 3F
	db 60, MAGMAR, 0
; Mansion B1F
	db 49, ARCANINE, TENTACRUEL, 0

EngineerData:
; Unused
	db 21, VOLTORB, MAGNEMITE, 0
; Route 11
	db 28, MAGNETON, 0
	db 24, MAGNEMITE, DROWZEE, GROWLITHE, 0
; Cloud
    db $FF, 85, JOLTEON, 86, SANDSLASH, 87, BLASTOISE, 88, GENGAR, 89, DODRIO, 90, ZAPDOS, 0
; James
    db $FF, 150, PERSIAN, 150, SCYTHER, 150, SLOWBRO, 150, GENGAR, 150, SNORLAX, 150, ALAKAZAM, 0

UnusedJugglerData:
; none

FisherData:
; SS Anne 2F Rooms
	db 25, SEEL, TENTACOOL, WARTORTLE, 0
; SS Anne B1F Rooms
	db 24, TENTACOOL, STARYU, SHELLDER, 0
; Route 12
	db 35, SEAKING, KINGLER, CLOYSTER, 0
	db 38, TENTACRUEL, STARMIE, 0
	db 41, GYARADOS, 0
	db 37, DEWGONG, GOLDUCK, SEADRA, SLOWBRO, 0
; Route 21
	db 48, SEAKING, SEAKING, VAPOREON, GOLDUCK, 0
	db 50, CLOYSTER, BLASTOISE, 0
	db 100, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, 0
	db 50, TENTACRUEL, GYARADOS, 0
; Route 12
	db 50, GYARADOS, LAPRAS, 0
; Mr Miyagi
    db $FF, 65, SLOWBRO, 66, HITMONLEE, 67, ALAKAZAM, 68, SNORLAX, 69, EXEGGUTOR, 70, POLIWRATH, 0

SwimmerData:
; Cerulean Gym
	db 21, HORSEA, GOLDEEN, KABUTO, OMANYTE, 0
; Route 19
	db 44, TENTACRUEL, CLOYSTER, 0
	db 45, SEAKING, SEADRA, SLOWBRO, 0
	db 45, POLIWRATH, BLASTOISE, 0
	db 48, SEADRA, TENTACRUEL, DEWGONG, KINGLER, 0
	db 50, GOLDUCK, CLOYSTER, VAPOREON, 0
	db 50, KINGLER, DRAGONAIR, 0
	db 47, TENTACRUEL, SEADRA, KINGLER, SLOWBRO, DEWGONG, 0
; Route 20
	db 50, DRAGONAIR, DRAGONAIR, 0
	db 55, LAPRAS, 0
	db 49, STARMIE, SLOWBRO, VAPOREON, GOLDUCK, 0
; Route 21
	db 50, BLASTOISE, DEWGONG, 0
	db 55, GYARADOS, 0
	db 49, KABUTOPS, OMASTAR, 0
	db 38, POLIWRATH, TENTACRUEL, KINGLER, 0

CueBallData:
; Route 16
	db 41, MACHOKE, PRIMEAPE, MAROWAK, 0
	db 43, PRIMEAPE, ARBOK, 0
	db 50, TAUROS, 0
; Route 17
	db 44, PRIMEAPE, POLIWRATH, 0
	db 45, GRAVELER, MACHOKE, 0
	db 50, MACHAMP, 0
	db 70, CLEFAIRY, JIGGLYPUFF, KRABBY, DRATINI, 0
	db 45, HAUNTER, KADABRA, 0
; Route 21
	db 52, TENTACRUEL, CLOYSTER, POLIWRATH, 0

GamblerData:
; Route 11
	db 20, KADABRA, MR_MIME, 0
	db 22, DROWZEE, CUBONE, 0
	db 21, TANGELA, FARFETCHD, 0
	db 24, GROWLITHE, VULPIX, 0
; Route 8
	db 38, POLIWHIRL, KADABRA, JYNX, 0
; Unused
	db 22, ONIX, GEODUDE, GRAVELER, 0
; Route 8
	db 32, DUGTRIO, NINETALES, 0

BeautyData:
; Celadon Gym
	db 40, VILEPLUME, VICTREEBEL, VENUSAUR, TANGELA, 0
	db 41, VICTREEBEL, BLASTOISE, 0
	db 43, EXEGGUTOR, 0
; Route 13
	db 46, MACHOKE, MACHOKE, MACHOKE, 0
	db 47, WIGGLYTUFF, PERSIAN, 0
; Route 20
	db 50, VAPOREON, 0
	db 46, CLOYSTER, CLOYSTER, SEADRA, 0
	db 47, POLIWRATH, STARMIE, 0
; Route 15
	db 45, PIDGEOT, CHANSEY, 0
	db 45, VENUSAUR, VILEPLUME, 0
; Route 19
	db 47, POLIWRATH, SEAKING, KINGLER, BLASTOISE, GYARADOS, 0
	db 50, DEWGONG, LAPRAS, 0
	db 45, STARMIE, STARMIE, STARMIE, 0
; Route 20
	db 50, SEADRA, DRAGONAIR, DRAGONAIR, 0
; Harribel
	db 21, STARMIE, 0
; Prof Ivy
    db 17, WARTORTLE, LAPRAS, 0

PsychicData:
; Saffron Gym
	db 44, KADABRA, SLOWBRO, MR_MIME, HYPNO, 0
	db 48, EXEGGUTOR, ALAKAZAM, 0
	db 47, HYPNO, JYNX, STARMIE, 0
	db 50, SLOWBRO, 0

RockerData:
; Vermilion Gym
	db 28, VOLTORB, MAGNETON, RAICHU, 0
; Route 12
	db 45, JOLTEON, ELECTABUZZ, 0
; Grimmjow
    db 20, PERSIAN, 0
; Sephiroth
    db $FF, 82, GYARADOS, 83, SCYTHER, 84, CHARIZARD, 85, PERSIAN, 86, DRAGONITE, 87, MOLTRES, 0

JugglerData:
; Silph Co. 5F
	db 45, ELECTRODE, MR_MIME, 0
; Victory Road 2F
	db 57, LICKITUNG, HYPNO, TENTACRUEL, ALAKAZAM, 0
; Fuchsia Gym
	db 45, VENOMOTH, HYPNO, GENGAR, 0
	db 48, PINSIR, TAUROS, 0
; Victory Road 2F
	db 60, ALAKAZAM, 0
; Unused
	db 33, HYPNO, 0
; Fuchsia Gym
	db 47, GENGAR, 0
	db $FF, 50, MR_MIME, 70, DITTO, 0
; Pegasus
    db $FF, 33, FARFETCHD, 37, GENGAR, 0
; Wallace
    db $FF, 70, STARMIE, 71, HYPNO, 72, LAPRAS, 73, CHANSEY, 74, GYARADOS, 75, ARTICUNO, 0

TamerData:
; Fuchsia Gym
	db 47, SANDSLASH, ARBOK, 0
	db 46, ARBOK, SANDSLASH, NIDOKING, 0
; Viridian Gym
	db 57, KANGASKHAN, 0
	db 52, NIDOQUEEN, TAUROS, 0
; Victory Road 2F
	db 59, PERSIAN, ARCANINE, RHYDON, 0
; Unused
	;db 42, RHYHORN, PRIMEAPE, ARBOK, TAUROS, 0

BirdKeeperData:
; Route 13
	db 45, PIDGEOT, DODRIO, 0
	db 44, PIDGEOT, FEAROW, DODRIO, FARFETCHD, AERODACTYL, 0
	db 41, PIDGEOT, PIDGEOT, FEAROW, FEAROW, 0
; Route 14
	db 55, FARFETCHD, 0
	db 48, FEAROW, DODRIO, 0
; Route 15
	db 48, PIDGEOT, FARFETCHD, DODRIO, PIDGEOT, 0
	db 50, DODRIO, DODRIO, DODRIO, 0
; Route 18
	db 49, FEAROW, FEAROW, 0
	db 50, AERODACTYL, 0
	db 45, FEAROW, FEAROW, GOLEM, GYARADOS, 0
; Route 20
	db 47, FEAROW, FEAROW, PIDGEOT, 0
; Unused
	db 39, PIDGEOTTO, PIDGEOTTO, PIDGEY, PIDGEOTTO, 0
	db 42, FARFETCHD, FEAROW, 0
; Route 14
	db 44, PIDGEOT, DODRIO, CHARIZARD, 0
	db 45, FARFETCHD, FEAROW, PIDGEOT, DODRIO, 0
	db 50, AERODACTYL, CHARIZARD, 0
	db 47, FEAROW, DODRIO, CHARIZARD, 0

BlackbeltData:
; Fighting Dojo
	db 37, HITMONLEE, HITMONCHAN, 0
	db 31, MANKEY, MANKEY, PRIMEAPE, 0
	db 32, MACHOP, MACHOKE, 0
	db 36, PRIMEAPE, 0
	db 31, MACHOP, MANKEY, PRIMEAPE, 0
; Viridian Gym
	db 54, MACHAMP, POLIWRATH, 0
	db 58, MACHAMP, 0
	db 56, HITMONCHAN, HITMONLEE, MACHAMP, 0
; Victory Road 2F
	db 60, MACHAMP, MACHAMP, MACHAMP, 0
; Trunks
    db $FF, 70, PIDGEOT, 71, RAICHU, 72, ARCANINE, 73, MACHAMP, 74, MAROWAK, 75, ELECTABUZZ, 0

Green1Data:
	db 5, SQUIRTLE, 0
	db 5, BULBASAUR, 0
	db 5, CHARMANDER, 0
; Route 22
	db $FF, 10, NIDORAN_M, 10, RATTATA, 12, SQUIRTLE, 0
	db $FF, 10, NIDORAN_M, 10, RATTATA, 12, BULBASAUR, 0
	db $FF, 10, NIDORAN_M, 10, RATTATA, 12, CHARMANDER, 0
; Cerulean City
	db $FF, 20, NIDOKING, 18, RATICATE, 18, KADABRA, 21, WARTORTLE, 0
	db $FF, 20, NIDOKING, 18, RATICATE, 18, KADABRA, 21, IVYSAUR, 0
	db $FF, 20, NIDOKING, 18, RATICATE, 18, KADABRA, 21, CHARMELEON, 0
ProfOakData:
	;db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, BLASTOISE, 70, GYARADOS, 0
	;db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, VENUSAUR, 70, GYARADOS, 0
	;db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, CHARIZARD, 70, GYARADOS, 0
	db 100, MEWTWO, MEWTWO, MEWTWO, MEWTWO, MEWTWO, MEWTWO, 0

ChiefData:
; none

ScientistData:
; Unused
	db 34, KOFFING, VOLTORB, 0
; Silph Co. 2F
	db 45, PORYGON, WEEZING, RAICHU, KADABRA, 0
	db 42, MAGNETON, ELECTRODE, HAUNTER, 0
; Silph Co. 3F/Mansion 1F
	db 45, ELECTRODE, WEEZING, 0
; Silph Co. 4F
	db 80, DITTO, 0
; Silph Co. 5F
	db 46, EEVEE, VAPOREON, JOLTEON, FLAREON, 0
; Silph Co. 6F
	db 47, OMASTAR, KABUTOPS, DRAGONAIR, HYPNO, WEEZING, 0
; Silph Co. 7F
	db 45, SANDSLASH, GENGAR, 0
; Silph Co. 8F
	db 46, MUK, LICKITUNG, 0
; Silph Co. 9F
	db 48, DUGTRIO, WEEZING, DODRIO, 0
; Silph Co. 10F
	db 48, PARASECT, PORYGON, 0
; Mansion 3F
	db 47, VENUSAUR, CHARIZARD, BLASTOISE, 0
; Mansion B1F
	db 50, KABUTOPS, OMASTAR, AERODACTYL, 0
; Dr Fuji
    db $FF, 100, MEW, 100, ELECTRODE, 100, MEW, 100, PORYGON, 100, MEW, 200, DITTO, 0
; Tsunekazu Ishihara
    db $FF, 5, PIKACHU, 5, MEW, 56, JOLTEON, 56, DUGTRIO, 57, ARTICUNO, 90, EXEGGUTOR, 0

GiovanniData:
	db $FF, 41, AERODACTYL, 42, MACHAMP, 42, GYARADOS, 43, SNORLAX, 45, RHYDON, 0
	db $FF, 52, AERODACTYL, 53, MACHAMP, 54, GYARADOS, 54, SNORLAX, 55, RHYDON, 0
	db $FF, 59, AERODACTYL, 60, MACHAMP, 60, GYARADOS, 61, SNORLAX, 61, RHYDON, 62, MEW, 0
    db 100, AERODACTYL, MACHAMP, GYARADOS, SNORLAX, RHYDON, MEW, 0

RocketData:
; Mt. Moon B2F
	db 14, RATTATA, ZUBAT, 0
	db 15, SANDSHREW, MANKEY, GROWLITHE, 0
	db 16, CUBONE, EKANS, 0
	db 20, RATICATE, 0
; Cerulean City
	db 24, RATICATE, DROWZEE, 0
; Route 24
	db 24, ARBOK, GROWLITHE, 0
; Game Corner
	db 35, RATICATE, GOLBAT, 0
; Rocket Hideout B1F
	db 34, HYPNO, VENUSAUR, 0
	db 36, RATICATE, FEAROW, 0
	db 35, MUK, WEEZING, KANGASKHAN, 0
	db 34, RATICATE, FEAROW, SANDSLASH, NIDOKING, 0
	db 38, MUK, ARBOK, 0
; Rocket Hideout B2F
	db 35, BEEDRILL, GOLBAT, RATICATE, WEEZING, NIDOQUEEN, 0
; Rocket Hideout B3F
	db 37, RATICATE, SANDSLASH, FEAROW, 0
	db 38, MACHOKE, PINSIR, 0
; Rocket Hideout B4F
	db 40, ARBOK, SANDSLASH, HYPNO, 0
	db 40, FEAROW, KANGASKHAN, ALAKAZAM, 0
	db 40, ARBOK, GOLBAT, 0
; Pokémon Tower 7F
	db 42, GOLBAT, NINETALES, WIGGLYTUFF, 0
	db 43, WEEZING, HYPNO, 0
	db 44, GOLBAT, RATICATE, ARBOK, SANDSLASH, 0
; Unused
	db 26, DROWZEE, KOFFING, 0
; Silph Co. 2F
	db 43, NIDOKING, NIDOQUEEN, 0
	db 43, GOLBAT, VILEPLUME, DUGTRIO, PERSIAN, PRIMEAPE, 0
; Silph Co. 3F
	db 44, TAUROS, KANGASKHAN, SNORLAX, 0
; Silph Co. 4F
	db 44, MACHAMP, HYPNO, 0
	db 48, ARBOK, GOLBAT, VENOMOTH, 0
; Silph Co. 5F
	db 50, ARBOK, 0
	db 50, WEEZING, 0
; Silph Co. 6F
	db 45, MACHAMP, VICTREEBEL, 0
	db 46, GOLBAT, DUGTRIO, SCYTHER, 0
; Silph Co. 7F
	db 45, TAUROS, ARBOK, RHYDON, GYARADOS, 0
	db 49, HITMONCHAN, HITMONLEE, MACHAMP, 0
	db 46, SANDSLASH, MAROWAK, PRIMEAPE, 0
; Silph Co. 8F
	db 44, HYPNO, JYNX, MAGMAR, ELECTABUZZ, 0
	db 47, WEEZING, GOLBAT, KANGASKHAN, DODRIO, 0
; Silph Co. 9F
	db 45, CHANSEY, CLEFABLE, WIGGLYTUFF, 0
	db 48, ALAKAZAM, HYPNO, SNORLAX, 0
; Silph Co. 10F
	db 50, HYPNO, 0
; Silph Co. 11F
	db 50, KANGASKHAN, HYPNO, VAPOREON, JOLTEON, FLAREON, 0
	db 50, TAUROS, ALAKAZAM, BLASTOISE, VENUSAUR, CHARIZARD, 0

CooltrainerMData:
; Viridian Gym
	db 55, NIDOKING, NIDOQUEEN, 0
; Victory Road 3F
	db 58, EXEGGUTOR, CLOYSTER, ARCANINE, 0
	db 100, DITTO, 0
; Unused
	db 45, KINGLER, STARMIE, 0
; Victory Road 1F
	db 60, VENUSAUR, BLASTOISE, CHARIZARD, 0
; Unused
	db 44, IVYSAUR, WARTORTLE, CHARMELEON, 0
	db 49, NIDOKING, 0
	db 44, KINGLER, CLOYSTER, 0
; Viridian Gym
	db 55, SANDSLASH, ARCANINE, 0
	db 55, GENGAR, 0
; Stark
    db 22, ARCANINE, 0
; ichigo
    db 40, TAUROS, 0

CooltrainerFData:
; Celadon Gym
	db 41, VICTREEBEL, VILEPLUME, JYNX, 0
; Victory Road 3F
	db 60, VICTREEBEL, RAPIDASH, STARMIE, 0
	db 60, CHANSEY, CHANSEY, CHANSEY, 0
; Unused
	db 46, VILEPLUME, BUTTERFREE, 0
; Victory Road 1F
	db 59, PERSIAN, NINETALES, VAPOREON, 0
; Unused
	;db 45, IVYSAUR, VENUSAUR, 0
	;db 45, NIDORINA, NIDOQUEEN, 0
	;db 43, PERSIAN, NINETALES, RAICHU, 0

BrunoData:
	db $FF, 63, TAUROS, 64, GOLEM, 65, PINSIR, 66, POLIWRATH, 66, SNORLAX, 67, MACHAMP, 0
    db 100, TAUROS, GOLEM, PINSIR, POLIWRATH, SNORLAX, MACHAMP, 0

BrockData:
	db $FF, 15, ONIX, 16, RHYHORN, 0
	db $FF, 72, ONIX, 73, OMASTAR, 73, KABUTOPS, 74, RHYDON, 75, AERODACTYL, 76, GOLEM, 0

MistyData:
	db $FF, 24, PSYDUCK, 25, VAPOREON, 26, GYARADOS, 0
	db $FF, 76, GOLDUCK, 77, TENTACRUEL, 78, VAPOREON, 78, STARMIE, 79, LAPRAS, 80, GYARADOS, 0

LtSurgeData:
	db $FF, 33, RAICHU, 31, MAGNETON, 32 , JOLTEON, 35, ELECTABUZZ, 0
	db $FF, 80, RAICHU, 81, ELECTRODE, 82, MAGNETON, 83, JOLTEON, 84, ELECTABUZZ, 85, ZAPDOS, 0

ErikaData:
	db $FF, 46, VILEPLUME, 46, VICTREEBEL, 48, EXEGGUTOR, 50, VENUSAUR, 0
	db $FF, 84, VILEPLUME, 84, VICTREEBEL, 85, PARASECT, 86, TANGELA, 87, EXEGGUTOR, 88, VENUSAUR, 0

KogaData:
	db $FF, 50, PINSIR, 50, NIDOKING, 51, GENGAR, 52, HYPNO, 53 , SCYTHER, 0
	db $FF, 88, PINSIR, 89, NIDOKING, 90, GENGAR, 90, HYPNO, 91, KANGASKHAN, 92, SCYTHER, 0

BlaineData:
	db $FF, 58, MAGMAR, 58, NINETALES, 59, ARCANINE, 59, CHARIZARD, 60, MOLTRES, 0
	db $FF, 96, MAGMAR, 97, RAPIDASH, 98, NINETALES, 98, ARCANINE, 99, CHARIZARD, 100, MOLTRES, 0

SabrinaData:
	db $FF, 53, MR_MIME, 53, JYNX, 54, SLOWBRO, 55, EXEGGUTOR, 56, ALAKAZAM, 0
	db $FF, 92, MR_MIME, 93, JYNX, 94, SLOWBRO, 95, EXEGGUTOR, 95, STARMIE, 96, ALAKAZAM, 0

GentlemanData:
; SS Anne 1F Rooms
	db 25, ARCANINE, 0
	db 23, NIDOKING, NIDOQUEEN, 0
; SS Anne 2F Rooms/Vermilion Gym
	db 35, PIKACHU, 0
; Unused
	db 48, PRIMEAPE, 0
; SS Anne 2F Rooms
	db 30, DRAGONAIR, 0
; Baragan
    db 21, WEEZING, 0
; Jackpot Jack
    db $FF, 10, ABRA, 8, ABRA, 6, ABRA, 4, ABRA, 2, ABRA, 50, ALAKAZAM, 0

Green2Data:
; SS Anne 2F
	db $FF, 33, NIDOKING, 32, RATICATE, 34, KADABRA, 36, BLASTOISE, 0
	db $FF, 33, NIDOKING, 32, RATICATE, 34, KADABRA, 36, VENUSAUR, 0
	db $FF, 33, NIDOKING, 32, RATICATE, 34, KADABRA, 36, CHARIZARD, 0
; Pokémon Tower 2F
	db $FF, 42, NIDOKING, 43, EXEGGUTOR, 43, STARMIE, 44, ALAKAZAM, 45, BLASTOISE, 0
	db $FF, 42, NIDOKING, 43, EXEGGUTOR, 43, STARMIE, 44, ALAKAZAM, 45, VENUSAUR, 0
	db $FF, 42, NIDOKING, 43, EXEGGUTOR, 43, STARMIE, 44, ALAKAZAM, 45, CHARIZARD, 0
; Silph Co. 7F
	db $FF, 52, NIDOKING, 52, EXEGGUTOR, 53, CHANSEY, 53, STARMIE, 54, ALAKAZAM, 55, BLASTOISE, 0
	db $FF, 52, NIDOKING, 52, EXEGGUTOR, 53, CHANSEY, 53, STARMIE, 54, ALAKAZAM, 55, VENUSAUR, 0
	db $FF, 52, NIDOKING, 52, EXEGGUTOR, 53, CHANSEY, 53, STARMIE, 54, ALAKAZAM, 55, CHARIZARD, 0
; Route 22
	db $FF, 59, ZAPDOS, 59, EXEGGUTOR, 60, CHANSEY, 60, STARMIE, 61, ALAKAZAM, 62, BLASTOISE, 0
	db $FF, 59, ZAPDOS, 59, EXEGGUTOR, 60, CHANSEY, 60, STARMIE, 61, ALAKAZAM, 62, VENUSAUR, 0
	db $FF, 59, ZAPDOS, 59, EXEGGUTOR, 60, CHANSEY, 60, STARMIE, 61, ALAKAZAM, 62, CHARIZARD, 0

Green3Data:
	db $FF, 67, ZAPDOS, 67, EXEGGUTOR, 68, CHANSEY, 68, STARMIE, 69, ALAKAZAM, 70, MEWTWO, 0
	db $FF, 67, ZAPDOS, 67, EXEGGUTOR, 68, CHANSEY, 68, STARMIE, 69, ALAKAZAM, 70, MEWTWO, 0
	db $FF, 67, ZAPDOS, 67, EXEGGUTOR, 68, CHANSEY, 68, STARMIE, 69, ALAKAZAM, 70, MEWTWO, 0
	db 100, ZAPDOS, EXEGGUTOR, CHANSEY, STARMIE, ALAKAZAM, MEWTWO, 0

LoreleiData:
	db $FF, 61, CLOYSTER, 62, JYNX, 62, SLOWBRO, 63, STARMIE, 64, LAPRAS, 65, ARTICUNO, 0
	db 100, CLOYSTER, JYNX, SLOWBRO, STARMIE, LAPRAS, ARTICUNO, 0

ChannelerData:
; Unused
	db 22, GASTLY, 0
	db 24, GASTLY, 0
	db 23, GASTLY, GASTLY, 0
	db 24, GASTLY, 0
; Pokémon Tower 3F
	db 42, CLEFABLE, 0
	db 60, HAUNTER, 0
; Unused
	db 24, HAUNTER, 0
; Pokémon Tower 3F
	db 42, JYNX, 0
; Pokémon Tower 4F
	db 42, HYPNO, 0
	db 41, HAUNTER, HYPNO, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 4F
	db 42, PERSIAN, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 5F
	db 40, GENGAR, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 5F
	db 40, ALAKAZAM, 0
	db 41, CLEFABLE, 0
	db 41, JYNX, HAUNTER, 0
; Pokémon Tower 6F
	db 41, HAUNTER, PERSIAN, CLEFABLE, 0
	db 45, GENGAR, 0
	db 45, ALAKAZAM, 0
; Saffron Gym
	db 48, CLEFABLE, ALAKAZAM, 0
	db 50, GENGAR, 0
	db 45, GENGAR, GENGAR, 0

AgathaData:
	db $FF, 65, GENGAR, 66, CLEFABLE, 66, GENGAR, 67, CHANSEY, 67, ALAKAZAM, 68, GENGAR, 0
    db 100, GENGAR, CLEFABLE, GENGAR, CHANSEY, ALAKAZAM, GENGAR, 0

LanceData:
	db $FF, 67, DRAGONITE, 67, GYARADOS, 68, DRAGONITE, 68, LAPRAS, 69, MOLTRES, 70, DRAGONITE, 0
	db 100, DRAGONITE, GYARADOS, DRAGONITE, LAPRAS, MOLTRES, DRAGONITE, 0
