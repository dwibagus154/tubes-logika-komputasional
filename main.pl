:- dynamic(init/1).         
:- dynamic(player/14).

:- include('command.pl').
:- include('leveling.pl').
:- include('store.pl').
:- include('fakta.pl').
:- include('battle.pl').
:- include('map.pl').
:- include('inventory.pl').

start :- 
    init(_),
    write('Game already started'),!.

start :-
    \+init(_),
    write('  ______    _____    __    _      ____    _   _    _____    __    _ '),nl,
    write(' / _____|  |  ___|  |  \\  | |   /  ___|  | | | |  |_   _|  |  \\  | |'),nl,
    write('| |  ___   | |___   |   \\ | |  | (___    | |_| |    | |    |   \\ | |'),nl,
    write('| | |_  |  |  ___|  | |\\ \\| |   \\___ \\   |  _  |    | |    | |\\ \\| |'),nl,
    write('| |___| |  | |___   | | \\   |   ____) |  | | | |   _| |_   | | \\   |'),nl,
    write(' \\______|  |_____|  |_|  \\__|  |_____/   |_| |_|  |_____|  |_|  \\__|'),nl,
    write('Welcome to Genshin Isekai'),nl,
    write('Available commands:'),nl,
    write('     help. -- show available commands'),nl,
    write('     quit. -- quit the game'),nl,
    write('     w. a. s. d. -- move'),nl,
    write('     map. -- look at the map'),nl,
    write('     status. -- show your status'),nl,
    write('     inventory -- show your inventory'), nl,
    write('     Legends:'),nl,
    write('       - # = Wall'),nl,
    write('       - S = Store'),nl,
    write('       - P = Player'),nl,
    write('       - D = Boss Dungeon'), nl, nl,
    asserta(init(1)),
    repeat,
    write('Choose your job'), nl,
    write('1. swordsman'), nl,
    write('2. archer'), nl,
    write('3. sorcerer'), nl,
    write('Insert role: '),
    read(Nama), nl,
    character(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
    write('You choose '), write(Nama), write(',let`s explore the world!'),
    (Nama == swordsman
        -> (addInventory(1), addInventory(2),!);
     Nama == archer
        -> (addInventory(5), addInventory(6),!);
     Nama == sorcerer
        -> (addInventory(9), addInventory(10),!) 
    ),
    bikinTembok,
    !.

quit :-
    \+init(_),
    write('You haven`t start any game yet.'),!.

quit :-
    write('Goodbye chief, you will be missed.'), nl,
    retract(player(_,_,_,_,_,_,_,_,_,_,_,_,_,_)),
    retract(tembok(_,_,_,_,_,_,_,_,_,_,_,_)),
    forall(inventoryZ(_,_,_,_,_,_), retract(inventoryZ(_,_,_,_,_,_))),
    retract(init(_)), !.

save :- 
    \+init(_),
    write('belum mulai'), nl, !.




/*
Beberapa program yang kami buat terinspirasi dari 
https://github.com/stanleyyoga123/Tubes-Logif .
Beberapa diantaranya adalah konsep pembuatan map
dan pelaksanaan fungsi battle.
*/