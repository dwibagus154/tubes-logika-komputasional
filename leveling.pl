levelUp(Nama) :-
    player(Nama,_,Max_HP,Attack,Special,Def,Level,Bonus_atk,Bonus_def,Bonus_HP, Exp, Gold, Pos_X, Pos_Y),
    NextLevel is (Level+1),
    NextMaxHP is (Max_HP + 100*Level),
    NextCurrHP is NextMaxHP,
    NextAttack is (Attack + 15*Level),
    NextDef is (Def + 15*Level),
    NextSpecial is (Special + 20*Level),
    retract(player(Name,_,_,_,_,_,Level,_,_,_,_,_,_,_)),
    asserta(player(Name,NextCurrHP,NextMaxHP,NextAttack,NextSpecial,NextDef,NextLevel,Bonus_atk,Bonus_def,Bonus_HP,Exp, Gold, Pos_X, Pos_Y)).

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 1,
    Exp >= 100,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 2,
    Exp >= 200,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 3,
    Exp >= 400,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 4,
    Exp >= 700,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 5,
    Exp >= 1000,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 6,
    Exp >= 1300,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 7,
    Exp >= 1600,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 8,
    Exp >= 1900,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 9,
    Exp >= 2200,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 10,
    Exp >= 2500,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 11,
    Exp >= 2800,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 12,
    Exp >= 3200,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 13,
    Exp >= 3600,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 14,
    Exp >= 4000,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(Nama,Level,Exp) :-
    Level =< 15,
    Exp >= 4500,
    write('Congrats you leveled up!'),nl,
    levelUp(Nama),!.

xpTargetLevelUp(_,_,Exp) :-
    Exp < 4501.