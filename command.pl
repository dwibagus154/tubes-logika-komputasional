:- dynamic(player/14). 

s :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp+1),
    \+isAtas(TempX,Next),
    \+isBawah(TempX,Next),
    \+isKanan(TempX,Next),
    \+isKiri(TempX,Next),
    \+isStore(TempX,Next),
    \+isBoss(TempX,Next),
    \+isQuest(TempX,Next),
    \+isTembok(TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next),
    triggered,
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Next)),!.

s :- 
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp+1),
    (
        isAtas(TempX,Next);
        isBawah(TempX,Next);
        isKanan(TempX,Next);
        isKiri(TempX,Next);
        isTembok(TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next)
    ),
    write('You hit a wall.'),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp+1),
    isStore(TempX,Next),
    write('You are now in the store.'), nl, write('Type `store.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp+1),
    isQuest(TempX,Next),
    write('You have entered the quest zone.'), nl,
    write('Type `takeQuest.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp+1),
    isBoss(TempX,Next),
    write('You have entered the Dungeon.'), nl,
    write('Type `dungeon.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Next)),!.

s :-
    \+init(_),
    write('The game hasn`t start yet.').

w :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp-1),
    \+isAtas(TempX,Next),
    \+isBawah(TempX,Next),
    \+isKanan(TempX,Next),
    \+isKiri(TempX,Next),
    \+isStore(TempX,Next),
    \+isBoss(TempX,Next),
    \+isQuest(TempX,Next),
    \+isTembok(TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next),
    triggered,
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp-1),
    (
        isAtas(TempX,Next);
        isBawah(TempX,Next);
        isKanan(TempX,Next);
        isKiri(TempX,Next);
        isTembok(TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next)
    ),
    write('You hit a wall.'),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp-1),
    isStore(TempX,Next),
    write('You are now in the store.'), nl, write('Type `store.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp-1),
    isQuest(TempX,Next),
    write('You have entered the quest zone.'), nl,
    write('Type `takeQuest.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (Temp-1),
    isBoss(TempX,Next),
    write('You have entered the Dungeon.'), nl,
    write('Type `dungeon.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Next)),!.

w :-
    \+init(_),
    write('The game hasn`t start yet.').

d :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX+1),
    \+isAtas(Next,Temp),
    \+isBawah(Next,Temp),
    \+isKanan(Next,Temp),
    \+isKiri(Next,Temp),
    \+isStore(Next, Temp),
    \+isBoss(Next, Temp),
    \+isQuest(Next, Temp),
    \+isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp),
    triggered,
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Next, Pos_Y)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX+1),
    (
        isAtas(Next,Temp);
        isBawah(Next,Temp);
        isKanan(Next,Temp);
        isKiri(Next,Temp);
        isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp)
    ),
    write('You hit a wall.'),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX+1),
    isStore(Next,Temp),
    write('You are now in the store.'), nl, write('Type `store.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Next, Pos_Y)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX+1),
    isQuest(Next,Temp),
    write('You have entered the quest zone.'), nl,
    write('Type `takeQuest.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Next, Pos_Y)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX+1),
    isBoss(Next, Temp),
    write('You have entered the Dungeon.'), nl,
    write('Type `dungeon.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Next, Pos_Y)),!.

d :-
    \+init(_),
    write('The game hasn`t start yet.').

a :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX-1),
    \+isAtas(Next,Temp),
    \+isBawah(Next,Temp),
    \+isKanan(Next,Temp),
    \+isKiri(Next,Temp),
    \+isStore(Next, Temp),
    \+isBoss(Next, Temp),
    \+isQuest(Next, Temp),
    \+isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp),
    triggered,
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Next, Pos_Y)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX-1),
    (
        isAtas(Next,Temp);
        isBawah(Next,Temp);
        isKanan(Next,Temp);
        isKiri(Next,Temp);
        isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp)
    ),
    write('You hit a wall.'),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX-1),
    isStore(Next,Temp),
    write('You are now in the store.'),nl, write('Type `store.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Next, Pos_Y)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX-1),
    isQuest(Next,Temp),
    write('You have entered the quest zone.'), nl,
    write('Type `takeQuest.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Next, Pos_Y)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    player(_,_,_,_,_,_,_,_,_,_,_,_,TempX,Temp),
    Next is (TempX-1),
    isBoss(Next, Temp),
    write('You have entered the Dungeon.'), nl,
    write('Type `dungeon.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_, Pos_Y)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Next, Pos_Y)),!.

a :- 
    \+init(_),
    write('The game hasn`t start yet.').

teleport(X,_) :-
    init(_),
    \+ isEnemyAlive(_),
    (X < 1 
        -> (write('You Cant teleport to this place'), nl,!)  
    ).
teleport(X,_) :-
    init(_),
    \+ isEnemyAlive(_),
    (X > 10 
        -> (write('You Cant teleport to this place'), nl,!)  
    ).
teleport(_,Y) :-
    init(_),
    \+ isEnemyAlive(_),
    (Y < 1  
        -> (write('You Cant teleport to this place'), nl,!)  
    ).
teleport(_,Y) :-
    init(_),
    \+ isEnemyAlive(_),
    (Y > 10 
        -> (write('You Cant teleport to this place'), nl,!)  
    ).


teleport(X,Y) :-
    init(_),
    \+ isEnemyAlive(_),
    NextX is X,
    NextY is Y,
    \+isAtas(NextX, NextY),
    \+isBawah(NextX, NextY),
    \+isKanan(NextX, NextY),
    \+isKiri(NextX, NextY),
    \+isStore(NextX, NextY),
    \+isBoss(NextX, NextY),
    \+isQuest(NextX, NextY),
    \+isTembok(NextX,NextY,NextX, NextY,NextX, NextY,NextX, NextY,NextX, NextY,NextX, NextY),
    triggered,
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, NextX, NextY)),!.

teleport(X,_) :-
    init(_),
    \+ isEnemyAlive(_),
    X < 0,
    write('You can`t teleport outside the map.'),!.

teleport(X,_) :-
    init(_),
    \+ isEnemyAlive(_),
    X > 11,
    write('You can`t teleport outside the map.'),!.

teleport(_,Y) :-
    init(_),
    \+ isEnemyAlive(_),
    Y < 0,
    write('You can`t teleport outside the map.'),!.

teleport(_,Y) :-
    init(_),
    \+ isEnemyAlive(_),
    Y > 11,
    write('You can`t teleport outside the map.'),!.

teleport(X,Y) :-
    init(_),
    \+ isEnemyAlive(_),
    NextX is X,
    NextY is Y,
    (
        isAtas(NextX,NextY);
        isBawah(NextX,NextY);
        isKanan(NextX,NextY);
        isKiri(NextX,NextY);
        isTembok(NextX,NextY,NextX,NextY,NextX,NextY,NextX,NextY,NextX,NextY,NextX,NextY)
    ),
    write('You hit a wall.'),!.

teleport(X,Y) :-
    init(_),
    \+ isEnemyAlive(_),
    NextX is X,
    NextY is Y,
    isStore(NextX,NextY),
    write('You are now in the store.'), nl, write('Type `store.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, NextX, NextY)),!.

teleport(X,Y) :-
    init(_),
    \+ isEnemyAlive(_),
    NextX is X,
    NextY is Y,
    isQuest(NextX,NextY),
    write('You have entered the quest zone.'), nl,
    write('Type `takeQuest.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, NextX, NextY)),!.

teleport(X,Y) :-
    init(_),
    \+ isEnemyAlive(_),
    NextX is X,
    NextY is Y,
    isBoss(NextX, NextY),
    write('You have entered the Dungeon.'), nl,
    write('Type `dungeon.` to begin.'),
    retract(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold,_,_)),
    asserta(player(Nama, Curr_HP, Max_HP, Atk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, NextX, NextY)),!.

teleport(_,_) :-
    \+init(_),
    write('The game hasn`t start yet.').

status :-
    init(_),
    write('Your status:'),nl,
    player(Job,Curr_HP,Max_HP,Atk,_,Def,Level,Bonusatk,Bonusdef,Bonushp,Exp,Gold,_,_),
    write('Job: '),
    write(Job),nl,
    write('Level: '),
    write(Level),nl,
    write('HP: '),
    NewHP is (Max_HP + Bonushp),
    write(Curr_HP),write('/'),write(NewHP),nl,
    write('Attack: '),
    Newatk is (Atk + Bonusatk),
    write(Newatk),nl,
    write('Defense: '),
    Newdef is (Def + Bonusdef),
    write(Newdef),nl,
    write('Exp: '),
    write(Exp),nl,
    write('Gold: '),
    write(Gold),nl. 

help :-
    init(_),
    write('Commands: '), nl,
    write('     start. -- start the game!'),nl,
    write('     help. -- show available commands'),nl,
    write('     quit. -- quit the game'),nl,
    write('     w. a. s. d. -- move'),nl,
    write('     map. -- look at the map'),nl,
    write('     status. -- show your status'),nl,
    write('     inventory -- show your inventory').
    
triggered :-
    random(1,100,X),
    (X >= 80
        -> enemyTriggered
        ; !).