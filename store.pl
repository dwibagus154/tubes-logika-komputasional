:- dynamic(inventoryZ/3).
:- dynamic(player/14).

gacha :- 
    player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y),
    isStore(Pos_X,Pos_Y),
    Gold >= 500,
    Nama == swordsman,
    random(1,5,ID),
    equipment(ID,_,Name,_,_,_),
    write('You get a '), write(Name), write('.'), nl,
    Gold1 is Gold - 500, 
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, _, Pos_X, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold1, Pos_X, Pos_Y)),
    addInventory(ID), !.

gacha :- 
    player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y),
    isStore(Pos_X,Pos_Y),
    Gold >= 500,
    Nama == archer,
    random(5,9,ID),
    equipment(ID,_,Name,_,_,_),
    write('You get a '), write(Name), write('.'), nl,
    Gold1 is Gold - 500, 
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, _, Pos_X, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold1, Pos_X, Pos_Y)),
    addInventory(ID), !.

gacha :- 
    player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y),
    isStore(Pos_X,Pos_Y),
    Gold >= 500,
    Nama == sorcerer,
    random(9,14,ID),
    equipment(ID,_,Name,_,_,_),
    write('You get a '), write(Name), write('.'), nl,
    Gold1 is Gold - 500, 
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, _, Pos_X, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold1, Pos_X, Pos_Y)),
    addInventory(ID), !.

gacha :- 
    player(_, _, _, _, _, _, _, _, _, _, _, Gold, A, B),
    isStore(A,B),  
    Gold < 500, 
    write('You don`t have enough gold.'),nl, !.

store :-
    isFull,
    player(_,_,_,_,_,_,_,_,_,_,_,_,A,B),
    isStore(A,B),  
    write('Your inventory is full.'), !.

store :-
    player(_,_,_,_,_,_,_,_,_,_,_,_,A,B),
    \+isStore(A,B),  
    write('This is not the store.'), !.

store :-
    \+isFull,
    player(_,_,_,_,_,_,_,_,_,_,_,_,A,B),
    isStore(A,B),  
    write('Welcome to the store. You can buy a potion or do a gacha.'),nl,
    write('- gacha.'), nl,
    write('- potion.').

potion :- 
    player(_,_,_,_,_,_,_,_,_,_,_,_,A,B),
    isStore(A,B),  
    write('Please choose one of three available potions.'),nl,
    write('- potion(sl).'),nl,
    write('- potion(lg).'),nl,
    write('- potion(med).').

potion(sl) :-
    player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y),
    isStore(Pos_X,Pos_Y), 
    Gold >= 120,
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, _, Pos_X, Pos_Y)),
    Gold1 is Gold - 120,
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold1, Pos_X, Pos_Y)),
    addInventory(14),
    write('Added small potion to your inventory.'), nl, !.

potion(sl) :-
    player(_, _, _, _, _, _, _, _, _, _, _, Gold, A, B),
    isStore(A,B),
    Gold < 120,
    write('You don`t have enough gold.'), nl.

potion(lg) :-
    player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y),
    isStore(Pos_X,Pos_Y),
    Gold >= 320,
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, _, Pos_X, Pos_Y)),
    Gold1 is Gold - 320,
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold1, Pos_X, Pos_Y)),
    addInventory(16),
    write('Added large potion to your inventory.'), nl, !.

potion(lg) :-
    player(_, _, _, _, _, _, _, _, _, _, _, Gold, A, B),
    isStore(A,B),
    Gold < 320,
    write('You dont`t have enough gold.'), nl.

potion(med) :-
    player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y),
    isStore(Pos_X,Pos_Y),
    Gold >= 240,
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, _, Pos_X, Pos_Y)),
    Gold1 is Gold - 240,
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold1, Pos_X, Pos_Y)),
    addInventory(15),
    write('Added medium potion to your inventory.'), nl, !.

potion(med) :-
    player(_, _, _, _, _, _, _, _, _, _, _, Gold, A, B),
    isStore(A,B),
    Gold < 240,
    write('You dont`t have enough gold.'), nl.


    