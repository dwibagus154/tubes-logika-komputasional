:- dynamic(pos_X/1).
:- dynamic(pos_Y/1).
:- dynamic(tembok/12).
:- dynamic(adaTembok/1).
:- dynamic(player/14).


isPlayer(X,Y) :-
    player(_,_,_,_,_,_,_,_,_,_,_,_,A,B),
    X =:= A,
    Y =:= B.

isStore(X,Y) :-
    X =:= 2,
    Y =:= 2.

isBoss(X,Y) :-
    X =:= 10,
    Y =:= 10.

isQuest(X,Y):-
    X =:= 10,
    Y =:= 1.

bikinTembok :-
    asserta(adaTembok(1)),
    random(3,7,X1),
    random(3,7,X2),
    random(3,7,X3),
    random(3,7,X4),
    random(3,7,X5),
    random(3,7,X6),
    random(3,7,Y1),
    random(3,7,Y2),
    random(3,7,Y3),
    random(3,7,Y4),
    random(3,7,Y5),
    random(3,7,Y6),
    asserta(tembok(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6)).

isTembok(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6) :-
    tembok(TempX1,TempY1,TempX2,TempY2,TempX3,TempY3,TempX4,TempY4,TempX5,TempY5,TempX6,TempY6),
    (
        (X1 == TempX1,
        Y1 == TempY1
        );
        (X2 == TempX2,
        Y2 == TempY2
        );
        (X3 == TempX3,
        Y3 == TempY3
        );
        (X4 == TempX4,
        Y4 == TempY4
        ); 
        ( X5 == TempX5,
        Y5 == TempY5
        );
        (X6 == TempX6,
        Y6 == TempY6
        )
    ).

isAtas(_,Y) :-
    Y =:= 0.

isBawah(_,Y) :-
    Y =:= 11.

isKiri(X,_) :-
    X =:= 0.

isKanan(X,_) :-
    X =:= 11.

printZ(X,Y) :-
    isBawah(X,Y),
    isKanan(X,Y),
    write('#').

printZ(X,Y) :-
    isTembok(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
    write('#'),
    NextX is (X+1),
    printZ(NextX,Y).

printZ(X,Y) :-
    isPlayer(X,Y),
    write('P'),
    NextX is (X+1),
    printZ(NextX,Y).
    
printZ(X,Y):-
    isQuest(X,Y),
    write('Q'),
    NextX is (X+1),
    printZ(NextX,Y).

printZ(X,Y) :-
    isStore(X,Y),
    write('S'),
    NextX is (X+1),
    printZ(NextX,Y).

printZ(X,Y) :-
    isBawah(X,Y),
    write('#'),
    NextX is (X+1),
    printZ(NextX,Y).

printZ(X,Y) :-
    isKiri(X,Y),
    write('#'),
    NextX is (X+1),
    printZ(NextX,Y).

printZ(X,Y) :-
    isKanan(X,Y),
    write('#'),nl,
    NextX is 0,
    NextY is (Y+1),
    printZ(NextX,NextY).

printZ(X,Y) :-
    isAtas(X,Y),
    write('#'),
    NextX is (X+1),
    printZ(NextX,Y).

printZ(X,Y) :-
    isBoss(X,Y),
    write('D'),
    NextX is (X+1),
    printZ(NextX,Y).

printZ(X,Y) :-
    \+isKiri(X,Y),
    \+isKanan(X,Y),
    \+isBawah(X,Y),
    \+isAtas(X,Y),
    write('-'),
    NextX is (X+1),
    printZ(NextX,Y).

map :- 
    init(_),
    adaTembok(_),
    printZ(0,0),!.