# PokemonTrueRed
Hack of Pokemon Red/Blue with a focus on fun, difficulty and post game content while retaining the feeling of a definitive gen 1 experience.

# Main Features
- All trainer parties and Pokemon updated for greater difficulty and engagement
- A significant amount of dialog changed to make the world more rich and fun
- AI updates making all enemies more difficult, some trainers will switch in specific situations
- Added ability to rematch any trainer, but you gain reduced exp before beating Elite Four
- Significant content available after Elite Four, such as 17 optional bosses, max DVs on all Pokemon obtained and more
- Player can sprint at bike speed by holding B, animation speed doubles  
- Player can warp home almost anytime by pressing down, select and B together  
- Different wild Pokemon available in every area, in addition to the important vanilla encounter
- Pokemon sprites are a mixture of Blue, Green and Yellow version sprites, based on which I felt looked the best  
- All in-game trades are different
- Boss enemies have better trained Pokemon with higher stats (stat exp / EVs)
- Unique, starter and legendary Pokemon always have good DVs at minimum  
- Items can not be used in boss battles, by a player or opponent
- Updated level-up moveset for all fully evolved Pokemon, they now learn good moves by level up
- numerous bug fixes including removal of badge boost, removal of 1 in 256 glitch and critical hit rates halved
- Many Gen 1 glitches still left to keep the spirit of the game, such a Hyper Beam not recharging on a kill
- All 151 Pokemon available with no missable Pokemon. Trade evolutions now evolve at level 36
- Multiples of all Legendary Pokemon available with new signature moves for Mewtwo, Mew and Pikachu
- New enemies, such as the Espada and Aizen on Nugget bridge and Chris Chan who is hiding in Rock Tunnel
- All good TMs are available to purchase in Celadon as soon as you get there, but some are only given by Gym Leaders 
- HM moves can be deleted at any time like normal moves, the warp home function protects you from trapping yourself
- Easier post-game grinding, with Exp.All giving full exp to whole party and optional bosses giving huge bonus money
- Cerulean Cave Mewtwo has dialog on encounter, also when using master ball and trying to run. Also has AI and different battle music

