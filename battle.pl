:- dynamic(enemyZ/8).    
:- dynamic(player/14).      
:- dynamic(peluang/1).
:- dynamic(isEnemyAlive/1).
:- dynamic(isRun/1).
:- dynamic(isFight/1).
:- dynamic(isQwest/1).
:- dynamic(quest/3).
:- dynamic(turn/1).
:- dynamic(isturn/1).
:- dynamic(count/1).


enemyTriggered :-  
    random(1, 4, ID),
    enemy(ID, Nama, _, Max_HP, Atk, Def, Give_Exp, Give_Gold),
    asserta(enemyZ(ID, Nama, Max_HP, Max_HP, Atk, Def, Give_Exp, Give_Gold)),
    write('You found a '), write(Nama), nl,
    write('HP: '), write(Max_HP), nl,
    write('Attack: '), write(Atk), nl,
    write('Defense: '), write(Def), nl,
    write('What will you do?'), nl,
    write('- fight.'), nl,
    write('- run.'), nl,
    write('- heal.'), nl,
    random(1, 11, X),
    asserta(peluang(X)),
    asserta(isEnemyAlive(1)).

enemyBoss:-
    enemy(99, Nama, _, Max_HP, Atk, Def, Give_Exp, Give_Gold),
    asserta(enemyZ(99, Nama, Max_HP, Max_HP, Atk, Def, Give_Exp, Give_Gold)),
    write('Fighting Boss dragon with level 70 '),nl,
    write('HP: '), write(Max_HP), nl,
    write('Attack: '), write(Atk), nl,
    write('Defense: '), write(Def), nl,
    asserta(isEnemyAlive(1)),
    fight.

run :-
    \+ isEnemyAlive(_),
    write('There`s no enemy here, why are you running?'),
    !.

run :-
    \+ isRun(_),
    isEnemyAlive(_),
    peluang(X), 
    X < 5,
    write('Run failed, fight with honor.'), nl,
    retract(peluang(X)),
    fight,
    !.

run :-
    \+ isRun(_),
    isEnemyAlive(_),
    peluang(X),
    X >= 5,
    write('Run success.'),
    retract(peluang(X)),
    retract(isEnemyAlive(_)),
    retract(enemyZ(_, _, _, _, _, _, _, _)), !.

fight :-
    \+ isEnemyAlive(_),
    write('There`s no one here, don`t fight yourself.'),
    !.

fight :-
    isFight(_),
    isEnemyAlive(_),
    write('You are currently fighting.'), nl,
    !.

fight :-
    asserta(turn(0)),
    asserta(isRun(1)),
    asserta(isFight(1)),
    isEnemyAlive(_),
    write('May the force be with you!'), nl,
    write('List of possible commands:'), nl,
    write('- attack.'), nl,
    write('- special.'), nl,
    write('- heal.'), nl,
    !.

attackComment :-
    enemyZ(_, Nama, Curr_HP, Max, _, _, _, _),
    Curr_HP > 0,
    write(Nama), write('`s health dropped to '), write(Curr_HP), write('/'), write(Max), nl,
    write('Enemy`s turn'), nl,
    enemyAttack,
    !.

