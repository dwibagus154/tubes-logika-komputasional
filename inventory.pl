:- dynamic(inventoryZ/6).   

/*equipment*/
maxInventory(100).


hitungPanjangInventory(Length) :-
    findall(Name, inventoryZ(_,_,Name,_,_,_), List),
    length(List,Length).

isFull :-
    hitungPanjangInventory(Length),
    Length =:= 100.

addInventory(_) :- 
    hitungPanjangInventory(Length),
    Length > 100,
    write('Inventory sudah penuh'),!,fail.

addInventory(ID) :-
    ID > 16,
    write('Game don`t have equipment with ID '), write(ID), nl, !.

addInventory(ID) :- 
    equipment(ID, Type, Name, Atk, Def, HP),
    asserta(inventoryZ(ID, Type, Name, Atk, Def, HP)), !.
   
/*jika kosong*/
equip(Name) :-
    \+inventoryZ(_,_,Name,_,_,_),
    write('You don`t have that equipment'), nl, !.

/*jika tidak kosong*/
equip(Name) :-
    inventoryZ(_,Type,Name,Atk,Def,HP),
    (Type == weapon
        -> (retract(player(Nama, Curr_HP, Max_HP, MyAtk, Special, MyDef, Lvl, _, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
            asserta(player(Nama, Curr_HP, Max_HP, MyAtk, Special, MyDef, Lvl, Atk, Armor, Acc, Exp, Gold, Pos_X, Pos_Y)),
            write(Name), write(' equipped.'), nl
            )
    ;!),
    (Type == armor
        -> (retract(player(Nama, Curr_HP, Max_HP, MyAtk, Special, MyDef, Lvl, Weapon, _, Acc, Exp, Gold, Pos_X, Pos_Y)),
            asserta(player(Nama, Curr_HP, Max_HP, MyAtk, Special, MyDef, Lvl, Weapon, Def, Acc, Exp, Gold, Pos_X, Pos_Y)),
            write(Name), write(' equipped.'), nl
            )
    ;!),
    (Type == acc
        -> (retract(player(Nama, Curr_HP, Max_HP, MyAtk, Special, MyDef, Lvl, Weapon, Armor, _, Exp, Gold, Pos_X, Pos_Y)),
            asserta(player(Nama, Curr_HP, Max_HP, MyAtk, Special, MyDef, Lvl, Weapon, Armor, HP, Exp, Gold, Pos_X, Pos_Y)),
            write(Name), write(' equipped.'), nl
            )
    ;!),
    (Type == potion
        -> (
            write(Name), write(' Cant equipped.'), nl
            )
    ;!),
    
    !.

makeListInventory(ListType, ListNama, ListAtk, ListDef, ListHP) :- 
    findall(Type, inventoryZ(_,Type,_,_,_,_), ListType),
    findall(Name, inventoryZ(_,_,Name,_,_,_), ListNama),
    findall(Atk, inventoryZ(_,_,_,Atk,_,_), ListAtk),
    findall(Def, inventoryZ(_,_,_,_,Def,_), ListDef),
    findall(HP, inventoryZ(_,_,_,_,_,HP), ListHP).

printt([],[],[],[],[]).
printt([A|B],[C|D],[E|F],[G|H],[I|J]) :-
    write('Type: '),
    write(A),nl,    
    write('Name: '),
    write(C),nl,
    (A == potion
        -> (
            write('Gold: '),
            write(E),nl,    
            /*write('Def: '),
            write(G),nl,*/
            write('Bonus HP: '),
            write(I),nl, nl
        ); (
            write('Attack: '),
            write(E),nl,    
            write('Def: '),
            write(G),nl,
            write('HP: '),
            write(I),nl, nl  
        )
    ),
    printt(B,D,F,H,J).

inventory :-
    init(_),
    makeListInventory(ListType, ListNama, ListAtk, ListDef, ListHP),
    write('Your Inventory:'),nl,nl,
    printt(ListType, ListNama, ListAtk, ListDef, ListHP).