# Download and Play
The current version of the game can be downloaded from [here](https://drive.google.com/file/d/1_kIna0G0oxiFy4uTDuSTY9Ntydxz4WNV/view?usp=sharing).

This is compatible with any existing gen 1 saves you have. You need to
- Manually save your current game in an outdoor map such as Pallet Town
- Download this game and place your existing save in the same directory and rename it to PokemonTrueRed.sav
- Load the game and pick continue

If your character seems to be unable to move simply warp home by pressing down, select and B together to fix it

# Screen Shots

Rematch Trainers
![Rematch](/screenshots/rematch.png?raw=true)

New Dialog
![Dialog](/screenshots/dialog2.png?raw=true)
![Dialog](/screenshots/newDialog.png?raw=true)
![Dialog](/screenshots/mewtwoTalk.png?raw=true)

Optional Bosses
![Optional Bosses](/screenshots/optionalBosses1.png?raw=true)
![Optional Bosses](/screenshots/optionalBosses2.png?raw=true)

New Enemy Encounters 
![New encounters](/screenshots/weevil.png?raw=true)

Signature Moves and Mixed Sprites
![New Moves](/screenshots/psyblast.png?raw=true)
![New Moves](/screenshots/pikaThunder.png?raw=true)
![New Moves](/screenshots/stone.png?raw=true)


# Battle
- All trainer parties are updated with
  - Different Pokemon
  - More Pokemon in some instances  
  - Better movesets  
  - Higher stats, depending on trainer
- All trainers can be rematched but rematches yield 3/8 of the normal exp until Elite Four is beaten 
- Enemy trainers Pokemon can have stat exp (EVs) there are three categories of level dependant stat exp
  - Normal trainers - 64 stat exp per level, enough for 20/64 extra stats at level 100
  - Gym Leaders and Rival - 324 per level, enough for 45/64 extra stats at level 100
  - Elite Four and optional bosses - 655 per level, enough for 64/64 extra stats at level 100
- All enemy trainers Pokemon have 15/15 DVs in all stats. This means optional boss level 100 Pokemon have max stats
- Items can not be used in boss battles
- Shift battle option does not work in boss battles
- Pokemon sprites are a mixture of Blue, Green and Yellow version sprites, based on which I felt looked the best
- Some trainers give bonus money when defeated. There are three levels of bonus money
  - Bonus equal to normal prize money - given by Elite Four and a few mini bosses
  - Bonus equal to 10 X normal prize money - given by optional bosses
  - Bonus equal to 100 X normal prize money - given by the strongest optional boss
- Exp.ALL now gives full exp and stat exp to all Pokemon in the party
- Exp.All can be obtained by catching 100 Pokemon or bought at Elite Four shop
- Critical hit rate is still based on speed but is half of vanilla values, so fast Pokemon have about 12% crit rate   
- Badge boosts are no longer a thing, it was dumb
- Maximum sleep turns is now 4 rather than 7  
- 1 in 256 glitch is fixed
- Pokemon no longer miss out on level up moves if they skip that level  
- the invulnerability glitch on Fly and Dig is fixed for player and opponent
- The healing glitch when remaining hp is 255 is fixed
- Rest restores stat drops from paralysis and burn  
- Some glitches are left in to maintain that gen 1 feeling
  - Enemies still have infinite pp, it makes them harder, even if it is unfair
  - Hyper beam still will not require a recharge on a miss or a kill
  - Trapping moves can still prevent enemy movement
- Game uses FAST text speed and SET battle style by default

# AI
- Enemies will not prioritize super effective moves if they are non-damaging
- Enemies will consider both player Pokemon types when assessing if a move is super effective
- Enemies will favor their STAB moves 50% of the time they don't have a super effective move
- If enemy Pokemon HP is below 33% all non-damaging moves except healing moves are deprioritized  
- Boss enemies will switch Pokemon under the following conditions
    - HP > 25% and one of Attack, Special or Accuracy have been lowered to -2 or lower
    - HP > 25% and enemy afflicted with leech seed, 25% chance to switch
    - Enemy Pokemon is in a state of SLP or FRZ and player uses a healing or stat boosting move
- When switching Pokemon Enemies use the following citeria
    - Pokemon that are in a state of SLP or FRZ are saved for last
    - If all Pokemon on the enemy team are in SLP they won't switch, to allow wake up
- Healing moves and sacrificial moves are used according to the following rules
    - deprioritized if above 50% HP
    - prioritized if below 33% HP
    - for some boss enemies Healing moves are prioritized if below 50% HP
- Reflect and light screen obey the following rules
    - deprioritized if they are already up
    - deprioritized if player has picked a move of the other damage category
    - deprioritized if the player has boosted stats in the other damage category
    - prioritized if player selected a damaging move of the defending category
    - prioritized if player has boosted stats in the defending category
- Amnesia and Swords Dance obey the following rules
    - prioritized if the enemy Pokemon is at less than +2 in the relevant stat
    - deprioritized if the relevant stat is at +4, due to the stat limit of 999
- Moves that lower accuracy are prioritized if player Pokemon isn't at least at -1 accuracy
- Stat dropping moves, such a growl are deprioritized if player is at -3 in the relevant stat
- Stat boosting moves, such a barrier are deprioritized if enemy is at +4 in the relevant stat  
- moves that inflict paralysis are slightly prioritized, since it is an OP status effect
- Leech seed and substitute are deprioritized if already in effect
- Useless moves like splash won't be used in battle

# Events/text
- A huge amount of text has been changed and there is significant additional text
- In addition to numerous regular NPCs, there is updated dialog for
    - All Gym leaders
    - All Rival encounters
    - Most Rockets and trainers
    - All Elite Four members
- For each Elite Four member there is a mandatory npc who will talk at length about them and their greatness 
    - Sea Captain talks about Lorelei
    - Mr Fuji talks about Agatha
    - Safari warden talks about Bruno
    - Silph chief talks about Lance
- Oaks intro plays different music, has different text and uses Dragonite instead of Nidorino
- The Old Man does not fight a level 5 Weedle. He is aware of his power to summon unholy creatures at Cinnabar  
- Weevil (for the yugioh fans) is in Viridian Forest but is too strong to beat when first encountered
- Gym guide gives actual good advice on how to beat gym leaders, including which Pokemon might help  
- Brock gives Mega punch tm and you can rematch him for as many as you want  
- Rockets are obsessed with their rank (D-S) and salary, often telling the player this info with pride
- Several Espada and Aizen (for the bleach fans) are on the nugget bridge
- Aizen gives a pp up when fought and can be farmed for more pp ups
- Residence of Vermilion are obsessed with a past war with Hoen, they don't take kindly to strangers
- SS Anne has an NPC who will heal your party for convenience  
- There are several trainers who are particularly strong who are out hunting noobs
- Chris Chan is hiding in Rock Tunnel and nearly everyone there has something to say about it. Get Flash to find him
- Celadon mart has all the best TMs, available as soon as you get there
- In Celadon Game Cornor is Jackpot Jack, he always wins. Follow the clues to find out the dark secret he hides
- Celadon Mansion has a lot of updated dialog, the programmer defends the many bugs in his code
- Trainers in Celadon Gym are having a bit of an argument
- Silph Co building has the elusive rank S rockets and rocket CEOs, you can never defeat their salaries!
- Sabrinna gives Psychic TM and can be rematched for as many as you want
- Koga gives Swords dance TM and can be rematched for as many as you want
- Cinnabar Pokemon Lab has updated dialog about Mewtwo. One of the scientists has gone slightly mad
- Cinnabar gym trainers are a cult that worships the great and merciful Missingno
- Giovanni has a special 6th Pokemon in his final fight, he gives the Hyper beam tm and can be rematched
- The rival starts to hear voices in his head and go a little crazy  
- Victory road has a trainer who will heal your team, she wanted to be a nurse, but how wants to be a champion
- Victory road has a trainer who has won the lottery, he is designed for money grinding pre Elite Four
- The Elite Four and Final rival are much stronger to live up to their reputations at this point
- Mewtwo Cerulean Cave encounter has several changes
  - Dialog during first interaction
  - Final battle music plays  
  - Mewtwo has a 15/16 chance to block maser ball and print unique text
  - Trying to run displays unique text
  - Mewtwo is the only wild Pokemon to have AI
  
# Player Functions
- Player can sprint at bike speed by holding B, animation speed doubles
- Player can warp home almost anytime by pressing down, select and B together. Player can not warp in the following places
  - Elite Four rooms
  - Safari Zone

# Post-game Features
- A level 70 Mew is given as a reward in Celadon Mansion Roof House
- Cerulean Cave accessible, which has entirely different wild encounters
- All Pokemon obtained by the player now have max DVs (IVs)
- Vitamins such as protein can be used indefinitely to max out stats  
- Rematches now give full exp  
- SS Anne returns, and the Bow can now be accessed where there are 9 optional bosses
- Hall of Destiny (fighting dojo) is accessible and has 7 optional bosses
- An optional boss outside Cerulean Cave will now fight the player  
- Legendary birds can be respawned by defeating Elite Four
- Mewtwo can be respawned by defeating one of the optional bosses
- Each time the strongest optional boss is defeated, the player is rewarded with a choice of level 100 Mewtwo or Mew
- Optional bosses yield huge bonus money, the strongest optional boss maxes out the players money when defeated

# Wild Pokemon Changes
- On Route 1 in addition to the classic Pidgey and Rattata there is also - Poliwag, Bellsprout, Vulpix
- Route 22 has in addition to Spearow and Nidoran also Poliwag, Bellsprout, Vulpix, Pikachu and Meowth  
- There are earlier evolution stones to allow the player to make the most of these Pokemon
  - Leaf stone in Viridian Forest
  - 2 moon stones in Mt.Moon
  - Fire stone on Route 4
  - Water stone on route 25
  - Thunder stone on SS Anne
- Viridian Forest also has Venonat, Paras, Beedrill, Butterfree
- Mt.Moon also has Nidorino, Nidorina, Gastly, Slowpoke, Machop
- Routes 4, 24, 25 also have Pikachu, Beedrill, Butterfree, Growlith, Cubone, Sandshrew and Abra is more common
- Route 4 has also Squirtle
- Route 25 has also Charmander  
- Route 6 also has Meowth, Bulbasaur, Scyther, Pinsir, Krabby, Kingler
- Route 11 also has Scyther, Pinsir, Ponyta, Rapidash
- Route 9 also has Magnemite, Machoke, Primeape, Tauros
- Rock Tunnel also has Gaveller, Machoke, Haunter, Rhyhorn
- Pokemon Tower also has Clefairy, Kadabra, Meowth, Gengar (on top floor)  
- Route 7 also has Pikachu, Poliwhirl, Weepinbell, Vulpix, Growlith, Eevee
- Route 8 also has Pikachu, Poliwhirl, Weepinbell, Vulpix, Eevee, Mr.Mime, Exeggcute
- Route 16 also has Hypon, Raticate, Fearow, Kangaskhan
- Route 12 also has Shellder, Gloom, Weepinbell
- Route 13 also has Ditto, Staryu
- Route 14 also has Persian, Staryu, Shellder
- Route 15 also has Fearow, Venomth, Tauros, Dodrio, Kangaskhan, Arcanine
- Route 18 also has Hypno, Fearow, Dodrio, Raticate, Kangaskhan
- Safari Zone has Nidoking, Nidoqueen, Clefable, Wigglytuff, Tauros, Scyther, Pinsir, Exeggutor, Chansey, Rhydon
- Route 21 grass also has Bulbasaur, Squirtle, Charmander, Jynx
- Route 21 water has Goldeen, Psyduck, Seel, Krabby, Horsea, Tentacrule, Dratini
- Routes 19, 20 have Seaking, Poliwrath, Seadra, Golduck, Kingler, Vaporeon, Tentacrule, Blastoise
- Cinnabar Lab has Ditto, Dratini, Rapidash, Magmar, Ninetales, Arcanine, Charizard, Porygon
- Power Plant also has Jolteon, Raichu, Magneton, Electabuzz
- Seafoam Islands has Seaking, Seadra, Dewgong, Gyarados, Slowbro, Cloyster, Jynx, Lapras, Staryu, Starmie
- Route 23 has Primeape, Hitmonchan, Hitmonlee, Jolteon, Flareon, Vaporeon, Sandslash, Lickitung, Farfetchd, Ditto
- Victory Road has Kangaskhan, Mr.Mime, Hypno, Hitmonchan, Hitmonlee, Golem, Machamp, Gengar, Alakazam
- Victory Road 3F also has Tauros, Arcanine, Venusaur, Blastoise, Charizard, Rhydon
- Cerulean Cave 1 has Clefable, Wigglytuff, Cloyster, Arcanine, Poliwrath, Jynx, Lapras, Exeggutor, Starmie, Dragonite
- Cerulean Cave 2 has Rhydon, Machamp, Aerodactyl, Kabutops, Omastar, Golem, Gengar, Exeggutor, Alakazam, Dragonite
- Cerulean Cave B1F has Chansey, Snorlax, Gyarados, Alakazam, Starmie, Charizard, Venusaur, Blastoise, Dragonite

# Pokemon Changes
- Pokemon given to the player, such as starter and trades have at least 8 DVs in every stat
- Snorlax and Legendary birds all have at least 10 DVs in every stat
- All Pokemon obtained have max DVs after the Elite Four have been defeated  
- Pokemon types and base stats have not been changed with a few exceptions
  - Onix and Rhyhorn are now pure rock types, this make Brock less trivial for Squirtle or Bulbasaur starters
  - Dragonite is pure dragon type, this makes Lance harder
  - Gyarados is pure water type, this makes Lance harder
  - Gengar is pure ghost type but has less HP and defense, this makes Agatha harder
- All Trade evolution Pokemon now evolve at level 36  
- Nearly all fully eveolved Pokemon have updated level up moveset
- Scyther and Pinsir now know Twineedle
- Aerodactyl, Kabutops and Omastar can learn Rock Slide and Earthquake
- Dragonite and Charizard can learn Fly
- Pikachu can learn Surf
- Moltres can learn Solarbeam
- Articuno can learn Psychic
- Zapdos has a signature move, Photon wave
  
# Move Changes
- Several moves have been altered to promote skill rather than luck
  - Double Team and Minimise increase defense rather than evasion
  - Spore is 90 accuracy rather than 100
  - OHKO moves are not in the game
  - Body Slam has a 10% chance to paralyse rather than 30%
  - Wrap is 80 accuracy rather than 85
- Karate Chop is now a Fighting type move
- Mega Punch is 90 accuracy rather than 85
- Gust is now a Flying type move
- Wing Attack is now 65 base power rather than 35
- Fly is now 80 base power rather than 70
- Poison Sting is 30 base power rather than 15
- Twineedle is 35 base power per hit rather than 15
- Pin missile is 20 base power per hit rather than 15
- Hyper Beam has 100 accuracy rather than 90, but 140 power rather than 150
- Submission has 100 accuracy and no recoil, since it's the best Fighting move
- Lick now has 60 power rather than 30
- Several special attacks have been changed to make them more effective
  - Solarbeam is now single turn with 90 accuracy, in line with Fireblast/Blizzard
  - Thunder is now 85 accuracy in line with Fireblast/Blizzard
- Stun spore and Glare now have 100 accuracy in line with Thunderwave
- Dragon Rage is now a true 90 power dragon move with a 10% burn chance
- Rock Throw is now 85 accuracy rather than 65
- Dig has a power decrease to 80 rather than 100
- Selfdestruct is now 150 power rather than 130
- Explosion is now 200 base power rather than 170
- Sludge is now 80 power and renamed to Sludge Bomb
- Sky Attack is now single turn and 90 power
- Psywave is no longer in the game
- Rockslide is now 100 accuracy, since it's the best Rock move
- Pikachu has a signature move Pika Thunder, a 250 BP 100 Acc Electric move with no other effect
- Zapdos has a signature move Photon Wave, an 80 BP 100 Acc psychic move with 30% paralysis rate
- Mew has a signature move Psycrush, a 120 BP 100 Acc Rock move with 10% paralysis rate
- Mewtwo has a signature move Psyblast, a 120 BP 100 Acc Dragon move with 10% freeze chance
- When Psyblast freezes the enemy the text reads "turned to stone" rather than "was frozen solid"
