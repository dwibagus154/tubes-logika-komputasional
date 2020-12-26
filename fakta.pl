/** character(nama, curr_HP, max_HP, atk, special, def, lvl, Weapon, Armor, Acc, exp, gold, pos_X, pos_Y) **/
character(swordsman, 1000, 1000, 69, 1000, 100, 1, 0, 0, 0, 0, 10000, 1, 1).
character(archer, 1500, 1500, 78, 12, 80, 1, 0, 0, 0, 0, 100, 1, 1).
character(sorcerer, 2000, 2000, 50, 500, 47, 1, 0, 0, 0, 0, 100, 1, 1).

/** equipment(ID, type, nama, bonus_atk, bonus_def, bonus_HP) **/
/* buat swordsman */
equipment(1, weapon, sword, 30, 0, 0).
equipment(2, weapon, katana, 45, 0, 0).
equipment(3, armor, kevlar, 0, 30, 0).
equipment(4, acc, gelang, 0, 0, 100).

/* buat archer */
equipment(5, weapon, bow, 15, 0, 0).
equipment(6, weapon, crossbow, 50, 0, 0).
equipment(7, armor, asgard, 0, 15, 0).
equipment(8, acc, hat, 0, 0, 150).

/* buat sorcerer */
equipment(9, weapon, sorce, 20, 0, 0).
equipment(10, weapon, orb, 35, 0, 0).
equipment(11, armor, scale, 0, 10, 0).
equipment(12, acc, ring, 0, 0, 70).
equipment(13, acc, wand, 0, 0, 100).

/** potion(id, type, nama, gold, 0, bonus_curr_hp) **/
equipment(14, potion, small, 0, 0, 250).
equipment(15, potion, medium, 0, 0, 500).
equipment(16, potion, large, 0, 0, 1000).

/** enemy(ID, nama, curr_HP, max_HP, atk, def, give_exp, give_gold) **/
enemy(1, slime, 1000, 1000, 20, 10, 50, 20).
enemy(2, goblin, 1500, 1500, 23, 10,30,50 ).
enemy(3, wolf, 2000, 2000, 59, 35, 100,30).
/* boss */
enemy(99, dragon, 7000, 7000, 1000, 1000, 0, 0).