attackComment :-
    isQwest(_),
    enemyZ(_, Name, Xurr_HP, _, _, _, Give_Exp, Give_Gold),
    Xurr_HP =< 0,
    retract(isEnemyAlive(_)),
    retract(isRun(_)),
    retract(isFight(_)),
    (Name == dragon -> (win, fail);!),
    write(Name), write(' vanished.'), nl,
    write('You get '), write(Give_Exp), write(' exp and '), write(Give_Gold), write(' gold.'), nl, 
    retract(quest(Sum1, Sum2, Sum3)),
    (Name == slime ->
        (SumNew is (Sum1 - 1),
        asserta(quest(SumNew, Sum2, Sum3)));!),
    (Name == goblin ->
        (SumNew is (Sum2 - 1),
        asserta(quest(Sum1, SumNew, Sum3)));!),
    (Name == wolf ->
        (SumNew is (Sum3 - 1),
        asserta(quest(Sum1, Sum2, SumNew)));!),
    retract(count(W)),
    W1 is (W+1),
    asserta(count(W1)),
    quest(A,B,C),
    ((A < 1, B < 1, C < 1) ->
        endQuest;!),
    retract(player(Nama, Curr_HP, Max_HP, MyAtk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
    New_Exp is (Exp + Give_Exp),
    New_Gold is (Gold + Give_Gold),
    asserta(player(Nama, Curr_HP, Max_HP, MyAtk, Special, Def, Lvl, Weapon, Armor, Acc, New_Exp, New_Gold, Pos_X, Pos_Y)),
    xpTargetLevelUp(Nama, Lvl, Exp),
    retract(enemyZ(_, _, _, _, _, _, _, _)),
    !.

attackComment :-
    \+isQwest(_),
    enemyZ(_, Name, Xurr_HP, _, _, _, Give_Exp, Give_Gold),
    Xurr_HP =< 0,
    retract(isEnemyAlive(_)),
    retract(isRun(_)),
    retract(isFight(_)),
    (Name == dragon -> (win, fail);!),
    write(Name), write(' vanished.'), nl,
    write('You get '), write(Give_Exp), write(' exp and '), write(Give_Gold), write(' gold.'), nl,
    retract(player(Nama, Curr_HP, Max_HP, MyAtk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
    New_Exp is Exp + Give_Exp,
    New_Gold is Gold + Give_Gold,
    asserta(player(Nama, Curr_HP, Max_HP, MyAtk, Special, Def, Lvl, Weapon, Armor, Acc, New_Exp, New_Gold, Pos_X, Pos_Y)),
    xpTargetLevelUp(Nama, Lvl, Exp),
    retract(enemyZ(_, _, _, _, _, _, _, _)),
    !.

attack :-
    \+ isEnemyAlive(_),
    write('There`s no one here, don`t attack yourself.'), nl,
    !.

attack :-
    isEnemyAlive(_),
    player(_, _, _, Atk, _, _, _, _, _, _, _, _, _, _),
    enemyZ(_, Nama, Curr_HP, _, _, Def, _, _),
    (Atk-Def >= 1
        ->NewAtk = Atk-Def;
        NewAtk = 1),
    NewHP is (Curr_HP - NewAtk),
    retract(enemyZ(ID, Nama, _, Max_HP, Atk2, Def, Give_exp, Give_gold)),
    asserta(enemyZ(ID, Nama, NewHP, Max_HP, Atk2, Def, Give_exp, Give_gold)),
    write('Attack success!'), nl,
    retract(turn(X)),
    X1 is X+1,
    (X1 >= 3
        -> asserta(isturn(1))
        ; !
    ),
    asserta(turn(X1)),
    attackComment,!.

special :-
    \+ isEnemyAlive(_),
    write('There`s no one here.'),
    !.

special :-
    isturn(_),
    isEnemyAlive(_),
    retract(isturn(_)),
    asserta(turn(0)),
    player(_, _, _, _, Special, _, _, _, _, _, _, _, _, _),
    enemyZ(_, Nama, Curr_HP, _, _, Def, _, _),
    (Special-Def >= 1
        ->NewAtk = Special-Def;
        NewAtk = 1),
    NewHP is (Curr_HP - NewAtk),
    retract(enemyZ(ID, Nama, _, Max_HP, Atk, Def, Give_exp, Give_gold)),
    asserta(enemyZ(ID, Nama, NewHP, Max_HP, Atk, Def, Give_exp, Give_gold)),
    write('Special attack success!'), nl,
    asserta(turn(0)),
    attackComment,!.

special:-
    \+ isturn(_),
    isEnemyAlive(_),
    write('You can`t use special attack yet.'), !.

enemyAttack :-
    enemyZ(_, Nama, _, _, Atk, _, _, _),
    player(_, Xurr_HP, _, _, _, Def, _, _, _, _, _, _, _, _),
    (Atk-Def >= 1
        ->NewAtk = (Atk-Def);
        NewAtk = 1),
    NewHP is (Xurr_HP - NewAtk),
    retract(player(Name, _, Max_HP, MyAtk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
    asserta(player(Name, NewHP, Max_HP, MyAtk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
    write(Nama), write(' uses attack!'), nl,
    enemyComment,
    !.

enemyComment :-
    player(_, Surr_HP, Max, _, _, _, _, _, _, _, _, _, _, _),
    Surr_HP > 0,
    write('Your health dropped to '), write(Surr_HP), write('/'), write(Max), nl,
    write('What will you do?'), nl,
    write('- attack.'), nl,
    write('- special.'), nl,
    write('- heal.'), nl,
    !.

enemyComment :-
    player(_, Surr_HP, _, _, _, _, _, _, _, _, _, _, _, _),
    Surr_HP =< 0,
    retract(player(_, _, _, _, _, _, _, _, _, _, _, _, _, _)),
    retract(enemyZ(_, _, _, _, _, _, _, _)),
    lose.

takeQuest :-
    player(_, _, _, _, _, _, _, _, _, _, _, _, Pos_X, Pos_Y),
    \+isQuest(Pos_X, Pos_Y),
    write('You can`t take quest here.'), !.

takeQuest :-
    asserta(count(0)),
    player(_, _, _, _, _, _, _, _, _, _, _, _, Pos_X, Pos_Y),
    isQuest(Pos_X, Pos_Y),
    random(1,3,Sum_1),
    random(1,3,Sum_2),
    random(1,3,Sum_3),
    asserta(quest(Sum_1, Sum_2, Sum_3)),
    write('Defeat '), write(Sum_1), write(' slime, '), write(Sum_2), write(' goblin, and '), write(Sum_3), write(' wolf to gain extra exp and gold.'), nl,
    write('Type `infoQuest.` to check your progress.'), nl,
    asserta(isQwest(1)), !.

endQuest :-
    retract(player(Nama, Curr_HP, Max_HP, MyAtk, Special, Def, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
    count(W),
    BonusExp is (25*W),
    BonusGold is (50*W),
    New_Exp is (Exp + BonusExp),
    New_Gold is (Gold + BonusGold),
    asserta(player(Nama, Curr_HP, Max_HP, MyAtk, Special, Def, Lvl, Weapon, Armor, Acc, New_Exp, New_Gold, Pos_X, Pos_Y)),
    write('You`ve gained '), write(BonusExp), write(' extra exp and '), write(BonusGold), write(' extra gold for completing your quest.'), nl,
    retract(isQwest(_)),
    retract(quest(_,_,_)),
    retract(count(_)),
    !.

infoQuest :-
    \+isQwest(_),
    write('No active quest currently.'), nl, !.

infoQuest :-
    isQwest(_),
    quest(A,B,C),
    write('You still need to defeat '),nl,
    (A > 0 
        -> (write('- '), write(A), write(' slime'), nl); !),
    (B > 0 
        -> (write('- '), write(B), write(' goblin'), nl); !),
    (C > 0 
        -> (write('- '), write(C), write(' wolf'), nl); !),
    write('to complete the quest.'), nl, !.

dungeon :-
    player(_, _, _, _, _, _, _, _, _, _, _, _, Pos_X, Pos_Y),
    \+isBoss(Pos_X, Pos_Y),
    write('This is not a dungeon.'), !.

dungeon :-
    player(_, _, _, _, _, _, _, _, _, _, _, _, Pos_X, Pos_Y),
    isBoss(Pos_X, Pos_Y),
    write('You will fight the boss. Are you dare enough?'), nl,
    write('type `fightBoss.` to begin.'), !.

fightBoss :-
    player(_, _, _, _, _, _, _, _, _, _, _, _, Pos_X, Pos_Y),
    \+isBoss(Pos_X, Pos_Y),
    write('There`s no boss here.'), !.

fightBoss :-
    player(_, _, _, _, _, _, _, _, _, _, _, _, Pos_X, Pos_Y),
    isBoss(Pos_X, Pos_Y),
    enemyBoss.

heal :-
    player(_,Curr_HP,Max_HP,_,_,_,_,_,_,_,_,_,_,_),
    write('Your health is '), write(Curr_HP), write('/'), write(Max_HP), nl,
    write('Please choose healing potion you want to use.'), nl,
    write('Possible options: '), nl,
    write('- small'), nl,
    write('- medium'), nl,
    write('- large'), nl,
    read(Name), nl,
    (inventoryZ(_,Type,Name,_,_,HP) ->
        ((Type == potion
            -> (retract(player(Nama, Curr_HP, Max_HP, MyAtk, Special, MyDef, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
                ((Curr_HP + HP) > Max_HP 
                    -> NewHP is Max_HP;
                       NewHP is (Curr_HP + HP)),
                asserta(player(Nama, NewHP, Max_HP, MyAtk, Special, MyDef, Lvl, Weapon, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
                retract(inventoryZ(_,_,Name,_,_,_)),
                PrintHP is (NewHP - Curr_HP),
                write('You healed '), write(PrintHP), write(' HP.'), nl
            )
        ; write('That is not a potion.')))
    ; write('You don`t have that in your inventory.')
    ),
    !.

win :-
    write('__  ______  __  __   _       _______   __'), nl,
    write('\\ \\/ / __ \\/ / / /  | |     / /  _/ | / /'), nl,
    write(' \\  / / / / / / /   | | /| / // //  |/ /'), nl,
    write(' / / /_/ / /_/ /    | |/ |/ // // /|  / '), nl, 
    write('/_/\\____/\\____/     |__/|__/___/_/ |_/'), nl, nl,
    write('... and so the dragon has died, you have'), nl,
    write('become the saviour for Genshin`s village.'), nl,
    quit, !.

lose :-                                                                      
    write('_|      _|    _|_|    _|    _|      _|          _|_|      _|_|_|  _|_|_|_|'), nl,  
    write('  _|  _|    _|    _|  _|    _|      _|        _|    _|  _|        _|'), nl,        
    write('    _|      _|    _|  _|    _|      _|        _|    _|    _|_|    _|_|_|'), nl,    
    write('    _|      _|    _|  _|    _|      _|        _|    _|        _|  _|'), nl,        
    write('    _|        _|_|      _|_|        _|_|_|_|    _|_|    _|_|_|    _|_|_|_|'), nl,    
    quit, !.

